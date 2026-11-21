# Section 31: Schema Migrations Management

## Overview
This section models database schema migrations. It shows how to write paired "Up" (apply changes) and "Down" (rollback changes) scripts to update table structures safely over time.

## Tables
- **`comments`**: Table updated across versions (created with column `contents`, renamed to `body`, and tested with rollback).

## Design Tradeoff
We use structured Up and Down migration scripts instead of making manual changes directly in the database GUI. Manual changes were rejected because developers and production servers quickly get out of sync, while migration files can be tracked in Git and run consistently everywhere.

## PostgreSQL Features
- **Transactional DDL**: PostgreSQL allows table alteration commands (`ALTER TABLE RENAME COLUMN`) to run inside transactions, so if a migration fails, the schema change rolls back cleanly.

## Datasets
- *Self-contained*: All migration steps are demonstrated directly in SQL.
