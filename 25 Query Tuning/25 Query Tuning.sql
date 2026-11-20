-- Dataset: users_social.csv, likes_social.csv
-- Database: instagram

-- SECTION 25: Advanced Query Tuning

-- Explain query with cost estimates breakdown
EXPLAIN SELECT * FROM users
WHERE username = 'sam_dev';

-- Inspecting planner cost parameters from PostgreSQL configuration
SHOW seq_page_cost;
SHOW random_page_cost;
SHOW cpu_tuple_cost;
SHOW cpu_operator_cost;

-- Explain multi-table join with cost propagation across nodes
EXPLAIN ANALYZE
SELECT users.username, COUNT(*)
FROM users
JOIN likes ON likes.user_id = users.id
GROUP BY users.username;

-- Forcing PostgreSQL to avoid sequential scans when testing indexes
SET enable_seqscan = off;

EXPLAIN SELECT * FROM users
WHERE username = 'sam_dev';

-- Resetting sequential scans back to default on
SET enable_seqscan = on;
