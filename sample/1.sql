CREATE DATABASE gold_love;

USE gold_love;

CREATE TABLE retro_songs (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    duration FLOAT NOT NULL,
    grade VARCHAR(1),
    artist VARCHAR (30)
);

INSERT INTO retro_songs
(id, name, duration, grade, artist)
VALUES
(1, "Ek Ajnabee Haseena Se", 4.26, "A", "Kishore Kumar"),
(2, "Kabhi Kabhi Mere Dil Mein", 4.45, "A", "Mukesh"),
(3, "In Aankhon Ki Masti", 5.43, "A", "Asha Bhosle"),
(4, "Ham Ne Tum Ko Dekha", 4.25, "B", "Shailendra Singh"),
(5, "Mere Sapnon Ki Rani", 5.00, "B", "Kishore Kumar"),
(6, "Bahon Mein Chale Aao", 4.02, "O", "Lata Mangeshkar");

SELECT * FROM retro_songs;

SELECT name, artist FROM retro_songs;
SELECT grade FROM retro_songs;

SELECT DISTINCT artist FROM retro_songs;

SELECT *
FROM retro_songs
WHERE duration < 4.30;

SELECT *
FROM retro_songs 
WHERE artist = "Kishore Kumar";

SELECT * 
FROM retro_songs
WHERE duration < 4.30 AND artist = "Kishore Kumar";

SELECT *
FROM retro_songs
WHERE duration+1 > 6;

SELECT *
FROM retro_songs
WHERE grade = "O";

SELECT *
FROM retro_songs
WHERE grade = "A" OR artist = "Asha Bhosle";

SELECT *
FROM retro_songs
WHERE duration BETWEEN 4.30 AND 5.30;

SELECT *
FROM retro_songs
WHERE grade IN ("O", "A");

SELECT *
FROM retro_songs
WHERE grade IN ("A+", "B+");

SELECT *
FROM retro_songs
WHERE grade NOT IN ("O", "A+", "A");

SELECT *
FROM retro_songs
LIMIT 3;

SELECT *
FROM retro_songs
WHERE duration > 4.20
LIMIT 3;

SELECT *
FROM retro_songs
WHERE duration > 4.20;

SELECT *
FROM retro_songs
ORDER BY artist ASC;

SELECT *
FROM retro_songs
ORDER BY duration ASC;

SELECT *
FROM retro_songs
ORDER BY duration DESC;

SELECT *
FROM retro_songs
ORDER BY duration ASC
LIMIT 3;

SELECT duration
FROM retro_songs;

SELECT MAX(duration)
FROM retro_songs;

SELECT MIN(duration)
FROM retro_songs;

SELECT AVG(duration)
FROM retro_songs;

SELECT COUNT(duration)
FROM retro_songs;

SELECT grade
FROM retro_songs
GROUP BY grade;

SELECT grade, COUNT(id)
FROM retro_songs
GROUP BY grade;

SELECT grade, artist, COUNT(id)
FROM retro_songs
GROUP BY grade;

SELECT grade, artist, COUNT(id)
FROM retro_songs
GROUP BY grade, artist;

SELECT grade, AVG(duration)
FROM retro_songs
GROUP BY grade;

SELECT artist
FROM retro_songs
GROUP BY artist;

SELECT artist
FROM retro_songs
GROUP BY artist
ORDER BY artist DESC;

SELECT artist, COUNT(id)
FROM retro_songs
GROUP BY artist
ORDER BY artist DESC; 

SELECT artist
FROM retro_songs
GROUP BY artist;

SELECT artist, COUNT(id)
FROM retro_songs
GROUP BY artist;

SELECT artist, COUNT(id)
FROM retro_songs
GROUP BY artist
HAVING MAX(duration) < 4.30;

SELECT artist, COUNT(id)
FROM retro_songs
GROUP BY artist
WHERE MAX(duration) < 4.30;
-- WHERE CLAUSE IS NOT USED WITH GROUP BY CLAUSE