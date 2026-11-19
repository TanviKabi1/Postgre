-- Dataset: products.csv, phones.csv
-- Database: ecommerce

-- SECTION 8: Unions and Intersections with Sets

-- Union combining top 4 highest price products and top 4 highest price-to-weight ratio products
(
    SELECT * FROM products
    ORDER BY price DESC
    LIMIT 4
)
UNION
(
    SELECT * FROM products
    ORDER BY price / weight DESC
    LIMIT 4
);

-- Union All keeps duplicate rows between sets
(
    SELECT * FROM products
    ORDER BY price DESC
    LIMIT 4
)
UNION ALL
(
    SELECT * FROM products
    ORDER BY price / weight DESC
    LIMIT 4
);

-- Intersect returns only rows common to both query results
(
    SELECT * FROM products
    ORDER BY price DESC
    LIMIT 4
)
INTERSECT
(
    SELECT * FROM products
    ORDER BY price / weight DESC
    LIMIT 4
);

-- Intersect All keeps duplicate pairs from both sets
(
    SELECT * FROM products
    ORDER BY price DESC
    LIMIT 4
)
INTERSECT ALL
(
    SELECT * FROM products
    ORDER BY price / weight DESC
    LIMIT 4
);

-- Except returns rows from first query that are not in the second query
(
    SELECT * FROM products
    ORDER BY price DESC
    LIMIT 4
)
EXCEPT
(
    SELECT * FROM products
    ORDER BY price / weight DESC
    LIMIT 4
);

-- Union exercise: manufacturers of cheap phones unioned with manufacturers that sell many models
SELECT manufacturer
FROM phones
WHERE price < 170
UNION
SELECT manufacturer
FROM phones
GROUP BY manufacturer
HAVING COUNT(*) > 2;
