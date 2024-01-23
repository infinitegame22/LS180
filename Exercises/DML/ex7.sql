INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);


 write an SQL statement that will return the name of the oldest device from our devices table.

 SELECT devices.name FROM devices
 ORDER BY created_at ASC LIMIT 1;