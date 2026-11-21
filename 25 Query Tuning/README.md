# Section 25: Query Tuning

## Overview
This section explores advanced query tuning. It examines the planner's cost settings (`seq_page_cost`, `random_page_cost`), analyzes how costs add up across multi-table joins, and tests turning off sequential scans.

## Tables
- **`users`** & **`likes`**: Joined to observe cost calculations across join nodes.

## Relationships & Foreign Keys
- `likes.user_id -> users.id`: Traversed during query plan evaluation.

## Design Tradeoff
We look at reducing `random_page_cost` on SSD-based servers. The old default of `4.0` assumed slow spinning hard drives, while on modern SSDs, random seeks are nearly as fast as sequential reads (`1.0`); setting it lower encourages PostgreSQL to use indexes more often.

## PostgreSQL Features
- **Planner Knobs**: Uses session settings like `SET enable_seqscan = off` to test how PostgreSQL handles alternative query plans.

## Datasets
- `users_social.csv`, `likes_social.csv`: Datasets used for join cost benchmarks.
