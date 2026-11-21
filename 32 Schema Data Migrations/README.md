# Section 32: Schema vs Data Migrations

## Overview
This section demonstrates the difference between changing table structure (schema migration) and updating existing rows (data migration). It refactors separate `lat` and `lng` coordinates into a single geometric `POINT`.

## Tables
- **`posts`**: Starts with separate `lat` and `lng` columns and transitions to a unified `loc POINT` column.

## Design Tradeoff
We refactor the coordinates in three safe steps: 1) add the new `loc` column, 2) copy data over using `UPDATE posts SET loc = POINT(lng, lat)`, 3) drop the old columns. The alternative—dropping and recreating the table—was rejected because it deletes existing production data; phased migrations preserve all rows.

## PostgreSQL Features
- **Geometric Types**: Uses PostgreSQL's native `POINT` type, which is optimized for distance math and spatial map queries.

## Datasets
- *Self-contained*: Inserts sample coordinates and transforms them inside the SQL script.
