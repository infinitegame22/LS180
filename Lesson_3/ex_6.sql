SELECT c.id, c.email, COUNT(DISTINCT tickets.event_id) FROM customers AS c
    INNER JOIN tickets on tickets.customer_id = c.id
    GROUP BY c.id
    HAVING COUNT(DISTINCT tickets.event_id) = 3;


Table "public.customers"
Column   |         Type          | Collation | Nullable |                Default
------------+-----------------------+-----------+----------+---------------------------------------
 id         | integer               |           | not null | nextval('customers_id_seq'::regclass)
 first_name | text                  |           | not null |
 last_name  | text                  |           | not null |
 phone      | character varying(10) |           | not null |
 email      | text                  |           | not null |
Indexes:
    "customers_pkey" PRIMARY KEY, btree (id)
    "customers_email_key" UNIQUE CONSTRAINT, btree (email)
Referenced by:
TABLE "tickets" CONSTRAINT "tickets_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id)

Table "public.events"
Column   |            Type             | Collation | Nullable |              Default
------------+-----------------------------+-----------+----------+------------------------------------
 id         | integer                     |           | not null | nextval('events_id_seq'::regclass)
 name       | text                        |           | not null |
 starts_at  | timestamp without time zone |           | not null |
 base_price | numeric(4,2)                |           | not null |
Indexes:
    "events_pkey" PRIMARY KEY, btree (id)
    "events_date_key" UNIQUE CONSTRAINT, btree (starts_at)
Referenced by:
TABLE "tickets" CONSTRAINT "tickets_event_id_fkey" FOREIGN KEY (event_id) REFERENCES events(id)
