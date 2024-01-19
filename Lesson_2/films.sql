DROP TABLE IF EXISTS public.films;
CREATE TABLE films (title varchar(255), year integer, genre varchar(100), director varchar(255), duration integer);

INSERT INTO films(title, year, genre, director, duration) VALUES ('Die Hard', 1988, 'action', 'John McTiernan', 132);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('Casablanca', 1942, 'drama', 'Michael Curtiz', 102);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('The Conversation', 1974, 'thriller', 'Francis Ford Coppola', 113);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

ALTER TABLE films ALTER COLUMN title SET NOT NULL;
ALTER TABLE films ALTER COLUMN year SET NOT NULL;
ALTER TABLE films ALTER COLUMN genre SET NOT NULL;
ALTER TABLE films ALTER COLUMN director SET NOT NULL;
ALTER TABLE films ALTER COLUMN duration SET NOT NULL;

ALTER TABLE films
ADD CONSTRAINT unique_title UNIQUE (title);

ALTER TABLE films
DROP CONSTRAINT unique_title;

ALTER TABLE films
ADD CONSTRAINT title CHECK (length(title) > 1);

INSERT INTO films
VALUES ('a', 1932, 'unknown', 'Patty', 20);

ALTER TABLE films DROP CONSTRAINT title;

ALTER TABLE films 
ADD CONSTRAINT date_max_check CHECK (year < 2100);
ALTER TABLE films
ADD CONSTRAINT date_min_check CHECK (year > 1900);

ALTER TABLE films ADD CONSTRAINT director_name
  CHECK (length(director) >= 3 AND position(' ' in director) > 0);

UPDATE films SET director = 'Johnny'
WHERE title = 'Die Hard';

CREATE TABLE test (
  name varchar(10) DEFAULT 'Joe',
  CONSTRAINT name_chk CHECK (name != 'Joe')
)  -- this is broken code

