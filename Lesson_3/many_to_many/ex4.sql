--  uniqueness constraint on the combination of columns book_id and category_id of the books_categories 
-- table. This constraint should be a table constraint; so, it should check for uniqueness on the combination 
-- of book_id and category_id across all rows of the books_categories table.

ALTER TABLE books_categories ADD UNIQUE (book_id, category_id);