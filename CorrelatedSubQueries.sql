-- Get invoices that are larger than the client's average invoice amount 
--   For each client find the avg invoice amount
--   For each client return the invoices larger than the avg

USE sql_invoicing;

SELECT *
FROM invoices i
WHERE invoice_total > (
	SELECT
		AVG(invoice_total)
	FROM invoices
    WHERE client_id = i.client_id
)
ORDER BY client_id


