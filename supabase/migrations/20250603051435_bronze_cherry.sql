-- First, delete existing RDP plans to avoid duplicates
DELETE FROM hosting_plans WHERE category = 'RDP';

-- Insert RDP Plans for each location
INSERT INTO hosting_plans (
  name, category, ram, cpu, storage, bandwidth, location,
  price_monthly, price_yearly, order_url, sort_order, visible
) VALUES
-- USA RDP Plans
('USA Basic RDP', 'RDP', '4GB', '2 vCPU', '60GB SSD', '1TB', 'USA',
  29.99, 23.99, '/clientarea', 10, true),
('USA Professional RDP', 'RDP', '8GB', '4 vCPU', '120GB SSD', '2TB', 'USA',
  49.99, 39.99, '/clientarea', 20, true),
('USA Enterprise RDP', 'RDP', '16GB', '8 vCPU', '240GB SSD', '4TB', 'USA',
  79.99, 63.99, '/clientarea', 30, true),

-- Singapore RDP Plans
('Singapore Basic RDP', 'RDP', '4GB', '2 vCPU', '60GB SSD', '1TB', 'Singapore',
  34.99, 27.99, '/clientarea', 40, true),
('Singapore Professional RDP', 'RDP', '8GB', '4 vCPU', '120GB SSD', '2TB', 'Singapore',
  54.99, 43.99, '/clientarea', 50, true),
('Singapore Enterprise RDP', 'RDP', '16GB', '8 vCPU', '240GB SSD', '4TB', 'Singapore',
  84.99, 67.99, '/clientarea', 60, true),

-- Germany RDP Plans
('Germany Basic RDP', 'RDP', '4GB', '2 vCPU', '60GB SSD', '1TB', 'Germany',
  32.99, 26.39, '/clientarea', 70, true),
('Germany Professional RDP', 'RDP', '8GB', '4 vCPU', '120GB SSD', '2TB', 'Germany',
  52.99, 42.39, '/clientarea', 80, true),
('Germany Enterprise RDP', 'RDP', '16GB', '8 vCPU', '240GB SSD', '4TB', 'Germany',
  82.99, 66.39, '/clientarea', 90, true),

-- Finland RDP Plans
('Finland Basic RDP', 'RDP', '4GB', '2 vCPU', '60GB SSD', '1TB', 'Finland',
  31.99, 25.59, '/clientarea', 100, true),
('Finland Professional RDP', 'RDP', '8GB', '4 vCPU', '120GB SSD', '2TB', 'Finland',
  51.99, 41.59, '/clientarea', 110, true),
('Finland Enterprise RDP', 'RDP', '16GB', '8 vCPU', '240GB SSD', '4TB', 'Finland',
  81.99, 65.59, '/clientarea', 120, true),

-- UK RDP Plans
('UK Basic RDP', 'RDP', '4GB', '2 vCPU', '60GB SSD', '1TB', 'UK',
  33.99, 27.19, '/clientarea', 130, true),
('UK Professional RDP', 'RDP', '8GB', '4 vCPU', '120GB SSD', '2TB', 'UK',
  53.99, 43.19, '/clientarea', 140, true),
('UK Enterprise RDP', 'RDP', '16GB', '8 vCPU', '240GB SSD', '4TB', 'UK',
  83.99, 67.19, '/clientarea', 150, true);