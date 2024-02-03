-- The company president is looking to increase revenue. As a prelude
--  to his decision making, he asks for two numbers: the amount of 
--  expected income from "big ticket" services (those services that 
--  cost more than $100) and the maximum income the company could 
--  achieve if it managed to convince all of its customers to select
--   all of the company's big ticket items.

-- For simplicity, your solution should involve two separate SQL
--  queries: one that reports the current expected income level, 
--  and one that reports the hypothetical maximum. 
--  The outputs should look like this:
-- 
--  sum
------
--  500.00
-- (1 row)
-- 
  --  sum
-------
--  10493.00
-- (1 row)

SELECT sum(price) FROM services AS s
JOIN customers_services AS cs ON s.id = cs.services_id
WHERE price > 100;

-- all customers, 7 customers so far
SELECT sum(price) * count(DISTINCT cs.customer_id) FROM services AS s
JOIN customers_services AS cs ON cs.services_id = s.id;

-- ?column? 
----------
 13135.65  -- why?
(1 row)

SELECT count(DISTINCT customer_id) FROM customers_services;
 count 
-------
     6
(1 row)

SELECT sum(price) * count(customers.id) FROM services, customers
WHERE price > 100;

 ?column?  
-----------
 220353.00
(1 row)

SELECT sum(price) * count(customers.id) FROM services, customers;
?column?  
-----------
 618125.20

SELECT sum(price) FROM services;
  sum   
---------
 1576.85
(1 row)

SELECT sum(price) * count(customers.id) FROM services, customers;

-- LS
SELECT SUM(price)
FROM customers
CROSS JOIN services
WHERE price > 100;

-- Lucas Sorribes
-- Hypothetical income 

SELECT sum(services.price) * (SELECT count(customers.id) FROM customers) AS sum 
    FROM services
WHERE services.price >= 100;