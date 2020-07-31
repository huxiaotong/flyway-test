CREATE
OR REPLACE VIEW scm.v_trans_store_code(
 lot_number,
 eai_update_type,
 store_code,
 store_name,
 view_store_code,
 integrate_db_store_code,
 system_brand_code,
 system_business_code,
 business_name,
 block_code,
 block_name,
 area_code,
 area_name,
 system_country_code,
 country_name,
 batch_region,
 integrate_db_business_code,
 store_device_rmvl_date,
 send_target_store_flag,
 code
) AS (
 SELECT
  w_trans_store_code.lot_number,
  CAST('1' AS varchar(1)) eai_update_type,
  w_trans_store_code.store_code,
  w_trans_store_code.store_name,
  w_trans_store_code.view_store_code,
  w_trans_store_code.integrate_db_store_code,
  w_trans_store_code.system_brand_code,
  w_trans_store_code.system_business_code,
  w_trans_store_code.business_name,
  w_trans_store_code.block_code,
  w_trans_store_code.block_name,
  w_trans_store_code.area_code,
  w_trans_store_code.area_name,
  w_trans_store_code.system_country_code,
  w_trans_store_code.country_name,
  w_trans_store_code.batch_region,
  w_trans_store_code.comb_db_business_code integrate_db_business_code,
  w_trans_store_code.store_device_rmvl_date,
  CAST(w_trans_store_code.send_target_store_type AS boolean) send_target_store_flag,
  m_store_general_purpose.code
 FROM
  scm.w_trans_store_code,
  scm.m_store_general_purpose
 WHERE
  w_trans_store_code.store_code = m_store_general_purpose.store_code
  AND m_store_general_purpose.general_purpose_type = 'time_zone'
)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser;
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview;
