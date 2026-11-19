-- Dataset: users_social.csv
-- Database: instagram

-- SECTION 24: Basic Query Tuning

-- Explain query execution plan without running the query
EXPLAIN SELECT * FROM users
WHERE username = 'sam_dev';

-- Explain analyze executes the query and provides actual run times and row counts
EXPLAIN ANALYZE SELECT * FROM users
WHERE username = 'sam_dev';

-- Create index to observe change in planner strategy
CREATE INDEX users_username_idx ON users (username);

-- Explain analyze with index in place (Index Scan vs Seq Scan)
EXPLAIN ANALYZE SELECT * FROM users
WHERE username = 'sam_dev';

-- Clean up
DROP INDEX users_username_idx;
