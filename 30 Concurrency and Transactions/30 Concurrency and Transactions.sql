-- Dataset: accounts.csv
-- Database: bank_demo

-- SECTION 30: Handling Concurrency and Transactions

-- Create accounts table for banking balance demonstrations
CREATE TABLE accounts (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(20) NOT NULL,
    balance INTEGER NOT NULL
);

-- Insert starting accounts
INSERT INTO accounts (name, balance)
VALUES ('Gia', 100),
       ('Aly', 100);

-- Open transaction and transfer funds safely
BEGIN;

UPDATE accounts
SET balance = balance - 50
WHERE name = 'Aly';

UPDATE accounts
SET balance = balance + 50
WHERE name = 'Gia';

-- Commit changes permanently
COMMIT;

-- Verify balances after successful commit
SELECT * FROM accounts;

-- Transaction aborted and rolled back due to error or cancellation
BEGIN;

UPDATE accounts
SET balance = balance - 1000
WHERE name = 'Aly';

-- Rollback cancels all modifications made since BEGIN
ROLLBACK;

-- Verify balance remains unchanged after rollback
SELECT * FROM accounts;
