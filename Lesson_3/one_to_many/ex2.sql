sql-course=# SELECT calls.when, calls.duration, contacts.first_name
sql-course-# FROM calls INNER JOIN contacts ON calls.contact_id = contacts.id
sql-course-# WHERE (contacts.first_name || ' ' || contacts.last_name) != 'William Swift';
        when         | duration | first_name
---------------------+----------+------------
 2016-01-08 15:30:00 |      350 | Yuan
 2016-01-11 11:06:00 |      111 | Tamila
 2016-01-13 18:13:00 |     2521 | Tamila
 2016-01-17 09:43:00 |      982 | Yuan
(4 rows)