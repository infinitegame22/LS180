SELECT events.name, COUNT(tickets.id) AS popularity FROM events
    INNER JOIN tickets ON events.id = tickets.event_id
    GROUP BY events.name
    ORDER BY popularity DESC;

            :-------------+---------+-----------+----------+-------------------------------------
         id          | integer |           | not null | nextval('tickets_id_seq'::regclass)
        event_id    | integer |           | not null |
 seat_id     | integer |           | not null |
 customer_id | integer |           | not null |
Indexes:
    "tickets_pkey" PRIMARY KEY, btree (id)
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