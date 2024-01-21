INSERT INTO contacts (first_name, last_name, "number")
VALUES ('Merve', 'Elk', 6343511126),
       ('Sawa', 'Fyodorov', 6125594874);

id | first_name | last_name |   number   
----+------------+-----------+------------
  6 | William    | Swift     | 7204890809
 17 | Yuan       | Ku        | 2195677796
 25 | Tamila     | Chichigov | 5702700921
 26 | Merve      | Elk       | 6343511126
 27 | Sawa       | Fyodorov  | 6125594874
(5 rows)

INSERT INTO calls ("when", duration, contact_id)
VALUES ('2016-01-17 11:52:00', 175, 26),
       ('2016-01-18 21:22:00', 79, 27);
