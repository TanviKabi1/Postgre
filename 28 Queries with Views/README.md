# Section 28: Queries with Views

## Overview
This section demonstrates PostgreSQL Views. It shows how to package complex queries into reusable virtual tables (`CREATE VIEW`) that can be queried just like regular tables.

## Tables
- **`photo_tags`**, **`caption_tags`**, **`posts`**: Real physical tables storing data.
- **`tags` (View)**: Virtual table combining photo and caption tags into one place.
- **`recent_posts` (View)**: Virtual table showing the 10 most recent posts.

## Design Tradeoff
We save our combined tag logic inside a View rather than copy-pasting the `UNION ALL` query into every app backend file. A View centralizes the query in the database, so if the tables change later, we only have to update the View in one place.

## PostgreSQL Features
- **Virtual Tables**: Views do not take up extra disk space; PostgreSQL runs the view's query under the hood whenever the view is called.

## Datasets
- `photo_tags.csv`, `caption_tags.csv`, `posts_social.csv`, `users_social.csv`: Source data for views.
