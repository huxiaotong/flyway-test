CREATE
OR REPLACE VIEW scm.v_g_class(
 lot_number,
 eai_update_date,
 eai_update_type,
 eai_send_status,
 eai_send_date,
 system_country_code,
 system_brand_code,
 system_business_code,
 g_department_code,
 g_department_name
) AS (
 SELECT
  w_g_class.lot_number,
  w_g_class.eai_update_date,
  w_g_class.eai_update_type,
  w_g_class.eai_send_status,
  w_g_class.eai_send_date,
  m_trans_business_code.system_country_code,
  m_trans_business_code.system_brand_code,
  m_trans_business_code.system_business_code,
  w_g_class.g_department_code,
  w_g_class.g_department_name
 FROM
  scm.w_g_class,
  scm.m_trans_business_code
 WHERE
   w_g_class.batch_region = m_trans_business_code.batch_region
   AND w_g_class.system_brand_code = m_trans_business_code.system_brand_code
)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser;
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview;
