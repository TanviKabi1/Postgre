-- Dataset: users_social.csv
-- Database: social_network

-- SECTION 34: Data Access Pattern Repositories

-- Create users table for API repository demonstration
CREATE TABLE IF NOT EXISTS users (
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    bio        VARCHAR(400),
    username   VARCHAR(30) NOT NULL
);

-- Repository find: fetch all users
SELECT id, created_at, updated_at, bio, username
FROM users;

-- Repository findById: fetch user by ID
SELECT id, created_at, updated_at, bio, username
FROM users
WHERE id = 1;

-- Repository insert: create user and return generated row
INSERT INTO users (username, bio)
VALUES ('kevin_tech', 'Full-stack developer and open source enthusiast')
RETURNING id, created_at, updated_at, bio, username;

-- Repository update: update user bio and return updated record
UPDATE users
SET bio = 'Senior backend engineer and database architect',
    updated_at = CURRENT_TIMESTAMP
WHERE id = 1
RETURNING id, created_at, updated_at, bio, username;

-- Repository delete: remove user and return deleted record
DELETE FROM users
WHERE id = 1
RETURNING id, created_at, updated_at, bio, username;
