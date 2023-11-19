encyclopedia=# SELECT name FROM countries GROUP BY max(population);
ERROR:  aggregate functions are not allowed in GROUP BY
LINE 1: SELECT name FROM countries GROUP BY max(population);
^
encyclopedia=# SELECT name, population FROM countries GROUP BY max(population);
ERROR:  aggregate functions are not allowed in GROUP BY
LINE 1: SELECT name, population FROM countries GROUP BY max(populati...
                                                        ^
encyclopedia=# SELECT name, max(population)
encyclopedia-# FROM countries
encyclopedia-# GROUP BY name;
name   |    max
---------+-----------
 Germany |   8239400
 Japan   | 126672000
 France  |  67158000
 USA     | 325365189
(4 rows)

encyclopedia=# SELECT name FROM countries
                                    encyclopedia-# ORDER BY population DESC
                   encyclopedia-# LIMIT 1;
name
------
 USA

encyclopedia=# SELECT DISTINCT binomial_name
                                   encyclopedia-# FROM animals;
binomial_name
--------------------------
 Falco Peregrinus
 Aquila Chrysaetos
 Strigops habroptila
 Columbidae Columbiformes
(4 rows)


encyclopedia=# SELECT max(binomial_name) FROM animals;
max
---------------------
 Strigops habroptila
(1 row)

encyclopedia=# SELECT MAX(LENGTH(binomial_name)) AS BNameMax
                   encyclopedia-# FROM animals;
bnamemax
----------
       24
(1 row)

encyclopedia=# SELECT binomial_name FROM animals
                                             encyclopedia-# GROUP BY MAX(LENGTH(binomial_name));
ERROR:  aggregate functions are not allowed in GROUP BY
LINE 2: GROUP BY MAX(LENGTH(binomial_name));
^
encyclopedia=# SELECT binomial_name FROM animals
               GROUP BY binomial_name;
binomial_name
--------------------------
 Falco Peregrinus
 Aquila Chrysaetos
 Strigops habroptila
 Columbidae Columbiformes
(4 rows)

encyclopedia=# SELECT * FROM animals
                                 encyclopedia-# ORDER BY LENGTH(binomial_name) DESC
                   encyclopedia-# LIMIT 1;
name |      binomial_name       | max_weight_kg | max_age | conservation_status
------+--------------------------+---------------+---------+---------------------
 Dove | Columbidae Columbiformes |        2.0000 |      15 | LC
(1 row)

encyclopedia=# SELECT binomial_name FROM animals
                                             encyclopedia-# ORDER BY LENGTH(binomial_name) DESC
                   encyclopedia-# LIMIT 1;
binomial_name
--------------------------
 Columbidae Columbiformes
(1 row)

encyclopedia=# SELECT first_name FROM celebrities
                                          encyclopedia-# WHERE date_of_birth LIKE '%1958%';
ERROR:  operator does not exist: date ~~ unknown
LINE 2: WHERE date_of_birth LIKE '%1958%';
^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
encyclopedia=# SELECT first_name FROM celebrities
                                          encyclopedia-# WHERE EXTRACT(YEAR FROM date_of_birth) = 1958;
first_name
------------
 Madonna
 Prince
(2 rows)

encyclopedia=# SELECT avg(max_weight) FROM animals;
ERROR:  column "max_weight" does not exist
LINE 1: SELECT avg(max_weight) FROM animals;
^
HINT:  Perhaps you meant to reference the column "animals.max_weight_kg".
encyclopedia=# SELECT avg(max_weight_kg) FROM animals;
avg
--------------------
 3.1700000000000000
(1 row)

encyclopedia=# SELECT count(name) FROM countries;
count
-------
     4
(1 row)

encyclopedia=# SELECT count(id) FROM countries;
count
-------
     4
(1 row)

ls_burger=# SELECT side, count(side) as side_count
                ls_burger-# FROM orders
                                     ls_burger-# GROUP BY side;
side     | side_count
-------------+------------
             |          0
 Fries       |          2
 Onion Rings |          1
(3 rows)

ls_burger=# SELECT side, count(id)
    ls_burger-# FROM orders
                         ls_burger-# WHERE side = 'Fries'
                ls_burger-# OR side = 'Onion Rings'
                ls_burger-# GROUP BY side;
side     | count
-------------+-------
 Fries       |     2
 Onion Rings |     1
(2 rows)

