# Section 26: Common Table Expressions

## Overview
This section introduces Common Table Expressions (CTEs) using the `WITH` keyword. It shows how to clean up messy subqueries and combine tagging data from different tables into a clean temporary result.

## Tables
- **`users`**: Target users who were tagged.
- **`photo_tags`** & **`caption_tags`**: Two different tag tables combined together inside a CTE.

## Relationships & Foreign Keys
- `photo_tags.user_id -> users.id` & `caption_tags.user_id -> users.id`: Connects tags back to users.

## Design Tradeoff
We use a `WITH tags AS (...)` CTE instead of writing a deeply nested subquery inside `FROM`. A nested subquery is hard to read and cannot be reused, while a CTE makes the query read top-to-bottom like clean code.

## PostgreSQL Features
- **Query Readability**: Breaks complex multi-step queries into separate named pieces that run together in a single query.

## Datasets
- `users_social.csv`, `photo_tags.csv`, `caption_tags.csv`: Social tag datasets.
