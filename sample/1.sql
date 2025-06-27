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

SELECT artist
FROM retro_songs
WHERE grade = "A"
GROUP BY artist;

SELECT artist
FROM retro_songs
WHERE grade = "A"
GROUP BY artist
HAVING MAX(duration) > 4.30;

SELECT artist
FROM retro_songs
WHERE grade = "A"
GROUP BY artist
HAVING MAX(duration) > 4.30
ORDER BY artist ASC;

SELECT artist
FROM retro_songs
WHERE grade = "A"
GROUP BY artist
HAVING MAX(duration) > 4.30
ORDER BY artist DESC;

SET SQL_SAFE_UPDATES = 0;

UPDATE retro_songs
SET grade = "c"
WHERE grade = "B";

UPDATE retro_songs
SET grade = "A"
WHERE duration BETWEEN 3 AND 4;

DELETE FROM retro_songs
WHERE grade = "C";

SELECT * FROM retro_songs; 

CREATE TABLE my_playlist (
    id INT PRIMARY KEY,
    name VARCHAR(30)
);

INSERT INTO my_playlist
VALUES
(101, "angrezzi"),
(102, "gold_love"),
(103, "mid_weed");

SELECT * FROM my_playlist;

UPDATE my_playlist
SET id = 104
WHERE id = 102;

UPDATE my_playlist
SET id = 111
WHERE id = 101;

CREATE TABLE album (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    my_playlist_id INT,
    FOREIGN KEY (my_playlist_id) REFERENCES my_playlist(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

DROP TABLE album;

INSERT INTO album
VALUES
(101, "Stop The World I Wanna Get Off With You", 101),
(102, "Tere Chehre Se Nazar Nahi", 102);

SELECT * FROM album; 

ALTER TABLE retro_songs
ADD COLUMN release_year INT;

ALTER TABLE retro_songs
DROP COLUMN release_year;

ALTER TABLE retro_songs
ADD COLUMN lyrics_avail INT NOT NULL DEFAULT 1;

ALTER TABLE retro_songs
MODIFY COLUMN lyrics_avail VARCHAR(3);

INSERT INTO retro_songs
(id, name, duration, lyrics_avail)
VALUES
(7, "Yeh Shaam Mastani", 4.36, "YES");

ALTER TABLE retro_songs
CHANGE lyrics_avail lyrics VARCHAR(4); 

ALTER TABLE retro_songs
DROP COLUMN lyrics;

ALTER TABLE retro_songs
RENAME to reso;

ALTER TABLE reso
RENAME TO retro_songs;

TRUNCATE TABLE retro_songs;