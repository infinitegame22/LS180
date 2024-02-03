-- customer who does not currently subscribe to any services.

--SELECT customers.* FROM customers
--JOIN customers_services ON customers.id <> customers_services.customer_id;

SELECT customers.* FROM customers
LEFT OUTER JOIN customers_services
              ON customer_id = customers.id
WHERE customers_services.services_id IS NULL;

-- Further Exploration

SELECT customers.*, services.* FROM customers
LEFT OUTER JOIN customers_services ON customer_id = customers.id
FULL OUTER JOIN services ON services_id = services.id
WHERE customers_services.customer_id IS NULL AND customers_services.services_id IS NULL;

 id |     name      | payment_token | id |     description     | price  
----+---------------+---------------+----+---------------------+--------
  2 | Nancy Monreal | JKWQPJKL      |    |                     |       
    |               |               |  8 | One-to-one Training | 999.00
(2 rows)