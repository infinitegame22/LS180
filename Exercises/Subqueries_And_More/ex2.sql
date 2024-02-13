-- Write a SQL query that shows all items that have had bids put on them.
-- Use the logical operator IN for this exercise, as well as a subquery.

SELECT DISTINCT name AS "Bid on Items" FROM items
JOIN bids ON item_id = items.id
WHERE item_id IN (SELECT item_id FROM bids);

-- LS
SELECT name AS "Bid on Items" FROM items
WHERE items.id IN (SELECT item_id FROM bids);

 Bid on Items
---------------
 Video Game
 Outdoor Grill
 Painting
 Tent
 Vase
(5 rows)