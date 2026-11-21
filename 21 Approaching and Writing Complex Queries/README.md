# Section 21: Approaching and Writing Complex Queries

## Overview
This section breaks down how to construct multi-table queries step by step. It queries the Instagram schema to find top users, show user post history, and calculate total likes received per creator.

## Tables
- **`users`**, **`posts`**, **`likes`**: Joined together to match users with their content and count the total likes each user has received.

## Relationships & Foreign Keys
- `posts.user_id -> users.id`: Joins posts with their creators.
- `likes.post_id -> posts.id`: Joins likes with the posts they were given to.

## Design Tradeoff
We calculate total likes on demand by joining `users -> posts -> likes` and using `COUNT(*)`. The alternative was keeping a `total_likes` column on the users table. A counter column was rejected because high-volume liking causes lock contention and deadlocks; calculating it via SQL joins guarantees accurate numbers.

## PostgreSQL Features
- **Hash Joins**: PostgreSQL hashes smaller tables in memory to join them with large tables in a single pass.

## Datasets
- `users_social.csv`, `posts_social.csv`, `likes_social.csv`: Used for multi-table engagement queries.
