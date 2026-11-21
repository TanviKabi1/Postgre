# Section 14: Database Side Validation and Constraints

## Overview
This section shows how to protect data quality at the database level using `NOT NULL`, `DEFAULT`, `UNIQUE`, and `CHECK` constraints.

## Tables
- **`products`**: Uses constraints to make sure price is never null and always greater than zero (`CHECK (price > 0)`).
- **`orders`**: Uses a check constraint to make sure delivery date is always after order date (`CHECK (created_at < est_delivery)`).

## Design Tradeoff
We enforce validation rules directly in the PostgreSQL schema using `CHECK` constraints rather than trusting the backend app code alone. App-only validation was rejected because scripts, admin tools, or bugs could easily bypass it and insert bad data; database constraints block bad data every time.

## PostgreSQL Features
- **Unique Indexes**: PostgreSQL automatically creates a B-Tree index whenever a `UNIQUE` constraint is added to check for duplicates quickly.

## Datasets
- *Self-contained*: All tables and constraints are created and tested in the SQL file.
