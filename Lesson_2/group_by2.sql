UPDATE films SET duration = 92 WHERE title = '1984';

UPDATE films SET duration = 92 WHERE title = 'Godzilla';

UPDATE films SET duration = 141 WHERE title = 'Godzilla' AND year = 2014;

CREATE TABLE colors (id serial, name text);

INSERT INTO colors (name) VALUES ('red');
INSERT INTO colors (name) VALUES ('green');
INSERT INTO colors (name) VALUES ('blue');