-- Dataset: None
-- Database: social_network

-- SECTION 31: Managing Database Design with Schema Migrations

-- Migration 1 Up: create comments table
CREATE TABLE comments (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    contents   VARCHAR(240) NOT NULL
);

-- Migration 2 Up: rename contents column to body
ALTER TABLE comments
RENAME COLUMN contents TO body;

-- Migration 2 Down: revert column name back to contents
ALTER TABLE comments
RENAME COLUMN body TO contents;

-- Migration 1 Down: drop comments table
DROP TABLE IF EXISTS comments;
