/*
  # Add VPS location fields to hosting plans

  1. Changes
    - Add region column for grouping cities by geographical area
    - Add flag_icon column for emoji flags
    - Add page_description column for city-specific descriptions
    - Add plan_type column to differentiate Basic/Standard/Pro plans
    - Add CHECK constraint for plan_type validation

  2. Security
    - Maintain existing RLS policies
*/

-- Add new columns for VPS locations
ALTER TABLE hosting_plans 
ADD COLUMN IF NOT EXISTS region text,
ADD COLUMN IF NOT EXISTS flag_icon text,
ADD COLUMN IF NOT EXISTS page_description text,
ADD COLUMN IF NOT EXISTS plan_type text;

-- Add CHECK constraint for plan_type
ALTER TABLE hosting_plans 
ADD CONSTRAINT hosting_plans_plan_type_check 
CHECK (plan_type IS NULL OR plan_type IN ('Basic', 'Standard', 'Pro'));