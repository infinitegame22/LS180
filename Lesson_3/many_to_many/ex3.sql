ALTER TABLE books ALTER COLUMN title TYPE character varying (255);

INSERT INTO books (author, title)
VALUES ('Lynn Sherr', 'Sally Ride: America''s First Woman in Space'),
       ('Charlotte Bronte', 'Jane Eyre'),
       ('Meeru Dhalwala and Vikram Vij', 'Vij''s: Elegant and Inspired Indian Cuisine');

       lesson_3=# SELECT * FROM books;
 id |                   title                    |            author             
----+--------------------------------------------+-------------------------------
  1 | A Tale of Two Cities                       | Charles Dickens
  2 | Harry Potter                               | J. K. Rowling
  3 | Einstein: His Life and Universe            | Walter Isaacson
  4 | Sally Ride: America's First Woman in Space | Lynn Sherr
  5 | Jane Eyre                                  | Charlotte Bronte
  6 | Vij's: Elegant and Inspired Indian Cuisine | Meeru Dhalwala and Vikram Vij
(6 rows)


INSERT INTO categories (name)
VALUES ('Space Exploration'),
       ('Cookbook'),
       ('South Asia');

       lesson_3=# SELECT * FROM categories;
 id |       name        
----+-------------------
  1 | Nonfiction
  2 | Fiction
  3 | Fantasy
  4 | Classics
  5 | Biography
  6 | Physics
  7 | Space Exploration
  8 | Cookbook
  9 | South Asia
(9 rows)

INSERT INTO books_categories (book_id, category_id)
VALUES (4, 5),
       (4, 1),
       (4, 7),
       (5, 2),
       (5, 4),
       (6, 8),
       (6, 1),
       (6, 9);

Author	Title	Categories
Lynn Sherr	Sally Ride: America's First Woman in Space	Biography, Nonfiction, Space Exploration
Charlotte Brontë	Jane Eyre	Fiction, Classics
Meeru Dhalwala and Vikram Vij	Vij's: Elegant and Inspired Indian Cuisine	Cookbook, Nonfiction, South Asia

SELECT * FROM books_categories;
 book_id | category_id 
---------+-------------
       1 |           2
       1 |           4
       2 |           2
       2 |           3
       3 |           1
       3 |           5
       3 |           6
(7 rows)
