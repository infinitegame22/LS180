Mac-mini:LS180 amyandjake$ psql -d sql_book
psql (14.9 (Homebrew))
Type "help" for help.

sql_book=# \d
List of relations
 Schema |     Name     |   Type   |   Owner
--------+--------------+----------+------------
 public | users        | table    | amyandjake
 public | users_id_seq | sequence | amyandjake
(2 rows)

sql_book=# SELECT * FROM users LIMIT 1;
id | enabled |        last_login         | full_name
----+---------+---------------------------+------------
  1 | f       | 2023-11-14 14:24:32.24714 | John Smith

sql_book=# SELECT * FROM users LIMIT 1 OFFSET 1;
id | enabled |         last_login         | full_name
----+---------+----------------------------+------------
  2 | t       | 2023-11-14 14:26:09.505371 | Jane Smith
(1 row)

sql_book=# INSERT INTO users (id, full_name)
               sql_book-# VALUES (5, 'Jane Smith');
INSERT 0 1
    sql_book=#

    sql_book=# SELECT * FROM users;
id | enabled |         last_login         |  full_name
----+---------+----------------------------+--------------
  1 | f       | 2023-11-14 14:24:32.24714  | John Smith
  2 | t       | 2023-11-14 14:26:09.505371 | Jane Smith
  3 | t       | 2023-11-14 14:26:09.505371 | Harry Potter
  4 | t       | 2023-11-16 16:50:56.879074 | Harry Potter
  5 | t       | 2023-11-16 16:51:37.159669 | Jane Smith
(5 rows)

sql_book=# SELECT DISTINCT full_name FROM users;
full_name
--------------
 John Smith
 Harry Potter
 Jane Smith
(3 rows)

sql_book=# SELECT count(full_name) FROM users;
count
-------
     5
(1 row)

sql_book=# SELECT count(DISTINCT full_name) FROM users;
count
-------
     3
(1 row)

sql_book=# SELECT count(id) FROM users;
count
-------
     5
(1 row)

sql_book=# SELECT count(id) FROM users WHERE enabled = true;
count
-------
     4
(1 row)

sql_book=# SELECT enabled, count(id) FROM users GROUP BY enabled;
enabled | count
---------+-------
 f       |     1
 t       |     4
(2 rows)

sql_book=# SELECT enabled, full_name, count(id)
    sql_book-# FROM users
                        sql_book-# GROUP BY enabled;
ERROR:  column "users.full_name" must appear in the GROUP BY clause or be used in an aggregate function
LINE 1: SELECT enabled, full_name, count(id)
