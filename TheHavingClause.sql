-- Get the customers
--   Located in Virginia 
--   Who have spent more than $100

USE sql_store;

SELECT 
	c.customer_id,
	c.first_name,
	c.last_name,
   SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c
JOIN orders o USING(customer_id)
JOIN order_items oi ON o.order_id = oi.order_id
WHERE state = 'VA'
GROUP BY 
   c.customer_id,
	c.first_name,
	c.last_name
HAVING SUM(oi.quantity * oi.unit_price) > 100