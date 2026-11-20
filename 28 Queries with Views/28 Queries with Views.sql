-- Dataset: photo_tags.csv, caption_tags.csv, posts_social.csv, users_social.csv
-- Database: instagram

-- SECTION 28: Simplifying Queries with Views

-- Create a view uniting photo_tags and caption_tags into a single virtual table
CREATE VIEW tags AS (
    SELECT id, created_at, user_id, post_id, 'photo_tag' AS tag_type
    FROM photo_tags
    UNION ALL
    SELECT id, created_at, user_id, post_id, 'caption_tag' AS tag_type
    FROM caption_tags
);

-- Query the view directly just like a real table
SELECT * FROM tags;

-- Filter the view by tag type
SELECT * FROM tags
WHERE tag_type = 'caption_tag';

-- Join the view with users to show who was tagged in any manner
SELECT users.username, tags.created_at, tags.tag_type
FROM tags
JOIN users ON users.id = tags.user_id;

-- Create a view for the 10 most recent posts
CREATE VIEW recent_posts AS (
    SELECT * FROM posts
    ORDER BY created_at DESC
    LIMIT 10
);

-- Query recent posts view
SELECT * FROM recent_posts;

-- Use create or replace to modify view definition to top 15 posts
CREATE OR REPLACE VIEW recent_posts AS (
    SELECT * FROM posts
    ORDER BY created_at DESC
    LIMIT 15
);

-- Drop a view
DROP VIEW recent_posts;
