create role scmadmin with login password 'scmadmin';
create role scmuser with login password 'scmuser';
create role scmview with login password 'scmview';

create schema if not exists scm authorization scmadmin;

commit;

