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