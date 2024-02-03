--  customer data for every customer 
--  who currently subscribes to at least one service.

 SELECT DISTINCT customers.name, customers.payment_token
 FROM customers JOIN customers_services ON customers.id = customers_services.customer_id;