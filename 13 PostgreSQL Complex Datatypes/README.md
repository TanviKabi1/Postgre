# Section 13: PostgreSQL Complex Datatypes

## Overview
This section tests PostgreSQL's built-in data types, including exact numbers (`NUMERIC`), floating points (`REAL`), character types (`VARCHAR`, `TEXT`), booleans, and timestamps with time zones.

## Tables
- **`items`**: Tests different number types and shows precision differences.
- **`characters_demo`**: Tests fixed vs unlimited text fields.
- **`booleans_demo`**: Tests boolean inputs (`true`, `'yes'`, `'1'`, `false`).
- **`dates_demo`**: Tests dates, times, and timezone-aware timestamps.

## Design Tradeoff
We choose `NUMERIC(10, 2)` for currency and monetary values instead of `FLOAT` or `REAL`. Floats were rejected because binary floating-point numbers cause rounding errors (like `0.1 + 0.2 != 0.3`), while `NUMERIC` stores exact decimal values.

## PostgreSQL Features
- **Timezone Awareness**: `TIMESTAMPTZ` converts all incoming dates to UTC on disk and displays them in the user's local timezone automatically.
- **Interval Math**: Allows direct date calculations like `CURRENT_DATE + INTERVAL '3 weeks'`.

## Datasets
- *Self-contained*: All data is created and tested directly inside the SQL script.
