-- Dataset: products.csv
-- Database: ecommerce

-- SECTION 11: Utility Operators Keywords and Functions

-- Greatest function: returns greatest value from a list of expressions
SELECT GREATEST(20, 10, 30);

-- Compute maximum shipping cost or price threshold
SELECT name, weight, GREATEST(30, 2 * weight) AS shipping_cost
FROM products;

-- Least function: returns smallest value from a list of expressions
SELECT LEAST(1, 20, 50, 100);

-- Apply price cap using LEAST
SELECT name, price, LEAST(price * 0.5, 50) AS discount_price
FROM products;

-- Case keyword: categorize product prices into high, medium, cheap
SELECT name, price,
    CASE
        WHEN price > 100 THEN 'high'
        WHEN price > 40  THEN 'medium'
        ELSE 'cheap'
    END AS price_category
FROM products;
