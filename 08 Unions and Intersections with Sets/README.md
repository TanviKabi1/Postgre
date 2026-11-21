# Section 08: Unions and Intersections with Sets

## Overview
This section demonstrates set operations in SQL. It uses `UNION`, `UNION ALL`, `INTERSECT`, and `EXCEPT` to combine or compare rows from two different queries.

## Tables
- **`products`**: Queried with different criteria (e.g. highest priced items vs best price-to-weight ratio) and combined using set logic.
- **`phones`**: Used for comparing sets across hardware records.

## Design Tradeoff
We use `UNION ALL` when we know rows are distinct or when we want to keep duplicates. The standard `UNION` was rejected for simple row combining because it forces PostgreSQL to sort and deduplicate the data, which wastes CPU time.

## PostgreSQL Features
- **Set Operations**: Combines query results directly inside the engine as long as both queries return the same number and types of columns.

## Datasets
- `products.csv`: Retail catalog.
- `phones.csv`: Phone sales catalog.
