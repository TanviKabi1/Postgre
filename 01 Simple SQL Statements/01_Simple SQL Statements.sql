-- Dataset: cities.csv, phones.csv
-- Database: fundamentals

-- SECTION 1: Simple But Powerful SQL Statements

-- 1. Create the cities table
CREATE TABLE cities (
    name       VARCHAR(50),
    country    VARCHAR(50),
    population INTEGER,
    area       INTEGER
);

-- 2. Insert rows into cities 
INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo',     'Japan',   38505000, 8223),
       ('Delhi',     'India',   20125000, 2240),
       ('Shanghai',  'China',   22125000, 4015),
       ('Sao Paulo', 'Brazil',  20935000, 3043);

-- 3. Retrieve all data 
SELECT * FROM cities;

-- 4. Select specific columns 
SELECT name, country FROM cities;

-- 5. Calculated column: population density 
SELECT name, population / area AS population_density
FROM cities;

-- 6. String operators: concatenation with || 
SELECT name || ', ' || country AS location
FROM cities;

-- 7. Concatenation using CONCAT function 
SELECT CONCAT(name, ', ', country) AS location
FROM cities;

-- 8. String functions: UPPER, LOWER, LENGTH
SELECT UPPER(name) AS name_upper,
       LOWER(country) AS country_lower,
       LENGTH(name) AS name_length
FROM cities;

-- 9. Rename column with AS 
SELECT UPPER(CONCAT(name, ', ', country)) AS location
FROM cities;

-- PHONES TABLE (exercise dataset)

-- 10. Create the phones table 
CREATE TABLE phones (
    name         VARCHAR(100),
    manufacturer VARCHAR(100),
    price        INTEGER,
    units_sold   INTEGER
);

-- 11. Insert phone records 
INSERT INTO phones (name, manufacturer, price, units_sold)
VALUES ('iPhone 12',         'Apple',   799, 95000),
       ('Samsung Galaxy S21','Samsung', 799, 85000),
       ('Pixel 5',           'Google',  699, 32000),
       ('OnePlus 9',         'OnePlus', 729, 20000),
       ('Moto G Power',      'Motorola',249, 15000);

-- 12. Exercise: name and revenue per phone (price * units_sold) 
SELECT name,
       price * units_sold AS total_revenue
FROM phones;
