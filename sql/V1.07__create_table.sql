CREATE TABLE scm.w_error_transaction(
 error_id numeric(1) DEFAULT 1 NOT NULL,
 transaction_id varchar(57) NOT NULL,
 transaction_data text NOT NULL,
 error_reason text NOT NULL,
 recovery_flag boolean DEFAULT FALSE NOT NULL,
 recovery_status numeric(1) DEFAULT 0 NOT NULL,
 recovery_count integer DEFAULT 0 NOT NULL,
 create_user_id varchar(30) DEFAULT 'BATCH',
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30) DEFAULT 'fr-store-receiver-recovery',
 update_user_id varchar(30) DEFAULT 'BATCH',
 update_datetime timestamptz NOT NULL,
 update_program_id varchar(30) DEFAULT 'fr-store-receiver-recovery',
  CONSTRAINT w_error_transaction_pk
   PRIMARY KEY(transaction_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.w_error_transaction_recovery(
 transaction_id varchar(57) NOT NULL,
 create_user_id varchar(30) DEFAULT 'BATCH',
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30) DEFAULT 'fr-store-receiver-recovery',
 update_user_id varchar(30) DEFAULT 'BATCH',
 update_datetime timestamptz NOT NULL,
 update_program_id varchar(30) DEFAULT 'fr-store-receiver-recovery',
  CONSTRAINT w_error_transaction_recovery_pk
   PRIMARY KEY(transaction_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.w_error_business_recovery(
 transaction_id varchar(57) NOT NULL,
 transaction_data text NOT NULL,
 create_user_id varchar(30) DEFAULT 'BATCH',
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30) DEFAULT 'fr-store-receiver-recovery',
 update_user_id varchar(30) DEFAULT 'BATCH',
 update_datetime timestamptz NOT NULL,
 update_program_id varchar(30) DEFAULT 'fr-store-receiver-recovery',
  CONSTRAINT w_error_business_recovery_pk
   PRIMARY KEY(transaction_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE on all tables in SCHEMA scm TO scmuser; 
GRANT SELECT on all tables in SCHEMA scm TO scmview;

commit;
