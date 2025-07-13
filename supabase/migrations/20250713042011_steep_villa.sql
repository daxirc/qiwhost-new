/*
  # Add Linux VPS Featured Plans Support

  1. New Columns
    - Add `is_linux_featured` boolean column to hosting_plans table
    
  2. Changes
    - Add default value of false to is_linux_featured column
    
  3. Notes
    - This allows specific plans to be featured on the Linux VPS page
    - Only 3 plans should be marked as featured for the Linux VPS page
*/

-- Add is_linux_featured column to hosting_plans table
ALTER TABLE public.hosting_plans 
ADD COLUMN IF NOT EXISTS is_linux_featured BOOLEAN DEFAULT false;

-- Add comment to the column
COMMENT ON COLUMN public.hosting_plans.is_linux_featured IS 'Indicates if this plan should be featured on the Linux VPS page';