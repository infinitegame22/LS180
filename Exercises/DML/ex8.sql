We've realized that the last two parts we're using for device number 2, "Gyroscope",
 actually belong to an "Accelerometer". Write an SQL statement that will associate the 
last two parts from our parts table with an "Accelerometer" instead of a "Gyroscope".

UPDATE parts
SET device_id = 1
WHERE part_number=9062 OR part_number = 10000;


-- ORDER BY device_id DESC LIMIT 2;


lesson_3=# SELECT * FROM parts;
 id | part_number | device_id 
----+-------------+-----------
  1 |         837 |         1
  2 |        1365 |         1
  3 |        9732 |         1
  4 |           5 |         2
  5 |          36 |         2
  6 |         531 |         2
  7 |        9062 |         2
  8 |       10000 |         2
(8 rows)

-- exploration

set the part with the smallest part_number to be associated with "Gyroscope"

UPDATE parts SET device_id = 2
WHERE part_number=5;