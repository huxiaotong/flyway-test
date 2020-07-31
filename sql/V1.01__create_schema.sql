IF NOT EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'scmadmin') THEN
    create role scmadmin with login password 'scmadmin';
END IF;

IF NOT EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'scmuser') THEN
    create role scmuser with login password 'scmuser';
END IF;

IF NOT EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'scmview') THEN
    create role scmview with login password 'scmview';
END IF;

create schema if not exists scm authorization scmadmin;

commit;

