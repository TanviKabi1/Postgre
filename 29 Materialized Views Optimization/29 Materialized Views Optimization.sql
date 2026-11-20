-- Dataset: likes_social.csv, posts_social.csv, comments_social.csv
-- Database: instagram

-- SECTION 29: Optimizing Queries with Materialized Views

-- Expensive aggregation grouping weekly likes on posts and comments
SELECT
    date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
    COUNT(posts.id) AS num_likes_for_posts,
    COUNT(comments.id) AS num_likes_for_comments
FROM likes
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week;

-- Create materialized view to persist query results on disk
CREATE MATERIALIZED VIEW weekly_likes AS (
    SELECT
        date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
        COUNT(posts.id) AS num_likes_for_posts,
        COUNT(comments.id) AS num_likes_for_comments
    FROM likes
    LEFT JOIN posts ON posts.id = likes.post_id
    LEFT JOIN comments ON comments.id = likes.comment_id
    GROUP BY week
    ORDER BY week
) WITH DATA;

-- Fast query executed directly against the persisted materialized view cache
SELECT * FROM weekly_likes;

-- Refresh materialized view to synchronize with newly inserted data
REFRESH MATERIALIZED VIEW weekly_likes;

-- Drop materialized view
DROP MATERIALIZED VIEW weekly_likes;
