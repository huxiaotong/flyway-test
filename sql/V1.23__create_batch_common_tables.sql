CREATE TABLE scm.m_store_batch_config (
  resource varchar(100) NOT NULL,
  action varchar(30) NOT NULL,
  task_definition varchar(100) NOT NULL,
  cluster_name varchar(100) NOT NULL,
  container_name varchar(100) NOT NULL,
  create_user_id varchar(30),
  create_datetime timestamptz NOT NULL,
  create_program_id varchar(30),
  update_user_id varchar(30),
  update_datetime timestamptz,
  update_program_id varchar(30),
  CONSTRAINT m_store_batch_config_pk
  PRIMARY KEY(resource, action)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_store_batch_status (
  resource varchar(100) NOT NULL,
  action varchar(30) NOT NULL,
  job_sequence varchar(100) NOT NULL,
  task_sequence varchar(100) NOT NULL,
  rerun_sequence numeric(3) NOT NULL,
  task_arn varchar(200),
  status varchar(20) NOT NULL,
  execution_content text,
  execution_parameters text,
  result_content text,
  create_user_id varchar(30),
  create_datetime timestamptz NOT NULL,
  create_program_id varchar(30),
  update_user_id varchar(30),
  update_datetime timestamptz,
  update_program_id varchar(30),
  CONSTRAINT t_store_batch_status_pk
    PRIMARY KEY(resource, action, job_sequence, task_sequence)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE on all tables in SCHEMA scm TO scmuser;
GRANT SELECT on all tables in SCHEMA scm TO scmview;

commit;
