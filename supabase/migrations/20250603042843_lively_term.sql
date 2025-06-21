/*
  # Add categories for dedicated servers and locations for RDP

  1. Changes
    - Add subcategory column to hosting_plans table
    - Add available_locations column to hosting_plans table
    - Update existing plans with subcategories and locations
*/

-- Add new columns
ALTER TABLE hosting_plans 
ADD COLUMN IF NOT EXISTS subcategory text,
ADD COLUMN IF NOT EXISTS available_locations text[];

-- Update dedicated server plans with subcategories
UPDATE hosting_plans 
SET subcategory = 'VALUE'
WHERE category = 'DEDICATED' AND name LIKE '%Basic%';

UPDATE hosting_plans 
SET subcategory = 'CUSTOM'
WHERE category = 'DEDICATED' AND name LIKE '%Professional%';

UPDATE hosting_plans 
SET subcategory = 'GPU'
WHERE category = 'DEDICATED' AND name LIKE '%Enterprise%';

-- Update RDP plans with available locations
UPDATE hosting_plans 
SET available_locations = ARRAY['USA', 'Singapore', 'Germany', 'Finland', 'UK']
WHERE category = 'RDP';