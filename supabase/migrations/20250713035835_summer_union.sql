/*
  # Recreate VPS Plans for Each City

  1. Changes
     - Delete all existing VPS plans
     - Create fresh VPS plans for each city location
     - Add Basic, Standard, and Pro plan types for each city
     - Include plan features and city-specific features
  
  2. Security
     - Maintain existing RLS policies
*/

-- First, delete all existing VPS plans
DELETE FROM public.hosting_plans WHERE category = 'VPS';

-- Ensure we have plan_features and city_features columns
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'hosting_plans' AND column_name = 'plan_features'
  ) THEN
    ALTER TABLE public.hosting_plans ADD COLUMN plan_features text[] DEFAULT NULL;
  END IF;
  
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'hosting_plans' AND column_name = 'city_features'
  ) THEN
    ALTER TABLE public.hosting_plans ADD COLUMN city_features text[] DEFAULT NULL;
  END IF;
END $$;

-- Create fresh VPS plans for each city

-- New York City
INSERT INTO public.hosting_plans (
  name, category, ram, cpu, storage, bandwidth, location, os_type, 
  price_monthly, price_yearly, order_url, visible, sort_order, 
  created_at, updated_at, subcategory, region, flag_icon, 
  plan_type, plan_features, city_features
) VALUES
(
  'Basic VPS - New York', 'VPS', '2GB', '1 vCPU', '20GB SSD', '1TB', 
  'New York', 'Linux', 9.99, 7.99, 'https://portal.qiwhost.com/cart.php', 
  true, 10, now(), now(), NULL, 'North America', '🇺🇸',
  'Basic', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection'],
  ARRAY['Low Latency Network', 'Tier-1 Network Providers', 'Redundant Power Systems', 'Advanced Cooling']
),
(
  'Standard VPS - New York', 'VPS', '4GB', '2 vCPU', '40GB SSD', '2TB', 
  'New York', 'Linux', 19.99, 15.99, 'https://portal.qiwhost.com/cart.php', 
  true, 20, now(), now(), NULL, 'North America', '🇺🇸',
  'Standard', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection', 'Free Backups'],
  ARRAY['Low Latency Network', 'Tier-1 Network Providers', 'Redundant Power Systems', 'Advanced Cooling']
),
(
  'Pro VPS - New York', 'VPS', '8GB', '4 vCPU', '80GB SSD', '4TB', 
  'New York', 'Linux', 39.99, 31.99, 'https://portal.qiwhost.com/cart.php', 
  true, 30, now(), now(), NULL, 'North America', '🇺🇸',
  'Pro', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Priority Support', 'SSD Storage', 'DDoS Protection', 'Free Backups', 'Dedicated IP'],
  ARRAY['Low Latency Network', 'Tier-1 Network Providers', 'Redundant Power Systems', 'Advanced Cooling']
);

-- Los Angeles
INSERT INTO public.hosting_plans (
  name, category, ram, cpu, storage, bandwidth, location, os_type, 
  price_monthly, price_yearly, order_url, visible, sort_order, 
  created_at, updated_at, subcategory, region, flag_icon, 
  plan_type, plan_features, city_features
) VALUES
(
  'Basic VPS - Los Angeles', 'VPS', '2GB', '1 vCPU', '20GB SSD', '1TB', 
  'Los Angeles', 'Linux', 9.99, 7.99, 'https://portal.qiwhost.com/cart.php', 
  true, 10, now(), now(), NULL, 'North America', '🇺🇸',
  'Basic', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection'],
  ARRAY['West Coast Connectivity', 'Asia-Pacific Optimized Routes', 'Green Energy Datacenter', 'Enterprise Hardware']
),
(
  'Standard VPS - Los Angeles', 'VPS', '4GB', '2 vCPU', '40GB SSD', '2TB', 
  'Los Angeles', 'Linux', 19.99, 15.99, 'https://portal.qiwhost.com/cart.php', 
  true, 20, now(), now(), NULL, 'North America', '🇺🇸',
  'Standard', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection', 'Free Backups'],
  ARRAY['West Coast Connectivity', 'Asia-Pacific Optimized Routes', 'Green Energy Datacenter', 'Enterprise Hardware']
),
(
  'Pro VPS - Los Angeles', 'VPS', '8GB', '4 vCPU', '80GB SSD', '4TB', 
  'Los Angeles', 'Linux', 39.99, 31.99, 'https://portal.qiwhost.com/cart.php', 
  true, 30, now(), now(), NULL, 'North America', '🇺🇸',
  'Pro', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Priority Support', 'SSD Storage', 'DDoS Protection', 'Free Backups', 'Dedicated IP'],
  ARRAY['West Coast Connectivity', 'Asia-Pacific Optimized Routes', 'Green Energy Datacenter', 'Enterprise Hardware']
);

-- London
INSERT INTO public.hosting_plans (
  name, category, ram, cpu, storage, bandwidth, location, os_type, 
  price_monthly, price_yearly, order_url, visible, sort_order, 
  created_at, updated_at, subcategory, region, flag_icon, 
  plan_type, plan_features, city_features
) VALUES
(
  'Basic VPS - London', 'VPS', '2GB', '1 vCPU', '20GB SSD', '1TB', 
  'London', 'Linux', 10.99, 8.99, 'https://portal.qiwhost.com/cart.php', 
  true, 10, now(), now(), NULL, 'Europe', '🇬🇧',
  'Basic', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection'],
  ARRAY['GDPR Compliant', 'European Network Hub', 'Tier-4 Facility', 'Low Latency UK Access']
),
(
  'Standard VPS - London', 'VPS', '4GB', '2 vCPU', '40GB SSD', '2TB', 
  'London', 'Linux', 21.99, 17.99, 'https://portal.qiwhost.com/cart.php', 
  true, 20, now(), now(), NULL, 'Europe', '🇬🇧',
  'Standard', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection', 'Free Backups'],
  ARRAY['GDPR Compliant', 'European Network Hub', 'Tier-4 Facility', 'Low Latency UK Access']
),
(
  'Pro VPS - London', 'VPS', '8GB', '4 vCPU', '80GB SSD', '4TB', 
  'London', 'Linux', 42.99, 34.99, 'https://portal.qiwhost.com/cart.php', 
  true, 30, now(), now(), NULL, 'Europe', '🇬🇧',
  'Pro', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Priority Support', 'SSD Storage', 'DDoS Protection', 'Free Backups', 'Dedicated IP'],
  ARRAY['GDPR Compliant', 'European Network Hub', 'Tier-4 Facility', 'Low Latency UK Access']
);

-- Frankfurt
INSERT INTO public.hosting_plans (
  name, category, ram, cpu, storage, bandwidth, location, os_type, 
  price_monthly, price_yearly, order_url, visible, sort_order, 
  created_at, updated_at, subcategory, region, flag_icon, 
  plan_type, plan_features, city_features
) VALUES
(
  'Basic VPS - Frankfurt', 'VPS', '2GB', '1 vCPU', '20GB SSD', '1TB', 
  'Frankfurt', 'Linux', 10.99, 8.99, 'https://portal.qiwhost.com/cart.php', 
  true, 10, now(), now(), NULL, 'Europe', '🇩🇪',
  'Basic', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection'],
  ARRAY['GDPR Compliant', 'Central European Hub', 'Green Energy Powered', 'High Security Facility']
),
(
  'Standard VPS - Frankfurt', 'VPS', '4GB', '2 vCPU', '40GB SSD', '2TB', 
  'Frankfurt', 'Linux', 21.99, 17.99, 'https://portal.qiwhost.com/cart.php', 
  true, 20, now(), now(), NULL, 'Europe', '🇩🇪',
  'Standard', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection', 'Free Backups'],
  ARRAY['GDPR Compliant', 'Central European Hub', 'Green Energy Powered', 'High Security Facility']
),
(
  'Pro VPS - Frankfurt', 'VPS', '8GB', '4 vCPU', '80GB SSD', '4TB', 
  'Frankfurt', 'Linux', 42.99, 34.99, 'https://portal.qiwhost.com/cart.php', 
  true, 30, now(), now(), NULL, 'Europe', '🇩🇪',
  'Pro', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Priority Support', 'SSD Storage', 'DDoS Protection', 'Free Backups', 'Dedicated IP'],
  ARRAY['GDPR Compliant', 'Central European Hub', 'Green Energy Powered', 'High Security Facility']
);

-- Singapore
INSERT INTO public.hosting_plans (
  name, category, ram, cpu, storage, bandwidth, location, os_type, 
  price_monthly, price_yearly, order_url, visible, sort_order, 
  created_at, updated_at, subcategory, region, flag_icon, 
  plan_type, plan_features, city_features
) VALUES
(
  'Basic VPS - Singapore', 'VPS', '2GB', '1 vCPU', '20GB SSD', '1TB', 
  'Singapore', 'Linux', 11.99, 9.99, 'https://portal.qiwhost.com/cart.php', 
  true, 10, now(), now(), NULL, 'Asia', '🇸🇬',
  'Basic', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection'],
  ARRAY['Asia-Pacific Hub', 'Low Latency SEA Access', 'Tier-3 Datacenter', 'Multiple Backbone Connections']
),
(
  'Standard VPS - Singapore', 'VPS', '4GB', '2 vCPU', '40GB SSD', '2TB', 
  'Singapore', 'Linux', 22.99, 18.99, 'https://portal.qiwhost.com/cart.php', 
  true, 20, now(), now(), NULL, 'Asia', '🇸🇬',
  'Standard', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection', 'Free Backups'],
  ARRAY['Asia-Pacific Hub', 'Low Latency SEA Access', 'Tier-3 Datacenter', 'Multiple Backbone Connections']
),
(
  'Pro VPS - Singapore', 'VPS', '8GB', '4 vCPU', '80GB SSD', '4TB', 
  'Singapore', 'Linux', 44.99, 36.99, 'https://portal.qiwhost.com/cart.php', 
  true, 30, now(), now(), NULL, 'Asia', '🇸🇬',
  'Pro', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Priority Support', 'SSD Storage', 'DDoS Protection', 'Free Backups', 'Dedicated IP'],
  ARRAY['Asia-Pacific Hub', 'Low Latency SEA Access', 'Tier-3 Datacenter', 'Multiple Backbone Connections']
);

-- Tokyo
INSERT INTO public.hosting_plans (
  name, category, ram, cpu, storage, bandwidth, location, os_type, 
  price_monthly, price_yearly, order_url, visible, sort_order, 
  created_at, updated_at, subcategory, region, flag_icon, 
  plan_type, plan_features, city_features
) VALUES
(
  'Basic VPS - Tokyo', 'VPS', '2GB', '1 vCPU', '20GB SSD', '1TB', 
  'Tokyo', 'Linux', 11.99, 9.99, 'https://portal.qiwhost.com/cart.php', 
  true, 10, now(), now(), NULL, 'Asia', '🇯🇵',
  'Basic', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection'],
  ARRAY['Japan Network Hub', 'Low Latency East Asia Access', 'Earthquake-Resistant Facility', 'Advanced Cooling Systems']
),
(
  'Standard VPS - Tokyo', 'VPS', '4GB', '2 vCPU', '40GB SSD', '2TB', 
  'Tokyo', 'Linux', 22.99, 18.99, 'https://portal.qiwhost.com/cart.php', 
  true, 20, now(), now(), NULL, 'Asia', '🇯🇵',
  'Standard', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection', 'Free Backups'],
  ARRAY['Japan Network Hub', 'Low Latency East Asia Access', 'Earthquake-Resistant Facility', 'Advanced Cooling Systems']
),
(
  'Pro VPS - Tokyo', 'VPS', '8GB', '4 vCPU', '80GB SSD', '4TB', 
  'Tokyo', 'Linux', 44.99, 36.99, 'https://portal.qiwhost.com/cart.php', 
  true, 30, now(), now(), NULL, 'Asia', '🇯🇵',
  'Pro', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Priority Support', 'SSD Storage', 'DDoS Protection', 'Free Backups', 'Dedicated IP'],
  ARRAY['Japan Network Hub', 'Low Latency East Asia Access', 'Earthquake-Resistant Facility', 'Advanced Cooling Systems']
);

-- Sydney
INSERT INTO public.hosting_plans (
  name, category, ram, cpu, storage, bandwidth, location, os_type, 
  price_monthly, price_yearly, order_url, visible, sort_order, 
  created_at, updated_at, subcategory, region, flag_icon, 
  plan_type, plan_features, city_features
) VALUES
(
  'Basic VPS - Sydney', 'VPS', '2GB', '1 vCPU', '20GB SSD', '1TB', 
  'Sydney', 'Linux', 11.99, 9.99, 'https://portal.qiwhost.com/cart.php', 
  true, 10, now(), now(), NULL, 'Oceania', '🇦🇺',
  'Basic', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection'],
  ARRAY['Australia Network Hub', 'Low Latency Oceania Access', 'Tier-3 Facility', 'Renewable Energy Powered']
),
(
  'Standard VPS - Sydney', 'VPS', '4GB', '2 vCPU', '40GB SSD', '2TB', 
  'Sydney', 'Linux', 22.99, 18.99, 'https://portal.qiwhost.com/cart.php', 
  true, 20, now(), now(), NULL, 'Oceania', '🇦🇺',
  'Standard', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Support', 'SSD Storage', 'DDoS Protection', 'Free Backups'],
  ARRAY['Australia Network Hub', 'Low Latency Oceania Access', 'Tier-3 Facility', 'Renewable Energy Powered']
),
(
  'Pro VPS - Sydney', 'VPS', '8GB', '4 vCPU', '80GB SSD', '4TB', 
  'Sydney', 'Linux', 44.99, 36.99, 'https://portal.qiwhost.com/cart.php', 
  true, 30, now(), now(), NULL, 'Oceania', '🇦🇺',
  'Pro', 
  ARRAY['Full Root Access', 'Linux OS', '24/7 Priority Support', 'SSD Storage', 'DDoS Protection', 'Free Backups', 'Dedicated IP'],
  ARRAY['Australia Network Hub', 'Low Latency Oceania Access', 'Tier-3 Facility', 'Renewable Energy Powered']
);

-- Add more cities as needed