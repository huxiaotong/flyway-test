ALTER TABLE scm.w_store
 ALTER COLUMN store_open_date TYPE timestamp,
 ALTER COLUMN store_close_date TYPE timestamp,
 ALTER COLUMN renewal_open_date TYPE timestamp,
 ALTER COLUMN renewal_previous_close_date TYPE timestamp,
 ALTER COLUMN store_inspection_start_date TYPE timestamp,
 ALTER COLUMN store_inspection_end_date TYPE timestamp,
 ALTER COLUMN system_machine_removal_date TYPE timestamp;
