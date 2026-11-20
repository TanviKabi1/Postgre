-- Dataset: None
-- Database: social_network

-- SECTION 32: Schema vs Data Migrations

-- Step 1: Initial schema migration - create posts table with separate lat and lng
CREATE TABLE posts (
    id        SERIAL PRIMARY KEY,
    caption   VARCHAR(240),
    lat       REAL,
    lng       REAL
);

-- Insert sample records
INSERT INTO posts (caption, lat, lng)
VALUES ('Beach vacation', 34.0195, -118.4912),
       ('City skyline', 40.7128, -74.0060);

-- Step 2: Add loc column to accommodate new PostGIS or point representation
ALTER TABLE posts
ADD COLUMN loc POINT;

-- Step 3: Data migration - populate loc by combining existing lat and lng
UPDATE posts
SET loc = POINT(lng, lat)
WHERE loc IS NULL;

-- Step 4: Verify migration integrity
SELECT id, caption, lat, lng, loc
FROM posts;

-- Step 5: Final cleanup migration - drop obsolete lat and lng columns
ALTER TABLE posts
DROP COLUMN lat,
DROP COLUMN lng;
