-- Dataset: None
-- Database: social_network

-- SECTION 33: Accessing PostgreSQL from APIs

-- Health check query used by application connection pools
SELECT 1 + 1 AS result;

-- Inspect active client connections to PostgreSQL
SELECT pid, usename, client_addr, state, query
FROM pg_stat_activity
WHERE datname = 'social_network';
