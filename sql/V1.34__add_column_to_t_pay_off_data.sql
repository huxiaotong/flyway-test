ALTER TABLE scm.t_pay_off_data
 ADD COLUMN payoff_amount_currency_code varchar(3),
 ADD COLUMN report_output_count numeric(5),
 ADD COLUMN integrity_check_type varchar(2),
 ADD COLUMN regular_time_error_notification_flag boolean,
 ADD COLUMN daily_summary_error_notification_flag boolean,
 ADD COLUMN data_alteration_status varchar(20),
 ADD COLUMN close_complete_flag boolean;
