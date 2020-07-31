CREATE
OR REPLACE VIEW scm.v_purge_item (
 lot_number,
 eai_update_datetime,
 eai_update_type,
 eai_send_status,
 eai_send_datetime,
 system_brand_code,
 system_country_code,
 item_code,
 process_type,
 system_business_code
) AS (
 SELECT
  w_purge_item.lot_number,
  w_purge_item.eai_update_datetime,
  w_purge_item.eai_update_type,
  w_purge_item.eai_send_status,
  w_purge_item.eai_send_datetime,
  m_trans_business_code.system_brand_code,
  m_trans_business_code.system_country_code,
  w_purge_item.item_code,
  cast('0' as numeric(1)) process_type,
  m_trans_business_code.system_business_code
 FROM
  scm.w_purge_item,
  scm.m_trans_business_code
 WHERE
  w_purge_item.batch_region = m_trans_business_code.batch_region
  AND w_purge_item.system_business_code = m_trans_business_code.system_business_code
)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser; 
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview; 
