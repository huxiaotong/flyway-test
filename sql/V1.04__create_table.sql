CREATE TABLE scm.t_dclose(
 store_code varchar(10) NOT NULL,
 business_date varchar(8) NOT NULL,
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 send_file_count numeric(4),
 processing_flag boolean DEFAULT FALSE NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_dclose_pk
   PRIMARY KEY(store_code,business_date)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.w_dclose_send(
 lot_number varchar(22) NOT NULL,
 store_code varchar(10) NOT NULL,
 business_date varchar(8) NOT NULL,
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 send_file_count numeric(4) NOT NULL,
 processing_flag boolean DEFAULT FALSE NOT NULL,
 ims_create_datetime timestamptz NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT w_dclose_send_pk
   PRIMARY KEY(lot_number,store_code,business_date)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_ims_scm_transaction_detail(
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 item_detail_sub_number numeric(4) NOT NULL,
 scm_transaction_type varchar(6),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 l2_item_code varchar(20),
 display_l2_item_code varchar(20),
 l2_product_name varchar(250),
 l3_item_code varchar(25),
 l3_pos_product_name varchar(250),
 product_classification varchar(6),
 non_md_type varchar(6),
 non_md_code varchar(25),
 service_code varchar(50),
 epc_code varchar(24),
 g_department_code varchar(6),
 major_category_code varchar(4),
 quantity_code varchar(1),
 detail_quantity numeric(16,4),
 item_cost_currency_code varchar(3),
 item_cost_value numeric(24,4),
 initial_selling_price_currency_code varchar(3),
 initial_selling_price numeric(24,4),
 bclass_price_currency_code varchar(3),
 bclass_price numeric(24,4),
 new_price_currency_code varchar(3),
 new_price numeric(24,4),
 retail_unit_price_tax_excluded_currency_code varchar(3),
 retail_unit_price_tax_excluded numeric(24,4),
 retail_unit_price_tax_included_currency_code varchar(3),
 retail_unit_price_tax_included numeric(24,4),
 ims_linkage_retail_unit_price numeric(24,4),
 scm_amount_tax_excluded_currency_code varchar(3),
 scm_amount_tax_excluded numeric(24,4),
 scm_amount_tax_included_currency_code varchar(3),
 scm_amount_tax_included numeric(24,4),
 calculation_unavailable_type varchar(10),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_status varchar(50),
 order_substatus varchar(50),
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 contribution_scm_representative varchar(10),
 customer_id varchar(30),
 bundle_purchase_applicable_quantity numeric(16,4),
 bundle_purchase_applicable_price_currency_code varchar(3),
 bundle_purchase_applicable_price numeric(24,4),
 bundle_purchase_index numeric(3),
 limited_amount_promotion_count numeric(2),
 store_item_discount_type varchar(10),
 store_item_discount_currency_code varchar(3),
 store_item_discount_setting numeric(24,4),
 store_bundle_sale_flag boolean DEFAULT FALSE NOT NULL,
 store_bundle_sale_price_currency_code varchar(3),
 store_bundle_sale_price numeric(24,4),
 set_scm_detail_index numeric(3),
 taxation_type varchar(1),
 tax_system_type varchar(10),
 unit_type varchar(4),
 pos_use_type varchar(1),
 factory_direct_shipment_not_covered varchar(1),
 lot_number varchar(22) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_ims_scm_transaction_detail_pk
   PRIMARY KEY(scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_ims_scm_transaction_detail_KEY1 ON scm.t_ims_scm_transaction_detail(lot_number);

CREATE TABLE scm.t_ims_scm_transaction_discount(
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 promotion_type varchar(4) NOT NULL,
 promotion_no varchar(10) NOT NULL,
 store_discount_type varchar(2) NOT NULL,
 item_discount_sub_number numeric(4) NOT NULL,
 quantity_code varchar(1),
 discount_quantity numeric(2),
 discount_amount_tax_excluded_currency_code varchar(3),
 discount_amount_tax_excluded numeric(24,4),
 discount_amount_tax_included_currency_code varchar(3),
 discount_amount_tax_included numeric(24,4),
 ims_linkage_discount_amount numeric(24,4),
 lot_number varchar(22) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_ims_scm_transaction_discount_pk
   PRIMARY KEY(scm_transaction_id,detail_sub_number,promotion_type,promotion_no,store_discount_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_ims_scm_transaction_discount_KEY1 ON scm.t_ims_scm_transaction_discount(lot_number);

CREATE TABLE scm.t_ims_scm_transaction_header(
 scm_transaction_id varchar(30) NOT NULL,
 integrated_order_id varchar(27) NOT NULL,
 scm_transaction_sub_number numeric(4) NOT NULL,
 store_code varchar(10) NOT NULL,
 data_creation_date varchar(8),
 data_creation_time varchar(6),
 business_date varchar(8),
 cash_register_no numeric(3) NOT NULL,
 receipt_no varchar(4) NOT NULL,
 scm_transaction_type varchar(6),
 return_type numeric(1),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 channel_code varchar(10),
 order_status varchar(50),
 order_substatus varchar(50),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_cancelled_date_time timestamptz,
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 payment_status varchar(50),
 payment_store_code varchar(10),
 payment_store_system_brand_code varchar(4),
 payment_store_system_business_code varchar(10),
 payment_store_system_country_code varchar(3),
 transfer_out_status varchar(50),
 shipment_status varchar(50),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receiving_status varchar(50),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 customer_id varchar(30),
 order_number_for_store_payment varchar(27),
 advance_received_store_code varchar(10),
 advance_received_store_system_brand_code varchar(4),
 advance_received_store_system_business_code varchar(10),
 advance_received_store_system_country_code varchar(3),
 operator_code varchar(18),
 original_transaction_id varchar(30),
 original_cash_register_no numeric(3),
 original_receipt_no varchar(4),
 deposit_currency_code varchar(3),
 deposit_value numeric(24,4),
 change_currency_code varchar(3),
 change_value numeric(24,4),
 receipt_no_for_credit_card_cancellation varchar(11),
 receipt_no_for_credit_card varchar(30),
 receipt_issued_flag boolean DEFAULT FALSE NOT NULL,
 e_receipt_target_flag boolean DEFAULT FALSE NOT NULL,
 processing_company_code varchar(20),
 employee_sale_flag boolean DEFAULT FALSE NOT NULL,
 consistency_scm_flag boolean DEFAULT FALSE NOT NULL,
 corporate_id varchar(20),
 scm_transaction_discount_flag boolean DEFAULT FALSE NOT NULL,
 scm_transaction_discount_amount_rate numeric(24,4),
 token_code varchar(30),
 ims_linkage_order_number varchar(30),
 ims_create_datetime timestamptz NOT NULL,
 lot_number varchar(22) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_ims_scm_transaction_header_pk
   PRIMARY KEY(scm_transaction_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_ims_scm_transaction_header_KEY1 ON scm.t_ims_scm_transaction_header(lot_number);

CREATE TABLE scm.t_ims_scm_transaction_tax(
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 tax_name varchar(120),
 tax_sub_number numeric(4) NOT NULL,
 tax_amount_sign varchar(1),
 tax_amount_currency_code varchar(3),
 ims_linkage_tax_type varchar(10) NOT NULL,
 tax_amount_value numeric(24,4),
 tax_rate numeric(16,4),
 lot_number varchar(22) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_ims_scm_transaction_tax_pk
   PRIMARY KEY(scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_ims_scm_transaction_tax_KEY1 ON scm.t_ims_scm_transaction_tax(lot_number);

CREATE TABLE scm.t_ims_scm_transaction_tender(
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(6) NOT NULL,
 tender_id numeric(6) NOT NULL,
 tender_sub_number numeric(4) NOT NULL,
 payment_sign varchar(1),
 tax_included_payment_amount_currency_code varchar(3),
 tax_included_payment_amount_value numeric(24,4),
 discount_value_currency_code varchar(3),
 discount_value numeric(24,4),
 discount_rate numeric(16,4),
 discount_code_id_corporate_id varchar(30),
 coupon_type varchar(6),
 coupon_discount_amount_setting_currency_code varchar(3),
 coupon_discount_amount_setting_value numeric(24,4),
 coupon_min_usage_amount_threshold_currency_code varchar(3),
 coupon_min_usage_amount_threshold_value numeric(24,4),
 coupon_user_id varchar(30),
 card_no varchar(30),
 credit_approval_code varchar(30),
 credit_processing_serial_number varchar(30),
 credit_payment_type varchar(30),
 credit_payment_count numeric(5),
 credit_affiliated_store_number varchar(30),
 lot_number varchar(22) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_ims_scm_transaction_tender_pk
   PRIMARY KEY(scm_transaction_id,tender_group,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_ims_scm_transaction_tender_KEY1 ON scm.t_ims_scm_transaction_tender(lot_number);

CREATE TABLE scm.t_ims_pay_off_data(
 lot_number varchar(22) NOT NULL,
 eai_update_datetime varchar(18) NOT NULL,
 eai_update_type varchar(1) NOT NULL,
 eai_send_status varchar(1) NOT NULL,
 eai_send_datetime varchar(18) NOT NULL,
 payoff_date varchar(8) NOT NULL,
 payoff_type_code varchar(6) NOT NULL,
 store_code varchar(10) NOT NULL,
 cash_register_no numeric(3) NOT NULL,
 payoff_amount numeric(24,4),
 payoff_quantity numeric(16,4),
 payoff_type_sub_number_code varchar(10) NOT NULL,
 batch_region numeric(2) NOT NULL,
 bih_status varchar(1) NOT NULL,
 bih_transaction_id varchar(30) NOT NULL,
 system_brand_code varchar(4) NOT NULL,
 system_business_code varchar(10),
 system_country_code varchar(3),
 advance_received_store_code varchar(10) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_ims_pay_off_data_pk
   PRIMARY KEY(store_code,cash_register_no,payoff_date,payoff_type_code,payoff_type_sub_number_code,advance_received_store_code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_ims_pay_off_data_KEY1 ON scm.t_ims_pay_off_data(lot_number);

CREATE TABLE scm.m_error_notification_pattern(
 error_type varchar(10) NOT NULL,
 error_notification_pattern varchar(2),
 error_notification_message_id varchar(3),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_error_notification_pattern_pk
   PRIMARY KEY(error_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.m_error_notification_message(
 error_notification_message_id varchar(3) NOT NULL,
 error_output_message varchar(200),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_error_notification_message_pk
   PRIMARY KEY(error_notification_message_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_jobnet_parameter(
 parameter_store_code varchar(10) NOT NULL,
 parameter_payoff_date varchar(10) NOT NULL,
 parameter_business_date varchar(10) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_jobnet_parameter_pk
   PRIMARY KEY(parameter_store_code,parameter_payoff_date,parameter_business_date)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.m_trans_business_code(
 system_country_code varchar(3) NOT NULL,
 system_business_code varchar(10) NOT NULL,
 system_brand_code varchar(4) NOT NULL,
 batch_region numeric(2) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_trans_business_code_pk
   PRIMARY KEY(system_country_code,system_business_code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX m_trans_business_code_KEY1 ON scm.m_trans_business_code(system_brand_code);

CREATE TABLE scm.m_business_country_state_setting(
 system_brand_code varchar(4) NOT NULL,
 system_business_code varchar(10) NOT NULL,
 system_country_code varchar(3) NOT NULL,
 state_code varchar(3) NOT NULL,
 store_code varchar(10) NOT NULL,
 code_l1 varchar(50) NOT NULL,
 code_l2 varchar(50) NOT NULL,
 code_l3 varchar(50) NOT NULL,
 code_value varchar(50) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_business_country_state_setting_pk
   PRIMARY KEY(store_code,code_l1,code_l2,code_l3,code_value)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.m_store_control(
 store_code varchar(10) NOT NULL,
 system_brand_code varchar(4) NOT NULL,
 system_business_code varchar(10),
 system_country_code varchar(3) NOT NULL,
 fc_store_type varchar(1),
 business_date varchar(8),
 closing_store_time varchar(6),
 language_type varchar(2),
 business_end_of_date varchar(8),
 tax_rate numeric(16,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_store_control_pk
   PRIMARY KEY(store_code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.m_type(
 system_brand_code varchar(4) NOT NULL,
 system_country_code varchar(3) NOT NULL,
 code_type varchar(4) NOT NULL,
 code varchar(6) NOT NULL,
 code_name varchar(40),
 code_num numeric(4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_type_pk
   PRIMARY KEY(system_brand_code,system_country_code,code_type,code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.w_type(
 lot_number varchar(22) NOT NULL,
 system_country_code varchar(3) NOT NULL,
 code_type varchar(4) NOT NULL,
 code varchar(6) NOT NULL,
 code_name varchar(40),
 code_num numeric(4),
 eai_update_datetime varchar(18),
 eai_update_type varchar(1),
 eai_send_status varchar(1),
 eai_send_datetime varchar(18),
 system_business_code varchar(10),
 required_type varchar(1),
 batch_region numeric(2),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT w_type_pk
   PRIMARY KEY(lot_number,system_country_code,code_type,code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_transaction_discount(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 promotion_type varchar(4) NOT NULL,
 promotion_no varchar(10) NOT NULL,
 store_discount_type varchar(2) NOT NULL,
 item_discount_sub_number numeric(4) NOT NULL,
 quantity_code varchar(1),
 discount_quantity numeric(2),
 discount_amount_tax_excluded_currency_code varchar(3),
 discount_amount_tax_excluded numeric(24,4),
 discount_amount_tax_included_currency_code varchar(3),
 discount_amount_tax_included numeric(24,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_transaction_discount_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,detail_sub_number,promotion_type,promotion_no,store_discount_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_transaction_detail(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 item_detail_sub_number numeric(4),
 scm_transaction_type varchar(6),
 system_brand_code varchar(4),
 l2_item_code varchar(20),
 display_l2_item_code varchar(20),
 l2_product_name varchar(250),
 l3_item_code varchar(25),
 l3_pos_product_name varchar(250),
 product_classification varchar(6),
 non_md_type varchar(6),
 non_md_code varchar(25),
 service_code varchar(50),
 epc_code varchar(24),
 g_department_code varchar(6),
 major_category_code varchar(4),
 quantity_code varchar(1),
 detail_quantity numeric(16,4),
 item_cost_currency_code varchar(3),
 item_cost_value numeric(24,4),
 initial_selling_price_currency_code varchar(3),
 initial_selling_price numeric(24,4),
 bclass_price_currency_code varchar(3),
 bclass_price numeric(24,4),
 new_price_currency_code varchar(3),
 new_price numeric(24,4),
 retail_unit_price_tax_excluded_currency_code varchar(3),
 retail_unit_price_tax_excluded numeric(24,4),
 retail_unit_price_tax_included_currency_code varchar(3),
 retail_unit_price_tax_included numeric(24,4),
 scm_amount_tax_excluded_currency_code varchar(3),
 scm_amount_tax_excluded numeric(24,4),
 scm_amount_tax_included_currency_code varchar(3),
 scm_amount_tax_included numeric(24,4),
 calculation_unavailable_type varchar(10),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_status varchar(50),
 order_substatus varchar(50),
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 contribution_scm_representative varchar(10),
 customer_id varchar(30),
 bundle_purchase_applicable_quantity numeric(16,4),
 bundle_purchase_applicable_price_currency_code varchar(3),
 bundle_purchase_applicable_price numeric(24,4),
 bundle_purchase_index numeric(3),
 limited_amount_promotion_count numeric(2),
 store_item_discount_type varchar(10),
 store_item_discount_currency_code varchar(3),
 store_item_discount_setting numeric(24,4),
 store_bundle_sale_flag boolean DEFAULT FALSE NOT NULL,
 store_bundle_sale_price_currency_code varchar(3),
 store_bundle_sale_price numeric(24,4),
 set_scm_detail_index numeric(3),
 taxation_type varchar(1),
 tax_system_type varchar(10),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_transaction_detail_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_scm_transaction_detail_KEY1 ON scm.t_scm_transaction_detail(scm_transaction_id,detail_sub_number);

CREATE TABLE scm.t_scm_transaction_detail_info(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 item_detail_sub_number numeric(4),
 key_code varchar(20),
 code_value_1 varchar(25),
 code_value_2 varchar(25),
 code_value_3 varchar(25),
 code_value_4 varchar(25),
 name_1 varchar(250),
 name_2 varchar(250),
 name_3 varchar(250),
 name_4 varchar(250),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_transaction_detail_info_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_transaction_error_detail(
 scm_transaction_error_id varchar(57) NOT NULL,
 integrated_order_id varchar(27),
 scm_transaction_id varchar(30),
 store_code varchar(10),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 error_type varchar(10),
 error_notification_flag boolean DEFAULT FALSE NOT NULL,
 data_alteration_flag boolean DEFAULT FALSE NOT NULL,
 key_info_1 varchar(40),
 key_info_2 varchar(40),
 key_info_3 varchar(40),
 key_info_4 varchar(40),
 key_info_5 varchar(40),
 key_info_6 varchar(40),
 key_info_7 varchar(40),
 key_info_8 varchar(40),
 error_item_id_1 varchar(50),
 error_item_value_1 varchar(100),
 error_item_id_2 varchar(50),
 error_item_value_2 varchar(100),
 error_item_id_3 varchar(50),
 error_item_value_3 varchar(100),
 error_item_id_4 varchar(50),
 error_item_value_4 varchar(100),
 error_item_id_5 varchar(50),
 error_item_value_5 varchar(100),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_transaction_error_detail_pk
   PRIMARY KEY(scm_transaction_error_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_transaction_header(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 integrated_order_id varchar(27) NOT NULL,
 scm_transaction_sub_number numeric(4) NOT NULL,
 store_code varchar(10) NOT NULL,
 data_creation_date_time timestamptz,
 data_creation_business_date varchar(8),
 cash_register_no numeric(3) NOT NULL,
 receipt_no varchar(4) NOT NULL,
 scm_linkage_type numeric(1),
 scm_transaction_type varchar(6),
 return_type numeric(1),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 channel_code varchar(10),
 order_status varchar(50),
 order_substatus varchar(50),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_cancelled_date_time timestamptz,
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 payment_status varchar(50),
 payment_store_code varchar(10),
 payment_store_system_brand_code varchar(4),
 payment_store_system_business_code varchar(10),
 payment_store_system_country_code varchar(3),
 transfer_out_status varchar(50),
 shipment_status varchar(50),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receiving_status varchar(50),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 customer_id varchar(30),
 order_number_for_store_payment varchar(27),
 advance_received_store_code varchar(10),
 advance_received_store_system_brand_code varchar(4),
 advance_received_store_system_business_code varchar(10),
 advance_received_store_system_country_code varchar(3),
 operator_code varchar(18),
 original_transaction_id varchar(30),
 original_cash_register_no numeric(3),
 original_receipt_no varchar(4),
 deposit_currency_code varchar(3),
 deposit_value numeric(24,4),
 change_currency_code varchar(3),
 change_value numeric(24,4),
 receipt_no_for_credit_card_cancellation varchar(11),
 receipt_no_for_credit_card varchar(30),
 receipt_issued_flag boolean DEFAULT FALSE NOT NULL,
 e_receipt_target_flag boolean DEFAULT FALSE NOT NULL,
 processing_company_code varchar(20),
 employee_sale_flag boolean DEFAULT FALSE NOT NULL,
 consistency_scm_flag boolean DEFAULT FALSE NOT NULL,
 corporate_id varchar(20),
 scm_transaction_discount_flag boolean DEFAULT FALSE NOT NULL,
 scm_transaction_discount_amount_rate_currency_code varchar(3),
 scm_transaction_discount_amount_rate numeric(24,4),
 token_code varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_transaction_header_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_scm_transaction_header_KEY1 ON scm.t_scm_transaction_header(scm_transaction_id);

CREATE TABLE scm.t_scm_transaction_total_amount(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 total_type varchar(50) NOT NULL,
 total_amount_sub_number numeric(4) NOT NULL,
 total_amount_tax_excluded_currency_code varchar(3),
 total_amount_tax_excluded_value numeric(24,4),
 total_amount_tax_included_currency_code varchar(3),
 total_amount_tax_included_value numeric(24,4),
 tax_rate numeric(16,4),
 scm_transaction_information_1 varchar(250),
 scm_transaction_information_2 varchar(250),
 scm_transaction_information_3 varchar(250),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_transaction_total_amount_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,total_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_transaction_history(
 transaction_id varchar(57) NOT NULL,
 scm_transaction_data text,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_transaction_history_pk
   PRIMARY KEY(transaction_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_transaction_tender(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(50) NOT NULL,
 tender_id varchar(50) NOT NULL,
 tender_sub_number numeric(4) NOT NULL,
 payment_sign varchar(1),
 tax_included_payment_amount_currency_code varchar(3),
 tax_included_payment_amount_value numeric(24,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_transaction_tender_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,tender_group,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_transaction_tender_info(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(50) NOT NULL,
 tender_id varchar(50) NOT NULL,
 discount_value_currency_code varchar(3),
 discount_value numeric(24,4),
 discount_rate numeric(16,4),
 discount_code_id_corporate_id varchar(30),
 coupon_type varchar(6),
 coupon_discount_amount_setting_currency_code varchar(3),
 coupon_discount_amount_setting_value numeric(24,4),
 coupon_min_usage_amount_threshold_currency_code varchar(3),
 coupon_min_usage_amount_threshold_value numeric(24,4),
 coupon_user_id varchar(30),
 card_no varchar(30),
 credit_approval_code varchar(30),
 credit_processing_serial_number varchar(30),
 credit_payment_type varchar(30),
 credit_payment_count numeric(5),
 credit_affiliated_store_number varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_transaction_tender_info_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,tender_group,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_report_transaction_discount(
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 promotion_type varchar(4) NOT NULL,
 promotion_no varchar(10) NOT NULL,
 store_discount_type varchar(2) NOT NULL,
 item_discount_sub_number numeric(4) NOT NULL,
 quantity_code varchar(1),
 discount_quantity numeric(2),
 discount_amount_tax_excluded_currency_code varchar(3),
 discount_amount_tax_excluded numeric(24,4),
 discount_amount_tax_included_currency_code varchar(3),
 discount_amount_tax_included numeric(24,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_report_transaction_discount_pk
   PRIMARY KEY(scm_transaction_id,detail_sub_number,promotion_type,promotion_no,store_discount_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_report_transaction_detail(
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 item_detail_sub_number numeric(4) NOT NULL,
 scm_transaction_type varchar(6),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 l2_item_code varchar(20),
 display_l2_item_code varchar(20),
 l2_product_name varchar(250),
 l3_item_code varchar(25),
 l3_pos_product_name varchar(250),
 product_classification varchar(6),
 non_md_type varchar(6),
 non_md_code varchar(25),
 service_code varchar(50),
 epc_code varchar(24),
 g_department_code varchar(6),
 major_category_code varchar(4),
 quantity_code varchar(1),
 detail_quantity numeric(16,4),
 item_cost_currency_code varchar(3),
 item_cost_value numeric(24,4),
 initial_selling_price_currency_code varchar(3),
 initial_selling_price numeric(24,4),
 bclass_price_currency_code varchar(3),
 bclass_price numeric(24,4),
 new_price_currency_code varchar(3),
 new_price numeric(24,4),
 retail_unit_price_tax_excluded_currency_code varchar(3),
 retail_unit_price_tax_excluded numeric(24,4),
 retail_unit_price_tax_included_currency_code varchar(3),
 retail_unit_price_tax_included numeric(24,4),
 scm_amount_tax_excluded_currency_code varchar(3),
 scm_amount_tax_excluded numeric(24,4),
 scm_amount_tax_included_currency_code varchar(3),
 scm_amount_tax_included numeric(24,4),
 calculation_unavailable_type varchar(10),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_status varchar(50),
 order_substatus varchar(50),
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 contribution_scm_representative varchar(10),
 customer_id varchar(30),
 bundle_purchase_applicable_quantity numeric(16,4),
 bundle_purchase_applicable_price_currency_code varchar(3),
 bundle_purchase_applicable_price numeric(24,4),
 bundle_purchase_index numeric(3),
 limited_amount_promotion_count numeric(2),
 store_item_discount_type varchar(10),
 store_item_discount_currency_code varchar(3),
 store_item_discount_setting numeric(24,4),
 store_bundle_sale_flag boolean DEFAULT FALSE NOT NULL,
 store_bundle_sale_price_currency_code varchar(3),
 store_bundle_sale_price numeric(24,4),
 set_scm_detail_index numeric(3),
 taxation_type varchar(1),
 tax_system_type varchar(10),
 scm_record_date varchar(8),
 linkage_date varchar(8),
 ims_linkage_flag boolean DEFAULT FALSE NOT NULL,
 inventory_updated_flag boolean DEFAULT FALSE NOT NULL,
 return_complete_flag boolean DEFAULT FALSE NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_report_transaction_detail_pk
   PRIMARY KEY(scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_report_transaction_detail_info(
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 item_detail_sub_number numeric(4) NOT NULL,
 key_code varchar(20),
 code_value_1 varchar(25),
 code_value_2 varchar(25),
 code_value_3 varchar(25),
 code_value_4 varchar(25),
 name_1 varchar(250),
 name_2 varchar(250),
 name_3 varchar(250),
 name_4 varchar(250),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_report_transaction_detail_info_pk
   PRIMARY KEY(scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_report_transaction_header(
 scm_transaction_id varchar(30) NOT NULL,
 integrated_order_id varchar(27) NOT NULL,
 scm_transaction_sub_number numeric(4) NOT NULL,
 store_code varchar(10) NOT NULL,
 data_creation_date_time timestamptz,
 data_creation_business_date varchar(8),
 scm_record_date varchar(8),
 cash_register_no numeric(3) NOT NULL,
 receipt_no varchar(4) NOT NULL,
 scm_transaction_type varchar(6),
 return_type numeric(1),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 channel_code varchar(10),
 order_status varchar(50),
 order_substatus varchar(50),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_cancelled_date_time timestamptz,
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 payment_status varchar(50),
 payment_store_code varchar(10),
 payment_store_system_brand_code varchar(4),
 payment_store_system_business_code varchar(10),
 payment_store_system_country_code varchar(3),
 transfer_out_status varchar(50),
 shipment_status varchar(50),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receiving_status varchar(50),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 customer_id varchar(30),
 order_number_for_store_payment varchar(27),
 advance_received_store_code varchar(10),
 advance_received_store_system_brand_code varchar(4),
 advance_received_store_system_business_code varchar(10),
 advance_received_store_system_country_code varchar(3),
 operator_code varchar(18),
 original_transaction_id varchar(30),
 original_cash_register_no numeric(3),
 original_receipt_no varchar(4),
 deposit_currency_code varchar(3),
 deposit_value numeric(24,4),
 change_currency_code varchar(3),
 change_value numeric(24,4),
 receipt_no_for_credit_card_cancellation varchar(11),
 receipt_no_for_credit_card varchar(30),
 receipt_issued_flag boolean DEFAULT FALSE NOT NULL,
 e_receipt_target_flag boolean DEFAULT FALSE NOT NULL,
 processing_company_code varchar(20),
 employee_sale_flag boolean DEFAULT FALSE NOT NULL,
 consistency_scm_flag boolean DEFAULT FALSE NOT NULL,
 corporate_id varchar(20),
 scm_transaction_discount_flag boolean DEFAULT FALSE NOT NULL,
 scm_transaction_discount_amount_rate_currency_code varchar(3),
 scm_transaction_discount_amount_rate numeric(24,4),
 token_code varchar(30),
 ims_linkage_flag boolean DEFAULT FALSE NOT NULL,
 ims_linkage_date varchar(8),
 hourly_scm_by_item_summary_flag boolean DEFAULT FALSE NOT NULL,
 hourly_summary_flag boolean DEFAULT FALSE NOT NULL,
 transaction_summary_flag boolean DEFAULT FALSE NOT NULL,
 department_summary_flag boolean DEFAULT FALSE NOT NULL,
 inventory_updated_flag boolean DEFAULT FALSE NOT NULL,
 heming_linkage_flag boolean DEFAULT FALSE NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_report_transaction_header_pk
   PRIMARY KEY(scm_transaction_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_report_transaction_total_amount(
 scm_transaction_id varchar(30) NOT NULL,
 total_type varchar(50) NOT NULL,
 total_amount_sub_number numeric(4) NOT NULL,
 total_amount_tax_excluded_currency_code varchar(3),
 total_amount_tax_excluded_value numeric(24,4),
 total_amount_tax_included_currency_code varchar(3),
 total_amount_tax_included_value numeric(24,4),
 tax_rate numeric(16,4),
 scm_transaction_information_1 varchar(250),
 scm_transaction_information_2 varchar(250),
 scm_transaction_information_3 varchar(250),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_report_transaction_total_amount_pk
   PRIMARY KEY(scm_transaction_id,total_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_report_transaction_tender(
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(6) NOT NULL,
 tender_id numeric(6) NOT NULL,
 tender_sub_number numeric(4) NOT NULL,
 payment_sign varchar(1),
 tax_included_payment_amount_currency_code varchar(3),
 tax_included_payment_amount_value numeric(24,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_report_transaction_tender_pk
   PRIMARY KEY(scm_transaction_id,tender_group,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_report_transaction_tender_info(
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(6) NOT NULL,
 tender_id numeric(6) NOT NULL,
 discount_value_currency_code varchar(3),
 discount_value numeric(24,4),
 discount_rate numeric(16,4),
 discount_code_id_corporate_id varchar(30),
 coupon_type varchar(6),
 coupon_discount_amount_setting_currency_code varchar(3),
 coupon_discount_amount_setting_value numeric(24,4),
 coupon_min_usage_amount_threshold_currency_code varchar(3),
 coupon_min_usage_amount_threshold_value numeric(24,4),
 coupon_user_id varchar(30),
 card_no varchar(30),
 credit_approval_code varchar(30),
 credit_processing_serial_number varchar(30),
 credit_payment_type varchar(30),
 credit_payment_count numeric(5),
 credit_affiliated_store_number varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_report_transaction_tender_info_pk
   PRIMARY KEY(scm_transaction_id,tender_group,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_report_transaction_order_information(
 integrated_order_id varchar(27) NOT NULL,
 order_barcode_number varchar(23),
 store_code varchar(10) NOT NULL,
 system_brand_code varchar(4) NOT NULL,
 system_business_code varchar(10),
 system_country_code varchar(3) NOT NULL,
 channel_code varchar(10) NOT NULL,
 customer_id varchar(30),
 order_confirmation_business_date varchar(8),
 order_confirmation_date_time timestamptz,
 data_alteration_scm_linkage_type numeric(1),
 data_alteration_backbone_linkage_type numeric(1),
 data_alteration_flag boolean DEFAULT FALSE NOT NULL,
 data_alteration_user_id varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_report_transaction_order_information_pk
   PRIMARY KEY(integrated_order_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_report_transaction_tax(
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 tax_group varchar(10) NOT NULL,
 tax_name varchar(120),
 tax_sub_number numeric(4) NOT NULL,
 tax_amount_sign varchar(1),
 tax_amount_currency_code varchar(3),
 tax_amount_value numeric(24,4),
 tax_rate numeric(16,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_report_transaction_tax_pk
   PRIMARY KEY(scm_transaction_id,detail_sub_number,tax_group)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_error_scm_transaction_discount(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 promotion_type varchar(4) NOT NULL,
 promotion_no varchar(10) NOT NULL,
 store_discount_type varchar(2) NOT NULL,
 item_discount_sub_number numeric(4),
 quantity_code varchar(1),
 discount_quantity numeric(2),
 discount_amount_tax_excluded_currency_code varchar(3),
 discount_amount_tax_excluded numeric(24,4),
 discount_amount_tax_included_currency_code varchar(3),
 discount_amount_tax_included numeric(24,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_error_scm_transaction_discount_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number,promotion_type,promotion_no,store_discount_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_error_scm_transaction_detail(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 item_detail_sub_number numeric(4),
 scm_transaction_type varchar(6),
 system_brand_code varchar(4),
 l2_item_code varchar(20),
 display_l2_item_code varchar(20),
 l2_product_name varchar(250),
 l3_item_code varchar(25),
 l3_pos_product_name varchar(250),
 product_classification varchar(6),
 non_md_type varchar(6),
 non_md_code varchar(25),
 service_code varchar(50),
 epc_code varchar(24),
 g_department_code varchar(6),
 major_category_code varchar(4),
 quantity_code varchar(1),
 detail_quantity numeric(16,4),
 item_cost_currency_code varchar(3),
 item_cost_value numeric(24,4),
 initial_selling_price_currency_code varchar(3),
 initial_selling_price numeric(24,4),
 bclass_price_currency_code varchar(3),
 bclass_price numeric(24,4),
 new_price_currency_code varchar(3),
 new_price numeric(24,4),
 retail_unit_price_tax_excluded_currency_code varchar(3),
 retail_unit_price_tax_excluded numeric(24,4),
 retail_unit_price_tax_included_currency_code varchar(3),
 retail_unit_price_tax_included numeric(24,4),
 scm_amount_tax_excluded_currency_code varchar(3),
 scm_amount_tax_excluded numeric(24,4),
 scm_amount_tax_included_currency_code varchar(3),
 scm_amount_tax_included numeric(24,4),
 calculation_unavailable_type varchar(10),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_status varchar(50),
 order_substatus varchar(50),
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 contribution_scm_representative varchar(10),
 customer_id varchar(30),
 bundle_purchase_applicable_quantity numeric(16,4),
 bundle_purchase_applicable_price_currency_code varchar(3),
 bundle_purchase_applicable_price numeric(24,4),
 bundle_purchase_index numeric(3),
 limited_amount_promotion_count numeric(2),
 store_item_discount_type varchar(10),
 store_item_discount_currency_code varchar(3),
 store_item_discount_setting numeric(24,4),
 store_bundle_sale_flag boolean DEFAULT FALSE NOT NULL,
 store_bundle_sale_price_currency_code varchar(3),
 store_bundle_sale_price numeric(24,4),
 set_scm_detail_index numeric(3),
 taxation_type varchar(1),
 tax_system_type varchar(10),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_error_scm_transaction_detail_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_error_scm_transaction_detail_info(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 item_detail_sub_number numeric(4),
 key_code varchar(20),
 code_value_1 varchar(25),
 code_value_2 varchar(25),
 code_value_3 varchar(25),
 code_value_4 varchar(25),
 name_1 varchar(250),
 name_2 varchar(250),
 name_3 varchar(250),
 name_4 varchar(250),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_error_scm_transaction_detail_info_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_error_scm_transaction_header(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 integrated_order_id varchar(27),
 scm_transaction_sub_number numeric(4),
 store_code varchar(10),
 data_creation_date_time timestamptz,
 data_creation_business_date varchar(8),
 cash_register_no numeric(3),
 receipt_no varchar(4),
 scm_linkage_type numeric(1),
 scm_transaction_type varchar(6),
 return_type numeric(1),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 channel_code varchar(10),
 order_status varchar(50),
 order_substatus varchar(50),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_cancelled_date_time timestamptz,
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 payment_status varchar(50),
 payment_store_code varchar(10),
 payment_store_system_brand_code varchar(4),
 payment_store_system_business_code varchar(10),
 payment_store_system_country_code varchar(3),
 transfer_out_status varchar(50),
 shipment_status varchar(50),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receiving_status varchar(50),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 customer_id varchar(30),
 order_number_for_store_payment varchar(27),
 advance_received_store_code varchar(10),
 advance_received_store_system_brand_code varchar(4),
 advance_received_store_system_business_code varchar(10),
 advance_received_store_system_country_code varchar(3),
 operator_code varchar(18),
 original_transaction_id varchar(30),
 original_cash_register_no numeric(3),
 original_receipt_no varchar(4),
 deposit_currency_code varchar(3),
 deposit_value numeric(24,4),
 change_currency_code varchar(3),
 change_value numeric(24,4),
 receipt_no_for_credit_card_cancellation varchar(11),
 receipt_no_for_credit_card varchar(30),
 receipt_issued_flag boolean DEFAULT FALSE NOT NULL,
 e_receipt_target_flag boolean DEFAULT FALSE NOT NULL,
 processing_company_code varchar(20),
 employee_sale_flag boolean DEFAULT FALSE NOT NULL,
 consistency_scm_flag boolean DEFAULT FALSE NOT NULL,
 corporate_id varchar(20),
 scm_transaction_discount_flag boolean DEFAULT FALSE NOT NULL,
 scm_transaction_discount_amount_rate_currency_code varchar(3),
 scm_transaction_discount_amount_rate numeric(24,4),
 token_code varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_error_scm_transaction_header_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_error_scm_transaction_total_amount(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 total_type varchar(50) NOT NULL,
 total_amount_sub_number numeric(4),
 total_amount_tax_excluded_currency_code varchar(3),
 total_amount_tax_excluded_value numeric(24,4),
 total_amount_tax_included_currency_code varchar(3),
 total_amount_tax_included_value numeric(24,4),
 tax_rate numeric(16,4),
 scm_transaction_information_1 varchar(250),
 scm_transaction_information_2 varchar(250),
 scm_transaction_information_3 varchar(250),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_error_scm_transaction_total_amount_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,total_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_error_scm_transaction_tender(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(50) NOT NULL,
 tender_id varchar(50) NOT NULL,
 tender_sub_number numeric(4),
 payment_sign varchar(1),
 tax_included_payment_amount_currency_code varchar(3),
 tax_included_payment_amount_value numeric(24,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_error_scm_transaction_tender_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,tender_group,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_error_scm_transaction_tender_info(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(50) NOT NULL,
 tender_id varchar(50) NOT NULL,
 discount_value_currency_code varchar(3),
 discount_value numeric(24,4),
 discount_rate numeric(16,4),
 discount_code_id_corporate_id varchar(30),
 coupon_type varchar(6),
 coupon_discount_amount_setting_currency_code varchar(3),
 coupon_discount_amount_setting_value numeric(24,4),
 coupon_min_usage_amount_threshold_currency_code varchar(3),
 coupon_min_usage_amount_threshold_value numeric(24,4),
 coupon_user_id varchar(30),
 card_no varchar(30),
 credit_approval_code varchar(30),
 credit_processing_serial_number varchar(30),
 credit_payment_type varchar(30),
 credit_payment_count numeric(5),
 credit_affiliated_store_number varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_error_scm_transaction_tender_info_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,tender_group,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_error_scm_order_information(
 transaction_id varchar(57) NOT NULL,
 integrated_order_id varchar(27) NOT NULL,
 order_barcode_number varchar(23),
 store_code varchar(10),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 channel_code varchar(10),
 update_type varchar(10),
 customer_id varchar(30),
 order_confirmation_business_date varchar(8),
 order_confirmation_date_time timestamptz,
 error_check_type numeric(1),
 data_alteration_scm_linkage_type numeric(1),
 data_alteration_backbone_linkage_type numeric(1),
 data_alteration_editing_flag boolean DEFAULT FALSE NOT NULL,
 data_alteration_user_id varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_error_scm_order_information_pk
   PRIMARY KEY(transaction_id,integrated_order_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_error_scm_transaction_tax(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 tax_group varchar(10) NOT NULL,
 tax_sub_number numeric(4),
 tax_amount_sign varchar(1),
 tax_amount_currency_code varchar(3),
 tax_amount_value numeric(24,4),
 tax_rate numeric(16,4),
 tax_name varchar(120),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_error_scm_transaction_tax_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number,tax_group)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_error_evacuation_scm_transaction_discount(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 promotion_type varchar(4) NOT NULL,
 promotion_no varchar(10) NOT NULL,
 store_discount_type varchar(2) NOT NULL,
 scm_transaction_error_id varchar(57),
 item_discount_sub_number numeric(4),
 quantity_code varchar(1),
 discount_quantity numeric(2),
 discount_amount_tax_excluded_currency_code varchar(3),
 discount_amount_tax_excluded numeric(24,4),
 discount_amount_tax_included_currency_code varchar(3),
 discount_amount_tax_included numeric(24,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_error_evacuation_scm_transaction_discount_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number,promotion_type,promotion_no,store_discount_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_error_evacuation_scm_transaction_discount_KEY1 ON scm.t_error_evacuation_scm_transaction_discount(scm_transaction_error_id);

CREATE TABLE scm.t_error_evacuation_scm_transaction_detail(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 scm_transaction_error_id varchar(57),
 item_detail_sub_number numeric(4),
 scm_transaction_type varchar(6),
 system_brand_code varchar(4),
 l2_item_code varchar(20),
 display_l2_item_code varchar(20),
 l2_product_name varchar(250),
 l3_item_code varchar(25),
 l3_pos_product_name varchar(250),
 product_classification varchar(6),
 non_md_type varchar(6),
 non_md_code varchar(25),
 service_code varchar(50),
 epc_code varchar(24),
 g_department_code varchar(6),
 major_category_code varchar(4),
 quantity_code varchar(1),
 detail_quantity numeric(16,4),
 item_cost_currency_code varchar(3),
 item_cost_value numeric(24,4),
 initial_selling_price_currency_code varchar(3),
 initial_selling_price numeric(24,4),
 bclass_price_currency_code varchar(3),
 bclass_price numeric(24,4),
 new_price_currency_code varchar(3),
 new_price numeric(24,4),
 retail_unit_price_tax_excluded_currency_code varchar(3),
 retail_unit_price_tax_excluded numeric(24,4),
 retail_unit_price_tax_included_currency_code varchar(3),
 retail_unit_price_tax_included numeric(24,4),
 scm_amount_tax_excluded_currency_code varchar(3),
 scm_amount_tax_excluded numeric(24,4),
 scm_amount_tax_included_currency_code varchar(3),
 scm_amount_tax_included numeric(24,4),
 calculation_unavailable_type varchar(10),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_status varchar(50),
 order_substatus varchar(50),
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 contribution_scm_representative varchar(10),
 customer_id varchar(30),
 bundle_purchase_applicable_quantity numeric(16,4),
 bundle_purchase_applicable_price_currency_code varchar(3),
 bundle_purchase_applicable_price numeric(24,4),
 bundle_purchase_index numeric(3),
 limited_amount_promotion_count numeric(2),
 store_item_discount_type varchar(10),
 store_item_discount_currency_code varchar(3),
 store_item_discount_setting numeric(24,4),
 store_bundle_sale_flag boolean DEFAULT FALSE NOT NULL,
 store_bundle_sale_price_currency_code varchar(3),
 store_bundle_sale_price numeric(24,4),
 set_scm_detail_index numeric(3),
 taxation_type varchar(1),
 tax_system_type varchar(10),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_error_evacuation_scm_transaction_detail_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_error_evacuation_scm_transaction_detail_KEY1 ON scm.t_error_evacuation_scm_transaction_detail(scm_transaction_error_id);

CREATE TABLE scm.t_error_evacuation_scm_transaction_detail_info(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 scm_transaction_error_id varchar(57),
 item_detail_sub_number numeric(4),
 key_code varchar(20),
 code_value_1 varchar(25),
 code_value_2 varchar(25),
 code_value_3 varchar(25),
 code_value_4 varchar(25),
 name_1 varchar(250),
 name_2 varchar(250),
 name_3 varchar(250),
 name_4 varchar(250),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_error_evacuation_scm_transaction_detail_info_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_error_evacuation_scm_transaction_detail_info_KEY1 ON scm.t_error_evacuation_scm_transaction_detail_info(scm_transaction_error_id);

CREATE TABLE scm.t_error_evacuation_scm_transaction_header(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 scm_transaction_error_id varchar(57),
 integrated_order_id varchar(27),
 scm_transaction_sub_number numeric(4),
 store_code varchar(10),
 data_creation_date_time timestamptz,
 data_creation_business_date varchar(8),
 cash_register_no numeric(3),
 receipt_no varchar(4),
 scm_linkage_type numeric(1),
 scm_transaction_type varchar(6),
 return_type numeric(1),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 channel_code varchar(10),
 order_status varchar(50),
 order_substatus varchar(50),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_cancelled_date_time timestamptz,
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 payment_status varchar(50),
 payment_store_code varchar(10),
 payment_store_system_brand_code varchar(4),
 payment_store_system_business_code varchar(10),
 payment_store_system_country_code varchar(3),
 transfer_out_status varchar(50),
 shipment_status varchar(50),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receiving_status varchar(50),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 customer_id varchar(30),
 order_number_for_store_payment varchar(27),
 advance_received_store_code varchar(10),
 advance_received_store_system_brand_code varchar(4),
 advance_received_store_system_business_code varchar(10),
 advance_received_store_system_country_code varchar(3),
 operator_code varchar(18),
 original_transaction_id varchar(30),
 original_cash_register_no numeric(3),
 original_receipt_no varchar(4),
 deposit_currency_code varchar(3),
 deposit_value numeric(24,4),
 change_currency_code varchar(3),
 change_value numeric(24,4),
 receipt_no_for_credit_card_cancellation varchar(11),
 receipt_no_for_credit_card varchar(30),
 receipt_issued_flag boolean DEFAULT FALSE NOT NULL,
 e_receipt_target_flag boolean DEFAULT FALSE NOT NULL,
 processing_company_code varchar(20),
 employee_sale_flag boolean DEFAULT FALSE NOT NULL,
 consistency_scm_flag boolean DEFAULT FALSE NOT NULL,
 corporate_id varchar(20),
 scm_transaction_discount_flag boolean DEFAULT FALSE NOT NULL,
 scm_transaction_discount_amount_rate_currency_code varchar(3),
 scm_transaction_discount_amount_rate numeric(24,4),
 token_code varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_error_evacuation_scm_transaction_header_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_error_evacuation_scm_transaction_header_KEY1 ON scm.t_error_evacuation_scm_transaction_header(scm_transaction_error_id);

CREATE TABLE scm.t_error_evacuation_scm_transaction_total_amount(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 total_type varchar(50) NOT NULL,
 scm_transaction_error_id varchar(57),
 total_amount_sub_number numeric(4),
 total_amount_tax_excluded_currency_code varchar(3),
 total_amount_tax_excluded_value numeric(24,4),
 total_amount_tax_included_currency_code varchar(3),
 total_amount_tax_included_value numeric(24,4),
 tax_rate numeric(16,4),
 scm_transaction_information_1 varchar(250),
 scm_transaction_information_2 varchar(250),
 scm_transaction_information_3 varchar(250),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_error_evacuation_scm_transaction_total_amount_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,total_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_error_evacuation_scm_transaction_total_amount_KEY1 ON scm.t_error_evacuation_scm_transaction_total_amount(scm_transaction_error_id);

CREATE TABLE scm.t_error_evacuation_scm_transaction_tender(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(50) NOT NULL,
 tender_id varchar(50) NOT NULL,
 scm_transaction_error_id varchar(57),
 tender_sub_number numeric(4),
 payment_sign varchar(1),
 tax_included_payment_amount_currency_code varchar(3),
 tax_included_payment_amount_value numeric(24,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_error_evacuation_scm_transaction_tender_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,tender_group,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_error_evacuation_scm_transaction_tender_KEY1 ON scm.t_error_evacuation_scm_transaction_tender(scm_transaction_error_id);

CREATE TABLE scm.t_error_evacuation_scm_transaction_tender_info(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(50) NOT NULL,
 tender_id varchar(50) NOT NULL,
 scm_transaction_error_id varchar(57),
 discount_value_currency_code varchar(3),
 discount_value numeric(24,4),
 discount_rate numeric(16,4),
 discount_code_id_corporate_id varchar(30),
 coupon_type varchar(6),
 coupon_discount_amount_setting_currency_code varchar(3),
 coupon_discount_amount_setting_value numeric(24,4),
 coupon_min_usage_amount_threshold_currency_code varchar(3),
 coupon_min_usage_amount_threshold_value numeric(24,4),
 coupon_user_id varchar(30),
 card_no varchar(30),
 credit_approval_code varchar(30),
 credit_processing_serial_number varchar(30),
 credit_payment_type varchar(30),
 credit_payment_count numeric(5),
 credit_affiliated_store_number varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_error_evacuation_scm_transaction_tender_info_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,tender_group,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_error_evacuation_scm_transaction_tender_info_KEY1 ON scm.t_error_evacuation_scm_transaction_tender_info(scm_transaction_error_id);

CREATE TABLE scm.t_error_evacuation_scm_order_information(
 transaction_id varchar(57) NOT NULL,
 integrated_order_id varchar(27) NOT NULL,
 scm_transaction_error_id varchar(57),
 order_barcode_number varchar(23),
 store_code varchar(10),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 channel_code varchar(10),
 update_type varchar(10),
 customer_id varchar(30),
 order_confirmation_business_date varchar(8),
 order_confirmation_date_time timestamptz,
 error_check_type numeric(1),
 data_alteration_scm_linkage_type numeric(1),
 data_alteration_backbone_linkage_type numeric(1),
 data_alteration_editing_flag boolean DEFAULT FALSE NOT NULL,
 data_alteration_user_id varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_error_evacuation_scm_order_information_pk
   PRIMARY KEY(transaction_id,integrated_order_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_error_evacuation_scm_order_information_KEY1 ON scm.t_error_evacuation_scm_order_information(scm_transaction_error_id);

CREATE TABLE scm.t_error_evacuation_scm_transaction_tax(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 tax_group varchar(10) NOT NULL,
 scm_transaction_error_id varchar(57),
 tax_sub_number numeric(4),
 tax_amount_sign varchar(1),
 tax_amount_currency_code varchar(3),
 tax_amount_value numeric(24,4),
 tax_rate numeric(16,4),
 tax_name varchar(120),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_error_evacuation_scm_transaction_tax_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number,tax_group)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_error_evacuation_scm_transaction_tax_KEY1 ON scm.t_error_evacuation_scm_transaction_tax(scm_transaction_error_id);

CREATE TABLE scm.t_transaction_inquiry_scm_transaction_discount(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 promotion_type varchar(4) NOT NULL,
 promotion_no varchar(10) NOT NULL,
 store_discount_type varchar(2) NOT NULL,
 item_discount_sub_number numeric(4) NOT NULL,
 quantity_code varchar(1),
 discount_quantity numeric(2),
 discount_amount_tax_excluded_currency_code varchar(3),
 discount_amount_tax_excluded numeric(24,4),
 discount_amount_tax_included_currency_code varchar(3),
 discount_amount_tax_included numeric(24,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_transaction_inquiry_scm_transaction_discount_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,detail_sub_number,promotion_type,promotion_no,store_discount_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_transaction_inquiry_scm_transaction_detail(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 item_detail_sub_number numeric(4) NOT NULL,
 scm_transaction_type varchar(6),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 l2_item_code varchar(20),
 display_l2_item_code varchar(20),
 l2_product_name varchar(250),
 l3_item_code varchar(25),
 l3_pos_product_name varchar(250),
 product_classification varchar(6),
 non_md_type varchar(6),
 non_md_code varchar(25),
 service_code varchar(50),
 epc_code varchar(24),
 g_department_code varchar(6),
 major_category_code varchar(4),
 quantity_code varchar(1),
 detail_quantity numeric(16,4),
 item_cost_currency_code varchar(3),
 item_cost_value numeric(24,4),
 initial_selling_price_currency_code varchar(3),
 initial_selling_price numeric(24,4),
 bclass_price_currency_code varchar(3),
 bclass_price numeric(24,4),
 new_price_currency_code varchar(3),
 new_price numeric(24,4),
 retail_unit_price_tax_excluded_currency_code varchar(3),
 retail_unit_price_tax_excluded numeric(24,4),
 retail_unit_price_tax_included_currency_code varchar(3),
 retail_unit_price_tax_included numeric(24,4),
 scm_amount_tax_excluded_currency_code varchar(3),
 scm_amount_tax_excluded numeric(24,4),
 scm_amount_tax_included_currency_code varchar(3),
 scm_amount_tax_included numeric(24,4),
 calculation_unavailable_type varchar(10),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_status varchar(50),
 order_substatus varchar(50),
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 contribution_scm_representative varchar(10),
 customer_id varchar(30),
 bundle_purchase_applicable_quantity numeric(16,4),
 bundle_purchase_applicable_price_currency_code varchar(3),
 bundle_purchase_applicable_price numeric(24,4),
 bundle_purchase_index numeric(3),
 limited_amount_promotion_count numeric(2),
 store_item_discount_type varchar(10),
 store_item_discount_currency_code varchar(3),
 store_item_discount_setting numeric(24,4),
 store_bundle_sale_flag boolean DEFAULT FALSE NOT NULL,
 store_bundle_sale_price_currency_code varchar(3),
 store_bundle_sale_price numeric(24,4),
 set_scm_detail_index numeric(3),
 taxation_type varchar(1),
 tax_system_type varchar(10),
 return_complete_flag boolean DEFAULT FALSE NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_transaction_inquiry_scm_transaction_detail_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_transaction_inquiry_scm_transaction_detail_KEY1 ON scm.t_transaction_inquiry_scm_transaction_detail(scm_transaction_id,detail_sub_number);

CREATE TABLE scm.t_transaction_inquiry_scm_transaction_detail_info(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 item_detail_sub_number numeric(4) NOT NULL,
 key_code varchar(20),
 code_value_1 varchar(25),
 code_value_2 varchar(25),
 code_value_3 varchar(25),
 code_value_4 varchar(25),
 name_1 varchar(250),
 name_2 varchar(250),
 name_3 varchar(250),
 name_4 varchar(250),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_transaction_inquiry_scm_transaction_detail_info_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,detail_sub_number)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_transaction_inquiry_scm_transaction_header(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 integrated_order_id varchar(27) NOT NULL,
 scm_transaction_sub_number numeric(4) NOT NULL,
 store_code varchar(10) NOT NULL,
 data_creation_date_time timestamptz,
 data_creation_business_date varchar(8),
 cash_register_no numeric(3) NOT NULL,
 receipt_no varchar(4) NOT NULL,
 scm_linkage_type numeric(1),
 scm_transaction_type varchar(6),
 return_type numeric(1),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 channel_code varchar(10),
 order_status varchar(50),
 order_substatus varchar(50),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_cancelled_date_time timestamptz,
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 payment_status varchar(50),
 payment_store_code varchar(10),
 payment_store_system_brand_code varchar(4),
 payment_store_system_business_code varchar(10),
 payment_store_system_country_code varchar(3),
 transfer_out_status varchar(50),
 shipment_status varchar(50),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receiving_status varchar(50),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 customer_id varchar(30),
 order_number_for_store_payment varchar(27),
 advance_received_store_code varchar(10),
 advance_received_store_system_brand_code varchar(4),
 advance_received_store_system_business_code varchar(10),
 advance_received_store_system_country_code varchar(3),
 operator_code varchar(18),
 original_transaction_id varchar(30),
 original_cash_register_no numeric(3),
 original_receipt_no varchar(4),
 deposit_currency_code varchar(3),
 deposit_value numeric(24,4),
 change_currency_code varchar(3),
 change_value numeric(24,4),
 receipt_no_for_credit_card_cancellation varchar(11),
 receipt_no_for_credit_card varchar(30),
 receipt_issued_flag boolean DEFAULT FALSE NOT NULL,
 e_receipt_target_flag boolean DEFAULT FALSE NOT NULL,
 processing_company_code varchar(20),
 employee_sale_flag boolean DEFAULT FALSE NOT NULL,
 consistency_scm_flag boolean DEFAULT FALSE NOT NULL,
 corporate_id varchar(20),
 scm_transaction_discount_flag boolean DEFAULT FALSE NOT NULL,
 scm_transaction_discount_amount_rate_currency_code varchar(3),
 scm_transaction_discount_amount_rate numeric(24,4),
 token_code varchar(30),
 return_complete_flag boolean DEFAULT FALSE NOT NULL,
 cancelled_flag boolean DEFAULT FALSE NOT NULL,
 heming_linkage_flag boolean DEFAULT FALSE NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_transaction_inquiry_scm_transaction_header_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_transaction_inquiry_scm_transaction_header_KEY1 ON scm.t_transaction_inquiry_scm_transaction_header(scm_transaction_id);

CREATE TABLE scm.t_transaction_inquiry_scm_transaction_total_amount(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 total_type varchar(50) NOT NULL,
 total_amount_sub_number numeric(4) NOT NULL,
 total_amount_tax_excluded_currency_code varchar(3),
 total_amount_tax_excluded_value numeric(24,4),
 total_amount_tax_included_currency_code varchar(3),
 total_amount_tax_included_value numeric(24,4),
 tax_rate numeric(16,4),
 scm_transaction_information_1 varchar(250),
 scm_transaction_information_2 varchar(250),
 scm_transaction_information_3 varchar(250),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_transaction_inquiry_scm_transaction_total_amount_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,total_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_transaction_inquiry_scm_transaction_tender(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(50) NOT NULL,
 tender_id varchar(50) NOT NULL,
 tender_sub_number numeric(4) NOT NULL,
 payment_sign varchar(1),
 tax_included_payment_amount_currency_code varchar(3),
 tax_included_payment_amount_value numeric(24,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_transaction_inquiry_scm_transaction_tender_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,tender_group,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_transaction_inquiry_scm_transaction_tender_info(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(50) NOT NULL,
 tender_id varchar(50) NOT NULL,
 discount_value_currency_code varchar(3),
 discount_value numeric(24,4),
 discount_rate numeric(16,4),
 discount_code_id_corporate_id varchar(30),
 coupon_type varchar(6),
 coupon_discount_amount_setting_currency_code varchar(3),
 coupon_discount_amount_setting_value numeric(24,4),
 coupon_min_usage_amount_threshold_currency_code varchar(3),
 coupon_min_usage_amount_threshold_value numeric(24,4),
 coupon_user_id varchar(30),
 card_no varchar(30),
 credit_approval_code varchar(30),
 credit_processing_serial_number varchar(30),
 credit_payment_type varchar(30),
 credit_payment_count numeric(5),
 credit_affiliated_store_number varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_transaction_inquiry_scm_transaction_tender_info_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,tender_group,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_transaction_inquiry_order_information(
 integrated_order_id varchar(27) NOT NULL,
 order_barcode_number varchar(23),
 store_code varchar(10) NOT NULL,
 system_brand_code varchar(4) NOT NULL,
 system_business_code varchar(10),
 system_country_code varchar(3) NOT NULL,
 channel_code varchar(10) NOT NULL,
 customer_id varchar(30),
 order_confirmation_business_date varchar(8),
 order_confirmation_date_time timestamptz,
 data_alteration_scm_linkage_type numeric(1),
 data_alteration_backbone_linkage_type numeric(1),
 data_alteration_flag boolean DEFAULT FALSE NOT NULL,
 data_alteration_user_id varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_transaction_inquiry_order_information_pk
   PRIMARY KEY(integrated_order_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_transaction_inquiry_scm_transaction_tax(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 tax_group varchar(10) NOT NULL,
 tax_name varchar(120),
 tax_sub_number numeric(4) NOT NULL,
 tax_amount_sign varchar(1),
 tax_amount_currency_code varchar(3),
 tax_amount_value numeric(24,4),
 tax_rate numeric(16,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_transaction_inquiry_scm_transaction_tax_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,detail_sub_number,tax_group)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.m_trans_store_code(
 store_code varchar(10) NOT NULL,
 store_name varchar(150) NOT NULL,
 view_store_code varchar(20),
 integrate_db_store_code varchar(20),
 system_brand_code varchar(4) NOT NULL,
 system_business_code varchar(10) NOT NULL,
 business_name varchar(120) NOT NULL,
 block_code varchar(10) NOT NULL,
 block_name varchar(120) NOT NULL,
 area_code varchar(10) NOT NULL,
 area_name varchar(120) NOT NULL,
 system_country_code varchar(3) NOT NULL,
 country_name varchar(120) NOT NULL,
 batch_region numeric(2) NOT NULL,
 integrate_db_business_code varchar(3),
 store_device_rmvl_date timestamptz,
 send_target_store_flag boolean DEFAULT FALSE NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_trans_store_code_pk
   PRIMARY KEY(store_code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.m_store(
 store_code varchar(10) NOT NULL,
 store_name varchar(150) NOT NULL,
 store_name_kana varchar(150),
 store_addr1 varchar(120) NOT NULL,
 store_addr2 varchar(120),
 store_city varchar(120) NOT NULL,
 county varchar(250),
 state_code varchar(4),
 system_country_code varchar(3) NOT NULL,
 postal_code varchar(10),
 fax_number varchar(20),
 phone_number varchar(20),
 store_type_code varchar(1) NOT NULL,
 open_date timestamptz NOT NULL,
 close_date timestamptz,
 renewal_open_date timestamptz,
 vat_region_code varchar(4),
 channel_id varchar(4),
 area_code varchar(10),
 order_start_date numeric(3) NOT NULL,
 order_end_date numeric(3),
 currency_code varchar(3) NOT NULL,
 language_code varchar(6) NOT NULL,
 shipment_logistics_district_code varchar(2),
 store_scale_pattern_code varchar(6),
 existing_store_type_code varchar(6),
 inventory_object_type_code varchar(6),
 register_cat_interlock_type_code varchar(6),
 ss_store_manager_store_type_code varchar(6),
 renewal_before_close_date timestamptz,
 open_term_number numeric(2),
 store_inspection_start_date timestamptz,
 store_inspection_end_date timestamptz,
 close_type_code varchar(6),
 direct_management_fc_store_type_code varchar(6),
 consignment_store_type_code varchar(6),
 system_machine_removal_date timestamptz,
 sale_channel_type_code varchar(6),
 transfer_out_control_exclude_flag boolean DEFAULT FALSE NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_store_pk
   PRIMARY KEY(store_code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.m_store_general_purpose(
 general_purpose_type varchar(20) NOT NULL,
 store_code varchar(10) NOT NULL,
 system_country_code varchar(3) NOT NULL,
 system_brand_code varchar(4) NOT NULL,
 code varchar(50) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_store_general_purpose_pk
   PRIMARY KEY(general_purpose_type,store_code,system_country_code,system_brand_code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_order_information(
 integrated_order_id varchar(27) NOT NULL,
 order_barcode_number varchar(23),
 store_code varchar(10) NOT NULL,
 system_brand_code varchar(4) NOT NULL,
 system_business_code varchar(10),
 system_country_code varchar(3) NOT NULL,
 channel_code varchar(10),
 update_type varchar(10),
 customer_id varchar(30),
 order_confirmation_business_date varchar(8),
 order_confirmation_date_time timestamptz,
 error_check_type numeric(1),
 data_alteration_scm_linkage_type numeric(1),
 data_alteration_backbone_linkage_type numeric(1),
 data_alteration_editing_flag boolean DEFAULT FALSE NOT NULL,
 data_alteration_user_id varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_order_information_pk
   PRIMARY KEY(integrated_order_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_scm_transaction_tax(
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 tax_group varchar(10) NOT NULL,
 tax_sub_number numeric(4) NOT NULL,
 tax_amount_sign varchar(1),
 tax_amount_currency_code varchar(3),
 tax_amount_value numeric(24,4),
 tax_rate numeric(16,4),
 tax_name varchar(120),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_scm_transaction_tax_pk
   PRIMARY KEY(order_sub_number,scm_transaction_id,detail_sub_number,tax_group)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_pile_up_pay_off_data(
 store_code varchar(10) NOT NULL,
 payoff_date varchar(8) NOT NULL,
 payoff_type_code varchar(6) NOT NULL,
 payoff_type_sub_number_code varchar(10) NOT NULL,
 cash_register_no numeric(3) NOT NULL,
 payoff_amount numeric(24,4),
 payoff_quantity numeric(16,4),
 payoff_processing_flag boolean DEFAULT FALSE NOT NULL,
 batch_region numeric(2) NOT NULL,
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 advance_received_store_code varchar(10) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_pile_up_pay_off_data_pk
   PRIMARY KEY(store_code,payoff_date,payoff_type_code,payoff_type_sub_number_code,cash_register_no,advance_received_store_code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_pay_off_data(
 store_code varchar(10) NOT NULL,
 payoff_date varchar(8) NOT NULL,
 payoff_type_code varchar(6) NOT NULL,
 payoff_type_sub_number_code varchar(10) NOT NULL,
 cash_register_no numeric(3) NOT NULL,
 payoff_amount numeric(24,4),
 payoff_quantity numeric(16,4),
 report_output_date varchar(8),
 processing_flag boolean DEFAULT FALSE NOT NULL,
 integrity_check_flag boolean DEFAULT TRUE NOT NULL,
 accounting_record_status numeric(1),
 batch_region numeric(2) NOT NULL,
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 payoff_integrity_error_notification_flag boolean DEFAULT FALSE NOT NULL,
 advance_received_store_code varchar(10) NOT NULL,
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_pay_off_data_pk
   PRIMARY KEY(store_code,payoff_date,payoff_type_code,payoff_type_sub_number_code,cash_register_no,advance_received_store_code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.m_pay_off_summary_mapping(
 mapping_pattern numeric(3) NOT NULL,
 mapping_ptn_name varchar(30),
 payoff_type_code varchar(6) NOT NULL,
 mapping_sub_pattern numeric(3),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_pay_off_summary_mapping_pk
   PRIMARY KEY(mapping_pattern,payoff_type_code)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_alteration_history_scm_transaction_discount(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 promotion_type varchar(4) NOT NULL,
 promotion_no varchar(10) NOT NULL,
 store_discount_type varchar(2) NOT NULL,
 history_type numeric(1) NOT NULL,
 scm_transaction_error_id varchar(57),
 item_discount_sub_number numeric(4),
 quantity_code varchar(1),
 discount_quantity numeric(2),
 discount_amount_tax_excluded_currency_code varchar(3),
 discount_amount_tax_excluded numeric(24,4),
 discount_amount_tax_included_currency_code varchar(3),
 discount_amount_tax_included numeric(24,4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_alteration_history_scm_transaction_discount_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number,promotion_type,promotion_no,store_discount_type,history_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_alteration_history_scm_transaction_discount_KEY1 ON scm.t_alteration_history_scm_transaction_discount(scm_transaction_error_id);

CREATE TABLE scm.t_alteration_history_scm_transaction_detail(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 history_type numeric(1) NOT NULL,
 scm_transaction_error_id varchar(57),
 item_detail_sub_number numeric(4),
 scm_transaction_type varchar(6),
 system_brand_code varchar(4),
 l2_item_code varchar(20),
 display_l2_item_code varchar(20),
 l2_product_name varchar(250),
 l3_item_code varchar(25),
 l3_pos_product_name varchar(250),
 product_classification varchar(6),
 non_md_type varchar(6),
 non_md_code varchar(25),
 service_code varchar(50),
 epc_code varchar(24),
 g_department_code varchar(6),
 major_category_code varchar(4),
 quantity_code varchar(1),
 detail_quantity numeric(16,4),
 item_cost_currency_code varchar(3),
 item_cost_value numeric(24,4),
 initial_selling_price_currency_code varchar(3),
 initial_selling_price numeric(24,4),
 bclass_price_currency_code varchar(3),
 bclass_price numeric(24,4),
 new_price_currency_code varchar(3),
 new_price numeric(24,4),
 retail_unit_price_tax_excluded_currency_code varchar(3),
 retail_unit_price_tax_excluded numeric(24,4),
 retail_unit_price_tax_included_currency_code varchar(3),
 retail_unit_price_tax_included numeric(24,4),
 scm_amount_tax_excluded_currency_code varchar(3),
 scm_amount_tax_excluded numeric(24,4),
 scm_amount_tax_included_currency_code varchar(3),
 scm_amount_tax_included numeric(24,4),
 calculation_unavailable_type varchar(10),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_status varchar(50),
 order_substatus varchar(50),
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 contribution_scm_representative varchar(10),
 customer_id varchar(30),
 bundle_purchase_applicable_quantity numeric(16,4),
 bundle_purchase_applicable_price_currency_code varchar(3),
 bundle_purchase_applicable_price numeric(24,4),
 bundle_purchase_index numeric(3),
 limited_amount_promotion_count numeric(2),
 store_item_discount_type varchar(10),
 store_item_discount_currency_code varchar(3),
 store_item_discount_setting numeric(24,4),
 store_bundle_sale_flag boolean DEFAULT FALSE NOT NULL,
 store_bundle_sale_price_currency_code varchar(3),
 store_bundle_sale_price numeric(24,4),
 set_scm_detail_index numeric(3),
 taxation_type varchar(1),
 tax_system_type varchar(10),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_alteration_history_scm_transaction_detail_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number,history_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_alteration_history_scm_transaction_detail_KEY1 ON scm.t_alteration_history_scm_transaction_detail(scm_transaction_error_id);

CREATE TABLE scm.t_alteration_history_scm_transaction_detail_info(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 history_type numeric(1) NOT NULL,
 scm_transaction_error_id varchar(57),
 item_detail_sub_number numeric(4),
 key_code varchar(20),
 code_value_1 varchar(25),
 code_value_2 varchar(25),
 code_value_3 varchar(25),
 code_value_4 varchar(25),
 name_1 varchar(250),
 name_2 varchar(250),
 name_3 varchar(250),
 name_4 varchar(250),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_alteration_history_scm_transaction_detail_info_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number,history_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_alteration_history_scm_transaction_detail_info_KEY1 ON scm.t_alteration_history_scm_transaction_detail_info(scm_transaction_error_id);

CREATE TABLE scm.t_alteration_history_scm_transaction_header(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 history_type numeric(1) NOT NULL,
 scm_transaction_error_id varchar(57),
 integrated_order_id varchar(27),
 scm_transaction_sub_number numeric(4),
 store_code varchar(10),
 data_creation_date_time timestamptz,
 data_creation_business_date varchar(8),
 cash_register_no numeric(3),
 receipt_no varchar(4),
 scm_linkage_type numeric(1),
 scm_transaction_type varchar(6),
 return_type numeric(1),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 channel_code varchar(10),
 order_status varchar(50),
 order_substatus varchar(50),
 order_status_update_date varchar(8),
 order_status_last_update_date_time timestamptz,
 order_cancelled_date_time timestamptz,
 booking_store_code varchar(10),
 booking_store_system_brand_code varchar(4),
 booking_store_system_business_code varchar(10),
 booking_store_system_country_code varchar(3),
 payment_status varchar(50),
 payment_store_code varchar(10),
 payment_store_system_brand_code varchar(4),
 payment_store_system_business_code varchar(10),
 payment_store_system_country_code varchar(3),
 transfer_out_status varchar(50),
 shipment_status varchar(50),
 shipment_store_code varchar(10),
 shipment_store_system_brand_code varchar(4),
 shipment_store_system_business_code varchar(10),
 shipment_store_system_country_code varchar(3),
 receiving_status varchar(50),
 receipt_store_code varchar(10),
 receipt_store_system_brand_code varchar(4),
 receipt_store_system_business_code varchar(10),
 receipt_store_system_country_code varchar(3),
 customer_id varchar(30),
 order_number_for_store_payment varchar(27),
 advance_received_store_code varchar(10),
 advance_received_store_system_brand_code varchar(4),
 advance_received_store_system_business_code varchar(10),
 advance_received_store_system_country_code varchar(3),
 operator_code varchar(18),
 original_transaction_id varchar(30),
 original_cash_register_no numeric(3),
 original_receipt_no varchar(4),
 deposit_currency_code varchar(3),
 deposit_value numeric(24,4),
 change_currency_code varchar(3),
 change_value numeric(24,4),
 receipt_no_for_credit_card_cancellation varchar(11),
 receipt_no_for_credit_card varchar(30),
 receipt_issued_flag boolean DEFAULT FALSE NOT NULL,
 e_receipt_target_flag boolean DEFAULT FALSE NOT NULL,
 processing_company_code varchar(20),
 employee_sale_flag boolean DEFAULT FALSE NOT NULL,
 consistency_scm_flag boolean DEFAULT FALSE NOT NULL,
 corporate_id varchar(20),
 scm_transaction_discount_flag boolean DEFAULT FALSE NOT NULL,
 scm_transaction_discount_amount_rate_currency_code varchar(3),
 scm_transaction_discount_amount_rate numeric(24,4),
 token_code varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_alteration_history_scm_transaction_header_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,history_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_alteration_history_scm_transaction_header_KEY1 ON scm.t_alteration_history_scm_transaction_header(scm_transaction_error_id);

CREATE TABLE scm.t_alteration_history_scm_transaction_total_amount(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 total_type varchar(50) NOT NULL,
 history_type numeric(1) NOT NULL,
 scm_transaction_error_id varchar(57),
 total_amount_tax_excluded_currency_code varchar(3),
 total_amount_tax_excluded_value numeric(24,4),
 total_amount_tax_included_currency_code varchar(3),
 total_amount_tax_included_value numeric(24,4),
 tax_rate numeric(16,4),
 scm_transaction_information_1 varchar(250),
 scm_transaction_information_2 varchar(250),
 scm_transaction_information_3 varchar(250),
 total_amount_sub_number numeric(4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_alteration_history_scm_transaction_total_amount_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,total_type,history_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_alteration_history_scm_transaction_total_amount_KEY1 ON scm.t_alteration_history_scm_transaction_total_amount(scm_transaction_error_id);

CREATE TABLE scm.t_alteration_history_scm_transaction_tender(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(50) NOT NULL,
 tender_id varchar(50) NOT NULL,
 history_type numeric(1) NOT NULL,
 scm_transaction_error_id varchar(57),
 payment_sign varchar(1),
 tax_included_payment_amount_currency_code varchar(3),
 tax_included_payment_amount_value numeric(24,4),
 tender_sub_number numeric(4),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_alteration_history_scm_transaction_tender_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,tender_group,tender_id,history_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_alteration_history_scm_transaction_tender_KEY1 ON scm.t_alteration_history_scm_transaction_tender(scm_transaction_error_id);

CREATE TABLE scm.t_alteration_history_scm_transaction_tender_info(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 tender_group varchar(50) NOT NULL,
 tender_id varchar(50) NOT NULL,
 history_type numeric(1) NOT NULL,
 scm_transaction_error_id varchar(57),
 discount_value_currency_code varchar(3),
 discount_value numeric(24,4),
 discount_rate numeric(16,4),
 discount_code_id_corporate_id varchar(30),
 coupon_type varchar(6),
 coupon_discount_amount_setting_currency_code varchar(3),
 coupon_discount_amount_setting_value numeric(24,4),
 coupon_min_usage_amount_threshold_currency_code varchar(3),
 coupon_min_usage_amount_threshold_value numeric(24,4),
 coupon_user_id varchar(30),
 card_no varchar(30),
 credit_approval_code varchar(30),
 credit_processing_serial_number varchar(30),
 credit_payment_type varchar(30),
 credit_payment_count numeric(5),
 credit_affiliated_store_number varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_alteration_history_scm_transaction_tender_info_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,tender_group,tender_id,history_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_alteration_history_scm_transaction_tender_info_KEY1 ON scm.t_alteration_history_scm_transaction_tender_info(scm_transaction_error_id);

CREATE TABLE scm.t_alteration_history_order_information(
 transaction_id varchar(57) NOT NULL,
 integrated_order_id varchar(27) NOT NULL,
 history_type numeric(1) NOT NULL,
 scm_transaction_error_id varchar(57),
 order_barcode_number varchar(23),
 store_code varchar(10),
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 channel_code varchar(10),
 update_type varchar(10),
 customer_id varchar(30),
 order_confirmation_business_date varchar(8),
 order_confirmation_date_time timestamptz,
 error_check_type numeric(1),
 data_alteration_scm_linkage_type numeric(1),
 data_alteration_backbone_linkage_type numeric(1),
 data_alteration_editing_flag boolean DEFAULT FALSE NOT NULL,
 data_alteration_user_id varchar(30),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_alteration_history_order_information_pk
   PRIMARY KEY(transaction_id,integrated_order_id,history_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_alteration_history_order_information_KEY1 ON scm.t_alteration_history_order_information(scm_transaction_error_id);

CREATE TABLE scm.t_alteration_history_scm_transaction_tax(
 transaction_id varchar(57) NOT NULL,
 order_sub_number numeric(4) NOT NULL,
 scm_transaction_id varchar(30) NOT NULL,
 detail_sub_number numeric(4) NOT NULL,
 tax_group varchar(10) NOT NULL,
 history_type numeric(1) NOT NULL,
 scm_transaction_error_id varchar(57),
 tax_sub_number numeric(4),
 tax_amount_sign varchar(1),
 tax_amount_currency_code varchar(3),
 tax_amount_value numeric(24,4),
 tax_rate numeric(16,4),
 tax_name varchar(120),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_alteration_history_scm_transaction_tax_pk
   PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,detail_sub_number,tax_group,history_type)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;
 CREATE INDEX t_alteration_history_scm_transaction_tax_KEY1 ON scm.t_alteration_history_scm_transaction_tax(scm_transaction_error_id);

CREATE TABLE scm.m_tender(
 store_code varchar(10) NOT NULL,
 tender_id varchar(50) NOT NULL,
 tender_name varchar(120),
 receipt_tender_name varchar(45),
 tender_group varchar(50),
 valid_date timestamptz,
 currency_code varchar(3),
 kid varchar(3),
 change_flag boolean DEFAULT FALSE NOT NULL,
 current_deposit_flag boolean DEFAULT FALSE NOT NULL,
 credit_company_code varchar(3),
 system_country_code varchar(3),
 system_business_code varchar(10),
 system_brand_code varchar(4),
 ims_tender_id numeric(6),
 ims_tender_group varchar(6),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_tender_pk
   PRIMARY KEY(store_code,tender_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.w_transaction_status_time(
 transaction_status_time timestamptz NOT NULL
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;


CREATE TABLE scm.w_untreated_transaction(
 transaction_id varchar(57) NOT NULL,
 retry_count numeric(1) NOT NULL,
 delete_flag boolean NOT NULL,
 create_user_id varchar(30) DEFAULT 'BATCH',
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30) DEFAULT 'fr-store-receiver-recovery',
 update_user_id varchar(30) DEFAULT 'BATCH',
 update_datetime timestamptz NOT NULL,
 update_program_id varchar(30) DEFAULT 'fr-store-receiver-recovery',
  CONSTRAINT w_untreated_transaction_pk
   PRIMARY KEY(transaction_id)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.m_general_delete_setting(
 processing_target_type varchar(10) NOT NULL,
 processing_no numeric(10) NOT NULL,
 delete_target_table varchar(100) NOT NULL,
 saved_days numeric(10) NOT NULL,
 date_item varchar(100) NOT NULL,
 system_brand_code varchar(4),
 system_country_code varchar(3),
 store_code varchar(10),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT m_general_delete_setting_pk
   PRIMARY KEY(processing_target_type,processing_no)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_business_receiver_status(
 transaction_id varchar(57) NOT NULL,
 business_receiver_name varchar(50) NOT NULL,
 create_date timestamptz NOT NULL,
 create_user varchar(50) NOT NULL,
 retry_count numeric(1) NOT NULL,
  CONSTRAINT t_business_receiver_status_pk
   PRIMARY KEY(transaction_id,business_receiver_name,retry_count)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_business_processor_status_p0(
 transaction_id varchar(57) NOT NULL,
 business_process_name varchar(50) NOT NULL,
 create_date timestamptz NOT NULL,
 create_user varchar(50) NOT NULL,
 retry_count numeric(1) NOT NULL,
  CONSTRAINT t_business_processor_status_p0_pk
   PRIMARY KEY(transaction_id,business_process_name,retry_count)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_business_processor_status_p1(
 transaction_id varchar(57) NOT NULL,
 business_process_name varchar(50) NOT NULL,
 create_date timestamptz NOT NULL,
 create_user varchar(50) NOT NULL,
 retry_count numeric(1) NOT NULL,
  CONSTRAINT t_business_processor_status_p1_pk
   PRIMARY KEY(transaction_id,business_process_name,retry_count)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE TABLE scm.t_open_log(
 store_code varchar(10) NOT NULL,
 business_date varchar(8) NOT NULL,
 cash_register_no numeric(3) NOT NULL,
 payoff_flag boolean DEFAULT FALSE NOT NULL,
 system_brand_code varchar(4),
 system_business_code varchar(10),
 system_country_code varchar(3),
 create_user_id varchar(30),
 create_datetime timestamptz NOT NULL,
 create_program_id varchar(30),
 update_user_id varchar(30),
 update_datetime timestamptz,
 update_program_id varchar(30),
  CONSTRAINT t_open_log_pk
   PRIMARY KEY(store_code,business_date,cash_register_no)
)
WITH (OIDS=FALSE,FILLFACTOR=90)
;

CREATE SEQUENCE cash_register_receipt_no
 MINVALUE 0010001 MAXVALUE 9999999 CYCLE;

GRANT ALL ON SEQUENCE cash_register_receipt_no TO scmuser;

CREATE OR REPLACE VIEW scm.v_type (
 lot_number,
 system_country_code,
 code_type,
 code,
 code_name,
 code_num,
 eai_update_datetime,
 eai_update_type,
 eai_send_status,
 eai_send_datetime,
 system_business_code,
 required_type,
 batch_region,
 system_brand_code
) AS (
SELECT
 w_type.lot_number,
 w_type.system_country_code,
 w_type.code_type,
 w_type.code,
 w_type.code_name,
 w_type.code_num,
 w_type.eai_update_datetime,
 w_type.eai_update_type,
 w_type.eai_send_status,
 w_type.eai_send_datetime,
 w_type.system_business_code,
 w_type.required_type,
 w_type.batch_region,
 m_trans_business_code.system_brand_code
FROM
 w_type,m_trans_business_code
WHERE
 w_type.system_country_code = m_trans_business_code.system_country_code
 AND w_type.system_business_code = m_trans_business_code.system_business_code
);

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE on all tables in SCHEMA scm TO scmuser; 
GRANT SELECT on all tables in SCHEMA scm TO scmview;

commit;
