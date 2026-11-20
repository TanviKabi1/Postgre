-- Dataset: users_social.csv
-- Database: social_network

-- SECTION 35: Security Around PostgreSQL

-- Demonstration of SQL Injection vulnerability when concatenating user input directly
-- Insecure string concatenation: SELECT * FROM users WHERE id = '1; DROP TABLE users;';

-- Secure approach: Prepared Statement with parameterized placeholders
PREPARE find_user_by_id (INTEGER) AS
SELECT id, created_at, updated_at, bio, username
FROM users
WHERE id = $1;

-- Executing the prepared statement safely
EXECUTE find_user_by_id (1);

-- Prepared statement for safe insert
PREPARE insert_user (VARCHAR, VARCHAR) AS
INSERT INTO users (username, bio)
VALUES ($1, $2)
RETURNING *;

EXECUTE insert_user ('sarah_code', 'Building scalable web backends');

-- Prepared statement for safe update
PREPARE update_user_bio (INTEGER, VARCHAR) AS
UPDATE users
SET bio = $2,
    updated_at = CURRENT_TIMESTAMP
WHERE id = $1
RETURNING *;

EXECUTE update_user_bio (2, 'Updated secure biography');

-- Prepared statement for safe delete
PREPARE delete_user (INTEGER) AS
DELETE FROM users
WHERE id = $1
RETURNING *;

EXECUTE delete_user (2);

-- Deallocate prepared statements after use
DEALLOCATE find_user_by_id;
DEALLOCATE insert_user;
DEALLOCATE update_user_bio;
DEALLOCATE delete_user;
