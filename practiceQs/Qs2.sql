-- WRITE THE QUERY TO FIND AVG DURATION IN EACH GRADE IN ASCENDING ORDER

CREATE DATABASE i_luv_hate_stories;

USE i_luv_hate_stories;

CREATE TABLE hindi_mood (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    duration FLOAT NOT NULL,
    grade VARCHAR(1),
    artist VARCHAR (30)
);

INSERT INTO hindi_mood
(id, name, duration, grade, artist)
VALUES
(1, "Thenkizhakku", 4.23, "A", "Santosh Narayanan"),
(2, "Kabira", 3.43, "O", "Pritam"),
(3, "Banjaara", 5.37, "A", "Mohammad Irfan"),
(4, "Kya Mujhe Pyaar Hai", 4.26, "A", "Pritam"),
(5, "Tere Liye", 4.40, "O", "Atif Aslam"),
(6, "O Sathi", 4.12, "B", "Atif Aslam");

SELECT grade, AVG(duration)
FROM hindi_mood
GROUP BY grade
ORDER BY AVG(duration) ASC;