CREATE TABLE contacts (
    id integer,
    first_name text,
    last_name text,
    number charvar(10)
);

CREATE TABLE calls (
    id integer,
    when timestamp without time zone,
    duration integer,
    contact_id integer REFERENCES contacts (id)
);

INSERT INTO calls ()
VALUES

INSERT INTO