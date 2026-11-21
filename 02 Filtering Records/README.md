# Section 02: Filtering Records

## Overview
This section focuses on filtering table rows using the `WHERE` clause. It covers conditions with `=`, `<`, `>`, `AND`, `OR`, `IN`, and `BETWEEN` to fetch only the rows needed.

## Tables
- **`cities`**: City records used to filter by population and area size.
- **`phones`**: Phone sales records used to filter by price range and manufacturer.

## Design Tradeoff
We filter records directly inside the database using SQL `WHERE` clauses. The rejected alternative was fetching every row into our app code and filtering there with an `if` check. Filtering inside the database is much faster and saves network bandwidth.

## PostgreSQL Features
- **Query Filtering**: PostgreSQL scans rows and discards non-matching records in memory before sending data to the client.

## Datasets
- `cities.csv`: Data for location and population filters.
- `phones.csv`: Data for price and manufacturer filters.
