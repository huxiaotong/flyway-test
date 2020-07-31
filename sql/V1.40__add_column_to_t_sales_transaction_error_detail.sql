ALTER TABLE scm.t_scm_transaction_error_detail
 ADD COLUMN regular_time_error_notification_flag boolean,
 ADD COLUMN daily_summary_error_notification_flag boolean,
 ADD COLUMN data_alteration_status_type varchar(1),
 ADD COLUMN error_occurred_list varchar(50),
 ADD COLUMN tax_type varchar(10),
 ADD COLUMN item_scm_amount numeric(24,4),
 ADD COLUMN non_item_scm_amount numeric(24,4),
 ADD COLUMN total_amount numeric(24,4),
 ADD COLUMN currency_code varchar(3),
 ADD COLUMN data_creation_date_time timestamptz;
