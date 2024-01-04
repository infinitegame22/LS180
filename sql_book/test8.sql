sql_book=# ALTER TABLE users ADD PRIMARY KEY (id);
ALTER TABLE

sql_book=# INSERT INTO addresses (user_id, street, city, state)
   sql_book-# VALUES (1, '2 Park Road', 'San Fran', 'CA');
ERROR:  duplicate key value violates unique constraint "addresses_pkey"
DETAIL:  Key (user_id)=(1) already exists.

sql_book=# INSERT INTO addresses (user_id, street, city, state)
sql_book-# VALUES (7, '11 Station Road', 'Portland', 'OR');
ERROR:  insert or update on table "addresses" violates foreign key constraint "addresses_user_id_fkey"
DETAIL:  Key (user_id)=(7) is not present in table "users".

    encyclopedia=# ALTER TABLE countries
ADD COLUMN continent_id int;
ALTER TABLE
    encyclopedia=# SELECT * FROM countries;
id | name | capital | population | continent_id
----+------+---------+------------+--------------
(0 rows)

-- Create the singers table
CREATE TABLE singers (
                         id SERIAL PRIMARY KEY,
                         name VARCHAR(100) UNIQUE NOT NULL
);

-- Create the albums table with a foreign key reference to singers
CREATE TABLE albums (
                        id SERIAL PRIMARY KEY,
                        album_name VARCHAR(100) NOT NULL,
                        released DATE NOT NULL,
                        genre VARCHAR(100) NOT NULL,
                        label VARCHAR(100) NOT NULL,
                        singer_id INTEGER REFERENCES singers(id)
);

-- Insert data into the singers table
INSERT INTO singers (name) VALUES
                               ('Bruce Springsteen'),
                               ('Prince'),
                               ('Madonna'),
                               ('Elvis Presley');

-- Insert data into the albums table with foreign key references
INSERT INTO albums (album_name, released, genre, label, singer_id) VALUES
                                                                       ('Born to Run', '1975-08-25', 'Rock and roll', 'Columbia', 1),
                                                                       ('Purple Rain', '1984-06-25', 'Pop, R&B, Rock', 'Warner Bros', 2),
                                                                       ('Born in the USA', '1984-06-04', 'Rock and roll, pop', 'Columbia', 1),
                                                                       ('Madonna', '1983-07-27', 'Dance-pop, post-disco', 'Warner Bros', 3),
                                                                       ('True Blue', '1986-06-30', 'Dance-pop, Pop', 'Warner Bros', 3),
                                                                       ('Elvis', '1956-10-19', 'Rock and roll, Rhythm and Blues', 'RCA Victor', 4),
                                                                       ('Sign o'' the Times', '1987-03-30', 'Pop, R&B, Rock, Funk', 'Paisley Park, Warner Bros', 2),
                                                                       ('G.I. Blues', '1960-10-01', 'Rock and roll, Pop', 'RCA Victor', 4);
