ALTER TABLE scm.t_scm_transaction_header
 ADD COLUMN customer_type varchar(10),
 ADD COLUMN scm_transaction_discount_type varchar(1);
