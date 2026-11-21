# Section 35: Security Around PostgreSQL

## Overview
This section focuses on preventing SQL Injection attacks. It shows how direct string concatenation is dangerous and demonstrates how to protect queries using Prepared Statements (`PREPARE`, `EXECUTE`, `DEALLOCATE`).

## Tables
- **`users`**: Target user table protected against malicious injection inputs like `'1; DROP TABLE users;'`.

## Design Tradeoff
We use **Prepared Statements with placeholders** (`$1`, `$2`) instead of string concatenation. Concatenating strings was rejected because an attacker can inject malicious SQL commands into input fields, while prepared statements treat user input strictly as data, making SQL injection impossible.

## PostgreSQL Features
- **Prepared Statements**: PostgreSQL parses and plans the query structure first, then safely inserts the parameters later during execution.

## Datasets
- `users_social.csv`: User data used for security testing.
