-- In the retro_songs table :
    -- Change the name of column "name" to "full_name".
    -- Delete all the songs which have duration greater than 4.30
    -- Delete the column for grades

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

ALTER TABLE retro_songs
CHANGE name full_name VARCHAR(30);

ALTER TABLE retro_songs
DROP COLUMN grade;

DELETE FROM retro_songs
WHERE duration > 4.30;
-- WE HAVE TO DISABLE SAFE UPDATE MODE IN MYSQL FOR PERFORMING DELETE ACTION.
    -- SET SQL_SAFE_UPDATES = 0; (FOR DISABLING)
    -- SET SQL_SAFE_UPDATES = 1; (FOR ENABLING, IT IS DEFAULT ENABLED)