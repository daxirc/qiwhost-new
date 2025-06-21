/*
  # Populate initial VPS location data

  This migration adds sample VPS plans for multiple cities across different regions.
  Each city will have 3 plans: Basic, Standard, and Pro.
*/

-- Insert VPS location plans for multiple cities
INSERT INTO hosting_plans (
  name, category, region, location, flag_icon, page_description, plan_type,
  ram, cpu, storage, bandwidth, os_type,
  price_monthly, price_yearly, order_url, sort_order, visible
) VALUES

-- North America - Silicon Valley
('Silicon Valley Basic VPS', 'VPS', 'North America', 'Silicon Valley', '🇺🇸', 'Experience premium VPS hosting in the heart of Silicon Valley with ultra-low latency and enterprise-grade infrastructure.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 19.99, 15.99, '/clientarea', 1010, true),
('Silicon Valley Standard VPS', 'VPS', 'North America', 'Silicon Valley', '🇺🇸', 'Experience premium VPS hosting in the heart of Silicon Valley with ultra-low latency and enterprise-grade infrastructure.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 39.99, 31.99, '/clientarea', 1020, true),
('Silicon Valley Pro VPS', 'VPS', 'North America', 'Silicon Valley', '🇺🇸', 'Experience premium VPS hosting in the heart of Silicon Valley with ultra-low latency and enterprise-grade infrastructure.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 79.99, 63.99, '/clientarea', 1030, true),

-- North America - Washington
('Washington Basic VPS', 'VPS', 'North America', 'Washington', '🇺🇸', 'Deploy your applications in Washington DC with direct access to government and enterprise networks.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 18.99, 15.19, '/clientarea', 1040, true),
('Washington Standard VPS', 'VPS', 'North America', 'Washington', '🇺🇸', 'Deploy your applications in Washington DC with direct access to government and enterprise networks.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 37.99, 30.39, '/clientarea', 1050, true),
('Washington Pro VPS', 'VPS', 'North America', 'Washington', '🇺🇸', 'Deploy your applications in Washington DC with direct access to government and enterprise networks.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 75.99, 60.79, '/clientarea', 1060, true),

-- Europe - Frankfurt
('Frankfurt Basic VPS', 'VPS', 'Europe', 'Frankfurt', '🇩🇪', 'Host your services in Frankfurt, Germany - the digital gateway to Europe with excellent connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 17.99, 14.39, '/clientarea', 1070, true),
('Frankfurt Standard VPS', 'VPS', 'Europe', 'Frankfurt', '🇩🇪', 'Host your services in Frankfurt, Germany - the digital gateway to Europe with excellent connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 35.99, 28.79, '/clientarea', 1080, true),
('Frankfurt Pro VPS', 'VPS', 'Europe', 'Frankfurt', '🇩🇪', 'Host your services in Frankfurt, Germany - the digital gateway to Europe with excellent connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 71.99, 57.59, '/clientarea', 1090, true),

-- Europe - London
('London Basic VPS', 'VPS', 'Europe', 'London', '🇬🇧', 'Power your applications from London with premium UK-based hosting and GDPR compliance.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 18.99, 15.19, '/clientarea', 1100, true),
('London Standard VPS', 'VPS', 'Europe', 'London', '🇬🇧', 'Power your applications from London with premium UK-based hosting and GDPR compliance.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 37.99, 30.39, '/clientarea', 1110, true),
('London Pro VPS', 'VPS', 'Europe', 'London', '🇬🇧', 'Power your applications from London with premium UK-based hosting and GDPR compliance.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 75.99, 60.79, '/clientarea', 1120, true),

-- Southeast Asia - Singapore
('Singapore Basic VPS', 'VPS', 'Southeast Asia', 'Singapore', '🇸🇬', 'Connect to Asia-Pacific markets with Singapore VPS hosting featuring world-class infrastructure.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 21.99, 17.59, '/clientarea', 1130, true),
('Singapore Standard VPS', 'VPS', 'Southeast Asia', 'Singapore', '🇸🇬', 'Connect to Asia-Pacific markets with Singapore VPS hosting featuring world-class infrastructure.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 41.99, 33.59, '/clientarea', 1140, true),
('Singapore Pro VPS', 'VPS', 'Southeast Asia', 'Singapore', '🇸🇬', 'Connect to Asia-Pacific markets with Singapore VPS hosting featuring world-class infrastructure.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 83.99, 67.19, '/clientarea', 1150, true),

-- East Asia - Tokyo
('Tokyo Basic VPS', 'VPS', 'East Asia', 'Tokyo', '🇯🇵', 'Serve Japanese and Asian markets with Tokyo VPS hosting offering exceptional performance and reliability.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 22.99, 18.39, '/clientarea', 1160, true),
('Tokyo Standard VPS', 'VPS', 'East Asia', 'Tokyo', '🇯🇵', 'Serve Japanese and Asian markets with Tokyo VPS hosting offering exceptional performance and reliability.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 43.99, 35.19, '/clientarea', 1170, true),
('Tokyo Pro VPS', 'VPS', 'East Asia', 'Tokyo', '🇯🇵', 'Serve Japanese and Asian markets with Tokyo VPS hosting offering exceptional performance and reliability.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 87.99, 70.39, '/clientarea', 1180, true);