-- Dataset: users_social.csv, posts_social.csv, likes_social.csv
-- Database: instagram

-- SECTION 21: Approaching and Writing Complex Queries

-- Highest three user IDs
SELECT * FROM users
ORDER BY id DESC
LIMIT 3;

-- Posts created by a particular user with user ID 200
SELECT url, caption
FROM posts
WHERE user_id = 200;

-- Join posts with users to retrieve username and caption for user ID 200
SELECT users.username, posts.caption
FROM posts
JOIN users ON users.id = posts.user_id
WHERE users.id = 200;

-- Count likes received per user across all posts
SELECT users.username, COUNT(*) AS num_likes
FROM users
JOIN posts ON posts.user_id = users.id
JOIN likes ON likes.post_id = posts.id
GROUP BY users.username;
