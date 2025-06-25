/*
  # Add Netlify build hook trigger for blog posts

  1. New Trigger
    - Creates a trigger on the blog_posts table
    - Triggers a Netlify build hook when blog posts are inserted, updated, or deleted
    - Uses the provided Netlify build hook URL

  2. Purpose
    - Automatically rebuilds the website when blog content changes
    - Ensures published blog posts appear on the frontend immediately
    - Maintains content synchronization between Supabase and the deployed site
*/

-- Create trigger for blog_posts table
CREATE TRIGGER "netlify_build_trigger_blog_posts"
AFTER INSERT OR UPDATE OR DELETE ON public.blog_posts
FOR EACH ROW EXECUTE FUNCTION supabase_functions.http_request(
  'https://api.netlify.com/build_hooks/6856b3edfc1bc8c8691396ae',
  'POST',
  '{"Content-Type":"application/json"}',
  '{}',
  '5000'
);