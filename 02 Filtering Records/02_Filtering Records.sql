-- Dataset: cities.csv, phones.csv
-- Database: fundamentals

-- SECTION 2: Filtering Records

-- 1. Basic WHERE clause 
SELECT * FROM cities
WHERE area > 4000;

-- 2. WHERE with equality 
SELECT * FROM cities
WHERE country = 'India';

-- 3. WHERE with NOT EQUAL 
SELECT name, area FROM cities
WHERE country != 'India';

-- 4. Compound WHERE: AND 
SELECT name, area, population FROM cities
WHERE area > 2000 AND population > 20000000;

-- 5. Compound WHERE OR 
SELECT name, country FROM cities
WHERE area > 4000 OR population > 20000000;

-- 6. Comparison operators: BETWEEN 
SELECT name, area FROM cities
WHERE area BETWEEN 2000 AND 4500;

-- 7. WHERE with IN list 
SELECT name, country FROM cities
WHERE country IN ('India', 'China');

-- 8. WHERE with NOT IN list 
SELECT name, country FROM cities
WHERE country NOT IN ('India', 'China');

-- 9. Calculations inside WHERE 
SELECT name, population / area AS density FROM cities
WHERE population / area > 5000;

-- 10. Phones exercise: WHERE with price filter 
SELECT name, manufacturer FROM phones
WHERE price < 750;

-- 11. Phones WHERE with IN 
SELECT name, manufacturer, price FROM phones
WHERE manufacturer IN ('Apple', 'Samsung');

-- 12. Phones WHERE with calculation
SELECT name, price * units_sold AS revenue FROM phones
WHERE price * units_sold > 60000000;

-- 13. UPDATE rows: change population of Tokyo 
UPDATE cities
SET population = 38600000
WHERE name = 'Tokyo';

-- Verify update
SELECT * FROM cities WHERE name = 'Tokyo';

-- 14. Exercise: UPDATE phones price 
UPDATE phones
SET price = 650
WHERE name = 'Pixel 5';

UPDATE phones
SET units_sold = units_sold + 1000
WHERE manufacturer = 'Samsung';

-- Verify updates
SELECT * FROM phones;

-- 15. DELETE rows 
DELETE FROM cities
WHERE name = 'Tokyo';


SELECT * FROM cities;

-- Re-insert Tokyo 
INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 38505000, 8223);

-- 16. Exercise: DELETE phones by manufacturer
DELETE FROM phones
WHERE manufacturer = 'Motorola';

-- Verify
SELECT * FROM phones;
