```diff
--- a/supabase/migrations/20250713_populate_all_vps_locations.sql
+++ b/supabase/migrations/20250713_populate_all_vps_locations.sql
@@ -1,4 +1,3 @@
-```sql
 -- Delete existing VPS plans to avoid conflicts
 DELETE FROM public.hosting_plans WHERE category = 'VPS';
 
@@ -1000,4 +999,3 @@
     'https://portal.qiwhost.com/cart.php?a=add&pid=100', TRUE, 100
 );
 
-``````