ALTER TABLE scm.m_business_country_state_setting
 ADD COLUMN variable_type varchar(1),
 ADD COLUMN display_order numeric(5),
 ALTER COLUMN state_code TYPE varchar(4);
