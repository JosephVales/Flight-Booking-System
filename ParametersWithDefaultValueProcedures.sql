-- Write a stored procedure called get_payments
-- with two parameters
--
--   client_id => INT
--   payment_method_id => TINYINT 

DELIMITER $$
CREATE PROCEDURE get_payments(client_id INT, payment_method_id TINYINT)
BEGIN 
   SELECT 
      c.client_id AS id,
      c.name,
      p.invoice_id,
      p.date,
      p.amount,
      pm.name AS payment_method
   FROM clients c
   JOIN payments p USING (client_id)
   JOIN payment_methods pm ON p.payment_method = pm.payment_method_id 
   WHERE 
      c.client_id = IFNULL(client_id, c.client_id) AND 
      pm.payment_method_id = IFNULL(payment_method_id, pm.payment_method_id);
END $$
DELIMITER ;