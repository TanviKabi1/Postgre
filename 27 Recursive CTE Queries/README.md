# Section 27: Recursive CTE Queries

## Overview
This section covers recursive queries using `WITH RECURSIVE`. It demonstrates number countdowns and walks through a social network graph to find friend-of-friend recommendations.

## Tables
- **`users`**: Social network accounts.
- **`followers`**: Graph edges connecting who follows whom (`leader_id`, `follower_id`).

## Relationships & Foreign Keys
- `followers.leader_id -> users.id` & `followers.follower_id -> users.id`: Self-referencing keys that form the social follower network.

## Design Tradeoff
We use a recursive CTE in PostgreSQL to find friend suggestions up to 2 steps away. The alternative was running multiple round-trip queries from our backend code. Doing it inside the database is much faster because it avoids network latency between steps.

## PostgreSQL Features
- **Recursion**: An anchor query starts the process, and a recursive step repeats until no new rows are found or a depth limit is reached.

## Datasets
- `users_social.csv`: User records.
- `followers.csv`: Follower relationship data.
