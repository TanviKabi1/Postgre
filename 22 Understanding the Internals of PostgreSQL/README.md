# Section 22: Understanding the Internals of PostgreSQL

## Overview
This section looks under the hood of PostgreSQL. It shows where database files are stored on disk and queries internal system catalogs (`pg_database`, `pg_class`) to inspect table file nodes and page counts.

## Tables
- **`pg_database`**: PostgreSQL system table listing all databases in the server cluster.
- **`pg_class`**: System table listing all tables and indexes, along with how many 8KB disk pages (`relpages`) and estimated rows (`reltuples`) they take up.

## Design Tradeoff
PostgreSQL stores table data in fixed 8KB disk pages rather than arbitrary variable-length files. Fixed pages were chosen by PostgreSQL designers because they match operating system page sizes, allow efficient memory caching in the buffer pool, and make crash recovery via WAL logs reliable.

## PostgreSQL Features
- **System Catalogs**: Demonstrates inspecting internal tables directly using ordinary `SELECT` statements.

## Datasets
- *Self-contained*: Queries native PostgreSQL internal catalog tables directly.
