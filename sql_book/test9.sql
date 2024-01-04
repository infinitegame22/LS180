/*
one-to-one: User has one address
*/

CREATE TABLE addresses (
                           user_id int, -- Both a primary and foreign key
                           street varchar(30) NOT NULL,
                           city varchar(30) NOT NULL,
                           state varchar(30) NOT NULL,
                           PRIMARY KEY (user_id),
                           FOREIGN KEY (user_id)
                               REFERENCES users (id)
                               ON DELETE CASCADE
);

INSERT INTO users
(id, username, enabled)
VALUES  (1, 'John Smith', FALSE),
        (2, 'Alice Walker', TRUE),
        (3, 'Harry Potter', TRUE),
        (4, 'Jane Smith', TRUE);



INSERT INTO addresses
(user_id, street, city, state)
VALUES (1, '1 Market Street', 'San Francisco', 'CA'),
       (2, '2 Elm Street', 'San Francisco', 'CA'),
       (3, '3 Main Street', 'Boston', 'MA');

CREATE TABLE books (
                       id serial,
                       title varchar(100) NOT NULL,
                       author varchar(100) NOT NULL,
                       published_date timestamp NOT NULL,
                       isbn char(12),
                       PRIMARY KEY (id),
                       UNIQUE (isbn)
);

/*
 one-to-many: Book has many reviews
*/

CREATE TABLE reviews (
                         id serial,
                         book_id integer NOT NULL,
                         reviewer_name varchar(255),
                         content varchar(255),
                         rating integer,
                         published_date timestamp DEFAULT CURRENT_TIMESTAMP,
                         PRIMARY KEY (id),
                         FOREIGN KEY (book_id)
                             REFERENCES books(id)
                             ON DELETE CASCADE
);

INSERT INTO books
(id, title, author, published_date, isbn)
VALUES
    (1, 'My First SQL Book', 'Mary Parker',
     '2012-02-22 12:08:17.320053-03',
     '981483029127'),
    (2, 'My Second SQL Book', 'John Mayer',
     '1972-07-03 09:22:45.050088-07',
     '857300923713'),
    (3, 'My First SQL Book', 'Cary Flint',
     '2015-10-18 14:05:44.547516-07',
     '523120967812');


INSERT INTO reviews
(id, book_id, reviewer_name, content, rating,
 published_date)
VALUES
    (1, 1, 'John Smith', 'My first review', 4,
     '2017-12-10 05:50:11.127281-02'),
    (2, 2, 'John Smith', 'My second review', 5,
     '2017-10-13 15:05:12.673382-05'),
    (3, 2, 'Alice Walker', 'Another review', 1,
     '2017-10-22 23:47:10.407569-07');

CREATE TABLE checkouts (
                           id serial,
                           user_id int NOT NULL,
                           book_id int NOT NULL,
                           checkout_date timestamp,
                           return_date timestamp,
                           PRIMARY KEY (id),
                           FOREIGN KEY (user_id) REFERENCES users(id)
                               ON DELETE CASCADE,
                           FOREIGN KEY (book_id) REFERENCES books(id)
                               ON DELETE CASCADE
);

INSERT INTO checkouts
(id, user_id, book_id, checkout_date, return_date)
VALUES
    (1, 1, 1, '2017-10-15 14:43:18.095143-07',
     NULL),
    (2, 1, 2, '2017-10-05 16:22:44.593188-07',
     '2017-10-13 13:0:12.673382-05'),
    (3, 2, 2, '2017-10-15 11:11:24.994973-07',
     '2017-10-22 17:47:10.407569-07'),
    (4, 4, 3, '2017-10-15 09:27:07.215217-07',
     NULL);

ALTER TABLE colors
    ADD CONSTRAINT unique_id_constraint UNIQUE (id);

INSERT INTO colors
VALUES (1, 'Red'),
       (2, 'Blue'),
       (3, 'Orange'),
       (4, 'Green');

CREATE TABLE shapes
(
    id       serial UNIQUE PRIMARY KEY,
    color_id int,
    shape    varchar(20),
        FOREIGN KEY (color_id)
        REFERENCES colors (id)
        ON DELETE CASCADE
);

SELECT colors.color, shapes.shape
FROM colors
         JOIN shapes
              ON colors.id = shapes.color_id;

INSERT INTO shapes
VALUES (1, 1, 'Square'),
       (2, 1, 'Star'),
       (3, 2, 'Triangle'),
       (4, 4, 'Circle');

SELECT users.*, addresses.*
FROM users
INNER JOIN addresses
ON users.id = addresses.user_id;

SELECT users.*, addresses.*
FROM users
LEFT JOIN addresses
ON users.id = addresses.user_id;

SELECT countries.name, continents.continent_name
FROM countries JOIN continents
ON countries.continent_id = continents.id;

--outputs

name   | continent_name
---------+----------------
 Brazil  | South America
 Egypt   | Africa
 France  | Europe
 Germany | Europe
 Japan   | Asia
 USA     | North America
(6 rows)



SELECT reviews.book_id, reviews.content,
       reviews.rating, reviews.published_date,
       books.id, books.title, books.author
    FROM reviews
    RIGHT JOIN books ON reviews.book_id = books.id;

SELECT * FROM users CROSS JOIN addresses;

SELECT users.full_name, books.title,
       checkouts.checkout_date
    FROM users
    INNER JOIN checkouts ON users.id = checkouts.user_id
    INNER JOIN books ON books.id = checkouts.book_id;

-- returns

full_name   |       title        |       checkout_date
--------------+--------------------+----------------------------
 John Smith   | My First SQL Book  | 2017-10-15 14:43:18.095143
 John Smith   | My Second SQL Book | 2017-10-05 16:22:44.593188
 Alice Walker | My Second SQL Book | 2017-10-15 11:11:24.994973
 Jane Smith   | My First SQL Book  | 2017-10-15 09:27:07.215217

SELECT u.full_name, b.title, c.checkout_date
FROM users AS u
INNER JOIN checkouts AS c ON u.id = c.user_id
INNER JOIN books AS b ON b.id = c.book_id;

SELECT count(id) AS "Number of Books Check Out"
FROM checkouts;

SELECT u.full_name FROM users u
WHERE u.id NOT IN (
    SELECT c.user_id FROM checkouts c
    );

SELECT u.full_name
FROM users u
LEFT JOIN checkouts c ON u.id = c.user_id
WHERE c.user_id IS NULL;

SELECT countries.name, continents.continent_name
FROM countries CROSS JOIN continents
                    ON countries.continent_id = continents.id;

SELECT countries.*, continents.*
    encyclopedia-# FROM countries
                            encyclopedia-# INNER JOIN continents ON countries.continent_id = continents.id;
id |  name   |     capital     | population | continent_id | id | continent_name
----+---------+-----------------+------------+--------------+----+----------------
  1 | Brazil  | Brasilia        |  208385000 |            5 |  5 | South America
  5 | Egypt   | Cairo           |   96308900 |            1 |  1 | Africa
  6 | France  | Paris           |   67158000 |            3 |  3 | Europe
  7 | Germany | Berlin          |   82349400 |            3 |  3 | Europe
  8 | Japan   | Tokyo           |  126672000 |            2 |  2 | Asia
  9 | USA     | Washington D.C. |  325365189 |            4 |  4 | North America
