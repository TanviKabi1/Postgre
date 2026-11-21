# Section 24: Basic Query Tuning

## Overview
This section covers query tuning using `EXPLAIN` and `EXPLAIN ANALYZE`. It shows how to read PostgreSQL query plans, check estimated execution costs, and see the real time spent on each step.

## Tables
- **`users`**: Queried under `EXPLAIN` to observe the switch from a full `Seq Scan` to an `Index Scan` once an index is created.

## Design Tradeoff
We use `EXPLAIN ANALYZE` during development to test real performance. Plain `EXPLAIN` only gives an educated guess based on statistics, but `EXPLAIN ANALYZE` actually executes the query and shows real millisecond runtimes and buffer hits.

## PostgreSQL Features
- **Query Planner**: Compares `Seq Scan` (reads every page from disk) vs `Index Scan` (jumps straight to the matching row via the index).

## Datasets
- `users_social.csv`: User data used for query plan analysis.
