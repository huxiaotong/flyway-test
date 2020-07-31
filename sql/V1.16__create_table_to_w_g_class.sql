CREATE TABLE scm.w_g_class(
 lot_number varchar(22) NOT NULL,
 eai_update_date varchar(18) NOT NULL,
 eai_update_type varchar(1) NOT NULL,
 eai_send_status varchar(1),
 eai_send_date varchar(18),
 g_department_code varchar(6) NOT NULL,
 g_department_name varchar(120) NOT NULL,
 system_brand_code varchar(4) NOT NULL,
 batch_region numeric(2) NOT NULL,
  CONSTRAINT w_g_class_pk
   PRIMARY KEY(lot_number,g_department_code,system_brand_code,eai_update_date)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser; 
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview; 

commit;
