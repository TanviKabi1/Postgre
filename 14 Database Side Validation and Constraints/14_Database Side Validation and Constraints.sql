-- Dataset: None
-- Database: validation_demo

-- SECTION 14: Database Side Validation and Constraints

-- Create products table for testing constraints
CREATE TABLE products (
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(50),
    department VARCHAR(50),
    price      INTEGER,
    weight     INTEGER
);

-- Insert row with NULL price
INSERT INTO products (name, department, weight)
VALUES ('Shirt', 'Clothes', 1);

-- Update NULL prices prior to adding NOT NULL constraint
UPDATE products
SET price = 999
WHERE price IS NULL;

-- Apply NOT NULL constraint using ALTER TABLE
ALTER TABLE products
ALTER COLUMN price SET NOT NULL;

-- Set a DEFAULT value for a column
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 999;

-- Add a unique constraint to a single column
ALTER TABLE products
ADD CONSTRAINT products_name_key UNIQUE (name);

-- Remove a constraint
ALTER TABLE products
DROP CONSTRAINT products_name_key;

-- Add multi-column uniqueness constraint
ALTER TABLE products
ADD CONSTRAINT products_name_department_key UNIQUE (name, department);

-- Add a CHECK constraint for single column validation
ALTER TABLE products
ADD CONSTRAINT products_price_must_be_positive CHECK (price > 0);

-- Table demonstrating multi-column CHECK constraints
CREATE TABLE orders (
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(50) NOT NULL,
    created_at   TIMESTAMP NOT NULL,
    est_delivery TIMESTAMP NOT NULL,
    CHECK (created_at < est_delivery)
);

-- Successful insert matching CHECK constraint
INSERT INTO orders (name, created_at, est_delivery)
VALUES ('Laptop', '2026-11-18 10:00:00', '2026-11-20 10:00:00');
