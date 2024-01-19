

Table "public.orders"
Column   |  Type   | Collation | Nullable |              Default
------------+---------+-----------+----------+------------------------------------
 id         | integer |           | not null | nextval('orders_id_seq'::regclass)
 product_id | integer |           |          |
 quantity   | integer |           | not null |
Indexes:
    "orders_pkey" PRIMARY KEY, btree (id)

Table "public.products"
Column |  Type   | Collation | Nullable |               Default
--------+---------+-----------+----------+--------------------------------------
 id     | integer |           | not null | nextval('products_id_seq'::regclass)
 name   | text    |           | not null |
Indexes:
    "products_pkey" PRIMARY KEY, btree (id)

ALTER TABLE orders
    ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES products (id);