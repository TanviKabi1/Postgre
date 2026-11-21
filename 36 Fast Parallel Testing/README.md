# Section 36: Fast Parallel Testing

## Overview
This section shows how to run automated tests in parallel without them interfering with each other. It uses isolated PostgreSQL schemas (`CREATE SCHEMA test`, `SET search_path`) to give each test runner its own clean sandbox.

## Tables
- **`test.users`**: A user table living inside a dedicated `test` schema, separate from the `public` schema.

## Design Tradeoff
We isolate tests using **PostgreSQL Schemas** (`CREATE SCHEMA test`) rather than creating a whole new physical database for every test run. Creating separate databases is slow and takes lots of server memory, while schemas are created in milliseconds and can be deleted instantly when the test finishes (`DROP SCHEMA test CASCADE`).

## PostgreSQL Features
- **Search Path**: Uses `SET search_path TO test, public` so queries like `SELECT * FROM users` automatically use the test table without modifying the query code.

## Datasets
- *Self-contained*: Creates, tests, and deletes the test schema completely inside the SQL script.
