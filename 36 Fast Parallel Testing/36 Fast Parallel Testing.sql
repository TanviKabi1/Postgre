-- Dataset: None
-- Database: social_network_test

-- SECTION 36: Fast Parallel Testing

-- Create an isolated test schema
CREATE SCHEMA test;

-- Create users table inside test schema
CREATE TABLE test.users (
    id       SERIAL PRIMARY KEY,
    username VARCHAR(30) NOT NULL
);

-- Query the table explicitly referencing the schema
SELECT * FROM test.users;

-- Inspect current search path
SHOW search_path;

-- Direct queries to test schema by setting search_path
SET search_path TO test, public;

-- Insert user directly without schema prefix
INSERT INTO users (username)
VALUES ('parallel_tester_1');

-- Query resolves to test.users automatically
SELECT * FROM users;

-- Reset search path back to default
SET search_path TO "$user", public;

-- Clean up test schema and cascade drop contained tables
DROP SCHEMA test CASCADE;
