```sql
-- Create a temporary table to hold the data to be inserted
CREATE TEMPORARY TABLE temp_hosting_plans (
    name TEXT,
    category TEXT,
    ram TEXT,
    cpu TEXT,
    storage TEXT,
    bandwidth TEXT,
    location TEXT,
    os_type TEXT,
    price_monthly NUMERIC,
    price_yearly NUMERIC,
    order_url TEXT,
    visible BOOLEAN,
    sort_order INTEGER,
    subcategory TEXT,
    region TEXT,
    flag_icon TEXT,
    page_description TEXT,
    plan_type TEXT
);

-- Insert the 40 city locations with demo data
INSERT INTO temp_hosting_plans (name, category, ram, cpu, storage, bandwidth, location, os_type, price_monthly, price_yearly, order_url, visible, sort_order, subcategory, region, flag_icon, page_description, plan_type) VALUES
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Silicon Valley', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'North America', '🇺🇸', 'High-performance VPS hosting in Silicon Valley with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Moscow', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Europe', '🇷🇺', 'High-performance VPS hosting in Moscow with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Frankfurt', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Europe', '🇩🇪', 'High-performance VPS hosting in Frankfurt with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Jeddah', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Middle East', '🇸🇦', 'High-performance VPS hosting in Jeddah with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Washington', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'North America', '🇺🇸', 'High-performance VPS hosting in Washington with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Athens', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Europe', '🇬🇷', 'High-performance VPS hosting in Athens with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Bahrain', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Middle East', '🇧🇭', 'High-performance VPS hosting in Bahrain with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Sofia', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Europe', '🇧🇬', 'High-performance VPS hosting in Sofia with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'London', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Europe', '🇬🇧', 'High-performance VPS hosting in London with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Doha', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Middle East', '🇶🇦', 'High-performance VPS hosting in Doha with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Tokyo', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'East Asia', '🇯🇵', 'High-performance VPS hosting in Tokyo with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Bangkok', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Southeast Asia', '🇹🇭', 'High-performance VPS hosting in Bangkok with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Hanoi', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Southeast Asia', '🇻🇳', 'High-performance VPS hosting in Hanoi with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Phnom Penh', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Southeast Asia', '🇰🇭', 'High-performance VPS hosting in Phnom Penh with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Ho Chi Minh', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Southeast Asia', '🇻🇳', 'High-performance VPS hosting in Ho Chi Minh with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Marseille', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Europe', '🇫🇷', 'High-performance VPS hosting in Marseille with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Manila', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Southeast Asia', '🇵🇭', 'High-performance VPS hosting in Manila with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Johannesburg', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Africa', '🇿🇦', 'High-performance VPS hosting in Johannesburg with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Taipei', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'East Asia', '🇹🇼', 'High-performance VPS hosting in Taipei with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Hong Kong', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'East Asia', '🇭🇰', 'High-performance VPS hosting in Hong Kong with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Istanbul', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Europe', '🇹🇷', 'High-performance VPS hosting in Istanbul with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Kuwait City', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Middle East', '🇰🇼', 'High-performance VPS hosting in Kuwait City with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Dubai', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Middle East', '🇦🇪', 'High-performance VPS hosting in Dubai with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Seoul', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'East Asia', '🇰🇷', 'High-performance VPS hosting in Seoul with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Riyadh', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Middle East', '🇸🇦', 'High-performance VPS hosting in Riyadh with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Muscat', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Middle East', '🇴🇲', 'High-performance VPS hosting in Muscat with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Yangon', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Southeast Asia', '🇲🇲', 'High-performance VPS hosting in Yangon with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Kathmandu', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'South Asia', '🇳🇵', 'High-performance VPS hosting in Kathmandu with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Baghdad', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Middle East', '🇮🇶', 'High-performance VPS hosting in Baghdad with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Dhaka', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'South Asia', '🇧🇩', 'High-performance VPS hosting in Dhaka with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Singapore', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Southeast Asia', '🇸🇬', 'High-performance VPS hosting in Singapore with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Kuala Lumpur', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Southeast Asia', '🇲🇾', 'High-performance VPS hosting in Kuala Lumpur with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Jakarta', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Southeast Asia', '🇮🇩', 'High-performance VPS hosting in Jakarta with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Buenos Aires', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'South America', '🇦🇷', 'High-performance VPS hosting in Buenos Aires with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Cairo', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'Africa', '🇪🇬', 'High-performance VPS hosting in Cairo with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Bogota', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'South America', '🇨🇴', 'High-performance VPS hosting in Bogota with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Karachi', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'South Asia', '🇵🇰', 'High-performance VPS hosting in Karachi with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Santiago', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'South America', '🇨🇱', 'High-performance VPS hosting in Santiago with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Sao Paulo', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'South America', '🇧🇷', 'High-performance VPS hosting in Sao Paulo with dedicated resources and enterprise-grade infrastructure.', 'Basic'),
('Basic Linux VPS', 'VPS', '2GB', '1 vCPU', '30GB SSD', '1TB', 'Mexico City', 'Linux', 9.99, 79.99, 'https://portal.qiwhost.com/login', TRUE, 10, NULL, 'North America', '🇲🇽', 'High-performance VPS hosting in Mexico City with dedicated resources and enterprise-grade infrastructure.', 'Basic');

-- Insert data into the actual hosting_plans table, ignoring conflicts on unique constraints (like name, category, location, etc. if a composite unique constraint exists)
INSERT INTO hosting_plans (name, category, ram, cpu, storage, bandwidth, location, os_type, price_monthly, price_yearly, order_url, visible, sort_order, subcategory, region, flag_icon, page_description, plan_type)
SELECT name, category, ram, cpu, storage, bandwidth, location, os_type, price_monthly, price_yearly, order_url, visible, sort_order, subcategory, region, flag_icon, page_description, plan_type
FROM temp_hosting_plans
ON CONFLICT (id) DO NOTHING; -- Assuming 'id' is the primary key and we don't want to update existing rows by default. Adjust if a different conflict resolution is needed.

-- Clean up the temporary table
DROP TABLE temp_hosting_plans;
```