ALTER TABLE scm.m_menu_screen
 ADD COLUMN brand varchar(10) NOT NULL,
 ADD COLUMN country_code varchar(10) NOT NULL,
 DROP CONSTRAINT m_menu_screen_pk,
 ADD CONSTRAINT m_menu_screen_pk PRIMARY KEY(menu_name,screen_name,version,brand,country_code);
