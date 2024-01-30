CREATE TABLE authors (
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL
);

CREATE TABLE books (
    id        serial PRIMARY KEY,
    title     varchar(100)    NOT NULL,
    isbn      char(13) UNIQUE NOT NULL,
    author_id int REFERENCES authors (id)
);

lesson_4=# \d books
Table "public.books"
Column   |          Type          | Collation | Nullable |              Default
-----------+------------------------+-----------+----------+-----------------------------------
 id        | integer                |           | not null | nextval('books_id_seq'::regclass)
 title     | character varying(100) |           | not null |
 isbn      | character(13)          |           | not null |
 author_id | integer                |           |          |
Indexes:
    "books_pkey" PRIMARY KEY, btree (id)
    "books_isbn_key" UNIQUE CONSTRAINT, btree (isbn)
Foreign-key constraints:
    "books_author_id_fkey" FOREIGN KEY (author_id) REFERENCES authors(id)

