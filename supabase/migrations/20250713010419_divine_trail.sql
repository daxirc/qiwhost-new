/*
  # Add City-Specific VPS Plans

  1. New Data
    - Adds demo VPS plans for various cities across different regions
    - Each city has Basic, Standard, and Pro plan types
    - Includes proper region and flag_icon data for navigation grouping
  
  2. Purpose
    - Populates the Locations dropdown in the navigation menu
    - Creates city-specific VPS plan pages
*/

-- Add North America Cities
INSERT INTO hosting_plans (name, category, ram, cpu, storage, bandwidth, location, region, flag_icon, os_type, price_monthly, price_yearly, order_url, visible, sort_order, plan_type, page_description)
VALUES
  ('Silicon Valley Basic', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Silicon Valley', 'North America', '🇺🇸', 'Linux', 9.99, 7.99, 'https://portal.qiwhost.com/login', true, 100, 'Basic', 'High-performance VPS hosting in Silicon Valley with low latency for North American users.'),
  ('Silicon Valley Standard', 'VPS', '4GB', '2 vCPU', '60GB SSD', '2TB', 'Silicon Valley', 'North America', '🇺🇸', 'Linux', 19.99, 15.99, 'https://portal.qiwhost.com/login', true, 101, 'Standard', 'High-performance VPS hosting in Silicon Valley with low latency for North American users.'),
  ('Silicon Valley Pro', 'VPS', '8GB', '4 vCPU', '120GB SSD', '4TB', 'Silicon Valley', 'North America', '🇺🇸', 'Linux', 39.99, 31.99, 'https://portal.qiwhost.com/login', true, 102, 'Pro', 'High-performance VPS hosting in Silicon Valley with low latency for North American users.');

-- Add Europe Cities
INSERT INTO hosting_plans (name, category, ram, cpu, storage, bandwidth, location, region, flag_icon, os_type, price_monthly, price_yearly, order_url, visible, sort_order, plan_type, page_description)
VALUES
  ('London Basic', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'London', 'Europe', '🇬🇧', 'Linux', 9.99, 7.99, 'https://portal.qiwhost.com/login', true, 200, 'Basic', 'Premium VPS hosting in London with excellent connectivity throughout Europe.'),
  ('London Standard', 'VPS', '4GB', '2 vCPU', '60GB SSD', '2TB', 'London', 'Europe', '🇬🇧', 'Linux', 19.99, 15.99, 'https://portal.qiwhost.com/login', true, 201, 'Standard', 'Premium VPS hosting in London with excellent connectivity throughout Europe.'),
  ('London Pro', 'VPS', '8GB', '4 vCPU', '120GB SSD', '4TB', 'London', 'Europe', '🇬🇧', 'Linux', 39.99, 31.99, 'https://portal.qiwhost.com/login', true, 202, 'Pro', 'Premium VPS hosting in London with excellent connectivity throughout Europe.');

-- Add Asia Cities
INSERT INTO hosting_plans (name, category, ram, cpu, storage, bandwidth, location, region, flag_icon, os_type, price_monthly, price_yearly, order_url, visible, sort_order, plan_type, page_description)
VALUES
  ('Tokyo Basic', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Tokyo', 'East Asia', '🇯🇵', 'Linux', 9.99, 7.99, 'https://portal.qiwhost.com/login', true, 300, 'Basic', 'Fast and reliable VPS hosting in Tokyo with optimal performance for East Asian users.'),
  ('Tokyo Standard', 'VPS', '4GB', '2 vCPU', '60GB SSD', '2TB', 'Tokyo', 'East Asia', '🇯🇵', 'Linux', 19.99, 15.99, 'https://portal.qiwhost.com/login', true, 301, 'Standard', 'Fast and reliable VPS hosting in Tokyo with optimal performance for East Asian users.'),
  ('Tokyo Pro', 'VPS', '8GB', '4 vCPU', '120GB SSD', '4TB', 'Tokyo', 'East Asia', '🇯🇵', 'Linux', 39.99, 31.99, 'https://portal.qiwhost.com/login', true, 302, 'Pro', 'Fast and reliable VPS hosting in Tokyo with optimal performance for East Asian users.');

-- Add Middle East Cities
INSERT INTO hosting_plans (name, category, ram, cpu, storage, bandwidth, location, region, flag_icon, os_type, price_monthly, price_yearly, order_url, visible, sort_order, plan_type, page_description)
VALUES
  ('Dubai Basic', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Dubai', 'Middle East', '🇦🇪', 'Linux', 9.99, 7.99, 'https://portal.qiwhost.com/login', true, 400, 'Basic', 'Strategic VPS hosting in Dubai with excellent connectivity throughout the Middle East.'),
  ('Dubai Standard', 'VPS', '4GB', '2 vCPU', '60GB SSD', '2TB', 'Dubai', 'Middle East', '🇦🇪', 'Linux', 19.99, 15.99, 'https://portal.qiwhost.com/login', true, 401, 'Standard', 'Strategic VPS hosting in Dubai with excellent connectivity throughout the Middle East.'),
  ('Dubai Pro', 'VPS', '8GB', '4 vCPU', '120GB SSD', '4TB', 'Dubai', 'Middle East', '🇦🇪', 'Linux', 39.99, 31.99, 'https://portal.qiwhost.com/login', true, 402, 'Pro', 'Strategic VPS hosting in Dubai with excellent connectivity throughout the Middle East.');

-- Add Southeast Asia Cities
INSERT INTO hosting_plans (name, category, ram, cpu, storage, bandwidth, location, region, flag_icon, os_type, price_monthly, price_yearly, order_url, visible, sort_order, plan_type, page_description)
VALUES
  ('Bangkok Basic', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Bangkok', 'Southeast Asia', '🇹🇭', 'Linux', 9.99, 7.99, 'https://portal.qiwhost.com/login', true, 500, 'Basic', 'Reliable VPS hosting in Bangkok with low latency for Southeast Asian users.'),
  ('Bangkok Standard', 'VPS', '4GB', '2 vCPU', '60GB SSD', '2TB', 'Bangkok', 'Southeast Asia', '🇹🇭', 'Linux', 19.99, 15.99, 'https://portal.qiwhost.com/login', true, 501, 'Standard', 'Reliable VPS hosting in Bangkok with low latency for Southeast Asian users.'),
  ('Bangkok Pro', 'VPS', '8GB', '4 vCPU', '120GB SSD', '4TB', 'Bangkok', 'Southeast Asia', '🇹🇭', 'Linux', 39.99, 31.99, 'https://portal.qiwhost.com/login', true, 502, 'Pro', 'Reliable VPS hosting in Bangkok with low latency for Southeast Asian users.');