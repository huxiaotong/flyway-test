ALTER TABLE scm.m_screen_path
 ADD COLUMN brand varchar(10) NOT NULL,
 ADD COLUMN country_code varchar(10) NOT NULL,
 DROP CONSTRAINT m_screen_path_pk,
 ADD CONSTRAINT m_screen_path_pk PRIMARY KEY(screen_name,version,brand,country_code,path);
