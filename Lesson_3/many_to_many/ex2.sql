 id |     author      |           categories
----+-----------------+--------------------------------
  1 | Charles Dickens | Fiction, Classics
  2 | J. K. Rowling   | Fiction, Fantasy
  3 | Walter Isaacson | Nonfiction, Biography, Physics
(3 rows)

SELECT books.id, books.author, string_agg(categories.name, ', ') AS categories
FROM books
  INNER JOIN books_categories ON books.id = books_categories.book_id
  INNER JOIN categories ON books_categories.category_id = categories.id
  GROUP BY books.id ORDER BY books.id;