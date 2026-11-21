# Section 01: Simple SQL Statements

## Overview
This section covers basic SQL queries in PostgreSQL. It sets up simple tables for cities and mobile phones to practice selecting data, doing math on columns, and formatting text.

## Tables
- **`cities`**: Stores city names, countries, populations, and land areas. Kept separate because city data has nothing to do with commercial phone products.
- **`phones`**: Stores phone models, makers, prices, and units sold. Kept as its own table to track hardware inventory independently.

## Design Tradeoff
We calculate revenue on the fly in queries (`price * units_sold`) rather than saving it as a `total_revenue` column in the table. The alternative was adding a stored column, but that wastes space and can get out of sync if someone updates the price or units sold later.

## PostgreSQL Features
- **Calculated Columns**: Performs math and string concatenation directly inside the query before sending results back.

## Datasets
- `cities.csv`: Sample city population and area records.
- `phones.csv`: Sample phone prices and sales numbers.
