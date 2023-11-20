sql_book=# SELECT * FROM users;
id | enabled |         last_login         |  full_name
----+---------+----------------------------+--------------
  1 | f       | 2023-11-14 14:24:32.24714  | John Smith
  2 | t       | 2023-11-14 14:26:09.505371 | Jane Smith
  3 | t       | 2023-11-14 14:26:09.505371 | Harry Potter
  4 | t       | 2023-11-16 16:50:56.879074 | Harry Potter
  5 | t       | 2023-11-16 16:51:37.159669 | Jane Smith
(5 rows)

sql_book=# UPDATE users SET enabled = false;
UPDATE 5
    sql_book=# SELECT * FROM users;
id | enabled |         last_login         |  full_name
----+---------+----------------------------+--------------
  1 | f       | 2023-11-14 14:24:32.24714  | John Smith
  2 | f       | 2023-11-14 14:26:09.505371 | Jane Smith
  3 | f       | 2023-11-14 14:26:09.505371 | Harry Potter
  4 | f       | 2023-11-16 16:50:56.879074 | Harry Potter
  5 | f       | 2023-11-16 16:51:37.159669 | Jane Smith
(5 rows)

sql_book=# UPDATE users SET full_name='Alice Walker' WHERE id=2;
UPDATE 1
    sql_book=# SELECT * FROM users;
id | enabled |         last_login         |  full_name
----+---------+----------------------------+--------------
  1 | f       | 2023-11-14 14:24:32.24714  | John Smith
  3 | t       | 2023-11-14 14:26:09.505371 | Harry Potter
  4 | t       | 2023-11-16 16:50:56.879074 | Harry Potter
  5 | t       | 2023-11-16 16:51:37.159669 | Jane Smith
  2 | t       | 2023-11-14 14:26:09.505371 | Alice Walker
(5 rows)

sql_book=# \c encyclopedia
You are now connected to database "encyclopedia" as user "amyandjake".
encyclopedia=# ALTER TABLE animals
    encyclopedia-# ADD class varchar(100);
ALTER TABLE
    encyclopedia=# SELECT * FROM animals;
name       |      binomial_name       | max_weight_kg | max_age | conservation_status | class
------------------+--------------------------+---------------+---------+---------------------+-------
 Dove             | Columbidae Columbiformes |        2.0000 |      15 | LC                  |
 Golden Eagle     | Aquila Chrysaetos        |        6.3500 |      24 | LC                  |
 Peregrine Falcon | Falco Peregrinus         |        1.5000 |      15 | LC                  |
 Pigeon           | Columbidae Columbiformes |        2.0000 |      15 | LC                  |
 Kakapo           | Strigops habroptila      |        4.0000 |      60 | CR                  |
(5 rows)

encyclopedia=# UPDATE animals
    encyclopedia-# SET class = 'Aves';
UPDATE 5
    encyclopedia=# SELECT * FROM animals;
name       |      binomial_name       | max_weight_kg | max_age | conservation_status | class
------------------+--------------------------+---------------+---------+---------------------+-------
 Dove             | Columbidae Columbiformes |        2.0000 |      15 | LC                  | Aves
 Golden Eagle     | Aquila Chrysaetos        |        6.3500 |      24 | LC                  | Aves
 Peregrine Falcon | Falco Peregrinus         |        1.5000 |      15 | LC                  | Aves
 Pigeon           | Columbidae Columbiformes |        2.0000 |      15 | LC                  | Aves
 Kakapo           | Strigops habroptila      |        4.0000 |      60 | CR                  | Aves
(5 rows)

ALTER TABLE countries
    ADD COLUMN continent varchar(50);

UPDATE countries
SET continent = 'North America'
WHERE name = 'USA';

UPDATE countries
SET continent = 'Asia'
WHERE name = 'Japan';

UPDATE countries
SET continent = 'Europe'
WHERE name = 'France' OR name = 'Germany';
Here we need three separate UPDATE statements since there are three different values that we want to update for the same column. For the France and Germany rows, since they both have the same value for continent, we can update these within a single statement by using the OR operator in our WHERE clause.

ls_burger=# UPDATE orders
ls_burger-# SET drink='Lemonade'
ls_burger-# WHERE customer_name='James Bergman';
UPDATE 1

ls_burger=# UPDATE orders
SET side='Fries'
WHERE customer_name='Aaron Muller';
UPDATE 1

ls_burger=# UPDATE orders
ls_burger-# SET side_cost=0.99
ls_burger-# WHERE customer_name='Aaron Muller';
UPDATE 1

ls_burger=# UPDATE orders
ls_burger-# SET customer_loyalty_points=customer_loyalty_points+3
ls_burger-# WHERE customer_name='Aaron Muller';
UPDATE 1
