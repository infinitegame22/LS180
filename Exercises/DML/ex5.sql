SELECT devices.name, COUNT(parts.device_id)
FROM devices
LEFT OUTER JOIN parts ON parts.device_id = devices.id GROUP BY devices.id;
-- name of each device in our database together with the number of parts for that device.