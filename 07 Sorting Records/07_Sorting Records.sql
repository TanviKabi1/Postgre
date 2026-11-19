-- Dataset: products.csv, phones.csv
-- Database: ecommerce

-- SECTION 7: Sorting Records

-- Create products table
CREATE TABLE products (
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(100),
    department VARCHAR(50),
    price      INTEGER,
    weight     INTEGER
);

-- Insert sample products
INSERT INTO products (name, department, price, weight)
VALUES ('Shirt',       'Clothes',    45,  1),
       ('Pants',       'Clothes',    65,  2),
       ('Hat',         'Clothes',    15,  1),
       ('Hammer',      'Tools',      20,  4),
       ('Drill',       'Tools',     120,  8),
       ('Shovel',      'Tools',      35,  6),
       ('Desk',        'Industrial',320, 45),
       ('Chair',       'Industrial',150, 15),
       ('Bacon',       'Grocery',    12,  1),
       ('Coffee Maker','Grocery',    85,  5),
       ('Toy Car',     'Toys',       25,  1),
       ('Board Game',  'Toys',       40,  3);

-- Sort products by price ascending (default)
SELECT * FROM products
ORDER BY price;

-- Sort products by price descending
SELECT * FROM products
ORDER BY price DESC;

-- Sort by price then weight
SELECT * FROM products
ORDER BY price ASC, weight DESC;

-- Limit results to top 5 cheapest products
SELECT * FROM products
ORDER BY price ASC
LIMIT 5;

-- Offset results by 5 to view next page of 5
SELECT * FROM products
ORDER BY price ASC
LIMIT 5 OFFSET 5;

-- Sort phones exercise: 
SELECT name FROM phones
ORDER BY price DESC
LIMIT 2 OFFSET 1;
