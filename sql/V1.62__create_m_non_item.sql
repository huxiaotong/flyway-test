CREATE TABLE scm.m_non_item(
 system_country_code varchar(3) NOT NULL,
 system_brand_code varchar(4) NOT NULL,
 non_item_code varchar(25) NOT NULL,
 apply_start_date timestamptz NOT NULL,
 apply_end_date timestamptz,
 non_item_type varchar(8),
 pos_item_name varchar(120),
 unit_retail numeric(24,4),
 g_dept_code varchar(6),
 major_category_code numeric(4) NOT NULL,
 tax_rate numeric(16,4),
 taxation_type varchar(1),
 tax_kind varchar(10),
 discount_flag boolean DEFAULT FALSE NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_non_item_pk
   PRIMARY KEY(system_country_code,system_brand_code,non_item_code,apply_start_date)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser; 
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview; 
