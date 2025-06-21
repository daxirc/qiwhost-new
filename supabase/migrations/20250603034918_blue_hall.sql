/*
  # Create hosting plans schema

  1. New Tables
    - `hosting_plans`
      - `id` (uuid, primary key)
      - `name` (text)
      - `category` (text) - VPS, RDP, or DEDICATED
      - `ram` (text)
      - `cpu` (text)
      - `storage` (text)
      - `bandwidth` (text)
      - `location` (text)
      - `os_type` (text, nullable)
      - `price_monthly` (numeric)
      - `price_yearly` (numeric)
      - `order_url` (text)
      - `visible` (boolean)
      - `sort_order` (integer)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)
    
    - `site_assets`
      - `id` (uuid, primary key)
      - `type` (text) - e.g., 'logo'
      - `file_path` (text)
      - `active` (boolean)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on both tables
    - Add policies for authenticated admin users
*/

-- Create hosting_plans table
CREATE TABLE IF NOT EXISTS hosting_plans (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  category text NOT NULL CHECK (category IN ('VPS', 'RDP', 'DEDICATED')),
  ram text NOT NULL,
  cpu text NOT NULL,
  storage text NOT NULL,
  bandwidth text NOT NULL,
  location text NOT NULL,
  os_type text,
  price_monthly numeric NOT NULL,
  price_yearly numeric NOT NULL,
  order_url text NOT NULL,
  visible boolean DEFAULT true,
  sort_order integer NOT NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create site_assets table
CREATE TABLE IF NOT EXISTS site_assets (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  type text NOT NULL,
  file_path text NOT NULL,
  active boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE hosting_plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE site_assets ENABLE ROW LEVEL SECURITY;

-- Create policies for hosting_plans
CREATE POLICY "Allow public read access" ON hosting_plans
  FOR SELECT USING (true);

CREATE POLICY "Allow admin full access" ON hosting_plans
  FOR ALL USING (auth.role() = 'authenticated');

-- Create policies for site_assets
CREATE POLICY "Allow public read access" ON site_assets
  FOR SELECT USING (true);

CREATE POLICY "Allow admin full access" ON site_assets
  FOR ALL USING (auth.role() = 'authenticated');

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Add triggers
CREATE TRIGGER update_hosting_plans_updated_at
  BEFORE UPDATE ON hosting_plans
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER update_site_assets_updated_at
  BEFORE UPDATE ON site_assets
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();