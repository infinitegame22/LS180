CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
)

CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6, 2) CHECK (initial_price BETWEEN 0.00 AND 1000.00) NOT NULL,
  sales_price numeric(6, 2) CHECK (initial_price BETWEEN 0.00 AND 1000.00)
);

CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id integer NOT NULL REFERENCES bidders (id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items (id) ON DELETE CASCADE
  amount numeric(6, 2) CHECK (initial_price BETWEEN 0.00 AND 1000.00) NOT NULL
);

CREATE INDEX idx_bids_bidder_item ON bids (bidder_id, item_id);