-- Write a Query to produce a report
--   Display the payment methods followed by the total amounts recieved of each
--   Display a the total sum using the ROLLUP operator

USE sql_invoicing;

SELECT 
	pm.name AS payment_method,
	SUM(p.amount) AS total
FROM payments p
JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY pm.name WITH ROLLUP