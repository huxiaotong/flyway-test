CREATE TABLE scm.w_trans_store_code(
 lot_number varchar(22) NOT NULL,
 store_code varchar(10) NOT NULL,
 store_name varchar(150) NOT NULL,
 store_open_date timestamptz,
 store_close_date timestamptz,
 view_store_code varchar(4) NOT NULL,
 integrate_db_store_code varchar(20) NOT NULL,
 system_brand_code varchar(4),
 system_business_code varchar(10) NOT NULL,
 business_name varchar(120) NOT NULL,
 block_code numeric(10),
 block_name varchar(120),
 area_code numeric(4),
 area_name varchar(120),
 system_country_code varchar(3) NOT NULL,
 country_name varchar(120) NOT NULL,
 batch_region numeric(2) NOT NULL,
 comb_db_business_code numeric(20),
 store_device_rmvl_date timestamptz,
 send_target_store_type varchar(2) NOT NULL,
  CONSTRAINT w_trans_store_code_pk
   PRIMARY KEY(lot_number,store_code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser; 
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview; 

commit;
