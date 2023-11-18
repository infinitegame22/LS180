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
