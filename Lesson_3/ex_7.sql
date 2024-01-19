SELECT events.name AS event,
       events.starts_at,
       sections.name AS section,
       seats.row,
       seats.number AS seat
FROM tickets
INNER JOIN events
    ON tickets.event_id = events.id
INNER JOIN customers
    ON tickets.customer_id = customers.id
INNER JOIN seats
    ON tickets.seat_id = seats.id
INNER JOIN sections
    ON seats.section_id = sections.id
WHERE customers.email = 'gennaro.rath@mcdermott.co';


WITH customer_event_seat_table AS (
    SELECT event_id, seat_id
    FROM tickets
    WHERE customer_id = (SELECT id FROM customers WHERE email = 'gennaro.rath@mcdermott.co')
),
events_data AS (
    SELECT name, starts_at, id
    FROM events
    WHERE id IN (SELECT event_id FROM customer_event_seat_table)
),
seats_data AS (
    SELECT section_id, number, row, id
    FROM seats
    WHERE id = (SELECT seat_id FROM customer_event_seat_table)
),
section_data AS (
    SELECT name
    FROM sections
    WHERE id = (SELECT section_id FROM seats_data)
)
SELECT * FROM section_data;
-- https://www.postgresql.org/docs/current/queries-with.html
SELECT event_id, seat_id
FROM tickets
JOIN
WHERE customer_id = (SELECT id FROM customers WHERE email = 'gennaro.rath@mcdermott.co');



Table "public.tickets"
Column    |  Type   | Collation | Nullable |               Default
-------------+---------+-----------+----------+-------------------------------------
 id          | integer |           | not null | nextval('tickets_id_seq'::regclass)
 event_id    | integer |           | not null |
 seat_id     | integer |           | not null |
 customer_id | integer |           | not null |
Indexes:
    "tickets_pkey" P
RIMARY KEY, btree (id)
    "tickets_event_id_seat_id_unique" UNIQUE CONSTRAINT, btree (event_id, seat_id)
Foreign-key constraints:
    "tickets_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id)
    "tickets_event_id_fkey" FOREIGN KEY (event_id) REFERENCES events(id)
    "tickets_seat_id_fkey" FOREIGN KEY (seat_id) REFERENCES seats(id)

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

Table "public.seats"
Column   |         Type         | Collation | Nullable |              Default
------------+----------------------+-----------+----------+-----------------------------------
 id         | integer              |           | not null | nextval('seats_id_seq'::regclass)
 section_id | integer              |           | not null |
 row        | character varying(1) |           | not null |
 number     | integer              |           | not null |
Indexes:
    "seats_pkey" PRIMARY KEY, btree (id)
    "seats_section_id_row_number_unique" UNIQUE CONSTRAINT, btree (section_id, "row", number)
Foreign-key constraints:
    "seats_section_id_fkey" FOREIGN KEY (section_id) REFERENCES sections(id)
Referenced by:
TABLE "tickets" CONSTRAINT "tickets_seat_id_fkey" FOREIGN KEY (seat_id) REFERENCES seats(id)

Table "public.sections"
Column      |     Type     | Collation | Nullable |               Default
------------------+--------------+-----------+----------+--------------------------------------
 id               | integer      |           | not null | nextval('sections_id_seq'::regclass)
 code             | text         |           | not null |
 name             | text         |           | not null |
 price_multiplier | numeric(4,3) |           | not null |
Indexes:
    "sections_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "seats" CONSTRAINT "seats_section_id_fkey" FOREIGN KEY (section_id) REFERENCES sections(id)
