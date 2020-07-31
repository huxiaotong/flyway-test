CREATE TABLE scm.m_screen_path(
 screen_name varchar(100) NOT NULL,
 version varchar(10) NOT NULL,
 path varchar(300) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz NOT NULL,
 update_program_id varchar(30),
  CONSTRAINT m_screen_path_pk
   PRIMARY KEY(screen_name,version,path)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser; 
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview; 
