# Section 07: Sorting Records

## Overview
This section covers sorting and pagination. It uses `ORDER BY` (ascending and descending), sorting by multiple columns, and using `LIMIT` and `OFFSET` to display data page by page.

## Tables
- **`products`**: Stores retail catalog items (`name`, `department`, `price`, `weight`) to test sorting by price and weight.
- **`phones`**: Used to test multi-column sorting on price and sales numbers.

## Design Tradeoff
We use `LIMIT` and `OFFSET` inside the database to fetch one page of products at a time. The alternative was fetching all products into the application and paginating in JavaScript. Database-level pagination is much lighter on memory and network speed.

## PostgreSQL Features
- **In-Memory Sort**: PostgreSQL sorts rows in RAM using allocated `work_mem`, only using disk space if the result set is too large to fit.

## Datasets
- `products.csv`: Products with prices and weights.
- `phones.csv`: Phones with prices and sales counts.
