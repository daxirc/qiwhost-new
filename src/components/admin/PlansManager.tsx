import React, { useState, useEffect } from 'react';
// Uses /api/plans endpoint
import { toast } from 'react-hot-toast';
import { getFlagImageUrl } from '../../i18n/utils';

// Flag emoji to country code mapping
const flagEmojiToCountryCode = {
  '🇺🇸': 'us',
  '🇸🇬': 'sg', 
  '🇩🇪': 'de',
  '🇫🇮': 'fi',
  '🇬🇧': 'gb',
  '🇲🇽': 'mx',
  '🇧🇬': 'bg',
  '🇬🇷': 'gr',
  '🇫🇷': 'fr',
  '🇷🇺': 'ru',
  '🇹🇷': 'tr',
  '🇸🇦': 'sa',
  '🇦🇪': 'ae',
  '🇧🇭': 'bh',
  '🇴🇲': 'om',
  '🇰🇼': 'kw',
  '🇮🇶': 'iq',
  '🇶🇦': 'qa',
  '🇹🇭': 'th',
  '🇻🇳': 'vn',
  '🇰🇭': 'kh',
  '🇵🇭': 'ph',
  '🇲🇾': 'my',
  '🇮🇩': 'id',
  '🇲🇲': 'mm',
  '🇯🇵': 'jp',
  '🇭🇰': 'hk',
  '🇹🇼': 'tw',
  '🇰🇷': 'kr',
  '🇿🇦': 'za',
  '🇪🇬': 'eg',
  '🇧🇩': 'bd',
  '🇵🇰': 'pk',
  '🇳🇵': 'np',
  '🇧🇷': 'br',
  '🇦🇷': 'ar',
  '🇨🇱': 'cl',
  '🇨🇴': 'co',
  '🇮🇳': 'in',
  '🇦🇺': 'au'
};

// Flag emoji to country name mapping
const flagEmojiToCountryName = {
  '🇺🇸': 'USA',
  '🇸🇬': 'Singapore',
  '🇩🇪': 'Germany',
  '🇫🇮': 'Finland',
  '🇬🇧': 'UK',
  '🇯🇵': 'Japan',
  '🇮🇳': 'India',
  '🇦🇺': 'Australia'
};

interface Plan {
  id: string;
  name: string;
  category: string;
  subcategory?: string | null;
  region?: string | null;
  flag_icon?: string | null;
  page_description?: string | null;
  plan_type?: string | null;
  plan_features?: string[] | null;
  city_features?: string[] | null;
  plan_type?: string | null;
  plan_features?: string[] | null;
  city_features?: string[] | null;
  ram: string;
  cpu: string;
  storage: string;
  bandwidth: string;
  location: string;
  available_locations?: string[] | null;
  os_type: string | null;
  price_monthly: number;
  price_yearly: number | null;
  sale_enabled: boolean;
  sale_price_monthly: number | null;
  sale_price_yearly: number | null;
  sale_badge_text: string | null;
  order_url: string;
  visible: boolean;
  sort_order: number;
}

interface PlansManagerProps {
  category: string;
  osTypeFilter?: string;
  showLocationFilter?: boolean;
  filterType?: 'location' | 'flag_icon';
  allowedFlagIcons?: string[];
  isLinuxFeatured?: boolean;
}

const DEDICATED_CATEGORIES = ['VALUE', 'CUSTOM', 'GPU'];
const RDP_LOCATIONS = ['USA', 'Singapore', 'Germany', 'Finland', 'UK'];
const VPS_REGIONS = ['North America', 'Europe', 'Southeast Asia', 'East Asia', 'Middle East', 'Africa', 'South Asia', 'South America', 'Oceania'];
const PLAN_TYPES = ['Basic', 'Standard', 'Pro'];

export default function PlansManager({ 
  category, 
  osTypeFilter, 
  showLocationFilter, 
  filterType, 
  allowedFlagIcons,
  isLinuxFeatured = false
}: PlansManagerProps) {
  const [plans, setPlans] = useState<Plan[]>([]);
  const [loading, setLoading] = useState(true);
  const [isEditing, setIsEditing] = useState(false);
  const [editingPlan, setEditingPlan] = useState<Plan | null>(null);
  const [selectedSubcategory, setSelectedSubcategory] = useState<string>(
    category === 'DEDICATED' ? 'VALUE' : ''
  );
  const [selectedLocation, setSelectedLocation] = useState<string>(
    category === 'RDP' ? 'USA' : ''
  );
  const [selectedRegion, setSelectedRegion] = useState<string>(
    category === 'VPS' ? 'North America' : ''
  );
  const [selectedFilterValue, setSelectedFilterValue] = useState<string>('All');
  const [availableFilterOptions, setAvailableFilterOptions] = useState<string[]>(['All']);
  const [isSaleEnabled, setIsSaleEnabled] = useState(false);
  const [planFeatures, setPlanFeatures] = useState<string[]>([
    'Full Root Access',
    'SSD Storage',
    'DDoS Protection',
    '24/7 Support',
    'Instant Provisioning',
    '99.9% Uptime Guarantee'
  ]);
  const [cityFeatures, setCityFeatures] = useState<string[]>([
    'Low Latency Network',
    'Enterprise-grade Infrastructure',
    'Multiple Datacenter Options',
    'Tier-1 Network Providers',
    'Redundant Power Systems',
    'Advanced Cooling Systems'
  ]);
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    fetchPlans();
    if (filterType) {
      fetchAvailableFilterOptions();
    }
  }, [category, osTypeFilter, selectedSubcategory, selectedLocation, selectedRegion, selectedFilterValue, filterType, allowedFlagIcons]);

  useEffect(() => {
    if (editingPlan) {
      setIsSaleEnabled(editingPlan.sale_enabled);
      if (editingPlan.plan_features) {
        setPlanFeatures(editingPlan.plan_features);
      }
      if (editingPlan.city_features) {
        setCityFeatures(editingPlan.city_features);
      }
    } else {
      setIsSaleEnabled(false);
      setPlanFeatures([
        'Full Root Access',
        'SSD Storage',
        'DDoS Protection',
        '24/7 Support',
        'Instant Provisioning',
        '99.9% Uptime Guarantee'
      ]);
      setCityFeatures([
        'Low Latency Network',
        'Enterprise-grade Infrastructure',
        'Multiple Datacenter Options',
        'Tier-1 Network Providers',
        'Redundant Power Systems',
        'Advanced Cooling Systems'
      ]);
    }
  }, [editingPlan]);

  async function fetchAvailableFilterOptions() {
    try {
      if (filterType === 'flag_icon' && allowedFlagIcons && allowedFlagIcons.length > 0) {
        setAvailableFilterOptions(['All', ...allowedFlagIcons]);
        return;
      }

      const distinctField = filterType === 'location' ? 'location' : 'flag_icon';
      const res = await fetch(`/api/plans?distinct=${distinctField}`);
      if (!res.ok) return;
      const data = await res.json();

      let options;
      if (filterType === 'location') {
        options = data.map(item => item.location).sort();
      } else if (filterType === 'flag_icon') {
        options = data.map(item => item.flag_icon).sort();
      }

      setAvailableFilterOptions(['All', ...(options || [])]);
    } catch (error) {
      console.error(`Error fetching available ${filterType} options:`, error);
    }
  }

  async function fetchPlans() {
    try {
      setLoading(true);
      const params = new URLSearchParams();
      params.set('category', category);

      if (category === 'VPS' && osTypeFilter) {
        params.set('os_type', osTypeFilter);
      }
      if (category === 'DEDICATED' && selectedSubcategory) {
        params.set('subcategory', selectedSubcategory);
      }
      if (category === 'RDP' && selectedLocation) {
        params.set('location', selectedLocation);
      }
      if (filterType === 'location' && selectedFilterValue !== 'All') {
        params.set('location', selectedFilterValue);
      } else if (filterType === 'flag_icon' && selectedFilterValue !== 'All') {
        params.set('flag_icon', selectedFilterValue);
      } else if (filterType === 'flag_icon' && allowedFlagIcons && allowedFlagIcons.length > 0) {
        params.set('flag_icons', allowedFlagIcons.join(','));
      } else if (category === 'VPS' && selectedRegion && !osTypeFilter && !filterType) {
        params.set('region', selectedRegion);
      }
      if (isLinuxFeatured) {
        params.set('os_type', 'Linux');
      }

      const res = await fetch(`/api/plans?${params.toString()}`);
      if (!res.ok) throw new Error('Failed to fetch plans');
      const data = await res.json();
      
      console.log('Fetched plans:', data);
      setPlans(data || []);
    } catch (error) {
      console.error('Error fetching plans:', error);
      toast.error(`Failed to load plans: ${error.message}`);
    } finally {
      setLoading(false);
    }
  }

  // Helper function to render filter label
  function renderFilterLabel(value: string): string {
    if (filterType === 'flag_icon') {
      return flagEmojiToCountryName[value] || value;
    }
    return value;
  }

  async function handleToggleLinuxFeatured(plan) {
    try {
      // Check if we're trying to enable a fourth featured plan
      if (!plan.is_linux_featured) {
        const featuredCount = plans.filter(p => p.is_linux_featured).length;
        if (featuredCount >= 3) {
          toast.error('Only 3 plans can be featured on the Linux VPS page. Please unfeatured another plan first.');
          return;
        }
      }
      
      const res = await fetch('/api/plans', {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: plan.id, is_linux_featured: !plan.is_linux_featured }),
      });
      if (!res.ok) throw new Error('Failed to update featured status');
      
      toast.success(`Plan ${!plan.is_linux_featured ? 'featured' : 'unfeatured'} successfully`);
      fetchPlans();
    } catch (error) {
      console.error('Error toggling Linux featured status:', error);
      toast.error(`Failed to update featured status: ${error.message}`);
    }
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center py-12">
        <div className="text-center">
          <div className="w-8 h-8 border-4 border-primary-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
          <p className="text-gray-600">Loading plans...</p>
        </div>
      </div>
    );
  }

  const displayTitle = osTypeFilter ? `${osTypeFilter} ${category} Plans` : `${category} Plans`;

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div className="flex flex-col sm:flex-row items-start sm:items-center gap-4">
          <h2 className="text-2xl font-bold text-gray-900">{displayTitle}</h2>
          {category === 'DEDICATED' && (
            <div className="flex flex-wrap gap-2">
              {DEDICATED_CATEGORIES.map((cat) => (
                <button
                  key={cat}
                  onClick={() => setSelectedSubcategory(cat)}
                  className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
                    selectedSubcategory === cat
                      ? 'bg-primary-600 text-white shadow-md'
                      : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                  }`}
                >
                  {cat.charAt(0) + cat.slice(1).toLowerCase()} Servers
                </button>
              ))}
            </div>
          )}
          {category === 'RDP' && (
            <div className="flex flex-wrap gap-2">
              {RDP_LOCATIONS.map((loc) => (
                <button
                  key={loc}
                  onClick={() => setSelectedLocation(loc)}
                  className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
                    selectedLocation === loc
                      ? 'bg-primary-600 text-white shadow-md'
                      : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                  }`}
                >
                  {loc}
                </button>
              ))}
            </div>
          )}
          {category === 'VPS' && !osTypeFilter && !filterType && (
            <div className="flex flex-wrap gap-2">
              {VPS_REGIONS.map((region) => (
                <button
                  key={region}
                  onClick={() => setSelectedRegion(region)}
                  className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
                    selectedRegion === region
                      ? 'bg-primary-600 text-white shadow-md'
                      : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                  }`}
                >
                  {region}
                </button>
              ))}
            </div>
          )}
          {filterType && (
            <div className="flex flex-wrap gap-2">
              <select
                value={selectedFilterValue}
                onChange={(e) => setSelectedFilterValue(e.target.value)}
                className="px-4 py-2 rounded-lg text-sm font-medium transition-colors bg-gray-100 text-gray-700 hover:bg-gray-200"
              >
                {availableFilterOptions.map((option) => (
                  <option key={option} value={option}>
                    {option === 'All' ? 'All' : renderFilterLabel(option)}
                    {filterType === 'flag_icon' && option !== 'All' ? ` ${option}` : ''}
                  </option>
                ))}
              </select>
            </div>
          )}
        </div>
        <button 
          onClick={() => {
            setEditingPlan(null);
            setIsEditing(true);
            setIsSaleEnabled(false);
          }}
          className="bg-primary-600 text-white px-6 py-2 rounded-lg hover:bg-primary-700 transition-colors font-medium shadow-md"
        >
          <i className="fas fa-plus mr-2"></i>
          Add New Plan
        </button>
      </div>

      {isEditing ? (
        <div className="bg-white rounded-xl shadow-lg border border-gray-200 p-6">
          <div className="flex items-center justify-between mb-6">
            <h3 className="text-xl font-semibold text-gray-900">
              {editingPlan ? 'Edit Plan' : 'Create New Plan'}
            </h3>
            <button
              onClick={() => {
                setIsEditing(false);
                setEditingPlan(null);
                setIsSaleEnabled(false);
              }}
              className="text-gray-400 hover:text-gray-600 transition-colors"
            >
              <i className="fas fa-times text-xl"></i>
            </button>
          </div>
          
          <form onSubmit={(e) => {
            e.preventDefault();
            const formData = new FormData(e.target as HTMLFormElement);
            
            const osTypeValue = osTypeFilter || (formData.get('os_type') as string);
            const priceYearlyValue = formData.get('price_yearly') as string;
            const salePriceMonthlyValue = formData.get('sale_price_monthly') as string;
            const salePriceYearlyValue = formData.get('sale_price_yearly') as string;
            const saleBadgeTextValue = formData.get('sale_badge_text') as string;
            const regionValue = formData.get('region') as string;
            const flagIconValue = formData.get('flag_icon') as string;
            const pageDescriptionValue = formData.get('page_description') as string;
            const planTypeValue = formData.get('plan_type') as string;
            
            const planData = {
              name: formData.get('name') as string,
              plan_features: planFeatures,
              city_features: category === 'VPS' ? cityFeatures : null,
              ram: formData.get('ram') as string,
              cpu: formData.get('cpu') as string,
              storage: formData.get('storage') as string,
              bandwidth: formData.get('bandwidth') as string,
              location: formData.get('location') as string,
              region: category === 'VPS' ? (regionValue || selectedRegion) : null,
              flag_icon: category === 'VPS' ? flagIconValue : null,
              page_description: category === 'VPS' ? pageDescriptionValue : null,
              plan_type: category === 'VPS' ? planTypeValue : null,
              os_type: osTypeValue ? osTypeValue : null,
              price_monthly: parseFloat(formData.get('price_monthly') as string),
              price_yearly: category !== 'DEDICATED' && priceYearlyValue ? parseFloat(priceYearlyValue) : null,
              sale_enabled: isSaleEnabled,
              sale_price_monthly: salePriceMonthlyValue ? parseFloat(salePriceMonthlyValue) : null,
              sale_price_yearly: category !== 'DEDICATED' && salePriceYearlyValue ? parseFloat(salePriceYearlyValue) : null,
              sale_badge_text: saleBadgeTextValue || null,
              order_url: formData.get('order_url') as string,
              visible: formData.get('visible') === 'true',
              sort_order: parseInt(formData.get('sort_order') as string),
              subcategory: category === 'DEDICATED' ? selectedSubcategory : null
            };
            savePlan(planData);
          }}>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Name *</label>
                <input
                  type="text"
                  name="name"
                  defaultValue={editingPlan?.name}
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                />
              </div>

              {category === 'VPS' && (
                <>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Region *</label>
                    <select
                      name="region"
                      defaultValue={editingPlan?.region || selectedRegion}
                      required
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                    >
                      {VPS_REGIONS.map((region) => (
                        <option key={region} value={region}>{region}</option>
                      ))}
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Flag Icon *</label>
                    <input
                      type="text"
                      name="flag_icon"
                      defaultValue={editingPlan?.flag_icon || ''}
                      required
                      placeholder="🇺🇸"
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Plan Type *</label>
                    <select
                      name="plan_type"
                      defaultValue={editingPlan?.plan_type || 'Basic'}
                      required
                      className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                    >
                      {PLAN_TYPES.map((type) => (
                        <option key={type} value={type}>{type}</option>
                      ))}
                    </select>
                  </div>
                </>
              )}

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">RAM *</label>
                <input
                  type="text"
                  name="ram"
                  defaultValue={editingPlan?.ram}
                  required
                  placeholder="e.g., 4GB"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">CPU *</label>
                <input
                  type="text"
                  name="cpu"
                  defaultValue={editingPlan?.cpu}
                  required
                  placeholder="e.g., 2 vCPU"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Storage *</label>
                <input
                  type="text"
                  name="storage"
                  defaultValue={editingPlan?.storage}
                  required
                  placeholder="e.g., 60GB SSD"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Bandwidth *</label>
                <input
                  type="text"
                  name="bandwidth"
                  defaultValue={editingPlan?.bandwidth}
                  required
                  placeholder="e.g., 1TB"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Location *</label>
                {category === 'RDP' ? (
                  <select
                    name="location"
                    defaultValue={editingPlan?.location || selectedLocation}
                    required
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  >
                    {RDP_LOCATIONS.map((loc) => (
                      <option key={loc} value={loc}>{loc}</option>
                    ))}
                  </select>
                ) : (
                  <input
                    type="text"
                    name="location"
                    defaultValue={editingPlan?.location}
                    required
                    placeholder="e.g., Silicon Valley"
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  />
                )}
              </div>
              {!osTypeFilter && (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">OS Type</label>
                  <input
                    type="text"
                    name="os_type"
                    defaultValue={editingPlan?.os_type || ''}
                    placeholder="e.g., Linux/Windows"
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  />
                </div>
              )}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Monthly Price ($) *</label>
                <input
                  type="number"
                  name="price_monthly"
                  defaultValue={editingPlan?.price_monthly}
                  required
                  step="0.01"
                  min="0"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                />
              </div>
              {category !== 'DEDICATED' && (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Yearly Price ($) *</label>
                  <input
                    type="number"
                    name="price_yearly"
                    defaultValue={editingPlan?.price_yearly || ''}
                    required
                    step="0.01"
                    min="0"
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  />
                </div>
              )}

              {category === 'VPS' && (
                <div className="col-span-2">
                  <label className="block text-sm font-medium text-gray-700 mb-2">Page Description</label>
                  <textarea
                    name="page_description"
                    defaultValue={editingPlan?.page_description || ''}
                    rows={3}
                    placeholder="Description for the VPS location page"
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  />
                </div>
              )}

              {category === 'DEDICATED' && (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Server Type *</label>
                  <select
                    name="subcategory"
                    value={selectedSubcategory}
                    onChange={(e) => setSelectedSubcategory(e.target.value)}
                    required
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                  >
                    {DEDICATED_CATEGORIES.map((cat) => (
                      <option key={cat} value={cat}>
                        {cat.charAt(0) + cat.slice(1).toLowerCase()} Servers
                      </option>
                    ))}
                  </select>
                </div>
              )}

              <div className="col-span-2">
                <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
                  <div className="flex items-center mb-4">
                    <label className="flex items-center cursor-pointer">
                      <input
                        type="checkbox"
                        name="sale_enabled"
                        checked={isSaleEnabled}
                        onChange={(e) => setIsSaleEnabled(e.target.checked)}
                        className="form-checkbox h-5 w-5 text-primary-600 rounded focus:ring-primary-500"
                      />
                      <span className="ml-3 text-sm font-medium text-gray-700">Enable Sale Pricing</span>
                    </label>
                  </div>

                  {isSaleEnabled && (
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">Sale Monthly Price ($) *</label>
                        <input
                          type="number"
                          name="sale_price_monthly"
                          defaultValue={editingPlan?.sale_price_monthly || ''}
                          required={isSaleEnabled}
                          step="0.01"
                          min="0"
                          className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                        />
                      </div>
                      {category !== 'DEDICATED' && (
                        <div>
                          <label className="block text-sm font-medium text-gray-700 mb-2">Sale Yearly Price ($) *</label>
                          <input
                            type="number"
                            name="sale_price_yearly"
                            defaultValue={editingPlan?.sale_price_yearly || ''}
                            required={isSaleEnabled}
                            step="0.01"
                            min="0"
                            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                          />
                        </div>
                      )}
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">Sale Badge Text *</label>
                        <input
                          type="text"
                          name="sale_badge_text"
                          defaultValue={editingPlan?.sale_badge_text || ''}
                          required={isSaleEnabled}
                          placeholder="e.g., Save 20%"
                          className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                        />
                      </div>
                    </div>
                  )}
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Order URL *</label>
                <input
                  type="text"
                  name="order_url"
                  defaultValue={editingPlan?.order_url}
                  required
                  placeholder="/clientarea or https://example.com"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                />
                <p className="mt-1 text-sm text-gray-500">
                  Use relative path (/clientarea) or full URL (https://example.com)
                </p>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Sort Order *</label>
                <input
                  type="number"
                  name="sort_order"
                  defaultValue={editingPlan?.sort_order || (plans.length + 1) * 10}
                  required
                  min="0"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Visible *</label>
                <select
                  name="visible"
                  defaultValue={editingPlan?.visible ? 'true' : 'false'}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                >
                  <option value="true">Yes</option>
                  <option value="false">No</option>
                </select>
              </div>
            </div>
            
            {/* Plan Features */}
            <div className="col-span-2 mt-6">
              <label className="block text-sm font-medium text-gray-700 mb-2">Plan Features</label>
              <div className="bg-gray-50 p-4 rounded-lg border border-gray-200">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  {planFeatures.map((feature, index) => (
                    <div key={index} className="flex items-center">
                      <input
                        type="text"
                        value={feature}
                        onChange={(e) => {
                          const newFeatures = [...planFeatures];
                          newFeatures[index] = e.target.value;
                          setPlanFeatures(newFeatures);
                        }}
                        className="flex-1 px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                      />
                      <button
                        type="button"
                        onClick={() => {
                          const newFeatures = planFeatures.filter((_, i) => i !== index);
                          setPlanFeatures(newFeatures);
                        }}
                        className="ml-2 text-red-500 hover:text-red-700"
                      >
                        <i className="fas fa-times"></i>
                      </button>
                    </div>
                  ))}
                </div>
                <button
                  type="button"
                  onClick={() => setPlanFeatures([...planFeatures, ''])}
                  className="mt-4 px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition-colors text-sm"
                >
                  <i className="fas fa-plus mr-2"></i>
                  Add Feature
                </button>
              </div>
            </div>

            {/* City Features (only for VPS) */}
            {category === 'VPS' && (
              <div className="col-span-2 mt-4">
                <label className="block text-sm font-medium text-gray-700 mb-2">City-Specific Features</label>
                <div className="bg-gray-50 p-4 rounded-lg border border-gray-200">
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    {cityFeatures.map((feature, index) => (
                      <div key={index} className="flex items-center">
                        <input
                          type="text"
                          value={feature}
                          onChange={(e) => {
                            const newFeatures = [...cityFeatures];
                            newFeatures[index] = e.target.value;
                            setCityFeatures(newFeatures);
                          }}
                          className="flex-1 px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                        />
                        <button
                          type="button"
                          onClick={() => {
                            const newFeatures = cityFeatures.filter((_, i) => i !== index);
                            setCityFeatures(newFeatures);
                          }}
                          className="ml-2 text-red-500 hover:text-red-700"
                        >
                          <i className="fas fa-times"></i>
                        </button>
                      </div>
                    ))}
                  </div>
                  <button
                    type="button"
                    onClick={() => setCityFeatures([...cityFeatures, ''])}
                    className="mt-4 px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition-colors text-sm"
                  >
                    <i className="fas fa-plus mr-2"></i>
                    Add City Feature
                  </button>
                </div>
              </div>
            )}

            <div className="mt-8 flex justify-end space-x-4">
              <button
                type="button"
                onClick={() => {
                  setIsEditing(false);
                  setEditingPlan(null);
                  setIsSaleEnabled(false);
                }}
                className="px-6 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors font-medium"
              >
                Cancel
              </button>
              <button
                type="submit"
                disabled={isSubmitting}
                className="px-6 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors font-medium disabled:opacity-50 disabled:cursor-not-allowed flex items-center"
              >
                {isSubmitting ? (
                  <>
                    <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin mr-2"></div>
                    Saving...
                  </>
                ) : (
                  <>
                    <i className="fas fa-save mr-2"></i>
                    Save Plan
                  </>
                )}
              </button>
            </div>
          </form>
        </div>
      ) : (
        <div className="bg-white rounded-xl shadow-lg border border-gray-200 overflow-hidden">
          {plans.length === 0 ? (
            <div className="text-center py-12">
              <div className="text-gray-400 text-6xl mb-4">
                <i className="fas fa-inbox"></i>
              </div>
              <h3 className="text-lg font-medium text-gray-900 mb-2">No plans found</h3>
              <p className="text-gray-500 mb-6">Get started by creating your first plan.</p>
              <button 
                onClick={() => {
                  setEditingPlan(null);
                  setIsEditing(true);
                  setIsSaleEnabled(false);
                }}
                className="bg-primary-600 text-white px-6 py-2 rounded-lg hover:bg-primary-700 transition-colors font-medium"
              >
                <i className="fas fa-plus mr-2"></i>
                Create Plan
              </button>
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Name</th>
                    {category === 'VPS' && (
                      <>
                        <th className="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Region</th>
                        <th className="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Plan Type</th>
                        {!osTypeFilter && (
                          <th className="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">OS Type</th>
                        )}
                      </>
                    )}
                    <th className="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Specs</th>
                    <th className="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Location</th>
                    <th className="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Price</th>
                    <th className="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Sale</th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Visible
                    </th>
                    {isLinuxFeatured && (
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Featured
                      </th>
                    )}
                    <th className="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {plans.map((plan) => (
                    <tr key={plan.id} className="hover:bg-gray-50 transition-colors">
                      <td className="px-6 py-4">
                        <div className="flex items-center">
                          <div className="text-sm font-medium text-gray-900">{plan.name}</div>
                          {plan.os_type && osTypeFilter && (
                            <div className="text-sm text-gray-500">{plan.os_type}</div>
                          )}
                        </div>
                      </td>
                      {category === 'VPS' && (
                        <>
                          <td className="px-6 py-4">
                            <div className="flex items-center">
                              {plan.flag_icon && getFlagImageUrl(plan.flag_icon) ? (
                                <img 
                                  src={getFlagImageUrl(plan.flag_icon)} 
                                  width="20" 
                                  alt={`${plan.location} Flag`} 
                                  className="flag-icon mr-2"
                                />
                              ) : (
                                plan.flag_icon && <span className="mr-2">{plan.flag_icon}</span>
                              )}
                              <span className="text-sm text-gray-900">{plan.region}</span>
                            </div>
                          </td>
                          <td className="px-6 py-4">
                            <span className={`px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full ${
                              plan.plan_type === 'Pro' ? 'bg-purple-100 text-purple-800' :
                              plan.plan_type === 'Standard' ? 'bg-blue-100 text-blue-800' :
                              'bg-green-100 text-green-800'
                            }`}>
                              {plan.plan_type || 'Basic'}
                            </span>
                          </td>
                          {!osTypeFilter && (
                            <td className="px-6 py-4">
                              <span className="text-sm text-gray-900">{plan.os_type || 'Not specified'}</span>
                            </td>
                          )}
                        </>
                      )}
                      <td className="px-6 py-4">
                        <div className="text-sm text-gray-900">
                          <div>{plan.cpu}</div>
                          <div>{plan.ram}</div>
                          <div>{plan.storage}</div>
                         {plan.plan_features && plan.plan_features.length > 0 && (
                           <div className="mt-2">
                             <span className="text-xs text-gray-500">Features: {plan.plan_features.length}</span>
                           </div>
                         )}
                        </div>
                      </td>
                      <td className="px-6 py-4 text-sm text-gray-900">{plan.location}</td>
                      <td className="px-6 py-4">
                        <div className="text-sm text-gray-900">
                          <div className="font-medium">${plan.price_monthly}/mo</div>
                          {plan.price_yearly && (
                            <div className="text-gray-500">${plan.price_yearly}/yr</div>
                          )}
                        </div>
                        {plan.sale_enabled && (
                          <div className="text-green-600 text-sm mt-1">
                            <div>Sale: ${plan.sale_price_monthly}/mo</div>
                            {plan.sale_price_yearly && (
                              <div>Sale: ${plan.sale_price_yearly}/yr</div>
                            )}
                          </div>
                        )}
                      </td>
                      <td className="px-6 py-4">
                        <span className={`px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full ${
                          plan.sale_enabled 
                            ? 'bg-green-100 text-green-800' 
                            : 'bg-gray-100 text-gray-800'
                        }`}>
                          {plan.sale_enabled ? plan.sale_badge_text || 'On Sale' : 'No Sale'}
                        </span>
                      </td>
                      <td className="px-6 py-4">
                        <span className={`px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full ${
                          plan.visible 
                            ? 'bg-green-100 text-green-800' 
                            : 'bg-red-100 text-red-800'
                        }`}>
                          {plan.visible ? 'Visible' : 'Hidden'}
                        </span>
                      </td>
                      
                      {/* Linux Featured Toggle */}
                      {isLinuxFeatured && (
                        <td className="px-6 py-4 whitespace-nowrap">
                          <button
                            onClick={() => handleToggleLinuxFeatured(plan)}
                            className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2 ${
                              plan.is_linux_featured ? 'bg-primary-600' : 'bg-gray-200'
                            }`}
                          >
                            <span
                              className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
                                plan.is_linux_featured ? 'translate-x-6' : 'translate-x-1'
                              }`}
                            />
                          </button>
                        </td>
                      )}
                      
                      <td className="px-6 py-4 text-sm space-x-3">
                        <button 
                          className="text-primary-600 hover:text-primary-900 font-medium transition-colors"
                          onClick={() => handleEdit(plan)}
                        >
                          <i className="fas fa-edit mr-1"></i>
                          Edit
                        </button>
                        <button 
                          className="text-red-600 hover:text-red-900 font-medium transition-colors"
                          onClick={() => deletePlan(plan.id)}
                        >
                          <i className="fas fa-trash mr-1"></i>
                          Delete
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      )}
    </div>
  );

  async function deletePlan(id: string) {
    if (!confirm('Are you sure you want to delete this plan?')) return;

    try {
      const res = await fetch('/api/plans', {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id }),
      });
      if (!res.ok) throw new Error('Failed to delete plan');
      
      toast.success('Plan deleted successfully');
      fetchPlans();
    } catch (error) {
      console.error('Error deleting plan:', error);
      toast.error(`Failed to delete plan: ${error.message}`);
    }
  }

  async function savePlan(plan: Partial<Plan>) {
    try {
      setIsSubmitting(true);
      
      let orderUrl = plan.order_url || '';
      if (!orderUrl.startsWith('/') && !orderUrl.startsWith('http://') && !orderUrl.startsWith('https://')) {
        orderUrl = `https://${orderUrl}`;
      }

      if (plan.sale_enabled) {
        if (!plan.sale_price_monthly) {
          throw new Error('Monthly sale price is required when sale is enabled');
        }
        if (category !== 'DEDICATED' && !plan.sale_price_yearly) {
          throw new Error('Yearly sale price is required when sale is enabled for non-dedicated plans');
        }
        if (plan.sale_price_monthly >= plan.price_monthly!) {
          throw new Error('Monthly sale price must be lower than regular monthly price');
        }
        if (category !== 'DEDICATED' && plan.sale_price_yearly && plan.price_yearly && plan.sale_price_yearly >= plan.price_yearly) {
          throw new Error('Yearly sale price must be lower than regular yearly price');
        }
      }

      const planData = {
        ...plan,
        order_url: orderUrl,
        plan_features: planFeatures,
        city_features: category === 'VPS' ? cityFeatures : null,
        category,
        subcategory: category === 'DEDICATED' ? selectedSubcategory : null,
        region: category === 'VPS' ? (plan.region || selectedRegion) : null,
        location: category === 'RDP' ? selectedLocation : plan.location,
        available_locations: category === 'RDP' ? RDP_LOCATIONS : null,
        os_type: osTypeFilter || plan.os_type || null,
        price_yearly: category === 'DEDICATED' ? (plan.price_monthly! * 12) : (plan.price_yearly || null),
        sale_price_monthly: plan.sale_enabled ? plan.sale_price_monthly : null,
        sale_price_yearly: plan.sale_enabled && category !== 'DEDICATED' ? plan.sale_price_yearly : null,
        sale_badge_text: plan.sale_enabled ? plan.sale_badge_text : null
      };

      let method, body;
      if (editingPlan?.id) {
        console.log('Updating plan:', editingPlan.id, planData);
        method = 'PUT';
        body = { id: editingPlan.id, ...planData };
      } else {
        console.log('Creating plan:', planData);
        method = 'POST';
        body = planData;
      }

      const res = await fetch('/api/plans', {
        method,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body),
      });
      if (!res.ok) {
        const err = await res.json();
        console.error('API save error:', err);
        throw new Error(err.error || 'Failed to save plan');
      }
      
      toast.success(`Plan ${editingPlan?.id ? 'updated' : 'created'} successfully`);
      setIsEditing(false);
      setEditingPlan(null);
      fetchPlans();
    } catch (error) {
      console.error('Error saving plan:', error);
      toast.error(error.message || 'Failed to save plan');
    } finally {
      setIsSubmitting(false);
    }
  }

  function handleEdit(plan: Plan) {
    setEditingPlan(plan);
    setIsEditing(true);
    setIsSaleEnabled(plan.sale_enabled);
    if (category === 'DEDICATED') {
      setSelectedSubcategory(plan.subcategory || 'VALUE');
    }
    if (category === 'VPS') {
      setSelectedRegion(plan.region || 'North America');
    }
  }
}