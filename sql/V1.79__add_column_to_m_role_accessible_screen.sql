ALTER TABLE scm.m_role_accessible_screen
 ADD COLUMN brand varchar(10) NOT NULL,
 ADD COLUMN country_code varchar(10) NOT NULL,
 DROP CONSTRAINT m_role_accessible_screen_pk,
 ADD CONSTRAINT m_role_accessible_screen_pk PRIMARY KEY(role,screen_name,version,brand,country_code);
