/*
  # Add sale functionality to hosting plans

  1. Changes
    - Add sale_enabled boolean field
    - Add sale_price_monthly numeric field
    - Add sale_price_yearly numeric field
    - Add sale_badge_text text field for custom sale labels

  2. Security
    - Maintain existing RLS policies
*/

-- Add sale-related columns to hosting_plans
ALTER TABLE hosting_plans 
ADD COLUMN sale_enabled boolean DEFAULT false,
ADD COLUMN sale_price_monthly numeric,
ADD COLUMN sale_price_yearly numeric,
ADD COLUMN sale_badge_text text;