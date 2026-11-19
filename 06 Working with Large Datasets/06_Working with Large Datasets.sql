-- Dataset: orders.csv, users_ecommerce.csv
-- Database: ecommerce

-- SECTION 6: Working with Large Datasets

-- Create users table
CREATE TABLE users (
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50)
);

-- Create orders table
CREATE TABLE orders (
    id         SERIAL PRIMARY KEY,
    user_id    INTEGER REFERENCES users(id),
    product_id INTEGER,
    paid       BOOLEAN
);

-- Insert users
INSERT INTO users (first_name, last_name)
VALUES ('Demetrius', 'Ward'),
       ('Rosalia',   'Kuhic'),
       ('Mckayla',   'Brakus'),
       ('Delmer',    'Walsh'),
       ('Lucinda',   'Hoppe'),
       ('Jerome',    'Abshire');

-- Insert orders
INSERT INTO orders (user_id, product_id, paid)
VALUES (1, 3, true),
       (1, 5, false),
       (2, 1, true),
       (3, 3, true),
       (4, 2, false),
       (5, 4, true);

-- Count paid and unpaid orders using GROUP BY
SELECT paid, COUNT(*)
FROM orders
GROUP BY paid;

-- Join users and orders to show who paid
SELECT users.first_name, users.last_name, orders.paid
FROM users
JOIN orders ON orders.user_id = users.id;
