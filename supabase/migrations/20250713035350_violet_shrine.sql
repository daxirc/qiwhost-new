/*
  # Fix VPS Plans Structure and Data

  1. Schema Updates
    - Add plan_features array column to hosting_plans table
    - Add city_features array column to hosting_plans table
  
  2. Data Updates
    - Update existing VPS plans with default features
    - Ensure each city has Basic, Standard, and Pro plans
*/

-- Add plan_features and city_features columns if they don't exist
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'hosting_plans' AND column_name = 'plan_features'
  ) THEN
    ALTER TABLE hosting_plans ADD COLUMN plan_features text[] DEFAULT NULL;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'hosting_plans' AND column_name = 'city_features'
  ) THEN
    ALTER TABLE hosting_plans ADD COLUMN city_features text[] DEFAULT NULL;
  END IF;
END $$;

-- Update existing VPS plans with default features
UPDATE hosting_plans
SET plan_features = ARRAY[
  'Full Root Access',
  'SSD Storage',
  'DDoS Protection',
  '24/7 Support',
  'Instant Provisioning',
  '99.9% Uptime Guarantee'
]
WHERE category = 'VPS' AND plan_features IS NULL;

-- Update VPS plans with city-specific features
UPDATE hosting_plans
SET city_features = ARRAY[
  'Low Latency Network',
  'Enterprise-grade Infrastructure',
  'Multiple Datacenter Options',
  'Tier-1 Network Providers',
  'Redundant Power Systems',
  'Advanced Cooling Systems'
]
WHERE category = 'VPS' AND city_features IS NULL;

-- Ensure plan_type is set for all VPS plans
UPDATE hosting_plans
SET plan_type = 'Basic'
WHERE category = 'VPS' AND plan_type IS NULL AND sort_order < 20;

UPDATE hosting_plans
SET plan_type = 'Standard'
WHERE category = 'VPS' AND plan_type IS NULL AND sort_order >= 20 AND sort_order < 30;

UPDATE hosting_plans
SET plan_type = 'Pro'
WHERE category = 'VPS' AND plan_type IS NULL AND sort_order >= 30;

-- Make sure all VPS plans have a region set
UPDATE hosting_plans
SET region = 'North America'
WHERE category = 'VPS' AND region IS NULL AND (location = 'USA' OR location LIKE '%USA%' OR location LIKE '%US%');

UPDATE hosting_plans
SET region = 'Europe'
WHERE category = 'VPS' AND region IS NULL AND (
  location = 'UK' OR 
  location = 'Germany' OR 
  location = 'Finland' OR
  location LIKE '%London%' OR
  location LIKE '%Frankfurt%' OR
  location LIKE '%Berlin%' OR
  location LIKE '%Helsinki%'
);

UPDATE hosting_plans
SET region = 'Southeast Asia'
WHERE category = 'VPS' AND region IS NULL AND (
  location = 'Singapore' OR
  location LIKE '%Singapore%'
);

UPDATE hosting_plans
SET region = 'East Asia'
WHERE category = 'VPS' AND region IS NULL AND (
  location = 'Japan' OR
  location LIKE '%Tokyo%' OR
  location LIKE '%Japan%'
);

UPDATE hosting_plans
SET region = 'South Asia'
WHERE category = 'VPS' AND region IS NULL AND (
  location = 'India' OR
  location LIKE '%India%'
);

UPDATE hosting_plans
SET region = 'Oceania'
WHERE category = 'VPS' AND region IS NULL AND (
  location = 'Australia' OR
  location LIKE '%Australia%' OR
  location LIKE '%Sydney%'
);

-- Set default flag icons based on location if missing
UPDATE hosting_plans
SET flag_icon = '🇺🇸'
WHERE category = 'VPS' AND flag_icon IS NULL AND (location = 'USA' OR location LIKE '%USA%' OR location LIKE '%US%');

UPDATE hosting_plans
SET flag_icon = '🇬🇧'
WHERE category = 'VPS' AND flag_icon IS NULL AND (location = 'UK' OR location LIKE '%UK%' OR location LIKE '%London%');

UPDATE hosting_plans
SET flag_icon = '🇩🇪'
WHERE category = 'VPS' AND flag_icon IS NULL AND (location = 'Germany' OR location LIKE '%Germany%' OR location LIKE '%Frankfurt%' OR location LIKE '%Berlin%');

UPDATE hosting_plans
SET flag_icon = '🇫🇮'
WHERE category = 'VPS' AND flag_icon IS NULL AND (location = 'Finland' OR location LIKE '%Finland%' OR location LIKE '%Helsinki%');

UPDATE hosting_plans
SET flag_icon = '🇸🇬'
WHERE category = 'VPS' AND flag_icon IS NULL AND (location = 'Singapore' OR location LIKE '%Singapore%');

UPDATE hosting_plans
SET flag_icon = '🇯🇵'
WHERE category = 'VPS' AND flag_icon IS NULL AND (location = 'Japan' OR location LIKE '%Japan%' OR location LIKE '%Tokyo%');

UPDATE hosting_plans
SET flag_icon = '🇮🇳'
WHERE category = 'VPS' AND flag_icon IS NULL AND (location = 'India' OR location LIKE '%India%');

UPDATE hosting_plans
SET flag_icon = '🇦🇺'
WHERE category = 'VPS' AND flag_icon IS NULL AND (location = 'Australia' OR location LIKE '%Australia%' OR location LIKE '%Sydney%');