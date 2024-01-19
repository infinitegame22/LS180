SELECT count(id) FROM tickets;

SELECT COUNT( DISTINCT customer_id)
FROM tickets;

-- SELECT (COUNT( DISTINCT customer_id) / COUNT(*)) * 10.00 AS percent
-- FROM tickets;

SELECT COUNT(*) AS percent
FROM customers AS c
LEFT JOIN tickets AS t
ON c.id = t.customer_id;

-- SELECT ROUND(COUNT(DISTINCT t.customer_id)::decimal / COUNT(*)::decimal) * 100 AS percent
-- FROM customers AS c
--          LEFT JOIN tickets AS t
--                    ON c.id = t.customer_id;

Table "public.customers"
Column   |         Type          | Collation | Nullable |                Default
------------+-----------------------+-----------+----------+---------------------------------------
 id         | integer               |           | not null | nextval('customers_id_seq'::regclass)
 first_name | text                  |           | not null |
 last_name  | text                  |           | not null |
 phone      | character varying(10) |           | not null |
 email      | text                  |           | not null |

Table "public.tickets"
Column    |  Type   | Collation | Nullable |               Default
-------------+---------+-----------+----------+-------------------------------------
 id          | integer |           | not null | nextval('tickets_id_seq'::regclass)
 event_id    | integer |           | not null |
 seat_id     | integer |           | not null |
 customer_id | integer |           | not null |

SELECT round( COUNT(DISTINCT tickets.customer_id)
       / COUNT(DISTINCT customers.id)::decimal * 100, 2)
       AS percent
    FROM customers
    LEFT OUTER JOIN tickets
    ON tickets.customer_id = customers.id;

SELECT customers.id, tickets.customer_id
    FROM customers
    LEFT OUTER JOIN tickets
        ON tickets.customer_id = customers.id;