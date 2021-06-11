-- Make a Query that returns
--   complete customer name in one cell
--   phone of customer, if not existent return Unkonwn

USE sql_store;

SELECT 
	CONCAT(first_name, ' ', last_name),
   IFNULL(phone, 'Unknown') AS phone
FROM customers