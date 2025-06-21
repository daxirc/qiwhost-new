/*
  # Complete VPS locations migration

  This migration adds all remaining VPS locations from the hierarchical structure:
  - North America: Mexico City
  - Europe: Sofia, Athens, Marseille, Moscow
  - Middle East: Istanbul, Riyadh, Dubai, Jeddah, Bahrain, Muscat, Kuwait City, Baghdad, Doha
  - Southeast Asia: Bangkok, Hanoi, Phnom Penh, Ho Chi Minh, Manila, Kuala Lumpur, Jakarta, Yangon
  - East Asia: Hong Kong, Taipei, Seoul
  - Africa: Johannesburg, Cairo
  - South Asia: Dhaka, Karachi, Kathmandu
  - South America: Sao Paulo, Buenos Aires, Santiago, Bogota
*/

INSERT INTO hosting_plans (
  name, category, region, location, flag_icon, page_description, plan_type,
  ram, cpu, storage, bandwidth, os_type,
  price_monthly, price_yearly, order_url, sort_order, visible
) VALUES

-- North America - Mexico City
('Mexico City Basic VPS', 'VPS', 'North America', 'Mexico City', '🇲🇽', 'Expand into Latin American markets with Mexico City VPS hosting offering excellent regional connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 16.99, 13.59, '/clientarea', 1190, true),
('Mexico City Standard VPS', 'VPS', 'North America', 'Mexico City', '🇲🇽', 'Expand into Latin American markets with Mexico City VPS hosting offering excellent regional connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 33.99, 27.19, '/clientarea', 1200, true),
('Mexico City Pro VPS', 'VPS', 'North America', 'Mexico City', '🇲🇽', 'Expand into Latin American markets with Mexico City VPS hosting offering excellent regional connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 67.99, 54.39, '/clientarea', 1210, true),

-- Europe - Sofia
('Sofia Basic VPS', 'VPS', 'Europe', 'Sofia', '🇧🇬', 'Host your services in Sofia, Bulgaria with cost-effective European hosting and excellent Eastern European connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 15.99, 12.79, '/clientarea', 1220, true),
('Sofia Standard VPS', 'VPS', 'Europe', 'Sofia', '🇧🇬', 'Host your services in Sofia, Bulgaria with cost-effective European hosting and excellent Eastern European connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 31.99, 25.59, '/clientarea', 1230, true),
('Sofia Pro VPS', 'VPS', 'Europe', 'Sofia', '🇧🇬', 'Host your services in Sofia, Bulgaria with cost-effective European hosting and excellent Eastern European connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 63.99, 51.19, '/clientarea', 1240, true),

-- Europe - Athens
('Athens Basic VPS', 'VPS', 'Europe', 'Athens', '🇬🇷', 'Deploy in Athens, Greece for Mediterranean and Balkan market access with reliable European infrastructure.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 16.99, 13.59, '/clientarea', 1250, true),
('Athens Standard VPS', 'VPS', 'Europe', 'Athens', '🇬🇷', 'Deploy in Athens, Greece for Mediterranean and Balkan market access with reliable European infrastructure.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 33.99, 27.19, '/clientarea', 1260, true),
('Athens Pro VPS', 'VPS', 'Europe', 'Athens', '🇬🇷', 'Deploy in Athens, Greece for Mediterranean and Balkan market access with reliable European infrastructure.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 67.99, 54.39, '/clientarea', 1270, true),

-- Europe - Marseille
('Marseille Basic VPS', 'VPS', 'Europe', 'Marseille', '🇫🇷', 'Experience French VPS hosting in Marseille with premium European infrastructure and GDPR compliance.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 18.99, 15.19, '/clientarea', 1280, true),
('Marseille Standard VPS', 'VPS', 'Europe', 'Marseille', '🇫🇷', 'Experience French VPS hosting in Marseille with premium European infrastructure and GDPR compliance.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 37.99, 30.39, '/clientarea', 1290, true),
('Marseille Pro VPS', 'VPS', 'Europe', 'Marseille', '🇫🇷', 'Experience French VPS hosting in Marseille with premium European infrastructure and GDPR compliance.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 75.99, 60.79, '/clientarea', 1300, true),

-- Europe - Moscow
('Moscow Basic VPS', 'VPS', 'Europe', 'Moscow', '🇷🇺', 'Serve Russian and CIS markets with Moscow VPS hosting featuring local data sovereignty and compliance.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 17.99, 14.39, '/clientarea', 1310, true),
('Moscow Standard VPS', 'VPS', 'Europe', 'Moscow', '🇷🇺', 'Serve Russian and CIS markets with Moscow VPS hosting featuring local data sovereignty and compliance.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 35.99, 28.79, '/clientarea', 1320, true),
('Moscow Pro VPS', 'VPS', 'Europe', 'Moscow', '🇷🇺', 'Serve Russian and CIS markets with Moscow VPS hosting featuring local data sovereignty and compliance.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 71.99, 57.59, '/clientarea', 1330, true),

-- Middle East - Istanbul
('Istanbul Basic VPS', 'VPS', 'Middle East', 'Istanbul', '🇹🇷', 'Bridge Europe and Asia with Istanbul VPS hosting offering strategic location and excellent connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 19.99, 15.99, '/clientarea', 1340, true),
('Istanbul Standard VPS', 'VPS', 'Middle East', 'Istanbul', '🇹🇷', 'Bridge Europe and Asia with Istanbul VPS hosting offering strategic location and excellent connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 39.99, 31.99, '/clientarea', 1350, true),
('Istanbul Pro VPS', 'VPS', 'Middle East', 'Istanbul', '🇹🇷', 'Bridge Europe and Asia with Istanbul VPS hosting offering strategic location and excellent connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 79.99, 63.99, '/clientarea', 1360, true),

-- Middle East - Riyadh
('Riyadh Basic VPS', 'VPS', 'Middle East', 'Riyadh', '🇸🇦', 'Deploy in Saudi Arabia with Riyadh VPS hosting for Gulf region market access and local compliance.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 24.99, 19.99, '/clientarea', 1370, true),
('Riyadh Standard VPS', 'VPS', 'Middle East', 'Riyadh', '🇸🇦', 'Deploy in Saudi Arabia with Riyadh VPS hosting for Gulf region market access and local compliance.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 49.99, 39.99, '/clientarea', 1380, true),
('Riyadh Pro VPS', 'VPS', 'Middle East', 'Riyadh', '🇸🇦', 'Deploy in Saudi Arabia with Riyadh VPS hosting for Gulf region market access and local compliance.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 99.99, 79.99, '/clientarea', 1390, true),

-- Middle East - Dubai
('Dubai Basic VPS', 'VPS', 'Middle East', 'Dubai', '🇦🇪', 'Experience premium UAE hosting in Dubai with world-class infrastructure and business-friendly environment.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 26.99, 21.59, '/clientarea', 1400, true),
('Dubai Standard VPS', 'VPS', 'Middle East', 'Dubai', '🇦🇪', 'Experience premium UAE hosting in Dubai with world-class infrastructure and business-friendly environment.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 53.99, 43.19, '/clientarea', 1410, true),
('Dubai Pro VPS', 'VPS', 'Middle East', 'Dubai', '🇦🇪', 'Experience premium UAE hosting in Dubai with world-class infrastructure and business-friendly environment.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 107.99, 86.39, '/clientarea', 1420, true),

-- Middle East - Jeddah
('Jeddah Basic VPS', 'VPS', 'Middle East', 'Jeddah', '🇸🇦', 'Serve the Red Sea region with Jeddah VPS hosting offering strategic location for Middle East and Africa.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 23.99, 19.19, '/clientarea', 1430, true),
('Jeddah Standard VPS', 'VPS', 'Middle East', 'Jeddah', '🇸🇦', 'Serve the Red Sea region with Jeddah VPS hosting offering strategic location for Middle East and Africa.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 47.99, 38.39, '/clientarea', 1440, true),
('Jeddah Pro VPS', 'VPS', 'Middle East', 'Jeddah', '🇸🇦', 'Serve the Red Sea region with Jeddah VPS hosting offering strategic location for Middle East and Africa.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 95.99, 76.79, '/clientarea', 1450, true),

-- Middle East - Bahrain
('Bahrain Basic VPS', 'VPS', 'Middle East', 'Bahrain', '🇧🇭', 'Access Gulf markets with Bahrain VPS hosting featuring excellent regional connectivity and stability.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 22.99, 18.39, '/clientarea', 1460, true),
('Bahrain Standard VPS', 'VPS', 'Middle East', 'Bahrain', '🇧🇭', 'Access Gulf markets with Bahrain VPS hosting featuring excellent regional connectivity and stability.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 45.99, 36.79, '/clientarea', 1470, true),
('Bahrain Pro VPS', 'VPS', 'Middle East', 'Bahrain', '🇧🇭', 'Access Gulf markets with Bahrain VPS hosting featuring excellent regional connectivity and stability.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 91.99, 73.59, '/clientarea', 1480, true),

-- Middle East - Muscat
('Muscat Basic VPS', 'VPS', 'Middle East', 'Muscat', '🇴🇲', 'Deploy in Oman with Muscat VPS hosting for Arabian Peninsula market access and regional compliance.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 21.99, 17.59, '/clientarea', 1490, true),
('Muscat Standard VPS', 'VPS', 'Middle East', 'Muscat', '🇴🇲', 'Deploy in Oman with Muscat VPS hosting for Arabian Peninsula market access and regional compliance.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 43.99, 35.19, '/clientarea', 1500, true),
('Muscat Pro VPS', 'VPS', 'Middle East', 'Muscat', '🇴🇲', 'Deploy in Oman with Muscat VPS hosting for Arabian Peninsula market access and regional compliance.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 87.99, 70.39, '/clientarea', 1510, true),

-- Middle East - Kuwait City
('Kuwait City Basic VPS', 'VPS', 'Middle East', 'Kuwait City', '🇰🇼', 'Serve Kuwait and neighboring markets with reliable VPS hosting and excellent Gulf connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 23.99, 19.19, '/clientarea', 1520, true),
('Kuwait City Standard VPS', 'VPS', 'Middle East', 'Kuwait City', '🇰🇼', 'Serve Kuwait and neighboring markets with reliable VPS hosting and excellent Gulf connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 47.99, 38.39, '/clientarea', 1530, true),
('Kuwait City Pro VPS', 'VPS', 'Middle East', 'Kuwait City', '🇰🇼', 'Serve Kuwait and neighboring markets with reliable VPS hosting and excellent Gulf connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 95.99, 76.79, '/clientarea', 1540, true),

-- Middle East - Baghdad
('Baghdad Basic VPS', 'VPS', 'Middle East', 'Baghdad', '🇮🇶', 'Deploy in Iraq with Baghdad VPS hosting for Mesopotamian region market access and local presence.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 20.99, 16.79, '/clientarea', 1550, true),
('Baghdad Standard VPS', 'VPS', 'Middle East', 'Baghdad', '🇮🇶', 'Deploy in Iraq with Baghdad VPS hosting for Mesopotamian region market access and local presence.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 41.99, 33.59, '/clientarea', 1560, true),
('Baghdad Pro VPS', 'VPS', 'Middle East', 'Baghdad', '🇮🇶', 'Deploy in Iraq with Baghdad VPS hosting for Mesopotamian region market access and local presence.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 83.99, 67.19, '/clientarea', 1570, true),

-- Middle East - Doha
('Doha Basic VPS', 'VPS', 'Middle East', 'Doha', '🇶🇦', 'Experience Qatar VPS hosting in Doha with premium infrastructure and strategic Gulf location.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 25.99, 20.79, '/clientarea', 1580, true),
('Doha Standard VPS', 'VPS', 'Middle East', 'Doha', '🇶🇦', 'Experience Qatar VPS hosting in Doha with premium infrastructure and strategic Gulf location.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 51.99, 41.59, '/clientarea', 1590, true),
('Doha Pro VPS', 'VPS', 'Middle East', 'Doha', '🇶🇦', 'Experience Qatar VPS hosting in Doha with premium infrastructure and strategic Gulf location.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 103.99, 83.19, '/clientarea', 1600, true),

-- Southeast Asia - Bangkok
('Bangkok Basic VPS', 'VPS', 'Southeast Asia', 'Bangkok', '🇹🇭', 'Connect to Southeast Asian markets with Bangkok VPS hosting offering excellent regional connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 20.99, 16.79, '/clientarea', 1610, true),
('Bangkok Standard VPS', 'VPS', 'Southeast Asia', 'Bangkok', '🇹🇭', 'Connect to Southeast Asian markets with Bangkok VPS hosting offering excellent regional connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 41.99, 33.59, '/clientarea', 1620, true),
('Bangkok Pro VPS', 'VPS', 'Southeast Asia', 'Bangkok', '🇹🇭', 'Connect to Southeast Asian markets with Bangkok VPS hosting offering excellent regional connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 83.99, 67.19, '/clientarea', 1630, true),

-- Southeast Asia - Hanoi
('Hanoi Basic VPS', 'VPS', 'Southeast Asia', 'Hanoi', '🇻🇳', 'Serve Vietnamese markets with Hanoi VPS hosting featuring local presence and regional connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 19.99, 15.99, '/clientarea', 1640, true),
('Hanoi Standard VPS', 'VPS', 'Southeast Asia', 'Hanoi', '🇻🇳', 'Serve Vietnamese markets with Hanoi VPS hosting featuring local presence and regional connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 39.99, 31.99, '/clientarea', 1650, true),
('Hanoi Pro VPS', 'VPS', 'Southeast Asia', 'Hanoi', '🇻🇳', 'Serve Vietnamese markets with Hanoi VPS hosting featuring local presence and regional connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 79.99, 63.99, '/clientarea', 1660, true),

-- Southeast Asia - Phnom Penh
('Phnom Penh Basic VPS', 'VPS', 'Southeast Asia', 'Phnom Penh', '🇰🇭', 'Deploy in Cambodia with Phnom Penh VPS hosting for Mekong region market access.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 18.99, 15.19, '/clientarea', 1670, true),
('Phnom Penh Standard VPS', 'VPS', 'Southeast Asia', 'Phnom Penh', '🇰🇭', 'Deploy in Cambodia with Phnom Penh VPS hosting for Mekong region market access.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 37.99, 30.39, '/clientarea', 1680, true),
('Phnom Penh Pro VPS', 'VPS', 'Southeast Asia', 'Phnom Penh', '🇰🇭', 'Deploy in Cambodia with Phnom Penh VPS hosting for Mekong region market access.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 75.99, 60.79, '/clientarea', 1690, true),

-- Southeast Asia - Ho Chi Minh
('Ho Chi Minh Basic VPS', 'VPS', 'Southeast Asia', 'Ho Chi Minh', '🇻🇳', 'Access Southern Vietnam markets with Ho Chi Minh VPS hosting and excellent regional connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 20.99, 16.79, '/clientarea', 1700, true),
('Ho Chi Minh Standard VPS', 'VPS', 'Southeast Asia', 'Ho Chi Minh', '🇻🇳', 'Access Southern Vietnam markets with Ho Chi Minh VPS hosting and excellent regional connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 41.99, 33.59, '/clientarea', 1710, true),
('Ho Chi Minh Pro VPS', 'VPS', 'Southeast Asia', 'Ho Chi Minh', '🇻🇳', 'Access Southern Vietnam markets with Ho Chi Minh VPS hosting and excellent regional connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 83.99, 67.19, '/clientarea', 1720, true),

-- Southeast Asia - Manila
('Manila Basic VPS', 'VPS', 'Southeast Asia', 'Manila', '🇵🇭', 'Serve Philippine markets with Manila VPS hosting offering archipelago-wide connectivity and local presence.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 21.99, 17.59, '/clientarea', 1730, true),
('Manila Standard VPS', 'VPS', 'Southeast Asia', 'Manila', '🇵🇭', 'Serve Philippine markets with Manila VPS hosting offering archipelago-wide connectivity and local presence.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 43.99, 35.19, '/clientarea', 1740, true),
('Manila Pro VPS', 'VPS', 'Southeast Asia', 'Manila', '🇵🇭', 'Serve Philippine markets with Manila VPS hosting offering archipelago-wide connectivity and local presence.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 87.99, 70.39, '/clientarea', 1750, true),

-- Southeast Asia - Kuala Lumpur
('Kuala Lumpur Basic VPS', 'VPS', 'Southeast Asia', 'Kuala Lumpur', '🇲🇾', 'Deploy in Malaysia with Kuala Lumpur VPS hosting for Southeast Asian market access and connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 20.99, 16.79, '/clientarea', 1760, true),
('Kuala Lumpur Standard VPS', 'VPS', 'Southeast Asia', 'Kuala Lumpur', '🇲🇾', 'Deploy in Malaysia with Kuala Lumpur VPS hosting for Southeast Asian market access and connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 41.99, 33.59, '/clientarea', 1770, true),
('Kuala Lumpur Pro VPS', 'VPS', 'Southeast Asia', 'Kuala Lumpur', '🇲🇾', 'Deploy in Malaysia with Kuala Lumpur VPS hosting for Southeast Asian market access and connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 83.99, 67.19, '/clientarea', 1780, true),

-- Southeast Asia - Jakarta
('Jakarta Basic VPS', 'VPS', 'Southeast Asia', 'Jakarta', '🇮🇩', 'Access Indonesian markets with Jakarta VPS hosting featuring local presence and archipelago connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 19.99, 15.99, '/clientarea', 1790, true),
('Jakarta Standard VPS', 'VPS', 'Southeast Asia', 'Jakarta', '🇮🇩', 'Access Indonesian markets with Jakarta VPS hosting featuring local presence and archipelago connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 39.99, 31.99, '/clientarea', 1800, true),
('Jakarta Pro VPS', 'VPS', 'Southeast Asia', 'Jakarta', '🇮🇩', 'Access Indonesian markets with Jakarta VPS hosting featuring local presence and archipelago connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 79.99, 63.99, '/clientarea', 1810, true),

-- Southeast Asia - Yangon
('Yangon Basic VPS', 'VPS', 'Southeast Asia', 'Yangon', '🇲🇲', 'Deploy in Myanmar with Yangon VPS hosting for emerging market access and regional connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 18.99, 15.19, '/clientarea', 1820, true),
('Yangon Standard VPS', 'VPS', 'Southeast Asia', 'Yangon', '🇲🇲', 'Deploy in Myanmar with Yangon VPS hosting for emerging market access and regional connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 37.99, 30.39, '/clientarea', 1830, true),
('Yangon Pro VPS', 'VPS', 'Southeast Asia', 'Yangon', '🇲🇲', 'Deploy in Myanmar with Yangon VPS hosting for emerging market access and regional connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 75.99, 60.79, '/clientarea', 1840, true),

-- East Asia - Hong Kong
('Hong Kong Basic VPS', 'VPS', 'East Asia', 'Hong Kong', '🇭🇰', 'Connect to Greater China markets with Hong Kong VPS hosting offering strategic Asian gateway location.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 24.99, 19.99, '/clientarea', 1850, true),
('Hong Kong Standard VPS', 'VPS', 'East Asia', 'Hong Kong', '🇭🇰', 'Connect to Greater China markets with Hong Kong VPS hosting offering strategic Asian gateway location.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 49.99, 39.99, '/clientarea', 1860, true),
('Hong Kong Pro VPS', 'VPS', 'East Asia', 'Hong Kong', '🇭🇰', 'Connect to Greater China markets with Hong Kong VPS hosting offering strategic Asian gateway location.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 99.99, 79.99, '/clientarea', 1870, true),

-- East Asia - Taipei
('Taipei Basic VPS', 'VPS', 'East Asia', 'Taipei', '🇹🇼', 'Serve Taiwan markets with Taipei VPS hosting featuring excellent regional connectivity and local presence.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 23.99, 19.19, '/clientarea', 1880, true),
('Taipei Standard VPS', 'VPS', 'East Asia', 'Taipei', '🇹🇼', 'Serve Taiwan markets with Taipei VPS hosting featuring excellent regional connectivity and local presence.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 47.99, 38.39, '/clientarea', 1890, true),
('Taipei Pro VPS', 'VPS', 'East Asia', 'Taipei', '🇹🇼', 'Serve Taiwan markets with Taipei VPS hosting featuring excellent regional connectivity and local presence.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 95.99, 76.79, '/clientarea', 1900, true),

-- East Asia - Seoul
('Seoul Basic VPS', 'VPS', 'East Asia', 'Seoul', '🇰🇷', 'Access Korean markets with Seoul VPS hosting offering premium infrastructure and excellent regional connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 24.99, 19.99, '/clientarea', 1910, true),
('Seoul Standard VPS', 'VPS', 'East Asia', 'Seoul', '🇰🇷', 'Access Korean markets with Seoul VPS hosting offering premium infrastructure and excellent regional connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 49.99, 39.99, '/clientarea', 1920, true),
('Seoul Pro VPS', 'VPS', 'East Asia', 'Seoul', '🇰🇷', 'Access Korean markets with Seoul VPS hosting offering premium infrastructure and excellent regional connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 99.99, 79.99, '/clientarea', 1930, true),

-- Africa - Johannesburg
('Johannesburg Basic VPS', 'VPS', 'Africa', 'Johannesburg', '🇿🇦', 'Serve African markets with Johannesburg VPS hosting offering continental gateway and local presence.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 21.99, 17.59, '/clientarea', 1940, true),
('Johannesburg Standard VPS', 'VPS', 'Africa', 'Johannesburg', '🇿🇦', 'Serve African markets with Johannesburg VPS hosting offering continental gateway and local presence.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 43.99, 35.19, '/clientarea', 1950, true),
('Johannesburg Pro VPS', 'VPS', 'Africa', 'Johannesburg', '🇿🇦', 'Serve African markets with Johannesburg VPS hosting offering continental gateway and local presence.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 87.99, 70.39, '/clientarea', 1960, true),

-- Africa - Cairo
('Cairo Basic VPS', 'VPS', 'Africa', 'Cairo', '🇪🇬', 'Deploy in Egypt with Cairo VPS hosting for North African and Middle Eastern market access.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 20.99, 16.79, '/clientarea', 1970, true),
('Cairo Standard VPS', 'VPS', 'Africa', 'Cairo', '🇪🇬', 'Deploy in Egypt with Cairo VPS hosting for North African and Middle Eastern market access.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 41.99, 33.59, '/clientarea', 1980, true),
('Cairo Pro VPS', 'VPS', 'Africa', 'Cairo', '🇪🇬', 'Deploy in Egypt with Cairo VPS hosting for North African and Middle Eastern market access.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 83.99, 67.19, '/clientarea', 1990, true),

-- South Asia - Dhaka
('Dhaka Basic VPS', 'VPS', 'South Asia', 'Dhaka', '🇧🇩', 'Serve Bangladeshi markets with Dhaka VPS hosting offering local presence and regional connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 17.99, 14.39, '/clientarea', 2000, true),
('Dhaka Standard VPS', 'VPS', 'South Asia', 'Dhaka', '🇧🇩', 'Serve Bangladeshi markets with Dhaka VPS hosting offering local presence and regional connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 35.99, 28.79, '/clientarea', 2010, true),
('Dhaka Pro VPS', 'VPS', 'South Asia', 'Dhaka', '🇧🇩', 'Serve Bangladeshi markets with Dhaka VPS hosting offering local presence and regional connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 71.99, 57.59, '/clientarea', 2020, true),

-- South Asia - Karachi
('Karachi Basic VPS', 'VPS', 'South Asia', 'Karachi', '🇵🇰', 'Deploy in Pakistan with Karachi VPS hosting for South Asian market access and local compliance.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 16.99, 13.59, '/clientarea', 2030, true),
('Karachi Standard VPS', 'VPS', 'South Asia', 'Karachi', '🇵🇰', 'Deploy in Pakistan with Karachi VPS hosting for South Asian market access and local compliance.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 33.99, 27.19, '/clientarea', 2040, true),
('Karachi Pro VPS', 'VPS', 'South Asia', 'Karachi', '🇵🇰', 'Deploy in Pakistan with Karachi VPS hosting for South Asian market access and local compliance.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 67.99, 54.39, '/clientarea', 2050, true),

-- South Asia - Kathmandu
('Kathmandu Basic VPS', 'VPS', 'South Asia', 'Kathmandu', '🇳🇵', 'Serve Nepalese markets with Kathmandu VPS hosting offering Himalayan region connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 18.99, 15.19, '/clientarea', 2060, true),
('Kathmandu Standard VPS', 'VPS', 'South Asia', 'Kathmandu', '🇳🇵', 'Serve Nepalese markets with Kathmandu VPS hosting offering Himalayan region connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 37.99, 30.39, '/clientarea', 2070, true),
('Kathmandu Pro VPS', 'VPS', 'South Asia', 'Kathmandu', '🇳🇵', 'Serve Nepalese markets with Kathmandu VPS hosting offering Himalayan region connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 75.99, 60.79, '/clientarea', 2080, true),

-- South America - Sao Paulo
('Sao Paulo Basic VPS', 'VPS', 'South America', 'Sao Paulo', '🇧🇷', 'Access Brazilian markets with Sao Paulo VPS hosting offering Latin American gateway and local presence.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 22.99, 18.39, '/clientarea', 2090, true),
('Sao Paulo Standard VPS', 'VPS', 'South America', 'Sao Paulo', '🇧🇷', 'Access Brazilian markets with Sao Paulo VPS hosting offering Latin American gateway and local presence.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 45.99, 36.79, '/clientarea', 2100, true),
('Sao Paulo Pro VPS', 'VPS', 'South America', 'Sao Paulo', '🇧🇷', 'Access Brazilian markets with Sao Paulo VPS hosting offering Latin American gateway and local presence.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 91.99, 73.59, '/clientarea', 2110, true),

-- South America - Buenos Aires
('Buenos Aires Basic VPS', 'VPS', 'South America', 'Buenos Aires', '🇦🇷', 'Serve Argentine markets with Buenos Aires VPS hosting featuring regional connectivity and local presence.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 21.99, 17.59, '/clientarea', 2120, true),
('Buenos Aires Standard VPS', 'VPS', 'South America', 'Buenos Aires', '🇦🇷', 'Serve Argentine markets with Buenos Aires VPS hosting featuring regional connectivity and local presence.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 43.99, 35.19, '/clientarea', 2130, true),
('Buenos Aires Pro VPS', 'VPS', 'South America', 'Buenos Aires', '🇦🇷', 'Serve Argentine markets with Buenos Aires VPS hosting featuring regional connectivity and local presence.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 87.99, 70.39, '/clientarea', 2140, true),

-- South America - Santiago
('Santiago Basic VPS', 'VPS', 'South America', 'Santiago', '🇨🇱', 'Deploy in Chile with Santiago VPS hosting for Pacific coast market access and regional connectivity.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 23.99, 19.19, '/clientarea', 2150, true),
('Santiago Standard VPS', 'VPS', 'South America', 'Santiago', '🇨🇱', 'Deploy in Chile with Santiago VPS hosting for Pacific coast market access and regional connectivity.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 47.99, 38.39, '/clientarea', 2160, true),
('Santiago Pro VPS', 'VPS', 'South America', 'Santiago', '🇨🇱', 'Deploy in Chile with Santiago VPS hosting for Pacific coast market access and regional connectivity.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 95.99, 76.79, '/clientarea', 2170, true),

-- South America - Bogota
('Bogota Basic VPS', 'VPS', 'South America', 'Bogota', '🇨🇴', 'Access Colombian markets with Bogota VPS hosting offering Andean region connectivity and local presence.', 'Basic',
  '2GB', '1 vCPU', '30GB SSD', '1TB', 'Linux/Windows', 20.99, 16.79, '/clientarea', 2180, true),
('Bogota Standard VPS', 'VPS', 'South America', 'Bogota', '🇨🇴', 'Access Colombian markets with Bogota VPS hosting offering Andean region connectivity and local presence.', 'Standard',
  '4GB', '2 vCPU', '60GB SSD', '2TB', 'Linux/Windows', 41.99, 33.59, '/clientarea', 2190, true),
('Bogota Pro VPS', 'VPS', 'South America', 'Bogota', '🇨🇴', 'Access Colombian markets with Bogota VPS hosting offering Andean region connectivity and local presence.', 'Pro',
  '8GB', '4 vCPU', '120GB SSD', '4TB', 'Linux/Windows', 83.99, 67.19, '/clientarea', 2200, true);