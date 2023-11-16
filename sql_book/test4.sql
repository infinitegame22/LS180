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