# Section 04: Relating Records with Joins

## Overview
This section shows how to combine data from different tables in a single query. It practices `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`, and multi-table joins.

## Tables
- **`users`**, **`photos`**, **`comments`**: Social media tables joined to see photos with their owner's name and comments.
- **`authors`**: Stores author names (`id`, `name`). Kept separate so author info is not duplicated for each book.
- **`books`**: Stores book titles and author IDs (`author_id`). Kept separate to allow authors to have many books.

## Relationships & Foreign Keys
- `photos.user_id -> users.id`: Lets us join photos with their owners.
- `comments.photo_id -> photos.id`: Lets us join comments with the photos they belong to.
- `books.author_id -> authors.id`: Connects each book to its author.

## Design Tradeoff
We keep authors and books in separate normalized tables and join them when needed. The alternative was putting author names directly into the books table. A separate table is better because renaming an author only needs one update instead of changing hundreds of book rows.

## PostgreSQL Features
- **Join Strategies**: PostgreSQL picks the fastest join method (Hash Join, Nested Loop, or Merge Join) based on table size.

## Datasets
- `users.csv`, `photos.csv`, `comments.csv`: Social tables.
- `authors.csv`, `books.csv`: Authors and books dataset.
