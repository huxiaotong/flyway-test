ALTER USER scmadmin SET search_path TO scm,public;
ALTER USER scmuser SET search_path TO scm,public;
ALTER USER scmview SET search_path TO scm,public;

commit;
