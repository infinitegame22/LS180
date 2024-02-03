-- Write a query that displays the description for every service
-- that is subscribed to by at least 3 customers 
 -- Include the customer count for each description in the report. 

SELECT s.description, COUNT(s.description) FROM services AS s
INNER JOIN customers_services ON s.id = customers_services.services_id
WHERE COUNT(s.description) >= 3;

-- chatGPT
-- , "aggregate functions are not allowed in WHERE," is due to the fact that aggregate functions, such as COUNT, cannot be used directly in the WHERE clause. Aggregate functions are applied after the WHERE clause is evaluated.

SELECT s.description, COUNT(cs.customer_id) AS count
FROM services AS s
INNER JOIN customers_services AS cs ON s.id = cs.services_id
GROUP BY s.description
HAVING COUNT(cs.customer_id) >= 3;
