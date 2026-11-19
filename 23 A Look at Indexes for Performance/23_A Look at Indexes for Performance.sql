-- Dataset: users_social.csv
-- Database: instagram

-- SECTION 23: A Look at Indexes for Performance

-- Benchmarking a query before creating an index
SELECT * FROM users
WHERE username = 'sam_dev';

-- Create a B-Tree index on username column
CREATE INDEX users_username_idx ON users (username);

-- View newly created index in system catalog
SELECT relname, relkind
FROM pg_class
WHERE relname = 'users_username_idx';

-- List all indexes currently present on the users table
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'users';

-- Check size of index compared to table
SELECT pg_size_pretty(pg_relation_size('users')) AS table_size,
       pg_size_pretty(pg_relation_size('users_username_idx')) AS index_size;

-- Drop an index
DROP INDEX users_username_idx;
