SELECT orders.quantity, products.name
FROM orders
LEFT JOIN products ON orders.product_id = products.id;