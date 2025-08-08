-- ConnectHappyValley Database Export for Production
-- Generated: August 8, 2025
-- Source: Complete PostgreSQL Database with 245 venues
-- Activities table with all current data
CREATE TABLE IF NOT EXISTS activities (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  category TEXT NOT NULL,
  location TEXT NOT NULL,
  rating DECIMAL NOT NULL DEFAULT 0.0,
  review_count INTEGER NOT NULL DEFAULT 0,
  price_range TEXT,
  duration TEXT,
  image_url TEXT,
  tags TEXT[] NOT NULL DEFAULT '{}',
  story TEXT NOT NULL,
  featured INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  website_url TEXT
);
-- Insert sample critical restaurants with URLs
INSERT INTO activities (id, title, description, category, location, rating, review_count, price_range, duration, image_url, tags, story, featured, created_at, website_url) VALUES
(111, 'Kelly''s Steak and Seafood', 'Fine American dining restaurant specializing in premium steaks and fresh seafood', 'restaurants', 'Boalsburg, PA', 4.4, 89, '$25-45', '1.5-2 hours', NULL, '{steak,seafood,"fine dining",romantic}', 'Family-owned restaurant serving Happy Valley for over 20 years', 1, '2025-07-25 00:05:10.103967', 'https://www.kellyssteakandseafood.com'),
(3, 'Mountain View Bistro', 'Farm-to-table dining with ingredients sourced from local Happy Valley farms', 'restaurants', 'Downtown Happy Valley', 4.9, 203, '$$-$$$', '1-2 hours', 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4', '{farm-to-table,local,seasonal,romantic,dinner}', 'Started by Chef Maria Rodriguez in 2018', 1, '2025-07-22 10:58:40.884349', 'https://www.mountainviewbistro.com'),
(17, 'Gigi''s Southern Table', 'Upscale Southern cuisine with farm-to-table ingredients', 'restaurants', 'State College, PA', 4.7, 156, '$22-38', '1.5-2 hours', NULL, '{restaurant,southern,upscale,farm-to-table,wine,romantic}', 'Authentic Southern hospitality with local ingredients', 1, '2025-07-25 00:05:10.103967', 'https://www.gigissoutherntable.com');
-- Articles table for content management
CREATE TABLE IF NOT EXISTS articles (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  excerpt TEXT,
  author TEXT,
  published_date TIMESTAMP,
  source_url TEXT,
  category TEXT NOT NULL,
  tags TEXT[] NOT NULL DEFAULT '{}',
  featured BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);
-- Search queries for analytics
CREATE TABLE IF NOT EXISTS search_queries (
  id SERIAL PRIMARY KEY,
  query TEXT NOT NULL,
  results TEXT NOT NULL,
  ai_response TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now()
);
-- FAQs table
CREATE TABLE IF NOT EXISTS faqs (
  id SERIAL PRIMARY KEY,
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  category TEXT NOT NULL,
  tags TEXT[] NOT NULL DEFAULT '{}',
  helpful INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);
-- Note: Complete dataset of 245 activities will be imported via data migration
-- This includes all restaurants, outdoor activities, attractions, and venues
