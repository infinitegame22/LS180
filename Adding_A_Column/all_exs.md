Mac-mini:Adding_A_Column amyandjake$ psql -d encyclopedia
psql (14.9 (Homebrew))
Type "help" for help.

encyclopedia=#


-- OR

sql_book=# \c encyclopedia
You are now connected to database "encyclopedi
a" as user "amyandjake".

-- THEN

encyclopedia=# ALTER TABLE famous_people
    encyclopedia-# RENAME TO celebrities;
ALTER TABLE
    encyclopedia=# \dt celebrities
List of relations
 Schema |    Name     | Type  |   Owner
--------+-------------+-------+------------
 public | celebrities | table | amyandjake

encyclopedia=# ALTER TABLE famous_people
    encyclopedia-# RENAME TO celebrities;
ALTER TABLE
    encyclopedia=# \dt celebrities
List of relations
 Schema |    Name     | Type  |   Owner
--------+-------------+-------+------------
 public | celebrities | table | amyandjake
(1 row)

encyclopedia=# ALTER TABLE celebrities
    encyclopedia-# RENAME COLUMN name TO first_name;
ALTER TABLE
    encyclopedia=# ALTER TABLE celebrities
    encyclopedia-# ALTER COLUMN first_name TYPE varchar(80);
ALTER TABLE
    encyclopedia=# \dt
List of relations
 Schema |    Name     | Type  |   Owner
--------+-------------+-------+------------
 public | animals     | table | amyandjake
 public | celebrities | table | amyandjake
 public | countries   | table | amyandjake
 public | users       | table | amyandjake
(4 rows)


encyclopedia=# ALTER TABLE celebrities ADD COLUMN last_name varchar(100);
ALTER TABLE
    encyclopedia=# \d celebrities
Table "public.celebrities"
Column     |          Type          | Collation | Nullable |                  Default                  
---------------+------------------------+-----------+----------+-------------------------------------------
 id            | integer                |           | not null | nextval('famous_people_id_seq'::regclass)
 first_name    | character varying(80)  |           | not null | 
 occupation    | character varying(150) |           |          | 
 date_of_birth | character varying(50)  |           |          | 
 deceased      | boolean                |           |          | false
 last_name     | character varying(100) |           |          |


encyclopedia=# ALTER TABLE celebrities
    encyclopedia-# ALTER COLUMN last_name SET NOT NULL;
ALTER TABLE
    encyclopedia=# \d celebrities
Table "public.celebrities"
Column     |          Type          | Collation | Nullable |                  Default                  
---------------+------------------------+-----------+----------+-------------------------------------------
 id            | integer                |           | not null | nextval('famous_people_id_seq'::regclass)
 first_name    | character varying(80)  |           | not null | 
 occupation    | character varying(150) |           |          | 
 date_of_birth | character varying(50)  |           |          | 
 deceased      | boolean                |           |          | false
 last_name     | character varying(100) |           | not null |   

ALTER TABLE celebrities ALTER COLUMN date_of_birth TYPE date USING date_of_birth::date;

encyclopedia=# \d animals
Table "public.animals"
Column        |          Type          | Collation | Nullable | Default
---------------------+------------------------+-----------+----------+---------
name                | character varying(100) |           | not null |
binomial_name       | character varying(100) |           | not null |
max_weight          | numeric(10,3)          |           |          |
max_age             | integer                |           |          |
conservation_status | character(2)           |           |          |
Check constraints:
"animals_conservation_status_check" CHECK (conservation_status ~ '^[A-Z]{2}$'::text)
"animals_max_weight_check" CHECK (max_weight >= 0.001 AND max_weight <= 40000::numeric)

encyclopedia=# ALTER TABLE animals
encyclopedia-# RENAME COLUMN max_weight TO max_weight_kg;
ALTER TABLE
encyclopedia=# \d animals
Table "public.animals"
Column        |          Type          | Collation | Nullable | Default
---------------------+------------------------+-----------+----------+---------
name                | character varying(100) |           | not null |
binomial_name       | character varying(100) |           | not null |
max_weight_kg       | numeric(10,3)          |           |          |
max_age             | integer                |           |          |
conservation_status | character(2)           |           |          |
Check constraints:
"animals_conservation_status_check" CHECK (conservation_status ~ '^[A-Z]{2}$'::text)
"animals_max_weight_check" CHECK (max_weight_kg >= 0.001 AND max_weight_kg <= 40000::numeric)

```SQL
ls_burger=# ALTER TABLE orders
ls_burger-# DROP COLUMN order_total;
ALTER TABLE
ls_burger=# \d orders
                                            Table "public.orders"
         Column          |          Type          | Collation | Nullable |              Default               
-------------------------+------------------------+-----------+----------+------------------------------------
 id                      | integer                |           | not null | nextval('orders_id_seq'::regclass)
 customer_name           | character varying(100) |           | not null | 
 burger                  | character varying(50)  |           |          | 
 side                    | character varying(50)  |           |          | 
 drink                   | character varying(50)  |           |          | 
 customer_email          | character varying(50)  |           |          | 
 customer_loyalty_points | integer                |           |          | 0
 burger_cost             | numeric(4,2)           |           |          | 0
 side_cost               | numeric(4,2)           |           |          | 0
 drink_cost              | numeric(4,2)           |           |          | 0
```