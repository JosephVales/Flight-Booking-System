-- This Query will return the current year orders

USE sql_store;

SELECT *
FROM orders 
WHERE YEAR(order_date) = YEAR(NOW()) 