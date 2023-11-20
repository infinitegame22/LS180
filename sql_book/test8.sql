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
