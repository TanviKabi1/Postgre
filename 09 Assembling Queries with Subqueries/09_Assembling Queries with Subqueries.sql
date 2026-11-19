-- Dataset: products.csv, orders.csv, users_ecommerce.csv, phones.csv
-- Database: ecommerce

-- SECTION 9: Assembling Queries with Subqueries

-- Subquery in WHERE: products more expensive than the maximum price in toys department
SELECT name, price
FROM products
WHERE price > (
    SELECT MAX(price)
    FROM products
    WHERE department = 'Toys'
);

-- Subquery in SELECT: calculate price compared to max price across all products
SELECT name, price, (
    SELECT MAX(price) FROM products
) AS max_price
FROM products;

-- Subquery in SELECT returning calculated ratio
SELECT name, price, price / (
    SELECT MAX(price) FROM products
) AS price_ratio
FROM products;

-- Subquery in FROM: calculate average order count per user
SELECT AVG(p.order_count)
FROM (
    SELECT user_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY user_id
) AS p;

-- Subquery in JOIN: join users with an aggregated orders subquery
SELECT users.first_name, o.user_id
FROM users
JOIN (
    SELECT user_id FROM orders
    WHERE product_id = 3
) AS o ON o.user_id = users.id;

-- Subquery with WHERE IN: products in departments that have any product under 20 dollars
SELECT name, department, price
FROM products
WHERE department IN (
    SELECT department
    FROM products
    WHERE price < 20
);

-- Subquery with WHERE NOT IN: products not in departments with cheap products
SELECT name, department, price
FROM products
WHERE department NOT IN (
    SELECT department
    FROM products
    WHERE price < 20
);

-- Subquery with ALL operator: products more expensive than ALL products in Industrial department
SELECT name, department, price
FROM products
WHERE price > ALL (
    SELECT price
    FROM products
    WHERE department = 'Industrial'
);

-- Subquery with SOME/ANY operator: products more expensive than AT LEAST ONE product in Industrial
SELECT name, department, price
FROM products
WHERE price > SOME (
    SELECT price
    FROM products
    WHERE department = 'Industrial'
);

-- Correlated subquery in WHERE: most expensive product within each department
SELECT name, department, price
FROM products AS p1
WHERE p1.price = (
    SELECT MAX(p2.price)
    FROM products AS p2
    WHERE p2.department = p1.department
);

-- Correlated subquery in SELECT: count orders per product without using GROUP BY
SELECT p.name, (
    SELECT COUNT(*)
    FROM orders AS o
    WHERE o.product_id = p.id
) AS num_orders
FROM products AS p;

-- SELECT without FROM: calculate max, min, avg phone prices as a standalone row
SELECT (
    SELECT MAX(price) FROM phones
), (
    SELECT MIN(price) FROM phones
), (
    SELECT AVG(price) FROM phones
);
