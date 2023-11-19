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

