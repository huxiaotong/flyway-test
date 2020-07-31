CREATE TABLE scm.m_purge_item(
 system_brand_code varchar(4) NOT NULL,
 system_country_code varchar(3) NOT NULL,
 item_code varchar(25) NOT NULL,
 process_type numeric(2),
 system_business_code varchar(10),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_purge_item_pk
   PRIMARY KEY(system_brand_code,system_country_code,item_code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser; 
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview; 
