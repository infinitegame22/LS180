SELECT countries.name, continents.continent_name
FROM countries
JOIN continents ON countries.continent_id = continents.id;

SELECT o.id
FROM orders AS o JOIN order_items AS oi
ON o.id = oi.order_id
JOIN products AS p
ON oi.product_id = p.id
WHERE p.product_name = 'Fries';

SELECT o.id, c.customer_name
FROM orders AS o 
FROM customers AS c
JOIN order_items AS oi
ON o.id = oi.order_id
JOIN products AS p
ON oi.product_id = p.id
WHERE p.product_name = 'Fries';

SELECT DISTINCT c.customer_name AS "Customers who like Fries"
FROM customers AS c JOIN orders as o
ON c.id = o.customer_id
JOIN order_items AS oi
ON o.id = oi.order_id
JOIN products AS p
ON oi.product_id = p.id
WHERE p.product_name = 'Fries';

SELECT sum(product_cost) AS total_cost
FROM customers AS c JOIN orders as o
ON c.id = o.customer_id
JOIN order_items AS oi
ON o.id = oi.order_id
JOIN products AS p
ON oi.product_id = p.id
WHERE c.customer_name = 'Natasha O''Shea';

SELECT p.product_name, COUNT(oi.id)
FROM products AS p JOIN order_items AS oi
ON p.id = oi.product_id
GROUP BY p.product_name
ORDER BY p.product_name;