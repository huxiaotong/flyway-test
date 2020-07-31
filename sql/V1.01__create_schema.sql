create role if not exists scmadmin with login password 'scmadmin';
create role if not exists scmuser with login password 'scmuser';
create role if not exists scmview with login password 'scmview';

create schema if not exists scm authorization scmadmin;

commit;

