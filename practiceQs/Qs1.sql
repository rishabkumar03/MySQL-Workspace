/*

Create a database for your company named XYZ.

Step 1: Create a table inside this DB to store employee info (id, name and salary).

Step 2: Add following information in the DB :
    1, "adam", 25000
    2, "bob", 30000
    3, "casey", 40000

Step 3: Select & view all your table data.

*/

CREATE DATABASE xyz_company;

USE DATABASE xyz_company;

CREATE TABLE storeInfo (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    salary INT NOT NULL
);

INSERT INTO storeInfo VALUES(1, "adam", 25000);
INSERT INTO storeInfo VALUES(2, "bob", 30000);
INSERT INTO storeInfo VALUES(3, "casey", 40000);

SELECT * FROM storeInfo;

