-- Dataset: None
-- Database: instagram

-- SECTION 22: Understanding the Internals of PostgreSQL

-- Show the directory where PostgreSQL stores database cluster data files
SHOW data_directory;

-- Find internal database OID for instagram database
SELECT oid, datname
FROM pg_database
WHERE datname = 'instagram';

-- Inspect pg_class system catalog to view relfilenode for users table
SELECT relname, relfilenode
FROM pg_class
WHERE relname = 'users';

-- Find storage details for all tables in current database
SELECT relname, relfilenode, relpages, reltuples
FROM pg_class
WHERE relkind = 'r' AND relnamespace = 2200;
