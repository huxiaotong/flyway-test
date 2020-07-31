CREATE TABLE scm.w_store(
 lot_number varchar(22) NOT NULL,
 eai_update_date varchar(18) NOT NULL,
 eai_update_type varchar(1) NOT NULL,
 eai_send_status varchar(1),
 eai_send_date varchar(18),
 store_code varchar(10) NOT NULL,
 store_name varchar(150) NOT NULL,
 store_name_kana varchar(150),
 address1 varchar(120) NOT NULL,
 address2 varchar(120),
 store_city varchar(120) NOT NULL,
 county varchar(250),
 state_code varchar(4) NOT NULL,
 system_country_code varchar(3) NOT NULL,
 postal_code varchar(10),
 fax_number varchar(20),
 phone_number varchar(20),
 store_type varchar(1) NOT NULL,
 store_open_date timestamptz NOT NULL,
 store_close_date timestamptz,
 renewal_open_date timestamptz,
 vat_region_code numeric(4) NOT NULL,
 channel_id numeric(4) NOT NULL,
 area_code numeric(4) NOT NULL,
 order_start_days numeric(3) NOT NULL,
 order_end_days numeric(3),
 currency_code varchar(3) NOT NULL,
 language_code numeric(6) NOT NULL,
 shipment_logistics_district_code varchar(2),
 store_scale_pattern_code varchar(6),
 existing_store_type_code varchar(6),
 inventory_object_type_code varchar(6),
 register_catinterlock_typecode varchar(6),
 ss_store_manager_store_type_code varchar(6),
 renewal_previous_close_date timestamptz,
 open_term_number numeric(2),
 store_inspection_start_date timestamptz,
 store_inspection_end_date timestamptz,
 close_type_code varchar(6),
 direct_management_fc_store_type_code varchar(6) NOT NULL,
 consignment_store_type_code varchar(6),
 system_machine_removal_date timestamptz,
 sale_channel_type_code varchar(6),
 tsf_out_control_exclusion_type varchar(1) NOT NULL,
 batch_region numeric(2) NOT NULL,
 system_business_code varchar(10) NOT NULL,
  CONSTRAINT w_store_pk
   PRIMARY KEY(lot_number,store_code,eai_update_date)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser; 
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview; 

commit;
