DROP TABLE IF EXISTS public.films;
CREATE TABLE films (title varchar(255), "year" integer, genre varchar(100));

INSERT INTO films(title, "year", genre) VALUES ('Die Hard', 1988, 'action');  
INSERT INTO films(title, "year", genre) VALUES ('Casablanca', 1942, 'drama');  
INSERT INTO films(title, "year", genre) VALUES ('The Conversation', 1974, 'thriller');  

SELECT * FROM films;

SELECT title FROM films
WHERE length(title) < 12;

ALTER TABLE films ADD COLUMN 
director varchar(255);
ALTER TABLE films ADD COLUMN
duration int;

INSERT INTO films (title, "year", genre, director, duration)
VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90),
       ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127),
       ('The Birdcage', 1996, 'comedy', 'Mike Nicols', 118);

SELECT DATE_PART('YEAR', AGE(CURRENT_DATE, '1996-01-11'));

SELECT title, 
extract("year" from current_date) - "year" AS age
FROM films
ORDER BY age ASC;

SELECT title, duration
FROM films
WHERE duration > 120
ORDER BY duration DESC;

SELECT title FROM films
ORDER BY duration DESC LIMIT 1;