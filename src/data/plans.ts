// ============================================================================
// QIW HOST — Hardcoded VPS & RDP Plans Data
// Source: ALL_PRODUCTS_NEW.md (2026-05-03 — updated pricing)
// ============================================================================

const PORTAL = 'https://portal.qiwhost.com';

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------
export interface VpsPlan {
  name: string;
  tier: 'Basic' | 'Professional' | 'Enterprise';
  pid: number;
  cpu: string;
  ram: string;
  storage: string;
  bandwidth: string;
  priceMonthly: number;
  priceAnnually: number;
  productUrl: string;
  cartUrl: string;
}

export interface VpsLocation {
  city: string;
  country: string;
  region: string;
  slug: string;
  flag: string;
  flagCode: string;
  tagline: string;
  groupUrl: string;
  plans: VpsPlan[];
}

export interface RdpPlan {
  name: string;
  tier: 'Basic' | 'Professional' | 'Enterprise';
  pid: number;
  cpu: string;
  ram: string;
  storage: string;
  bandwidth: string;
  priceMonthly: number;
  priceAnnually: number;
  productUrl: string;
  cartUrl: string;
}

export interface RdpLocation {
  name: string;
  country: string;
  slug: string;
  flag: string;
  flagCode: string;
  tagline: string;
  groupUrl: string;
  plans: RdpPlan[];
}

// ---------------------------------------------------------------------------
// Standard VPS tiers (most locations use these exact specs & prices)
// ---------------------------------------------------------------------------
const STD_BASIC = { cpu: '1 vCPU',     ram: '2 GB RAM', storage: '40 GB SSD Storage',  bandwidth: '1000 GB Bandwidth', priceMonthly: 12.99, priceAnnually: 155.88 };
const STD_PRO   = { cpu: '2 vCPU',     ram: '4 GB RAM', storage: '50 GB SSD Storage',  bandwidth: '2000 GB Bandwidth', priceMonthly: 22.99, priceAnnually: 275.88 };
const STD_ENT   = { cpu: '4 vCPU',     ram: '8 GB RAM', storage: '100 GB SSD Storage', bandwidth: '4000 GB Bandwidth', priceMonthly: 42.99, priceAnnually: 515.88 };

function makeVpsPlans(city: string, slug: string, pids: [number, number, number], overrides?: Partial<Record<'basic'|'pro'|'ent', Partial<typeof STD_BASIC>>>): VpsPlan[] {
  const b = { ...STD_BASIC, ...overrides?.basic };
  const p = { ...STD_PRO,   ...overrides?.pro };
  const e = { ...STD_ENT,   ...overrides?.ent };
  return [
    { name: `${city} Basic`,        tier: 'Basic',        pid: pids[0], ...b, productUrl: `${PORTAL}/store/${slug}/basic`,        cartUrl: `${PORTAL}/cart.php?a=add&pid=${pids[0]}` },
    { name: `${city} Professional`, tier: 'Professional', pid: pids[1], ...p, productUrl: `${PORTAL}/store/${slug}/professional`, cartUrl: `${PORTAL}/cart.php?a=add&pid=${pids[1]}` },
    { name: `${city} Enterprise`,   tier: 'Enterprise',   pid: pids[2], ...e, productUrl: `${PORTAL}/store/${slug}/enterprise`,  cartUrl: `${PORTAL}/cart.php?a=add&pid=${pids[2]}` },
  ];
}

function loc(city: string, country: string, region: string, slug: string, flag: string, flagCode: string, pids: [number, number, number], overrides?: Parameters<typeof makeVpsPlans>[3]): VpsLocation {
  return {
    city, country, region, slug, flag, flagCode,
    tagline: `High-performance VPS in ${city}, ${country}`,
    groupUrl: `${PORTAL}/store/${slug}`,
    plans: makeVpsPlans(city, slug, pids, overrides),
  };
}

// ---------------------------------------------------------------------------
// ALL VPS LOCATIONS (47 cities, 141 plans)
// ---------------------------------------------------------------------------
export const vpsLocations: VpsLocation[] = [
  // ── North America ──
  loc('Los Angeles', 'USA', 'North America', 'los-angeles', '🇺🇸', 'us', [2, 53, 3]),
  loc('New York', 'USA', 'North America', 'new-york', '🇺🇸', 'us', [4, 5, 6]),
  loc('Washington', 'USA', 'North America', 'washington', '🇺🇸', 'us', [7, 8, 9]),
  loc('Silicon Valley', 'USA', 'North America', 'silicon-valley', '🇺🇸', 'us', [10, 11, 12]),
  loc('Toronto', 'Canada', 'North America', 'toronto', '🇨🇦', 'ca', [73, 74, 75]),

  // ── South America ──
  loc('Mexico City', 'Mexico', 'South America', 'mexico-city', '🇲🇽', 'mx', [13, 14, 15]),
  loc('Quito', 'Ecuador', 'South America', 'quito', '🇪🇨', 'ec', [70, 71, 72]),
  loc('Bogota', 'Colombia', 'South America', 'bogota', '🇨🇴', 'co', [124, 125, 126]),
  loc('Santiago', 'Chile', 'South America', 'santiago', '🇨🇱', 'cl', [127, 128, 129]),
  loc('Lima', 'Peru', 'South America', 'lima', '🇵🇪', 'pe', [148, 149, 150]),
  loc('Buenos Aires', 'Argentina', 'South America', 'buenos-aires', '🇦🇷', 'ar', [139, 140, 141]),
  loc('Sao Paulo', 'Brazil', 'South America', 'sao-paulo', '🇧🇷', 'br', [157, 158, 159]),

  // ── Europe ──
  loc('London', 'UK', 'Europe', 'london', '🇬🇧', 'gb', [16, 17, 18]),
  loc('Frankfurt', 'Germany', 'Europe', 'frankfurt', '🇩🇪', 'de', [19, 20, 21]),
  loc('Marseille', 'France', 'Europe', 'marseille', '🇫🇷', 'fr', [64, 65, 66]),
  loc('Sofia', 'Bulgaria', 'Europe', 'sofia', '🇧🇬', 'bg', [76, 77, 78]),
  loc('Athens', 'Greece', 'Europe', 'athens', '🇬🇷', 'gr', [97, 98, 99]),
  loc('Istanbul', 'Turkey', 'Europe', 'istanbul', '🇹🇷', 'tr', [100, 101, 102]),
  loc('Bucharest', 'Romania', 'Europe', 'bucharest', '🇷🇴', 'ro', [151, 152, 153]),
  loc('Moscow', 'Russia', 'Europe', 'moscow', '🇷🇺', 'ru', [94, 95, 96]),

  // ── Middle East ──
  loc('Riyadh', 'Saudi Arabia', 'Middle East', 'riyadh', '🇸🇦', 'sa', [67, 68, 69]),
  loc('Dubai', 'UAE', 'Middle East', 'dubai', '🇦🇪', 'ae', [91, 92, 93]),
  loc('Doha', 'Qatar', 'Middle East', 'doha', '🇶🇦', 'qa', [106, 107, 108]),
  loc('Bahrain', 'Bahrain', 'Middle East', 'bahrain', '🇧🇭', 'bh', [121, 122, 123]),
  loc('Muscat', 'Oman', 'Middle East', 'muscat', '🇴🇲', 'om', [115, 116, 117]),
  loc('Kuwait City', 'Kuwait', 'Middle East', 'kuwait-city', '🇰🇼', 'kw', [130, 131, 132]),
  loc('Baghdad', 'Iraq', 'Middle East', 'baghdad', '🇮🇶', 'iq', [136, 137, 138]),
  loc('Jeddah', 'Saudi Arabia', 'Middle East', 'jeddah', '🇸🇦', 'sa', [145, 146, 147]),

  // ── South Asia ──
  loc('Mumbai', 'India', 'South Asia', 'mumbai', '🇮🇳', 'in', [37, 38, 39]),
  loc('Karachi', 'Pakistan', 'South Asia', 'karachi', '🇵🇰', 'pk', [112, 113, 114]),
  loc('Kathmandu', 'Nepal', 'South Asia', 'kathmandu', '🇳🇵', 'np', [154, 155, 156]),
  loc('Dhaka', 'Bangladesh', 'South Asia', 'dhaka', '🇧🇩', 'bd', [133, 134, 135]),

  // ── East Asia ──
  loc('Tokyo', 'Japan', 'East Asia', 'tokyo', '🇯🇵', 'jp', [25, 26, 27]),
  loc('Seoul', 'South Korea', 'East Asia', 'seoul', '🇰🇷', 'kr', [31, 32, 33]),
  loc('Hong Kong', 'Hong Kong', 'East Asia', 'hong-kong', '🇭🇰', 'hk', [28, 29, 30]),
  loc('Taipei', 'Taiwan', 'East Asia', 'taipei', '🇹🇼', 'tw', [34, 35, 36]),

  // ── Southeast Asia ──
  loc('Singapore', 'Singapore', 'Southeast Asia', 'singapore', '🇸🇬', 'sg', [22, 23, 24]),
  loc('Jakarta', 'Indonesia', 'Southeast Asia', 'jakarta', '🇮🇩', 'id', [79, 80, 81]),
  loc('Bangkok', 'Thailand', 'Southeast Asia', 'bangkok', '🇹🇭', 'th', [82, 83, 84]),
  loc('Ho Chi Minh', 'Vietnam', 'Southeast Asia', 'ho-chi-minh', '🇻🇳', 'vn', [85, 86, 87]),
  loc('Manila', 'Philippines', 'Southeast Asia', 'manila', '🇵🇭', 'ph', [88, 89, 90]),
  loc('Phnom Penh', 'Cambodia', 'Southeast Asia', 'phnom-penh', '🇰🇭', 'kh', [103, 104, 105]),
  loc('Kuala Lumpur', 'Malaysia', 'Southeast Asia', 'kuala-lumpur', '🇲🇾', 'my', [109, 110, 111]),
  loc('Hanoi', 'Vietnam', 'Southeast Asia', 'hanoi', '🇻🇳', 'vn', [118, 119, 120]),

  // ── Oceania ──
  loc('Sydney', 'Australia', 'Oceania', 'sydney', '🇦🇺', 'au', [40, 41, 42]),

  // ── Africa ──
  loc('Johannesburg', 'South Africa', 'Africa', 'johannesburg', '🇿🇦', 'za', [54, 43, 55]),
  loc('Cairo', 'Egypt', 'Africa', 'cairo', '🇪🇬', 'eg', [142, 143, 144]),
];

// ---------------------------------------------------------------------------
// ALL RDP LOCATIONS (5 locations, 15 plans)
// ---------------------------------------------------------------------------
function makeRdpPlans(name: string, slug: string, plans: Array<{ tier: RdpPlan['tier']; pid: number; priceMonthly: number; priceAnnually: number }>): RdpPlan[] {
  const specs: Record<string, { cpu: string; ram: string; storage: string; bandwidth: string }> = {
    Basic:        { cpu: '2 vCore CPU', ram: '4 GB RAM',  storage: '40 GB SSD NVMe Storage',  bandwidth: '1000 GB Bandwidth' },
    Professional: { cpu: '3 vCPU',      ram: '8 GB RAM',  storage: '50 GB SSD NVMe Storage',  bandwidth: '2000 GB Bandwidth' },
    Enterprise:   { cpu: '4 vCore CPU', ram: '16 GB RAM', storage: '100 GB SSD NVMe Storage', bandwidth: '3000 GB Bandwidth' },
  };
  return plans.map(p => ({
    name: `${name} ${p.tier}`,
    tier: p.tier,
    pid: p.pid,
    ...specs[p.tier],
    priceMonthly: p.priceMonthly,
    priceAnnually: p.priceAnnually,
    productUrl: `${PORTAL}/store/${slug}/${p.tier.toLowerCase()}`,
    cartUrl: `${PORTAL}/cart.php?a=add&pid=${p.pid}`,
  }));
}

export const rdpLocations: RdpLocation[] = [
  {
    name: 'USA', country: 'USA', slug: 'usa-rdp', flag: '🇺🇸', flagCode: 'us',
    tagline: 'Premium Windows RDP in USA',
    groupUrl: `${PORTAL}/store/usa-rdp`,
    plans: makeRdpPlans('USA', 'usa-rdp', [
      { tier: 'Basic', pid: 44, priceMonthly: 29.99, priceAnnually: 287.88 },
      { tier: 'Professional', pid: 45, priceMonthly: 49.99, priceAnnually: 479.88 },
      { tier: 'Enterprise', pid: 46, priceMonthly: 79.99, priceAnnually: 767.88 },
    ]),
  },
  {
    name: 'Germany', country: 'Germany', slug: 'germany-rdp', flag: '🇩🇪', flagCode: 'de',
    tagline: 'Premium Windows RDP in Germany',
    groupUrl: `${PORTAL}/store/germany-rdp`,
    plans: makeRdpPlans('Germany', 'germany-rdp', [
      { tier: 'Basic', pid: 47, priceMonthly: 32.99, priceAnnually: 316.68 },
      { tier: 'Professional', pid: 56, priceMonthly: 49.99, priceAnnually: 479.88 },
      { tier: 'Enterprise', pid: 57, priceMonthly: 79.99, priceAnnually: 767.88 },
    ]),
  },
  {
    name: 'UK', country: 'UK', slug: 'uk-rdp', flag: '🇬🇧', flagCode: 'gb',
    tagline: 'Premium Windows RDP in UK',
    groupUrl: `${PORTAL}/store/uk-rdp`,
    plans: makeRdpPlans('UK', 'uk-rdp', [
      { tier: 'Basic', pid: 48, priceMonthly: 33.99, priceAnnually: 326.28 },
      { tier: 'Professional', pid: 58, priceMonthly: 49.99, priceAnnually: 479.88 },
      { tier: 'Enterprise', pid: 59, priceMonthly: 79.99, priceAnnually: 767.88 },
    ]),
  },
  {
    name: 'Finland', country: 'Finland', slug: 'finland-rdp', flag: '🇫🇮', flagCode: 'fi',
    tagline: 'Premium Windows RDP in Finland',
    groupUrl: `${PORTAL}/store/finland-rdp`,
    plans: makeRdpPlans('Finland', 'finland-rdp', [
      { tier: 'Basic', pid: 49, priceMonthly: 31.99, priceAnnually: 307.08 },
      { tier: 'Professional', pid: 60, priceMonthly: 49.99, priceAnnually: 479.88 },
      { tier: 'Enterprise', pid: 61, priceMonthly: 79.99, priceAnnually: 767.88 },
    ]),
  },
  {
    name: 'Singapore', country: 'Singapore', slug: 'singapore-rdp', flag: '🇸🇬', flagCode: 'sg',
    tagline: 'Premium Windows RDP in Singapore',
    groupUrl: `${PORTAL}/store/singapore-rdp`,
    plans: makeRdpPlans('Singapore', 'singapore-rdp', [
      { tier: 'Basic', pid: 50, priceMonthly: 34.99, priceAnnually: 335.88 },
      { tier: 'Professional', pid: 62, priceMonthly: 49.99, priceAnnually: 479.88 },
      { tier: 'Enterprise', pid: 63, priceMonthly: 79.99, priceAnnually: 767.88 },
    ]),
  },
];

// ---------------------------------------------------------------------------
// Helper functions
// ---------------------------------------------------------------------------

/** Get all unique regions */
export function getRegions(): string[] {
  return [...new Set(vpsLocations.map(l => l.region))];
}

/** Get locations by region */
export function getLocationsByRegion(region: string): VpsLocation[] {
  return vpsLocations.filter(l => l.region === region);
}

/** Find a VPS location by slug */
export function getLocationBySlug(slug: string): VpsLocation | undefined {
  return vpsLocations.find(l => l.slug === slug);
}

/** Find a VPS location by city name (case-insensitive) */
export function getLocationByCity(city: string): VpsLocation | undefined {
  return vpsLocations.find(l => l.city.toLowerCase() === city.toLowerCase());
}

/** Get RDP location by slug */
export function getRdpBySlug(slug: string): RdpLocation | undefined {
  return rdpLocations.find(l => l.slug === slug);
}

/** Get the first 3 VPS plans (for homepage preview) */
export function getFeaturedVpsPlans(): VpsPlan[] {
  // Return standard-priced plans from the first location (Los Angeles)
  return vpsLocations[0].plans;
}

/** Background image mapping for location cards */
export const locationBackgrounds: Record<string, string> = {
  'Silicon Valley': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539039/Silicon_Valley_sxjcjj.png',
  'Moscow': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539040/Moscow_u5zvnl.png',
  'Frankfurt': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539039/Frankfurt_av8tht.png',
  'Jeddah': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539038/Jeddah_ze1wej.jpg',
  'Washington': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539037/Washington_btanro.png',
  'Athens': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539033/Athens_iiy7zu.png',
  'Bahrain': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539032/Bahrain_ewepu0.jpg',
  'Sofia': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539029/Sofia_nyezgc.png',
  'London': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539029/London_ngfcmz.png',
  'Doha': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539028/Doha_so056c.png',
  'Tokyo': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539027/Tokyo_nvz70e.jpg',
  'Bangkok': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539026/Bangkok_oo0cgx.jpg',
  'Hanoi': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539024/Hanoi_qqfl1y.jpg',
  'Phnom Penh': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539022/Phnom_Penh_l8dqtd.jpg',
  'Ho Chi Minh': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539020/Ho_Chi_Minh_rpgk3a.jpg',
  'Marseille': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539020/Marseille_uojjzm.png',
  'Manila': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539020/Manila_ke9u0g.jpg',
  'Johannesburg': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539018/Johannesburg_xlvrch.png',
  'Taipei': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539017/Taipei_fjfx42.jpg',
  'Hong Kong': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539017/Hong_Kong_sujbn0.jpg',
  'Istanbul': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539016/Istanbul_qwuebu.jpg',
  'Kuwait City': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539015/Kuwait_City_krkgsn.png',
  'Dubai': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539014/Dubai_mxvpm8.jpg',
  'Seoul': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539014/Seoul_xolino.jpg',
  'Riyadh': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539013/Riyadh_jcswfj.jpg',
  'Muscat': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539012/Muscat_q2sddt.jpg',
  'Kathmandu': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539010/Kathmandu_qvab9r.jpg',
  'Baghdad': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539009/Baghdad_j0k3ut.png',
  'Dhaka': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539008/Dhaka_nhwgws.jpg',
  'Singapore': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539006/Singapore_f2a8al.jpg',
  'Kuala Lumpur': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539005/Kuala_Lumpur_cyodnq.jpg',
  'Jakarta': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539003/Jakarta_s3ucyo.jpg',
  'Buenos Aires': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750539002/Buenos_Aires_vn8nvr.jpg',
  'Cairo': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750538998/Cairo_zpzfsq.jpg',
  'Bogota': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750538997/Bogota_c8b38a.jpg',
  'Karachi': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750538996/Karachi_idwjzk.png',
  'Santiago': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750538995/Santiago_m1uy5r.jpg',
  'Sao Paulo': 'https://res.cloudinary.com/dojj0miva/image/upload/f_auto,q_auto/v1750538994/Sao_Paulo_mvmaue.jpg',
  'Mexico City': 'https://images.pexels.com/photos/1386444/pexels-photo-1386444.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'Los Angeles': 'https://images.pexels.com/photos/2695680/pexels-photo-2695680.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'New York': 'https://images.pexels.com/photos/802024/pexels-photo-802024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'Mumbai': 'https://images.pexels.com/photos/2104882/pexels-photo-2104882.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
};

export const defaultBackgroundImage = 'https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';

/** Get background image for a city */
export function getBackgroundImage(city: string): string {
  return locationBackgrounds[city] || defaultBackgroundImage;
}
