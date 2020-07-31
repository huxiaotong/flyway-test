CREATE TABLE scm.w_purge_item(
 eai_update_datetime varchar(18) NOT NULL,
 eai_update_type varchar(1) NOT NULL,
 eai_send_status varchar(1),
 eai_send_datetime varchar(18),
 item_code varchar(25) NOT NULL,
 system_business_code varchar(10) NOT NULL,
 batch_region numeric(2) NOT NULL,
 lot_number varchar(22) NOT NULL,
  CONSTRAINT w_purge_item_pk
   PRIMARY KEY(lot_number,item_code,eai_update_datetime,batch_region)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser; 
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview; 

commit;
