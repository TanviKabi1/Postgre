# Section 06: Working with Large Datasets

## Overview
This section models an e-commerce store with customers and orders. It shows how to query larger tables, join customers with their purchases, and group orders by payment status.

## Tables
- **`users`**: Stores customer names. Kept separate from orders so user details are stored only once.
- **`orders`**: Stores purchases (`user_id`, `product_id`, `paid`). Kept separate because one customer can make dozens of purchases over time.

## Relationships & Foreign Keys
- `orders.user_id -> users.id`: Connects each purchase to the customer who placed it.

## Design Tradeoff
We store orders in their own table rather than embedding an orders list inside the user row. An embedded list was rejected because it makes it difficult to run store-wide reports (like counting all unpaid orders) and slows down updating user profiles.

## PostgreSQL Features
- **Boolean Grouping**: Groups orders by `paid` (true/false) to quickly check paid vs unpaid order volume.

## Datasets
- `users_ecommerce.csv`: Customer accounts.
- `orders.csv`: Purchase order records.
