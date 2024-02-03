 --list of all customer names together
 -- with a comma-separated list of the services they use

SELECT c.name, s.description from customers AS c
LEFT OUTER JOIN customers_services 
ON c.id = customers_services.customer_id
JOIN services AS s ON s.id = customers_services.id
GROUP BY s.description;

-- chatGPT
SELECT c.name, array_agg(s.description) as services
FROM customers AS c
LEFT OUTER JOIN customers_services ON c.id = customers_services.customer_id
JOIN services AS s ON s.id = customers_services.services_id
GROUP BY c.name;

name     |                                   services                                    
-------------+-------------------------------------------------------------------------------
 Pat Johnson | {"Unix Hosting",DNS,"Whois Registration"}
 Lynn Blake  | {"Unix Hosting",DNS,"Whois Registration","High Bandwidth","Business Support"}
 Chen Ke-Hua | {"Unix Hosting","High Bandwidth"}
 Scott Lakso | {"Unix Hosting",DNS,"Dedicated Hosting"}
 Jim Pornot  | {"Unix Hosting","Dedicated Hosting","Bulk Email"}
(5 rows)

-- LS
SELECT customers.name, string_agg(services.description, ', ') AS services
FROM customers
LEFT OUTER JOIN customers_services
            ON customer_id = customers.id
LEFT OUTER JOIN services
            ON services.id = services_id
GROUP BY customers.id;

-- Further Explanation

SELECT customers.name,
       lag(customers.name)
         OVER (ORDER BY customers.name)
         AS previous,
       services.description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = services_id;

               name      |   previous    |    description     
---------------+---------------+--------------------
 Chen Ke-Hua   |               | High Bandwidth
 Chen Ke-Hua   | Chen Ke-Hua   | Unix Hosting
 Jim Pornot    | Chen Ke-Hua   | Dedicated Hosting
 Jim Pornot    | Jim Pornot    | Unix Hosting
 Jim Pornot    | Jim Pornot    | Bulk Email
 Lynn Blake    | Jim Pornot    | Whois Registration
 Lynn Blake    | Lynn Blake    | High Bandwidth
 Lynn Blake    | Lynn Blake    | Business Support
 Lynn Blake    | Lynn Blake    | DNS
 Lynn Blake    | Lynn Blake    | Unix Hosting
 Nancy Monreal | Lynn Blake    | 
 Pat Johnson   | Nancy Monreal | Whois Registration
 Pat Johnson   | Pat Johnson   | DNS
 Pat Johnson   | Pat Johnson   | Unix Hosting
 Scott Lakso   | Pat Johnson   | DNS
 Scott Lakso   | Scott Lakso   | Dedicated Hosting
 Scott Lakso   | Scott Lakso   | Unix Hosting
(17 rows)

-- when running the given function with `lag` included we can see a column dedicated to the previously
-- iterated row value of the `customers.name` column.

SELECT 
       CASE WHEN lag(name) 
                 OVER (ORDER BY name) = name THEN NULL
            ELSE name
       END AS name,
       description
  FROM customers
  LEFT OUTER JOIN customers_services
          ON customer_id = customers.id
  LEFT OUTER JOIN services
          ON services.id = services_id;