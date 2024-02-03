-- Write the necessary SQL statements to delete the "Bulk Email" service and customer "Chen Ke-Hua" from the database.
SELECT * FROM services WHERE description = 'Bulk Email';


SELECT * FROM customers WHERE name='Chen Ke-Hua';
DELETE FROM customers WHERE name='Chen Ke-Hua';

SELECT * FROM customers_services WHERE services_id = 7;
DELETE FROM customers_services WHERE services_id = 7;