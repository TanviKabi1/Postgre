# Section 33: PostgreSQL API Access

## Overview
This section covers connecting applications to PostgreSQL. It demonstrates health-check queries (`SELECT 1 + 1`) and shows how to inspect active client connections using the system view `pg_stat_activity`.

## Tables
- **`pg_stat_activity`**: Built-in PostgreSQL administrative view that shows current client connections, user names, client IPs, and running queries.

## Design Tradeoff
We use connection pooling (reusing a set of open database connections) rather than opening a brand new TCP connection for every incoming web request. Creating a new connection every time is slow and wastes server RAM, while a pool keeps a few connections warm and ready.

## PostgreSQL Features
- **Activity Monitoring**: Lets administrators check for stuck or slow queries using `SELECT * FROM pg_stat_activity`.

## Datasets
- *Self-contained*: Queries native PostgreSQL internal views directly.
