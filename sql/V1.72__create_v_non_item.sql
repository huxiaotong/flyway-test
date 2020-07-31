CREATE
OR REPLACE VIEW scm.v_non_item(
 lot_number,
 eai_update_type,
 system_country_code,
 system_brand_code,
 non_item_code,
 apply_start_date,
 apply_end_date,
 non_item_type,
 pos_item_name,
 unit_retail,
 g_dept_code,
 major_category_code,
 tax_rate,
 tax_type,
 tax_kind,
 discount_flag
) AS (
 SELECT
  w_non_item.lot_number,
  CAST('1' AS varchar(1)) eai_update_type,
  w_non_item.system_country_code,
  w_non_item.system_brand_code,
  w_non_item.non_item_code,
  w_non_item.apply_start_date,
  w_non_item.apply_end_date,
  w_non_item.non_item_type,
  w_non_item.pos_item_name,
  w_non_item.unit_retail,
  w_non_item.g_dept_code,
  w_non_item.major_category_code,
  w_non_item.tax_rate,
  w_non_item.taxation_type,
  w_non_item.tax_kind,
  w_non_item.discount_flag
 FROM
  scm.w_non_item
)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser;
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview;
