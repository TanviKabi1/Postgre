-- Dataset: None
-- Database: types_demo

-- SECTION 13: PostgreSQL Complex Datatypes

-- Create table demonstrating various numeric types
CREATE TABLE items (
    id         SERIAL PRIMARY KEY,
    small_num  SMALLINT,
    normal_num INTEGER,
    big_num    BIGINT,
    exact_num  NUMERIC(10, 2),
    approx_num REAL,
    double_num DOUBLE PRECISION
);

-- Insert sample numbers to test numeric behavior
INSERT INTO items (small_num, normal_num, big_num, exact_num, approx_num, double_num)
VALUES (32767, 2147483647, 9223372036854775807, 12345.67, 1.234567, 1.23456789012345);

-- Casting numbers in PostgreSQL using double colon
SELECT 1.2345::INTEGER,
       1.2345::NUMERIC(5, 2),
       '123'::INTEGER;

-- String and character datatypes demo table
CREATE TABLE characters_demo (
    fixed_char VARCHAR(10),
    code_char  CHAR(5),
    unlimited  TEXT
);

INSERT INTO characters_demo (fixed_char, code_char, unlimited)
VALUES ('abcdefghij', 'ABCDE', 'This can be any length of text in PostgreSQL');

-- Boolean datatype demo
CREATE TABLE booleans_demo (
    is_active BOOLEAN
);

-- PostgreSQL accepts TRUE, FALSE, 'yes', 'no', '1', '0', 't', 'f'
INSERT INTO booleans_demo (is_active)
VALUES (true),
       ('yes'),
       ('1'),
       ('t'),
       (false),
       ('no'),
       ('0'),
       ('f');

SELECT * FROM booleans_demo;

-- Dates, times, and timestamps
CREATE TABLE dates_demo (
    entry_date DATE,
    entry_time TIME,
    time_tz    TIME WITH TIME ZONE,
    stamp      TIMESTAMP,
    stamp_tz   TIMESTAMP WITH TIME ZONE
);

INSERT INTO dates_demo (entry_date, entry_time, time_tz, stamp, stamp_tz)
VALUES ('2026-11-18', '18:50:00', '18:50:00-05', '2026-11-18 18:50:00', '2026-11-18 18:50:00-05');

-- Current timestamp and date functions
SELECT CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP;

-- Interval datatype for durations and date arithmetic
SELECT ('2026-11-18 20:00:00'::TIMESTAMP - '2026-11-18 08:00:00'::TIMESTAMP) AS difference;

-- Adding intervals to timestamps
SELECT ('2026-11-18'::DATE + INTERVAL '1 day') AS tomorrow,
       ('2026-11-18'::DATE + INTERVAL '3 weeks') AS future_date,
       ('2026-11-18 10:00:00'::TIMESTAMP + INTERVAL '1 day 2 hours 30 minutes') AS future_time;
