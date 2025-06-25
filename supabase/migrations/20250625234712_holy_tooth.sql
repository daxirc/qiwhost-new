/*
  # Add India and Australia VPS locations

  This migration adds VPS plans for:
  1. Mumbai, India (South Asia region)
  2. Sydney, Australia (Oceania region)

  Each location has Basic, Standard, and Pro plan types.
*/

INSERT INTO hosting_plans (
  name, category, region, location, flag_icon, page_description, plan_type,
  ram, cpu, storage, bandwidth, os_type,
  price_monthly, price_yearly, order_url, sort_order, visible
) VALUES

-- South Asia - Mumbai (India)
('Mumbai Basic VPS', 'VPS', 'South Asia', 'Mumbai', '🇮🇳', 'Deploy your applications in Mumbai, India, with high-performance VPS hosting and excellent regional connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 20.99, 16.79, '/clientarea', 2210, true),
('Mumbai Standard VPS', 'VPS', 'South Asia', 'Mumbai', '🇮🇳', 'Deploy your applications in Mumbai, India, with high-performance VPS hosting and excellent regional connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 41.99, 33.59, '/clientarea', 2220, true),
('Mumbai Pro VPS', 'VPS', 'South Asia', 'Mumbai', '🇮🇳', 'Deploy your applications in Mumbai, India, with high-performance VPS hosting and excellent regional connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 83.99, 67.19, '/clientarea', 2230, true),

-- Oceania - Sydney (Australia)
('Sydney Basic VPS', 'VPS', 'Oceania', 'Sydney', '🇦🇺', 'Host your services in Sydney, Australia, with premium VPS hosting for the Oceania region and beyond.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 25.99, 20.79, '/clientarea', 2240, true),
('Sydney Standard VPS', 'VPS', 'Oceania', 'Sydney', '🇦🇺', 'Host your services in Sydney, Australia, with premium VPS hosting for the Oceania region and beyond.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 51.99, 41.59, '/clientarea', 2250, true),
('Sydney Pro VPS', 'VPS', 'Oceania', 'Sydney', '🇦🇺', 'Host your services in Sydney, Australia, with premium VPS hosting for the Oceania region and beyond.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 103.99, 83.19, '/clientarea', 2260, true);