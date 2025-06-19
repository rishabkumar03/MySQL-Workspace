CREATE DATABASE one;
CREATE DATABASE two;
CREATE DATABASE bleachWorld;
CREATE DATABASE huecoMundo;
CREATE DATABASE IF NOT EXISTS bleachWorld;

DROP DATABASE one;
DROP DATABASE two;
DROP DATABASE soulSociety;
DROP DATABASE IF EXISTS karakuraTown;

SHOW DATABASES;
SHOW TABLES;

CREATE TABLE warrior(
	id INT PRIMARY KEY,
    name VARCHAR(30),
    age INT NOT NULL
);

INSERT INTO warrior VALUES(1, "ICHIGO", 20);
INSERT INTO warrior VALUES(2, "RUKIA", 300);

DROP TABLE warrior;

USE huecoMundo;

CREATE TABLE hollow(
    rollno INT PRIMARY KEY,
    name VARCHAR(50)
);

SELECT * FROM hollow;

INSERT INTO hollow
(rollno, name)
VALUES
("05", "Nnoitra Gilga"),
("06", "Grimmjow Jaegerjaquez"),
("08", "Szayelaporro Granz");

INSERT INTO hollow VALUES ("09", "Aaroniero Arruruerie");