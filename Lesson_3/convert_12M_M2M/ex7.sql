Write a SQL statement that determines how many films each director in the database has directed. 
Sort the results by number of films (greatest first) and then name (in alphabetical order).

SELECT films.name, directors.name
FROM films
JOIN films_directors ON films.id = films_directors.film_id
JOIN directors ON directors.id = films_directors.director_id