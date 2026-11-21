# Section 23: A Look at Indexes for Performance

## Overview
This section demonstrates how indexes speed up queries. It creates a B-Tree index on usernames and compares how fast PostgreSQL finds a record with and without the index.

## Tables
- **`users`**: Contains thousands of usernames used to test lookup speed and measure index file size on disk.

## Design Tradeoff
We added a B-Tree index on `users(username)`. The alternative was having no index and letting PostgreSQL scan every row sequentially. An index uses a little extra disk space and slightly slows down inserts, but it turns slow full-table scans into instant lookups, which is essential for user search.

## PostgreSQL Features
- **B-Tree Indexing**: Creates a balanced search tree that finds rows in $O(\log N)$ time instead of scanning all rows ($O(N)$).
- **Index Sizing**: Uses `pg_relation_size()` to compare the table size against the index size on disk.

## Datasets
- `users_social.csv`: User dataset used to populate records and test search speeds.
