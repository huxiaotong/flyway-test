CREATE TABLE scm.m_trans_tender(
 tender_id varchar(50) NOT NULL,
 tender_group varchar(50),
 ims_tender_id numeric(6) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_trans_tender_pk
   PRIMARY KEY(tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX m_trans_tender_KEY1 ON scm.m_trans_tender(ims_tender_id);

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser; 
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview; 
