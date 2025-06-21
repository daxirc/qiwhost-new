/*
  # Add demo hosting plans

  This migration adds initial demo plans for:
  1. VPS Plans
  2. RDP Plans
  3. Dedicated Server Plans
*/

-- VPS Plans
INSERT INTO hosting_plans (name, category, ram, cpu, storage, bandwidth, location, os_type, price_monthly, price_yearly, order_url, sort_order) VALUES
('Starter VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'USA', 'Linux/Windows', 9.99, 7.99, '/clientarea', 10),
('Business VPS', 'VPS', '4GB', '2 vCPU', '60GB SSD', '2TB', 'USA', 'Linux/Windows', 19.99, 15.99, '/clientarea', 20),
('Enterprise VPS', 'VPS', '8GB', '4 vCPU', '120GB SSD', '4TB', 'USA', 'Linux/Windows', 39.99, 31.99, '/clientarea', 30);

-- RDP Plans
INSERT INTO hosting_plans (name, category, ram, cpu, storage, bandwidth, location, os_type, price_monthly, price_yearly, order_url, sort_order) VALUES
('Basic RDP', 'RDP', '4GB', '2 vCPU', '60GB SSD', '1TB', 'USA', 'Windows', 29.99, 23.99, '/clientarea', 40),
('Professional RDP', 'RDP', '8GB', '4 vCPU', '120GB SSD', '2TB', 'USA', 'Windows', 49.99, 39.99, '/clientarea', 50),
('Enterprise RDP', 'RDP', '16GB', '8 vCPU', '240GB SSD', '4TB', 'USA', 'Windows', 79.99, 63.99, '/clientarea', 60);

-- Dedicated Server Plans
INSERT INTO hosting_plans (name, category, ram, cpu, storage, bandwidth, location, os_type, price_monthly, price_yearly, order_url, sort_order) VALUES
('Basic Server', 'DEDICATED', '32GB', 'Intel Xeon E-2276G', '2x 512GB SSD', '10TB', 'USA', 'Linux/Windows', 99.99, 89.99, '/clientarea', 70),
('Professional Server', 'DEDICATED', '64GB', 'AMD EPYC 7302P', '2x 1TB NVMe SSD', '20TB', 'USA', 'Linux/Windows', 199.99, 179.99, '/clientarea', 80),
('Enterprise Server', 'DEDICATED', '128GB', 'Intel Xeon Gold 6226R', '2x 2TB NVMe SSD', 'Unlimited', 'USA', 'Linux/Windows', 299.99, 269.99, '/clientarea', 90);