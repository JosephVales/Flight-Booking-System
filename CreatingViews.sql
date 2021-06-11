-- Create a view to see the balance 
-- for each client 
-- Name the view as client_balance
-- The view should have
--   client_id
--   name
--   balance (diference between what client owes and has paid)

CREATE VIEW clients_balance AS 
   SELECT
      c.client_id,
      c.name,
      SUM(invoice_total - payment_total) AS balance
   FROM client c
   JOIN invoices i USING (client_id)
   GROUP BY client_id, name