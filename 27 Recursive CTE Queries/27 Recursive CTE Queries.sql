-- Dataset: users_social.csv, followers.csv
-- Database: instagram

-- SECTION 27: Recursive Common Table Expressions

-- Simple recursive CTE: number countdown from 10 down to 1
WITH RECURSIVE countdown(val) AS (
    SELECT 10 AS val
    UNION
    SELECT val - 1 FROM countdown WHERE val > 1
)
SELECT * FROM countdown;

-- Recursive CTE generating follower recommendation suggestions up to depth 2 for user ID 1
WITH RECURSIVE suggestions(leader_id, follower_id, depth) AS (
    SELECT leader_id, follower_id, 1 AS depth
    FROM followers
    WHERE follower_id = 1
    UNION
    SELECT followers.leader_id, followers.follower_id, depth + 1
    FROM followers
    JOIN suggestions ON suggestions.leader_id = followers.follower_id
    WHERE depth < 2
)
SELECT DISTINCT users.id, users.username
FROM suggestions
JOIN users ON users.id = suggestions.leader_id
WHERE depth > 1
LIMIT 10;
