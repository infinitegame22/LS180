SELECT devices.name, parts.part_number
FROM parts
INNER JOIN devices ON devices.id = parts.device_id;