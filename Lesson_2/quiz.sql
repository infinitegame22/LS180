CREATE TABLE names(
    id serial,
    name text
 );

INSERT INTO names (id, name)
VALUES (1, 'Abedi'),
       (2, 'Allyssa'),
       (3, 'amy'),
       (4, 'ben'),
       (5, 'Becky'),
       (6, 'Christophe'),
       (7, 'Camilla'),
       (8, 'david'),
       (9, 'Elsa'),
       (10, 'frank'),
       (11, 'Felipe');

SELECT upper(left(title, 1)), count(id)
FROM films GROUP BY upper(left(title, 1))
ORDER BY upper(left(title, 1));

SELECT left(upper(title), 1) AS first_letter, count(title)
    FROM films GROUP BY first_letter
    ORDER BY first_letter;

SELECT upper(substring(title from 1 for 1)) AS first_letter, count(id)
    FROM films GROUP BY first_letter
    ORDER BY first_letter;