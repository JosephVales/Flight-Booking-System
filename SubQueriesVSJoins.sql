-- Find customers who have ordered lettuce (id=3)
--   Select customer_id, first_name, last_name

-- Using Joins
USE sql_store;

SELECT 
	DISTINCT customer_id,
   first_name,
   last_name
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE product_id = (
	SELECT product_id 
	FROM products
	WHERE name REGEXP 'LETTUCE'
)

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- Using SubQueries
USE sql_store;

SELECT 
	customer_id,
    first_name,
    last_name
FROM customers 
WHERE customer_id IN (
	SELECT customer_id
    FROM orders 
    WHERE order_id IN (
		SELECT DISTINCT order_id
		FROM order_items
		WHERE product_id = (
			SELECT product_id 
			FROM products
			WHERE name REGEXP 'LETTUCE'
		)
	)
)
