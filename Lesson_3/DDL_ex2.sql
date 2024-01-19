
-- CREATE DATABASE extrasolar;
-- -- \c extrasolar
-- CREATE TABLE stars (
--     id serial PRIMARY KEY,
--      name varchar(25) UNIQUE NOT NULL,
--      distance integer NOT NULL CHECK (distance > 0),
--      spectral_type varchar(1),
--      companions integer NOT NULL CHECK (companions >= 0)
--    );
-- CREATE TABLE planets (
--     id serial PRIMARY KEY,
--     designation varchar(1) UNIQUE NOT NULL,
--     mass integer
-- );

ALTER TABLE planets ADD COLUMN star_id integer NOT NULL;
ALTER TABLE planets ADD CONSTRAINT star_id_fkey
    FOREIGN KEY star_id
    REFERENCES stars(id);

-- LS
ALTER TABLE planets
    ADD COLUMN star_id integer NOT NULL REFERENCES stars (id);