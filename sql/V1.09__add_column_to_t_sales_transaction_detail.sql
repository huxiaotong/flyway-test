ALTER TABLE scm.t_scm_transaction_detail
 ADD COLUMN item_actual_scm_unit_price_tax_excluded_currency_code varchar(3),
 ADD COLUMN item_actual_scm_unit_price_tax_excluded numeric(24,4),
 ADD COLUMN item_actual_scm_unit_price_tax_included_currency_code varchar(3),
 ADD COLUMN item_actual_scm_unit_price_tax_included numeric(24,4);

commit;