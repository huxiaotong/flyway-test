CREATE
OR REPLACE VIEW scm.v_tender(
 code,
 lot_number,
 eai_update_datetime,
 eai_update_type,
 eai_send_status,
 eai_send_datetime,
 ims_tender_id,
 tender_name,
 receipt_tender_name,
 ims_tender_group,
 valid_date,
 currency_code,
 kid,
 change_flag,
 current_deposit_flag,
 credit_company_code,
 batch_region,
 store_code
) AS (
 SELECT
  m_store_general_purpose.code,
  w_tender.lot_number,
  w_tender.eai_update_datetime,
  w_tender.eai_update_type,
  w_tender.eai_send_status,
  w_tender.eai_send_datetime,
  w_tender.tender_id,
  w_tender.tender_name,
  w_tender.receipt_tender_name,
  w_tender.tender_group,
  w_tender.valid_date,
  w_tender.currency_code,
  w_tender.kid,
  CAST(w_tender.change_flag AS boolean) change_flag,
  CAST(w_tender.current_deposit_flag AS boolean) current_deposit_flag,
  w_tender.credit_company_code,
  w_tender.batch_region,
  w_tender.store_code
 FROM
  scm.w_tender,
  scm.m_store_general_purpose
 WHERE
  w_tender.store_code = m_store_general_purpose.store_code
  AND m_store_general_purpose.general_purpose_type = 'time_zone'
)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser;
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview;
