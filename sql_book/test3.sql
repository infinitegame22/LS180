sql_book=# CREATE TABLE users (
                                  sql_book(# id serial UNIQUE NOT NULL,
                                  sql_book(# enabled boolean DEFAULT true,
                                  sql_book(# last_login timestamp without time zone DEFAULT now()
                                      sql_book(# );
CREATE TABLE
    sql_book=# \d users
Table "public.users"
Column   |            Type             | Collation | Nullable |              Default
------------+-----------------------------+-----------+----------+-----------------------------------
 id         | integer                     |           | not null | nextval('users_id_seq'::regclass)
 enabled    | boolean                     |           |          | true
 last_login | timestamp without time zone |           |          | now()
Indexes:
    "users_id_key" UNIQUE CONSTRAINT, btree (id)

sql_book=# SELECT * FROM users;
id | enabled | last_login
----+---------+------------
(0 rows)

sql_book=# ALTER TABLE users
    sql_book-# ADD COLUMN full_nam character varying(25) NOT NULL,
    sql_book-# enabled boolean DEFAULT true,
    sql_book-# ;
ERROR:  syntax error at or near "enabled"
LINE 3: enabled boolean DEFAULT true,
        ^
sql_book=# ALTER TABLE users
    sql_book-# ;
ERROR:  syntax error at or near ";"
LINE 2: ;
^
sql_book=# \d users
Table "public.users"
Column   |            Type             | Collation | Nullable |              Default
------------+-----------------------------+-----------+----------+-----------------------------------
 id         | integer                     |           | not null | nextval('users_id_seq'::regclass)
 enabled    | boolean                     |           |          | true
 last_login | timestamp without time zone |           |          | now()
Indexes:
    "users_id_key" UNIQUE CONSTRAINT, btree (id)

sql_book=# ALTER TABLE users
    sql_book-# ADD COLUMN full_name character varying(25) NOT NULL<
    sql_book-# ,'
sql_book'# ;
sql_book'# ;
sql_book'# ^C
sql_book=# ALTER TABLE users
    sql_book-# ADD COLUMN full_name character varying(25) NOT NULL;
ALTER TABLE
    sql_book=# \d users
Table "public.users"
Column   |            Type             | Collation | Nullable |              Default
------------+-----------------------------+-----------+----------+-----------------------------------
 id         | integer                     |           | not null | nextval('users_id_seq'::regclass)
 enabled    | boolean                     |           |          | true
 last_login | timestamp without time zone |           |          | now()
 full_name  | character varying(25)       |           | not null |
Indexes:
    "users_id_key" UNIQUE CONSTRAINT, btree (id)

sql_book=# INSERT INTO users VALUES ('John Smith', false);
ERROR:  invalid input syntax for type integer: "John Smith"
LINE 1: INSERT INTO users VALUES ('John Smith', false);

sql_book=# INSERT INTO users (full_name, enabled)
               sql_book-# VALUES ('John Smith', false);
INSERT 0 1

    sql_book=# SELECT * FROM users;
id | enabled |         last_login         |  full_name
----+---------+----------------------------+--------------
  1 | f       | 2023-11-14 14:24:32.24714  | John Smith
  2 | t       | 2023-11-14 14:26:09.505371 | Jane Smith
  3 | t       | 2023-11-14 14:26:09.505371 | Harry Potter

sql_book=# INSERT INTO users (id, enabled)
               sql_book-# VALUES (1, false)
                              sql_book-# ;
ERROR:  null value in column "full_name" of relation "users" violates not-null constraint
DETAIL:  Failing row contains (1, f, 2023-11-14 14:31:10.730219, null).
sql_book=#

sql_book=# INSERT INTO users (id, enabled)
               sql_book-# VALUES (1, false)
                              sql_book-# ;
ERROR:  null value in column "full_name" of relation "users" violates not-null constraint
DETAIL:  Failing row contains (1, f, 2023-11-14 14:31:10.730219, null).
sql_book=# INSERT INTO (id, full_name, enabled)
               sql_book-# VALUES(1, 'Alissa Jackson', true);
ERROR:  syntax error at or near "("
LINE 1: INSERT INTO (id, full_name, enabled)
            ^
sql_book=# SELECT * FROM users;
id | enabled |         last_login         |  full_name
----+---------+----------------------------+--------------
  1 | f       | 2023-11-14 14:24:32.24714  | John Smith
  2 | t       | 2023-11-14 14:26:09.505371 | Jane Smith
  3 | t       | 2023-11-14 14:26:09.505371 | Harry Potter
(3 rows)

sql_book=# ALTER TABLE users ADD CHECK (full_name <> '');
ALTER TABLE
    sql_book=# INSERT INTO users (id, full_name) VALUES (4, '');
ERROR:  new row for relation "users" violates check constraint "users_full_name_check"
DETAIL:  Failing row contains (4, t, 2023-11-14 14:37:14.816231, ).

Certainly! To add the provided data to the countries table, you can use the SQL INSERT INTO statement. Here's an example:

sql
Copy code
INSERT INTO countries (name, capital, population)
VALUES
  ('USA', 'Washington D.C.', 325365189),
  ('Germany', 'Berlin', 82349400),
  ('Japan', 'Tokyo', 126672000);
This SQL statement inserts the specified data into the countries table, assuming that the columns in the VALUES clause are in the same order as the columns in your table (name, capital, population). The population values are assumed to be integers. Adjust the data types if necessary based on your table schema.

                                                          encyclopedia=# INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
VALUES ('Bruce', 'Springsteen', 'singer/songwriter', '1949-09-23', false);
INSERT 0 1

                                                      encyclopedia=# INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth)
encyclopedia-# VALUES ('Scarlett', 'Johansson', 'actor', '1984-11-22');
INSERT 0 1
encyclopedia=# SELECT * FROM celebrities;
 id | first_name |    occupation     | date_of_birth | deceased |  last_name
----+------------+-------------------+---------------+----------+-------------
  1 | Bruce      | singer/songwriter | 1949-09-23    | f        | Springsteen
  2 | Scarlett   | actor             | 1984-11-22    | f        | Johansson

                                                          encyclopedia=# INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
encyclopedia-# VALUES
encyclopedia-# ("Frank", "Sinatra", "Singer, Actor", '1915-12-12', true),
encyclopedia-# ("Tom", "Cruise", "Actor", '1962-7-3', DEFAULT);
ERROR:  column "Frank" does not exist
LINE 3: ("Frank", "Sinatra", "Singer, Actor", '1915-12-12', true),

  encyclopedia=# INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
encyclopedia-# VALUES
encyclopedia-# ('Frank', 'Sinatra', 'Singer, Actor', '1915-12-12', true),
encyclopedia-# ('Tom', 'Cruise', 'Actor', '1962-07-03', DEFAULT);

                                                   encyclopedia=# SELECT * FROM celebrities;
 id | first_name |    occupation     | date_of_birth | deceased |  last_name
----+------------+-------------------+---------------+----------+-------------
  1 | Bruce      | singer/songwriter | 1949-09-23    | f        | Springsteen
  2 | Scarlett   | actor             | 1984-11-22    | f        | Johansson
  3 | Frank      | Singer, Actor     | 1915-12-12    | t        | Sinatra
  4 | Tom        | Actor             | 1962-07-03    | f        | Cruise


                                           encyclopedia=# ALTER TABLE animals
encyclopedia-# DROP CONSTRAINT unique_binomial_name;
ALTER TABLE
encyclopedia=# INSERT INTO animals
VALUES
('Dove', 'Columbidae Columbiformes', 2, 15, 'LC'),
('Golden Eagle', 'Aquila Chrysaetos', 6.35, 24, 'LC'),
('Peregrine Falcon', 'Falco Peregrinus', 1.5, 15, 'LC'),
('Pigeon', 'Columbidae Columbiformes', 2, 15, 'LC'),
('Kakapo', 'Strigops habroptila', 4, 60, 'CR');
INSERT 0 5

                                                     In the customer_name column, for the rows with Natasha O'Shea we need to escape the single quote mark after the O by using a second single quote mark.

Where an order doesn't include a particular item (burger, side, or drink) we have to specify a NULL value for the appropriate column. For the equivalent cost column, we could either explicitly use the DEFAULT or specify a value of 0.00 or 0.

Copy Code
INSERT INTO orders (customer_name, customer_email, customer_loyalty_points, burger, side, drink, burger_cost, side_cost, drink_cost)
            VALUES ('James Bergman', 'james1998@email.com', 28, 'LS Chicken Burger', 'Fries', 'Cola', 4.50, 0.99, 1.50),
                   ('Natasha O''Shea', 'natasha@osheafamily.com', 18, 'LS Cheeseburger', 'Fries', NULL, 3.50, 0.99, DEFAULT),
                   ('Natasha O''Shea', 'natasha@osheafamily.com', 42, 'LS Double Deluxe Burger', 'Onion Rings', 'Chocolate Shake', 6.00, 1.50, 2.00),
                   ('Aaron Muller', NULL, 10, 'LS Burger', NULL, NULL, 3.00, DEFAULT, DEFAULT);