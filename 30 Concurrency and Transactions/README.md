# Section 30: Concurrency and Transactions

## Overview
This section demonstrates database transactions and ACID safety. Using a bank account transfer example, it shows how `BEGIN`, `COMMIT`, and `ROLLBACK` prevent money from disappearing if something goes wrong.

## Tables
- **`accounts`**: Stores account balances (`name`, `balance`). Kept as its own ledger table to isolate balances from user profile info.

## Design Tradeoff
We wrap money transfers inside an explicit transaction block (`BEGIN ... COMMIT`). The rejected alternative was running two separate update statements. If the server crashed after deducting from user A but before crediting user B, money would be lost forever; transactions guarantee that either both updates happen or neither happens.

## PostgreSQL Features
- **Rollback Safety**: If any error happens during a transaction, `ROLLBACK` cancels all changes and leaves the balances untouched.

## Datasets
- `accounts.csv`: Bank account balance data.
