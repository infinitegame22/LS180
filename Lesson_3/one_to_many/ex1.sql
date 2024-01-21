INSERT INTO calls ("when", calls, first_name, last_name, number)
VALUES ('2016-01-18 14:47:00', 632, 'William', 'Swift', 7204890809);

INSERT INTO calls ("when", duration, contact_id)
VALUES ('2016-01-18 14:47:00', 632, 6);




calls:
 id |        when         | duration | contact_id 
----+---------------------+----------+------------
  1 | 2016-01-02 04:59:00 |     1821 |          6
  2 | 2016-01-08 15:30:00 |      350 |         17
  3 | 2016-01-11 11:06:00 |      111 |         25
  4 | 2016-01-13 18:13:00 |     2521 |         25
  5 | 2016-01-17 09:43:00 |      982 |         17
(5 rows)

contacts:
 id | first_name | last_name |   number   
----+------------+-----------+------------
  6 | William    | Swift     | 7204890809
 17 | Yuan       | Ku        | 2195677796
 25 | Tamila     | Chichigov | 5702700921
(3 rows)

