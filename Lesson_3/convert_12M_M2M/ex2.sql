-- Write the SQL statement needed to create a join table that will allow a film to have multiple directors,
-- and directors to have multiple films. 
--Include an id column in this table, and add foreign key constraints to the other columns.

CREATE TABLE films_directors (
  id serial PRIMARY KEY,
  film_id integer REFERENCES films (id) ON DELETE CASCADE,
  director_id integer REFERENCES directors (id) ON DELETE CASCADE,
  UNIQUE(director_id, film_id)
);