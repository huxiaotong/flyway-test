CREATE TABLE scm.w_g_class_link(
 eai_update_datetime varchar(18) NOT NULL,
 eai_update_type varchar(1) NOT NULL,
 eai_send_status varchar(1),
 eai_send_datetime varchar(18),
 department_code varchar(4) NOT NULL,
 major_category_code varchar(4) NOT NULL,
 g_department_code varchar(6) NOT NULL,
 system_brand_code varchar(4) NOT NULL,
 major_category_2_code varchar(4) NOT NULL,
 batch_region numeric(2) NOT NULL,
 lot_number varchar(22) NOT NULL,
  CONSTRAINT w_g_class_link_pk
   PRIMARY KEY(lot_number,department_code,major_category_code,major_category_2_code,system_brand_code,eai_update_datetime)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser; 
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview; 

commit;
