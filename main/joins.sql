CREATE DATABASE college;
USE college;

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(30)
);

INSERT INTO student (id, name)
VALUES
(101, "adam"),
(102, "bob"),
(103, "casey");

CREATE TABLE course(
    id INT PRIMARY KEY,
    course_name VARCHAR(30)
);

INSERT INTO course (id, course_name)
VALUES
(102, "english"),
(103, "math"),
(105, "science"),
(107, "computer science");

-- INNER JOIN
SELECT *
FROM student
INNER JOIN course
ON student.id = course.id;

SELECT * 
FROM student as s
INNER JOIN course as c
ON s.id = c.id;

SELECT *
FROM student as a
INNER JOIN course as b
ON a.id = b.id;

-- LEFT JOIN
SELECT *
FROM student as a
LEFT JOIN course as b
ON a.id = b.id;

-- RIGHT JOIN
SELECT *
FROM student as a
RIGHT JOIN course as b
ON a.id = b.id;

-- FULL JOIN
SELECT *
FROM student as a 
LEFT JOIN course as b
ON a.id = b.id
UNION
SELECT *
FROM student as a 
RIGHT JOIN course as b 
ON a.id = b.id;

-- LEFT EXCLUSIVE JOIN
SELECT *
FROM student as a 
LEFT JOIN course as b 
ON a.id = b.id
WHERE b.id IS NULL;

-- RIGHT EXCLUSIVE JOIN
SELECT *
FROM student as a 
RIGHT JOIN course as b 
ON a.id = b.id
WHERE a.id IS NULL;

-- FULL EXCLUSIVE JOIN
SELECT *
FROM student as a 
LEFT JOIN course as b 
ON a.id = b.id
WHERE b.id IS NULL
UNION
SELECT *
FROM student as a 
RIGHT JOIN course as b 
ON a.id = b.id
WHERE a.id IS NULL;  

-- SELF JOIN
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    manager_id INT
);

INSERT INTO employee (id, name, manager_id)
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

SELECT * FROM employee;

SELECT *
FROM employee as a 
JOIN employee as b 
ON a.id = b.manager_id;

SELECT a.name as manager_name, b.name
FROM employee as a 
JOIN employee as b 
ON a.id = b.manager_id;

SELECT name FROM employee
UNION
SELECT name FROM employee;

SELECT name FROM employee
UNION ALL
SELECT name FROM employee;