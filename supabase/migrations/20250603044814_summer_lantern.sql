/*
  # Update VPS plans schema

  1. Changes
    - Add Linux and Windows VPS plans
    - Update existing VPS plans with OS type
    - Adjust pricing for Windows plans (higher due to licensing)

  2. Data Updates
    - Create separate Linux and Windows VPS plans
    - Set appropriate pricing for each OS type
*/

-- First, delete existing VPS plans to avoid duplicates
DELETE FROM hosting_plans WHERE category = 'VPS';

-- Insert Linux VPS Plans
INSERT INTO hosting_plans (
  name, category, ram, cpu, storage, bandwidth, location, os_type,
  price_monthly, price_yearly, order_url, sort_order, visible
) VALUES
('Linux Basic', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'USA', 'Linux',
  14.99, 11.99, '/clientarea', 10, true),
('Linux Professional', 'VPS', '4GB', '2 vCPU', '60GB SSD', '2TB', 'USA', 'Linux',
  29.99, 23.99, '/clientarea', 20, true),
('Linux Enterprise', 'VPS', '8GB', '4 vCPU', '120GB SSD', '4TB', 'USA', 'Linux',
  59.99, 47.99, '/clientarea', 30, true);

-- Insert Windows VPS Plans (higher pricing due to licensing)
INSERT INTO hosting_plans (
  name, category, ram, cpu, storage, bandwidth, location, os_type,
  price_monthly, price_yearly, order_url, sort_order, visible
) VALUES
('Windows Basic', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'USA', 'Windows',
  19.99, 15.99, '/clientarea', 40, true),
('Windows Professional', 'VPS', '4GB', '2 vCPU', '60GB SSD', '2TB', 'USA', 'Windows',
  39.99, 31.99, '/clientarea', 50, true),
('Windows Enterprise', 'VPS', '8GB', '4 vCPU', '120GB SSD', '4TB', 'USA', 'Windows',
  69.99, 55.99, '/clientarea', 60, true);