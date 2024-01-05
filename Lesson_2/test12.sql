CREATE TABLE people (
  name varchar(50),
  age int,
  occupation varchar(20)
);

INSERT INTO people (name, age, occupation)
VALUES ('Abby', 34, 'biologist'),
       ('Mu''nisah', 26, NULL),
       ('Mirabelle', 40, 'contractor');

SELECT * FROM people
LIMIT 1 OFFSET 1;

SELECT * FROM people
WHERE name = 'Mu''nisah';

CREATE TABLE birds (
  name varchar(255),
  length decimal(3, 1),
  wingspan decimal(3, 1),
  family varchar(255),
  extinct boolean
);

INSERT INTO birds
VALUES ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', False),
       ('American Robin', 25.5, 36.0, 'Emberizidae', False),
       ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', True),
       ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', True),
       ('Common Kestrel', 35.5, 73.5, 'Falconidae', False);

SELECT birds.name, family FROM birds
WHERE extinct = FALSE
ORDER BY length DESC;

SELECT round(avg(wingspan), 1), min(wingspan), max(wingspan) FROM birds;

CREATE TABLE menu_items (
  item varchar(255),
  prep_time int,
  ingredient_cost numeric(4, 2),
  sales int,
  menu_price numeric(4,2)
);

INSERT INTO menu_items
VALUES ('omelette', 10, 1.50, 182, 7.99),
       ('tacos', 5, 2.00, 254, 8.99),
       ('oatmeal', 1, 0.50, 79, 5.99);

SELECT item, (menu_price - ingredient_cost) AS profit
FROM menu_items
ORDER BY profit DESC
LIMIT 1;

SELECT item, menu_price, ingredient_cost, 
       round(prep_time / 60.0 * 13.0, 2) AS labor, 
       menu_price - ingredient_cost - round(prep_time / 60.0 * 13.0, 2) AS profit
FROM menu_items
ORDER BY profit DESC;