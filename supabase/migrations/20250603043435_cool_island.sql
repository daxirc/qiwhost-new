/*
  # Add dedicated server plans

  This migration adds all the dedicated server plans from the pages:
  - 8 Value servers
  - 5 Custom servers
  - 3 GPU servers
*/

-- Value Dedicated Servers
INSERT INTO hosting_plans (
  name, category, subcategory, ram, cpu, storage, bandwidth, location, price_monthly, price_yearly, order_url, sort_order, visible
) VALUES
-- Value Servers
('Value Server V1', 'DEDICATED', 'VALUE', '32GB DDR4', 'Intel Xeon E-2236', '2x 512GB NVMe', '1Gbps', 'USA', 99, 89, '/clientarea', 10, true),
('Value Server V2', 'DEDICATED', 'VALUE', '64GB DDR4', 'Intel Xeon E-2276G', '2x 1TB NVMe', '1Gbps', 'Germany', 129, 116, '/clientarea', 20, true),
('Value Server V3', 'DEDICATED', 'VALUE', '128GB DDR4', 'AMD EPYC 7302P', '2x 2TB NVMe', '2.5Gbps', 'Finland', 179, 161, '/clientarea', 30, true),
('Value Server V4', 'DEDICATED', 'VALUE', '64GB DDR4', 'Intel Xeon E-2288G', '2x 1TB NVMe', '1Gbps', 'Singapore', 149, 134, '/clientarea', 40, true),
('Value Server V5', 'DEDICATED', 'VALUE', '128GB DDR4', 'AMD EPYC 7402P', '2x 2TB NVMe', '2.5Gbps', 'UK', 199, 179, '/clientarea', 50, true),
('Value Server V6', 'DEDICATED', 'VALUE', '256GB DDR4', 'Intel Xeon Gold 5218', '4x 2TB NVMe', '10Gbps', 'USA', 299, 269, '/clientarea', 60, true),
('Value Server V7', 'DEDICATED', 'VALUE', '256GB DDR4', 'AMD EPYC 7502P', '4x 2TB NVMe', '10Gbps', 'Germany', 329, 296, '/clientarea', 70, true),
('Value Server V8', 'DEDICATED', 'VALUE', '512GB DDR4', 'Intel Xeon Gold 6230R', '4x 4TB NVMe', '10Gbps', 'Finland', 399, 359, '/clientarea', 80, true),

-- Custom Servers
('Custom Server C1', 'DEDICATED', 'CUSTOM', '512GB DDR4', '2x Intel Xeon Gold 6230R', '8x 2TB NVMe', '10Gbps', 'USA/DE', 599, 539, '/clientarea', 90, true),
('Custom Server C2', 'DEDICATED', 'CUSTOM', '1TB DDR4', '2x AMD EPYC 7502', '8x 4TB NVMe', '10Gbps', 'USA/DE', 799, 719, '/clientarea', 100, true),
('Custom Server C3', 'DEDICATED', 'CUSTOM', '1TB DDR4', '2x Intel Xeon Gold 6248R', '12x 4TB NVMe', '10Gbps', 'USA/DE', 999, 899, '/clientarea', 110, true),
('Custom Server C4', 'DEDICATED', 'CUSTOM', '2TB DDR4', '2x AMD EPYC 7702', '12x 8TB NVMe', '10Gbps', 'USA/DE', 1299, 1169, '/clientarea', 120, true),
('Custom Server C5', 'DEDICATED', 'CUSTOM', '4TB DDR4', '4x Intel Xeon Gold 6248R', '24x 4TB NVMe', '10Gbps', 'USA/DE', 1999, 1799, '/clientarea', 130, true),

-- GPU Servers
('GPU Server G1', 'DEDICATED', 'GPU', '512GB DDR4', '2x Intel Xeon Gold 6230R', '4x 2TB NVMe', '10Gbps', 'USA', 899, 809, '/clientarea', 140, true),
('GPU Server G2', 'DEDICATED', 'GPU', '1TB DDR4', '2x AMD EPYC 7502', '8x 2TB NVMe', '10Gbps', 'Germany', 1499, 1349, '/clientarea', 150, true),
('GPU Server G3', 'DEDICATED', 'GPU', '2TB DDR4', '2x Intel Xeon Gold 6248R', '8x 4TB NVMe', '10Gbps', 'USA', 2499, 2249, '/clientarea', 160, true);

-- Delete any existing plans to avoid duplicates
DELETE FROM hosting_plans 
WHERE category = 'DEDICATED' 
AND id NOT IN (
  SELECT id FROM hosting_plans 
  WHERE category = 'DEDICATED' 
  ORDER BY created_at DESC 
  LIMIT 16
);