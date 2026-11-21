# Section 09: Assembling Queries with Subqueries

## Overview
This section explores subqueries (queries inside queries). It covers subqueries in the `WHERE` clause, in the `SELECT` list, and derived tables in the `FROM` clause.

## Tables
- **`products`**: Used to compare product prices against departmental maximums.
- **`orders`**: Grouped inside subqueries to find average order numbers per user.
- **`users`**: Joined with subquery results.

## Relationships & Foreign Keys
- `orders.user_id -> users.id`: Connects orders to customers in subquery joins.

## Design Tradeoff
We aggregate orders inside a subquery in the `FROM` clause before joining to users, rather than joining first. Pre-aggregating in a subquery is much faster because it shrinks millions of orders down to one row per user before the join happens.

## PostgreSQL Features
- **Subquery Optimization**: PostgreSQL can often rewrite subqueries into joins automatically when it finds a faster execution plan.

## Datasets
- `products.csv`, `orders.csv`, `users_ecommerce.csv`: E-commerce data.
- `phones.csv`: Price comparisons.
