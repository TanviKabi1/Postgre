-- Dataset: users.csv, photos.csv, comments.csv, authors.csv, books.csv
-- Database: relationships
-- Prerequisite: 03_Working with Tables.sql must have been run first (users, photos, comments exist)

-- SECTION 4: Relating Records with Joins

-- 1. INNER JOIN
SELECT comments.contents, users.username
FROM comments
JOIN users ON users.id = comments.user_id;

-- 2. INNER JOIN
SELECT comments.contents, photos.url
FROM comments
JOIN photos ON photos.id = comments.photo_id;

-- 3. Alternate JOIN 
SELECT c.contents, u.username
FROM comments AS c
JOIN users AS u ON u.id = c.user_id;

-- 4. Add a photo with no matching user 
INSERT INTO photos (url, user_id)
VALUES ('http://banner.jpg', NULL);

-- 5. INNER JOIN (default)
SELECT photos.url, users.username
FROM photos
JOIN users ON users.id = photos.user_id;

-- 6. LEFT JOIN: all photos, even without a user
SELECT photos.url, users.username
FROM photos
LEFT JOIN users ON users.id = photos.user_id;

-- 7. RIGHT JOIN: all users, even without photos 
INSERT INTO users (username) VALUES ('Nicole');

SELECT photos.url, users.username
FROM photos
RIGHT JOIN users ON users.id = photos.user_id;

-- 8. FULL JOIN: all rows from both sides 
SELECT photos.url, users.username
FROM photos
FULL JOIN users ON users.id = photos.user_id;

-- ─── 9. WHERE with JOIN: filter after joining ─────────────────
SELECT photos.url, users.username
FROM photos
JOIN users ON users.id = photos.user_id
WHERE photos.user_id = 2;

-- 10. THREE-WAY JOIN: comments + photos + users 
SELECT c.contents, p.url, u.username
FROM comments AS c
JOIN photos AS p ON p.id = c.photo_id
JOIN users  AS u ON u.id = c.user_id;

-- 11. Exercise: authors and books 
CREATE TABLE authors (
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE books (
    id        SERIAL PRIMARY KEY,
    title     VARCHAR(200),
    author_id INTEGER REFERENCES authors(id)
);

INSERT INTO authors (name)
VALUES ('Stephen King'),
       ('Agatha Christie'),
       ('JRR Tolkien'),
       ('George Orwell');

INSERT INTO books (title, author_id)
VALUES ('The Shining',           1),
       ('It',                    1),
       ('Murder on the Orient',  2),
       ('The Lord of the Rings', 3),
       ('1984',                  4),
       ('Animal Farm',           4);

-- 12. JOIN books with authors 
SELECT books.title, authors.name
FROM books
JOIN authors ON authors.id = books.author_id;

-- 13. Exercise solution
SELECT authors.name, COUNT(*) AS book_count
FROM books
JOIN authors ON authors.id = books.author_id
GROUP BY authors.name;
