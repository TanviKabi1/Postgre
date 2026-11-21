# Section 05: Aggregation of Records

## Overview
This section covers grouping data and calculating summary numbers using `GROUP BY`, aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`), and filtering groups with `HAVING`.

## Tables
- **`comments`**: Grouped by `photo_id` to count comments per photo.
- **`books`** & **`authors`**: Grouped by author to count books published.
- **`phones`**: Grouped by manufacturer to find total units sold and revenue.

## Relationships & Foreign Keys
- `comments.photo_id -> photos.id`: Groups comments by photo.
- `books.author_id -> authors.id`: Groups books by author.

## Design Tradeoff
We calculate comment totals dynamically using `COUNT(*)` and `GROUP BY` rather than keeping a counter column on the photos table. A stored counter was rejected because it easily gets out of sync during concurrent inserts or deletes, while SQL aggregation is always accurate.

## PostgreSQL Features
- **Group Filtering**: Uses `HAVING` to filter groups after aggregating (e.g. only show photos with more than 2 comments).

## Datasets
- `comments.csv`, `photos.csv`, `users.csv`: Comment counts.
- `authors.csv`, `books.csv`: Book counts.
- `phones.csv`: Sales revenue by brand.
