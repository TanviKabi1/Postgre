# Section 11: Utility Operators Keywords and Functions

## Overview
This section covers helpful SQL functions and conditional logic, including `GREATEST`, `LEAST`, and `CASE` statements to categorize data on the fly.

## Tables
- **`products`**: Product catalog items used to test price caps, dynamic shipping costs, and price tier labels.

## Design Tradeoff
We compute labels like `'cheap'`, `'medium'`, and `'high'` inside SQL using a `CASE` statement. The alternative was writing this logic in backend application code. Putting it in the query lets us sort and filter by tier directly in the database.

## PostgreSQL Features
- **Scalar Logic**: `CASE` and `GREATEST` run directly in PostgreSQL per row with near-zero overhead.

## Datasets
- `products.csv`: Product catalog with prices and weights.
