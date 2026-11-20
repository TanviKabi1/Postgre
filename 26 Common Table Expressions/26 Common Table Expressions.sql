-- Dataset: users_social.csv, photo_tags.csv, caption_tags.csv
-- Database: instagram

-- SECTION 26: Simple Common Table Expressions

-- Query without CTE: subquery union in JOIN to find users tagged before 2026-01-07
SELECT users.username, tags.created_at
FROM users
JOIN (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
) AS tags ON tags.user_id = users.id
WHERE tags.created_at < '2026-01-13';

-- Equivalent cleaner query rewritten using a Common Table Expression
WITH tags AS (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
)
SELECT users.username, tags.created_at
FROM users
JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2026-01-13';
