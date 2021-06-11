-- Write a stored procedure to return invoices 
-- for a given client 
-- get_invoices_by_client

DELIMITER $$
CREATE PROCEDURE get_invoices_by_client(client VARCHAR(50))
BEGIN
   SELECT 
      c.name,
      c.address,
      c.city,
      c.state,
      c.phone,
      i.number,
      i.invoice_total,
      i.payment_total,
      i.payment_date,
      i.invoice_date
   FROM  clients c
   JOIN invoices i USING(client_id)
   WHERE c.name = client;
END $$
DELIMITER ;