# Section 10: Selecting Distinct Records

## Overview
This section covers removing duplicate values from query results using `SELECT DISTINCT` and counting unique values with `COUNT(DISTINCT column)`.

## Tables
- **`products`**: Used to find unique department names and unique department/price combinations.
- **`phones`**: Used to count distinct manufacturers.

## Design Tradeoff
We use `SELECT DISTINCT` to pull unique departments directly from the products table for simple queries. The alternative was creating a separate `departments` table. While a separate table is better for large apps, `DISTINCT` was chosen here to keep the schema simple and avoid extra joins.

## PostgreSQL Features
- **Hash Aggregate**: PostgreSQL builds a hash table in memory to quickly identify and remove duplicate rows.

## Datasets
- `products.csv`: Products with repeated departments.
- `phones.csv`: Phone brands with repeated names.
