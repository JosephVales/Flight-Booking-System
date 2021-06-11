-- Display customer
-- Display points
-- Display category
--   If points < 2000, category = Bronze
--   If points between 2000 and 3000, category = Silver
--   If points greater than 3000, category = Gold

USE sql_store;

SELECT 
	CONCAT(first_name, ' ', last_name) AS customer,
   points,
   CASE 
		WHEN points < 2000 THEN 'Bronze'
      WHEN points BETWEEN 2000 AND 3000 THEN 'Silver'
      WHEN points > 3000 THEN 'Gold' 
	END AS category
FROM customers
ORDER BY points DESC