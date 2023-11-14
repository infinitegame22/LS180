CREATE TABLE all_users (
    id serial UNIQUE NOT NULL,
    username char(25),
    enabled boolean DEFAULT TRUE
);

CREATE TABLE countries (
    id serial,
    name varchar(50) UNIQUE NOT NULL,
    capital varchar(50) NOT NULL,
    population integer
);

CREATE TABLE famous_people (
    id serial,
    name varchar(100) NOT NULL,
    occupation varchar(150),
    date_of_birth varchar(50),
    deceased boolean default FALSE
);

CREATE TABLE animals (
    Name varchar(100) NOT NULL,
    Binomial_Name varchar(100) NOT NULL,
    "max_weight" DECIMAL(10, 3) CHECK (animals.max_weight >= 0.001 AND animals.max_weight <= 40000),
    "max_age" INT,
    "conservation_status" CHAR(2) CHECK (animals.Conservation_Status ~ '^[A-Z]{2}$')
);

CREATE DATABASE ls_burger;

CREATE TABLE orders (
    id serial,
    customer_name varchar(100) NOT NULL,
    burger varchar(50),
    side varchar(50),
    drink varchar(50),
    order_total DECIMAL(4, 2) NOT NULL
);

ALTER TABLE all_users
    ALTER COLUMN full_name
        SET NOT NULL;

ALTER TABLE all_users
    ALTER COLUMN id
        DROP DEFAULT;

ALTER TABLE all_users
    ADD COLUMN last_login timestamp
        NOT NULL
        DEFAULT NOW();