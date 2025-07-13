/*
  # VPS Plans Setup

  1. Schema Updates
     - Add plan_features array column to hosting_plans table
     - Add city_features array column to hosting_plans table
  
  2. Data Updates
     - Ensure each city has Basic, Standard, and Pro plan types
     - Add default features to all VPS plans
*/

-- Add new columns if they don't exist
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

-- Update all VPS plans with default features
UPDATE hosting_plans
SET plan_features = ARRAY[
  'Full Root Access',
  '24/7 Support',
  'SSD Storage',
  'DDoS Protection',
  'Instant Setup'
]
WHERE category = 'VPS' AND plan_features IS NULL;

-- Set plan types for VPS plans if not already set
UPDATE hosting_plans
SET plan_type = 'Basic'
WHERE category = 'VPS' AND plan_type IS NULL AND sort_order = 1;

UPDATE hosting_plans
SET plan_type = 'Standard'
WHERE category = 'VPS' AND plan_type IS NULL AND sort_order = 2;

UPDATE hosting_plans
SET plan_type = 'Pro'
WHERE category = 'VPS' AND plan_type IS NULL AND sort_order = 3;

-- Add city-specific features for each location
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

-- Ensure all VPS plans have a sort_order
UPDATE hosting_plans
SET sort_order = CASE
  WHEN plan_type = 'Basic' THEN 1
  WHEN plan_type = 'Standard' THEN 2
  WHEN plan_type = 'Pro' THEN 3
  ELSE 99
END
WHERE category = 'VPS' AND sort_order IS NULL;