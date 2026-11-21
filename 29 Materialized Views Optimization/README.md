# Section 29: Materialized Views Optimization

## Overview
This section covers Materialized Views. Unlike regular views, a Materialized View saves the query results physically to disk, giving instant lookup speeds for heavy reporting queries.

## Tables
- **`likes`**, **`posts`**, **`comments`**: Operational tables containing raw user engagement.
- **`weekly_likes` (Materialized View)**: Cached table on disk storing weekly like totals for posts and comments.

## Relationships & Foreign Keys
- `likes.post_id -> posts.id` & `likes.comment_id -> comments.id`: Aggregated to produce weekly metrics.

## Design Tradeoff
We chose a **Materialized View** over a standard View for weekly analytics. A standard View recalculated millions of rows on every single visit, making page loads slow. A Materialized View does the heavy math once and serves future reads instantly from disk.

## PostgreSQL Features
- **On-Demand Refresh**: Uses `REFRESH MATERIALIZED VIEW` to update the cached numbers whenever needed.

## Datasets
- `likes_social.csv`, `posts_social.csv`, `comments_social.csv`: Source data for weekly rollups.
