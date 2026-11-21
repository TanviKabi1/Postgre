# Section 34: Data Access Pattern Repositories

## Overview
This section models the Repository / DAO pattern used by backend code. It demonstrates standard CRUD queries (Create, Read, Update, Delete) and uses the `RETURNING` clause to get created rows back immediately.

## Tables
- **`users`**: User account table (`id`, `created_at`, `updated_at`, `bio`, `username`) queried by the repository methods.

## Design Tradeoff
We use PostgreSQL's `RETURNING` clause on `INSERT` and `UPDATE` statements (e.g. `INSERT INTO users (...) VALUES (...) RETURNING *`). The alternative was running an `INSERT` and then running a separate `SELECT` query to find the newly assigned ID. `RETURNING` does both in a single step, cutting network calls in half.

## PostgreSQL Features
- **Atomic Returning**: Returns the newly saved row directly from the insert statement without needing a second query.

## Datasets
- `users_social.csv`: User records used to test repository queries.
