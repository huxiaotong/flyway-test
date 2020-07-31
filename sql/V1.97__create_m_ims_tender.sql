CREATE TABLE scm.m_ims_tender(
 store_code varchar(10) NOT NULL,
 ims_tender_id numeric(6) NOT NULL,
 tender_name varchar(120),
 receipt_tender_name varchar(45),
 ims_tender_group varchar(6),
 valid_date timestamptz,
 currency_code varchar(3),
 kid varchar(3),
 change_flag boolean DEFAULT FALSE NOT NULL,
 current_deposit_flag boolean DEFAULT FALSE NOT NULL,
 credit_company_code varchar(3),
 batch_region numeric(2),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_ims_tender_pk
   PRIMARY KEY(store_code,ims_tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE on all tables in SCHEMA scm TO scmuser; 
GRANT SELECT on all tables in SCHEMA scm TO scmview;
