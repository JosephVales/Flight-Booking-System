-- Write a Query that displays 
--   product_id
--   name
--   orders
--   frecuency 
--       (if the order has been ordered more than 1 display many times),
--       (if the order has been orderder just once diplay once) 

USE sql_store;

SELECT 
	product_id,
   name,
   COUNT(*) AS orders,
   IF(COUNT(*)=1, 'Once','Many times') AS frecuency
FROM products p
JOIN order_items oi USING(product_id)
GROUP BY product_id, name