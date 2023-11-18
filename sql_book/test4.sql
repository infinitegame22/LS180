sql_book=# SELECT enabled, full_name FROM users
                                              sql_book-# WHERE id < 2;
enabled | full_name
---------+------------
 f       | John Smith
(1 row)

sql_book=# SELECT full_name, enabled FROM users
                                              sql_book-# ORDER BY enabled DESC, id DESC;
full_name   | enabled
--------------+---------
 Harry Potter | t
 Jane Smith   | t
 John Smith   | f
(3 rows)

sql_book=# SELECT full_name, enabled FROM users
                                              sql_book-# ORDER BY enabled DESC;
full_name   | enabled
--------------+---------
 Jane Smith   | t
 Harry Potter | t
 John Smith   | f
(3 rows)

sql_book=# SELECT full_name, enabled, last_login
    sql_book-# FROM users
                        sql_book-# WHERE id >= 2;
full_name   | enabled |         last_login
--------------+---------+----------------------------
 Jane Smith   | t       | 2023-11-14 14:26:09.505371
 Harry Potter | t       | 2023-11-14 14:26:09.505371

sql_book=# SELECT * FROM users
                             sql_book-# WHERE full_name = 'Harry Potter'
               sql_book-# OR enabled = 'false';
id | enabled |         last_login         |  full_name
----+---------+----------------------------+--------------
  1 | f       | 2023-11-14 14:24:32.24714  | John Smith
  3 | t       | 2023-11-14 14:26:09.505371 | Harry Potter
(2 rows)

sql_book=# SELECT * FROM users
                             sql_book-# WHERE full_name = 'Harry Potter'
               sql_book-# AND enabled='false';
id | enabled | last_login | full_name
----+---------+------------+-----------
(0 rows)

sql_book=# SELECT * FROM users
                             sql_book-# WHERE full_name = 'Harry Potter'
               sql_book-# AND enabled='false';
id | enabled | last_login | full_name
----+---------+------------+-----------
(0 rows)

sql_book=# SELECT * FROM users WHERE full_name LIKE '%Smith';
id | enabled |         last_login         | full_name
----+---------+----------------------------+------------
  1 | f       | 2023-11-14 14:24:32.24714  | John Smith
  2 | t       | 2023-11-14 14:26:09.505371 | Jane Smith
(2 rows)

encyclopedia=# SELECT population, capital
               FROM countries;
population |     capital
------------+-----------------
   67158000 | Paris
  325365189 | Washington D.C.
    8239400 | Berlin
  126672000 | Tokyo

encyclopedia=# SELECT name
                          encyclopedia-# FROM countries
                                                  encyclopedia-# ORDER BY name;
name
---------
 France
 Germany
 Japan
 USA
(4 rows)

encyclopedia=# SELECT name, capital
    encyclopedia-# FROM countries
                            encyclopedia-# ORDER BY population DESC;
name   |     capital
---------+-----------------
 USA     | Washington D.C.
 Japan   | Tokyo
 France  | Paris
 Germany | Berlin
(4 rows)

SELECT name, capital
FROM countries
ORDER BY population DESC;
name   |     capital
---------+-----------------
 USA     | Washington D.C.
 Japan   | Tokyo
 Germany | Berlin
 France  | Paris
(4 rows)

encyclopedia=# SELECT name, binomial_name, max_weight_kg, max_age
    encyclopedia-# FROM animals
                            encyclopedia-# ORDER BY max_age_years;

name       |      binomial_name       | max_weight_kg | max_age
------------------+--------------------------+---------------+---------
 Dove             | Columbidae Columbiformes |        2.0000 |      15
 Peregrine Falcon | Falco Peregrinus         |        1.5000 |      15
 Pigeon           | Columbidae Columbiformes |        2.0000 |      15
 Golden Eagle     | Aquila Chrysaetos        |        6.3500 |      24
 Kakapo           | Strigops habroptila      |        4.0000 |      60
(5 rows)

encyclopedia=# SELECT name
                          encyclopedia-# FROM countries
                                                  encyclopedia-# WHERE population > 70000000;
name
---------
 France
 USA
 Germany
 Japan
(4 rows)
encyclopedia=# SELECT name
                          encyclopedia-# FROM countries
                                                  encyclopedia-# WHERE population > 70000000 AND population < 200000000;
name
-------
 Japan
(1 row)

SELECT first_name, last_name
FROM celebrities
WHERE occupation LIKE '%sing%';

encyclopedia=# SELECT first_name, last_name
               FROM celebrities
               WHERE occupation LIKE '%Actor%'
               OR occupation LIKE '%Actress%';

encyclopedia=# SELECT first_name, last_name
               FROM celebrities
               WHERE (occupation LIKE '%Actor%'
                  OR occupation LIKE '%Actress%')
               AND occupation LIKE '%Sing%';);

ls_burger=# SELECT burger
                       ls_burger-# FROM orders
                                            ls_burger-# WHERE burger_cost < 5;
burger
-------------------
 LS Chicken Burger
 LS Cheeseburger
 LS Burger
(3 rows)

ls_burger=# SELECT customer_name, customer_email, customer_loyalty_points
    ls_burger-# FROM orders
    ls_burger-# WHERE customer_loyalty_points > 19
    ls_burger-# ORDER BY customer_loyalty_points DESC;

ls_burger=# SELECT customer_name FROM orders
ls_burger-# WHERE drink IS NULL OR drink = '';

customer_name
----------------
 Natasha O'Shea
 Aaron Muller
(2 rows)


ls_burger=# SELECT burger, side, drink
FROM orders
WHERE 'Fries' NOT IN (burger, side, drink) OR side IS NULL;
         burger          |    side     |      drink
-------------------------+-------------+-----------------
 LS Double Deluxe Burger | Onion Rings | Chocolate Shake
 LS Burger               |             |
(2 rows)

ls_burger=# SELECT burger, side drink FROM orders
ls_burger-# WHERE side != NULL
ls_burger-# AND drink != NULL;
 burger | drink
--------+-------
(0 rows)

ls_burger=# SELECT burger, side, drink
ls_burger-# FROM orders
ls_burger-# WHERE side IS NOT NULL AND drink IS NOT NULL;
         burger          |    side     |      drink
-------------------------+-------------+-----------------
 LS Chicken Burger       | Fries       | Cola
 LS Double Deluxe Burger | Onion Rings | Chocolate Shake
(2 rows)
