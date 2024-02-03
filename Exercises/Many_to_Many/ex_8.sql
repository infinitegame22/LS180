-- A new customer, 'John Doe', has signed up with our company.
-- His payment token is 'EYODHLCN'. Initially, he has signed up for
-- UNIX hosting, DNS, and Whois Registration.

INSERT INTO customers (name, payment_token)
VALUES ('John Doe', 'EYODHLCN');

INSERT INTO customers_services (services_id, customer_id)
VALUES (1, 7),
       (2, 7),
       (3, 7);