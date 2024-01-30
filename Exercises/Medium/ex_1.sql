CREATE DATABASE auction;

CREATE TABLE bidders (
    id serial PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE items (
    id serial PRIMARY KEY,
    name text NOT NULL,
    initial_price numeric(6, 2) CHECK (initial_price > 0) NOT NULL,
    sales_price numeric(6, 2) CHECK (sales_price > 0)
);

CREATE TABLE bids (
    id serial PRIMARY KEY,
    bidder_id integer NOT NULL REFERENCES bidders (id) ON DELETE CASCADE,
    item_id integer NOT NULL REFERENCES items (id) ON DELETE CASCADE
);

ALTER TABLE bids ADD COLUMN amount numeric(6, 2) CHECK (amount > 0) NOT NULL;

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders FROM 'Exercises/Medium/bidders.csv' WITH HEADER CSV