CREATE TABLE customers (
    id serial PRIMARY KEY,
    name text,
    payment_token varchar(8)
);

CREATE TABLE services (
    id serial PRIMARY KEY,
    description text,
    price numeric(10, 2) CHECK (price >= 0.00)
);

INSERT INTO customers (name, payment_token)
VALUES ('Pat Johnson',   'XHGOAHEQ'),
('Nancy Monreal', 'JKWQPJKL'),
('Lynn Blake',    'KLZXWEEE'),
('Chen Ke-Hua',   'KWETYCVX'),
('Scott Lakso',   'UUEAPQPS'),
('Jim Pornot',    'XKJEYAZA');

INSERT INTO services (description, price)
VALUES ('Unix Hosting', 5.95),
       ('DNS', 4.95),
       ('Whois Registration', 1.95),
       ('High Bandwidth', 15.00),
       ('Business Support', 250.00),
       ('Dedicated Hosting', 50.00),
       ('Bulk Email', 250.00),
       ('One-to-one Training', 999.00);

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  services_id integer REFERENCES services (id) NOT NULL,
  customer_id integer REFERENCES customers (id)  NOT NULL
      ON DELETE CASCADE
);
--https://www.postgresql.org/docs/16/ddl-constraints.html#DDL-CONSTRAINTS-UNIQUE-CONSTRAINTS:~:text=To%20define%20a%20unique%20constraint%20for%20a%20group%20of%20columns%2C%20write%20it%20as%20a%20table%20constraint%20with%20the%20column%20names%20separated%20by%20commas%3A

-- CREATE TABLE customers (
--     id serial PRIMARY KEY,
--     name text,
--     payment_token varchar(8)
-- );

-- CREATE TABLE services (
--     id serial PRIMARY KEY,
--     description text,
--     price numeric(10, 2) CHECK (price >= 0.00)
-- );

-- INSERT INTO customers (name, payment_token)
-- VALUES ('Pat Johnson',   'XHGOAHEQ'),
-- ('Nancy Monreal', 'JKWQPJKL'),
-- ('Lynn Blake',    'KLZXWEEE'),
-- ('Chen Ke-Hua',   'KWETYCVX'),
-- ('Scott Lakso',   'UUEAPQPS'),
-- ('Jim Pornot',    'XKJEYAZA');

-- INSERT INTO services (description, price)
-- VALUES ('Unix Hosting', 5.95),
--        ('DNS', 4.95),
--        ('Whois Registration', 1.95),
--        ('High Bandwidth', 15.00),
--        ('Business Support', 250.00),
--        ('Dedicated Hosting', 50.00),
--        ('Bulk Email', 250.00),
--        ('One-to-one Training', 999.00);

-- CREATE TABLE customers_services (
--   id serial PRIMARY KEY,
--   services_id integer REFERENCES services (id) NOT NULL,
--   customer_id integer REFERENCES customers (id) ON DELETE CASCADE NOT NULL,
--   UNIQUE(customer_id, services_id)
-- );
-- amy (id: 1)
--     3.      4      5
-- internet, cable, security

-- join table to establish customer to service relationship
-- customer id.   services_id
--   >>> 1.    |   3    <<<
--   >>> 1.    |   4    <<<
--   >>> 1.    |   5    <<<
--  1 | 5.   NOT ALLOWED: bad bad, not good

-- 'combination of x and y must be UNIQUE'
-- UNIQUE(x, y);

DELETE FROM customers_services;

INSERT INTO customers_services (customer_id, services_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (3, 1),
       (3, 2),
       (3, 3),
       (3, 4),
       (3, 5),
       (4, 1),
       (4, 4),
       (5, 1),
       (5, 2),
       (5, 6),
       (6, 1),
       (6, 6),
       (6, 7);

-- A LEFT OUTER JOIN is equivalent to first performing an INNER JOIN (to get all of the matching data) and then handling the non-matching rows "

SELECT c.*
FROM customers AS c
         LEFT JOIN services AS s ON s.customer_id = c.id;

id |     name      | payment_token
----+---------------+---------------
  1 | Pat Johnson   | XHGOAHEQ
  1 | Pat Johnson   | XHGOAHEQ
  1 | Pat Johnson   | XHGOAHEQ
  3 | Lynn Blake    | KLZXWEEE
  3 | Lynn Blake    | KLZXWEEE
  3 | Lynn Blake    | KLZXWEEE
  3 | Lynn Blake    | KLZXWEEE
  3 | Lynn Blake    | KLZXWEEE
  4 | Chen Ke-Hua   | KWETYCVX
  4 | Chen Ke-Hua   | KWETYCVX
  5 | Scott Lakso   | UUEAPQPS
  5 | Scott Lakso   | UUEAPQPS
  5 | Scott Lakso   | UUEAPQPS
  6 | Jim Pornot    | XKJEYAZA
  6 | Jim Pornot    | XKJEYAZA
  6 | Jim Pornot    | XKJEYAZA
 11 | Scott Lakso   | UUEAPQPS
 12 | Jim Pornot    | XKJEYAZA
 10 | Chen Ke-Hua   | KWETYCVX
  2 | Nancy Monreal | JKWQPJKL
  8 | Nancy Monreal | JKWQPJKL
  9 | Lynn Blake    | KLZXWEEE
  7 | Pat Johnson   | XHGOAHEQ
(23 rows)
