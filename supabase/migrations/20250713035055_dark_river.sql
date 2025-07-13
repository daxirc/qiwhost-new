/*
  # Upgrade VPS Plans and City Pages

  1. New Fields
    - Add `plan_features` array field to hosting_plans table to store plan-specific features
    - Add `city_features` array field to hosting_plans table to store city-specific features
  
  2. Updates
    - Update existing plans to include default features
    - Ensure each city has at least 3 plans (Basic, Standard, Pro)
*/

-- Add new columns to hosting_plans table
ALTER TABLE public.hosting_plans 
ADD COLUMN IF NOT EXISTS plan_features text[] DEFAULT NULL,
ADD COLUMN IF NOT EXISTS city_features text[] DEFAULT NULL;

-- Update existing VPS plans with default features
UPDATE public.hosting_plans
SET plan_features = ARRAY[
  'Full Root Access',
  'SSD Storage',
  'DDoS Protection',
  '24/7 Support',
  'Instant Provisioning',
  '99.9% Uptime Guarantee'
]
WHERE category = 'VPS' AND plan_features IS NULL;

-- Update city-specific features for all VPS plans
UPDATE public.hosting_plans
SET city_features = ARRAY[
  'Low Latency Network',
  'Enterprise-grade Infrastructure',
  'Multiple Datacenter Options',
  'Tier-1 Network Providers',
  'Redundant Power Systems',
  'Advanced Cooling Systems'
]
WHERE category = 'VPS' AND city_features IS NULL;

-- Ensure each city has Basic, Standard, and Pro plans
-- This is a helper function to check and create missing plans
DO $$
DECLARE
  city_record RECORD;
  region_val TEXT;
  flag_icon_val TEXT;
  location_val TEXT;
  plan_types TEXT[] := ARRAY['Basic', 'Standard', 'Pro'];
  plan_type TEXT;
  existing_count INTEGER;
  sort_order_val INTEGER;
  page_description_val TEXT;
BEGIN
  -- Get all unique cities
  FOR city_record IN 
    SELECT DISTINCT location, region, flag_icon, page_description
    FROM public.hosting_plans
    WHERE category = 'VPS' AND location IS NOT NULL
  LOOP
    location_val := city_record.location;
    region_val := city_record.region;
    flag_icon_val := city_record.flag_icon;
    page_description_val := city_record.page_description;
    
    -- Check each plan type
    FOREACH plan_type IN ARRAY plan_types
    LOOP
      -- Check if this plan type exists for this city
      SELECT COUNT(*) INTO existing_count
      FROM public.hosting_plans
      WHERE category = 'VPS' AND location = location_val AND plan_type = plan_type;
      
      -- If plan doesn't exist, create it
      IF existing_count = 0 THEN
        -- Get the highest sort order for this city and add 10
        SELECT COALESCE(MAX(sort_order), 0) + 10 INTO sort_order_val
        FROM public.hosting_plans
        WHERE category = 'VPS' AND location = location_val;
        
        -- Insert the missing plan
        INSERT INTO public.hosting_plans (
          name, 
          category, 
          ram, 
          cpu, 
          storage, 
          bandwidth, 
          location, 
          region,
          flag_icon,
          page_description,
          os_type, 
          price_monthly, 
          price_yearly, 
          order_url, 
          visible, 
          sort_order,
          plan_type,
          plan_features,
          city_features
        ) VALUES (
          CASE 
            WHEN plan_type = 'Basic' THEN location_val || ' Basic VPS'
            WHEN plan_type = 'Standard' THEN location_val || ' Standard VPS'
            WHEN plan_type = 'Pro' THEN location_val || ' Pro VPS'
          END,
          'VPS',
          CASE 
            WHEN plan_type = 'Basic' THEN '2GB'
            WHEN plan_type = 'Standard' THEN '4GB'
            WHEN plan_type = 'Pro' THEN '8GB'
          END,
          CASE 
            WHEN plan_type = 'Basic' THEN '1 vCPU'
            WHEN plan_type = 'Standard' THEN '2 vCPU'
            WHEN plan_type = 'Pro' THEN '4 vCPU'
          END,
          CASE 
            WHEN plan_type = 'Basic' THEN '40GB SSD'
            WHEN plan_type = 'Standard' THEN '80GB SSD'
            WHEN plan_type = 'Pro' THEN '160GB SSD'
          END,
          CASE 
            WHEN plan_type = 'Basic' THEN '1TB'
            WHEN plan_type = 'Standard' THEN '2TB'
            WHEN plan_type = 'Pro' THEN '4TB'
          END,
          location_val,
          region_val,
          flag_icon_val,
          page_description_val,
          'Linux',
          CASE 
            WHEN plan_type = 'Basic' THEN 9.99
            WHEN plan_type = 'Standard' THEN 19.99
            WHEN plan_type = 'Pro' THEN 39.99
          END,
          CASE 
            WHEN plan_type = 'Basic' THEN 7.99
            WHEN plan_type = 'Standard' THEN 15.99
            WHEN plan_type = 'Pro' THEN 31.99
          END,
          'https://portal.qiwhost.com/login',
          TRUE,
          sort_order_val,
          plan_type,
          ARRAY[
            'Full Root Access',
            'SSD Storage',
            'DDoS Protection',
            '24/7 Support',
            'Instant Provisioning',
            '99.9% Uptime Guarantee'
          ],
          ARRAY[
            'Low Latency Network',
            'Enterprise-grade Infrastructure',
            'Multiple Datacenter Options',
            'Tier-1 Network Providers',
            'Redundant Power Systems',
            'Advanced Cooling Systems'
          ]
        );
      END IF;
    END LOOP;
  END LOOP;
END $$;