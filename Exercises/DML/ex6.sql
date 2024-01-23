Write two SQL queries:

SELECT parts.part_number, devices.name FROM parts
INNER JOIN devices ON parts.device_id = devices.id;

 part_number |     name      
-------------+---------------
         837 | Accelerometer
        1365 | Accelerometer
        9732 | Accelerometer
           5 | Gyroscope
          36 | Gyroscope
         531 | Gyroscope
        9062 | Gyroscope
       10000 | Gyroscope

One that generates a listing of parts that currently belong to a device.

SELECT parts.part_number, devices.name FROM parts
LEFT JOIN devices ON parts.device_id <> devices.id;
One that generates a listing of parts that don't belong to a device.
Do not include the id column in your queries.

Expected Output:

part_number | device_id
------------+-----------
         12 |         1
         14 |         1
         16 |         1
         31 |         2
         33 |         2
         35 |         2
         37 |         2
         39 |         2
(8 rows)