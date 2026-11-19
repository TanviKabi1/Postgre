-- Dataset: products.csv, phones.csv
-- Database: ecommerce

-- SECTION 10: Selecting Distinct Records

-- Select distinct departments from products
SELECT DISTINCT department
FROM products;

-- Count distinct departments
SELECT COUNT(DISTINCT department)
FROM products;

-- Distinct combinations of two columns
SELECT DISTINCT department, name
FROM products;

-- Distinct exercise: count of unique phone manufacturers
SELECT COUNT(DISTINCT manufacturer)
FROM phones;
