/*
  # Create blog posts schema

  1. New Tables
    - `blog_posts`
      - `id` (uuid, primary key)
      - `title` (text)
      - `slug` (text, unique)
      - `description` (text)
      - `content` (text)
      - `featured_image` (text)
      - `published_at` (timestamp)
      - `status` (text) - 'draft' or 'published'
      - `seo_title` (text, nullable)
      - `seo_description` (text, nullable)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)

  2. Security
    - Enable RLS on blog_posts table
    - Add policies for authenticated admin users and public read access
*/

-- Create blog_posts table
CREATE TABLE IF NOT EXISTS blog_posts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  slug text NOT NULL UNIQUE,
  description text NOT NULL,
  content text NOT NULL,
  featured_image text NOT NULL,
  published_at timestamptz,
  status text NOT NULL CHECK (status IN ('draft', 'published')),
  seo_title text,
  seo_description text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE blog_posts ENABLE ROW LEVEL SECURITY;

-- Create policies for blog_posts
CREATE POLICY "Allow public read access to published posts" ON blog_posts
  FOR SELECT USING (status = 'published');

CREATE POLICY "Allow admin full access" ON blog_posts
  FOR ALL USING (auth.role() = 'authenticated');

-- Create updated_at trigger
CREATE TRIGGER update_blog_posts_updated_at
  BEFORE UPDATE ON blog_posts
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();