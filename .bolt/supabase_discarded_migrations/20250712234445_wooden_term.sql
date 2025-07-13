/*
  # Blog Posts Schema

  1. New Tables
    - `blog_posts`
      - `id` (uuid, primary key)
      - `title` (text, not null)
      - `slug` (text, not null, unique)
      - `description` (text, not null)
      - `content` (text, not null)
      - `featured_image` (text, not null)
      - `published_at` (timestamp with time zone)
      - `status` (text, not null)
      - `seo_title` (text)
      - `seo_description` (text)
      - `created_at` (timestamp with time zone, default now())
      - `updated_at` (timestamp with time zone, default now())
  
  2. Security
    - Enable RLS on `blog_posts` table
    - Add policy for authenticated users to have full access
    - Add policy for public users to read published posts
*/

-- Create blog_posts table if it doesn't exist
CREATE TABLE IF NOT EXISTS blog_posts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  slug text NOT NULL UNIQUE,
  description text NOT NULL,
  content text NOT NULL,
  featured_image text NOT NULL,
  published_at timestamp with time zone,
  status text NOT NULL CHECK (status IN ('draft', 'published')),
  seo_title text,
  seo_description text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE blog_posts ENABLE ROW LEVEL SECURITY;

-- Create policy for authenticated users (admin) to have full access
CREATE POLICY "Allow admin full access" 
  ON blog_posts
  FOR ALL 
  TO authenticated
  USING (role() = 'authenticated');

-- Create policy for public users to read only published posts
CREATE POLICY "Allow public read access to published posts" 
  ON blog_posts
  FOR SELECT 
  TO public
  USING (status = 'published');

-- Create trigger to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger for blog_posts table
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger 
    WHERE tgname = 'update_blog_posts_updated_at'
  ) THEN
    CREATE TRIGGER update_blog_posts_updated_at
    BEFORE UPDATE ON blog_posts
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at();
  END IF;
END $$;

-- Create Netlify build trigger for blog posts
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger 
    WHERE tgname = 'netlify_build_trigger_blog_posts'
  ) THEN
    CREATE TRIGGER netlify_build_trigger_blog_posts
    AFTER INSERT OR DELETE OR UPDATE ON blog_posts
    FOR EACH ROW
    EXECUTE FUNCTION supabase_functions.http_request(
      'https://api.netlify.com/build_hooks/6856b3edfc1bc8c8691396ae',
      'POST',
      '{"Content-Type":"application/json"}',
      '{}',
      '5000'
    );
  END IF;
END $$;