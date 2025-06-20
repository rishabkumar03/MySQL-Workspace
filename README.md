# MySQL Quick Learning Guide

## Installation
```bash
# Windows: Download from mysql.com

```

## Connect to MySQL
```bash
mysql -u root -p
```

## Basic Commands
```sql
SHOW DATABASES;              -- List databases
USE database_name;           -- Select database
SHOW TABLES;                 -- List tables
DESCRIBE table_name;         -- Show table structure
```

## Database Operations
```sql
CREATE DATABASE mydb;        -- Create database
DROP DATABASE mydb;          -- Delete database
```

## Table Operations
```sql
-- Create table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Delete table
DROP TABLE users;
```

## CRUD Operations

### INSERT
```sql
INSERT INTO users (name, email, age) VALUES ('John', 'john@email.com', 25);
```

### SELECT
```sql
SELECT * FROM users;                    -- All records
SELECT name, email FROM users;          -- Specific columns
SELECT * FROM users WHERE age > 18;     -- With condition
SELECT * FROM users ORDER BY name;      -- Sorted
SELECT * FROM users LIMIT 5;            -- First 5 records
```

### UPDATE
```sql
UPDATE users SET age = 26 WHERE id = 1;
```

### DELETE
```sql
DELETE FROM users WHERE id = 1;
```

## Common Data Types
```sql
INT                 -- Numbers
VARCHAR(50)         -- Text (up to 50 chars)
TEXT               -- Large text
DATE               -- Date (YYYY-MM-DD)
TIMESTAMP          -- Date and time
DECIMAL(10,2)      -- Decimal numbers
```

## WHERE Conditions
```sql
WHERE age = 25
WHERE age > 18 AND age < 65
WHERE name LIKE 'J%'           -- Starts with 'J'
WHERE email IS NOT NULL
WHERE age BETWEEN 18 AND 65
WHERE name IN ('John', 'Jane')
```

## Joins
```sql
-- INNER JOIN
SELECT u.name, p.title 
FROM users u 
INNER JOIN posts p ON u.id = p.user_id;

-- LEFT JOIN  
SELECT u.name, p.title 
FROM users u 
LEFT JOIN posts p ON u.id = p.user_id;
```

## Aggregate Functions
```sql
SELECT COUNT(*) FROM users;           -- Count records
SELECT AVG(age) FROM users;           -- Average age
SELECT MAX(age), MIN(age) FROM users; -- Max and min age
SELECT SUM(salary) FROM users;        -- Sum of salaries
```

## GROUP BY
```sql
SELECT age, COUNT(*) 
FROM users 
GROUP BY age 
HAVING COUNT(*) > 1;
```

## Indexes
```sql
CREATE INDEX idx_email ON users(email);  -- Create index
DROP INDEX idx_email ON users;           -- Remove index
```

## Useful Tips
- End statements with `;`
- Use `--` for comments
- Keywords are case-insensitive
- String values use single quotes `'text'`
- Use `EXPLAIN` before SELECT to see query performance

## Quick Reference
```sql
-- Backup database
mysqldump -u root -p database_name > backup.sql

-- Restore database
mysql -u root -p database_name < backup.sql

-- Show current user
SELECT USER();

-- Show current database
SELECT DATABASE();
```
