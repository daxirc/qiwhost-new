/*
  # Create VPS Plans for Global Locations

  1. Schema Updates
     - Adds plan_features and city_features array columns if they don't exist
  
  2. Data Operations
     - Deletes existing VPS plans for the specified locations
     - Creates 3 plans (Basic, Standard, Pro) for each location
     - Organizes locations by region
     - Sets appropriate flag icons and features
*/

-- Add array columns if they don't exist
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'hosting_plans' AND column_name = 'plan_features') THEN
    ALTER TABLE hosting_plans ADD COLUMN plan_features text[];
  END IF;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'hosting_plans' AND column_name = 'city_features') THEN
    ALTER TABLE hosting_plans ADD COLUMN city_features text[];
  END IF;
END $$;

-- Delete existing VPS plans for the specified locations
DELETE FROM hosting_plans 
WHERE category = 'VPS' AND location IN (
  'Cairo', 'Johannesburg', 
  'Hong Kong', 'Seoul', 'Taipei', 'Tokyo',
  'Athens', 'Frankfurt', 'London', 'Marseille', 'Moscow', 'Sofia',
  'Baghdad', 'Bahrain', 'Doha', 'Dubai', 'Istanbul', 'Jeddah', 'Kuwait City', 'Muscat', 'Riyadh',
  'Mexico City', 'Silicon Valley', 'Washington',
  'Sydney',
  'Bogota', 'Buenos Aires', 'Santiago', 'São Paulo',
  'Dhaka', 'Karachi', 'Kathmandu', 'Mumbai',
  'Bangkok', 'Hanoi', 'Ho Chi Minh City', 'Jakarta', 'Kuala Lumpur', 'Manila', 'Phnom Penh', 'Yangon'
);

-- Function to create VPS plans for a location
CREATE OR REPLACE FUNCTION create_vps_plans(
  p_location text,
  p_region text,
  p_flag_icon text,
  p_sort_order integer,
  p_city_features text[]
) RETURNS void AS $$
BEGIN
  -- Basic Plan
  INSERT INTO hosting_plans (
    name, category, subcategory, cpu, ram, storage, bandwidth, location, region, flag_icon,
    price_monthly, price_yearly, order_url, visible, sort_order, os_type,
    plan_type, plan_features, city_features
  ) VALUES (
    'Basic VPS', 'VPS', NULL, '1 vCPU', '2GB', '30GB SSD', '1TB', p_location, p_region, p_flag_icon,
    9.99, 7.99, 'https://portal.qiwhost.com/login', true, p_sort_order, 'Linux',
    'Basic', ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', '1 IPv4 Address'], p_city_features
  );
  
  -- Standard Plan
  INSERT INTO hosting_plans (
    name, category, subcategory, cpu, ram, storage, bandwidth, location, region, flag_icon,
    price_monthly, price_yearly, order_url, visible, sort_order, os_type,
    plan_type, plan_features, city_features
  ) VALUES (
    'Standard VPS', 'VPS', NULL, '2 vCPU', '4GB', '60GB SSD', '2TB', p_location, p_region, p_flag_icon,
    19.99, 15.99, 'https://portal.qiwhost.com/login', true, p_sort_order + 1, 'Linux',
    'Standard', ARRAY['Full Root Access', 'Linux OS', '24/7 Priority Support', 'SSD Storage', '1 IPv4 Address', 'Free SSL Certificate'], p_city_features
  );
  
  -- Pro Plan
  INSERT INTO hosting_plans (
    name, category, subcategory, cpu, ram, storage, bandwidth, location, region, flag_icon,
    price_monthly, price_yearly, order_url, visible, sort_order, os_type,
    plan_type, plan_features, city_features
  ) VALUES (
    'Pro VPS', 'VPS', NULL, '4 vCPU', '8GB', '120GB SSD', '4TB', p_location, p_region, p_flag_icon,
    39.99, 31.99, 'https://portal.qiwhost.com/login', true, p_sort_order + 2, 'Linux',
    'Pro', ARRAY['Full Root Access', 'Linux OS', '24/7 Priority Support', 'SSD Storage', '1 IPv4 Address', 'Free SSL Certificate', 'Daily Backups', 'DDoS Protection'], p_city_features
  );
END;
$$ LANGUAGE plpgsql;

-- Create plans for Africa
SELECT create_vps_plans('Cairo', 'Africa', '🇪🇬', 100, ARRAY['Low Latency North Africa Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Johannesburg', 'Africa', '🇿🇦', 110, ARRAY['Low Latency Africa Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);

-- Create plans for East Asia
SELECT create_vps_plans('Hong Kong', 'East Asia', '🇭🇰', 200, ARRAY['Low Latency East Asia Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Seoul', 'East Asia', '🇰🇷', 210, ARRAY['Low Latency Korea Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Taipei', 'East Asia', '🇹🇼', 220, ARRAY['Low Latency Taiwan Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Tokyo', 'East Asia', '🇯🇵', 230, ARRAY['Low Latency Japan Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);

-- Create plans for Europe
SELECT create_vps_plans('Athens', 'Europe', '🇬🇷', 300, ARRAY['Low Latency Southern Europe Access', 'Enterprise-grade Infrastructure', 'GDPR Compliant', 'Green Energy Powered']);
SELECT create_vps_plans('Frankfurt', 'Europe', '🇩🇪', 310, ARRAY['Low Latency Central Europe Access', 'Enterprise-grade Infrastructure', 'GDPR Compliant', 'Green Energy Powered']);
SELECT create_vps_plans('London', 'Europe', '🇬🇧', 320, ARRAY['Low Latency UK Access', 'Enterprise-grade Infrastructure', 'GDPR Compliant', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Marseille', 'Europe', '🇫🇷', 330, ARRAY['Low Latency Southern Europe Access', 'Enterprise-grade Infrastructure', 'GDPR Compliant', 'Green Energy Powered']);
SELECT create_vps_plans('Moscow', 'Europe', '🇷🇺', 340, ARRAY['Low Latency Eastern Europe Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Sofia', 'Europe', '🇧🇬', 350, ARRAY['Low Latency Eastern Europe Access', 'Enterprise-grade Infrastructure', 'GDPR Compliant', 'Green Energy Powered']);

-- Create plans for Middle East
SELECT create_vps_plans('Baghdad', 'Middle East', '🇮🇶', 400, ARRAY['Low Latency Iraq Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Bahrain', 'Middle East', '🇧🇭', 410, ARRAY['Low Latency Gulf Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Doha', 'Middle East', '🇶🇦', 420, ARRAY['Low Latency Qatar Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Dubai', 'Middle East', '🇦🇪', 430, ARRAY['Low Latency UAE Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Istanbul', 'Middle East', '🇹🇷', 440, ARRAY['Low Latency Turkey Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Jeddah', 'Middle East', '🇸🇦', 450, ARRAY['Low Latency Saudi Arabia Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Kuwait City', 'Middle East', '🇰🇼', 460, ARRAY['Low Latency Kuwait Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Muscat', 'Middle East', '🇴🇲', 470, ARRAY['Low Latency Oman Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Riyadh', 'Middle East', '🇸🇦', 480, ARRAY['Low Latency Saudi Arabia Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);

-- Create plans for North America
SELECT create_vps_plans('Mexico City', 'North America', '🇲🇽', 500, ARRAY['Low Latency Mexico Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Silicon Valley', 'North America', '🇺🇸', 510, ARRAY['Low Latency US West Coast Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Washington', 'North America', '🇺🇸', 520, ARRAY['Low Latency US East Coast Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);

-- Create plans for Oceania
SELECT create_vps_plans('Sydney', 'Oceania', '🇦🇺', 600, ARRAY['Low Latency Australia Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);

-- Create plans for South America
SELECT create_vps_plans('Bogota', 'South America', '🇨🇴', 700, ARRAY['Low Latency Colombia Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Buenos Aires', 'South America', '🇦🇷', 710, ARRAY['Low Latency Argentina Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Santiago', 'South America', '🇨🇱', 720, ARRAY['Low Latency Chile Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('São Paulo', 'South America', '🇧🇷', 730, ARRAY['Low Latency Brazil Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);

-- Create plans for South Asia
SELECT create_vps_plans('Dhaka', 'South Asia', '🇧🇩', 800, ARRAY['Low Latency Bangladesh Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Karachi', 'South Asia', '🇵🇰', 810, ARRAY['Low Latency Pakistan Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Kathmandu', 'South Asia', '🇳🇵', 820, ARRAY['Low Latency Nepal Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Mumbai', 'South Asia', '🇮🇳', 830, ARRAY['Low Latency India Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);

-- Create plans for Southeast Asia
SELECT create_vps_plans('Bangkok', 'Southeast Asia', '🇹🇭', 900, ARRAY['Low Latency Thailand Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Hanoi', 'Southeast Asia', '🇻🇳', 910, ARRAY['Low Latency Vietnam Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Ho Chi Minh City', 'Southeast Asia', '🇻🇳', 920, ARRAY['Low Latency Vietnam Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Jakarta', 'Southeast Asia', '🇮🇩', 930, ARRAY['Low Latency Indonesia Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Kuala Lumpur', 'Southeast Asia', '🇲🇾', 940, ARRAY['Low Latency Malaysia Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Manila', 'Southeast Asia', '🇵🇭', 950, ARRAY['Low Latency Philippines Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Phnom Penh', 'Southeast Asia', '🇰🇭', 960, ARRAY['Low Latency Cambodia Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);
SELECT create_vps_plans('Yangon', 'Southeast Asia', '🇲🇲', 970, ARRAY['Low Latency Myanmar Access', 'Enterprise-grade Infrastructure', 'Multiple Datacenter Options', 'Tier-1 Network Providers']);

-- Drop the function as it's no longer needed
DROP FUNCTION create_vps_plans;