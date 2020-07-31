insert into scm.m_general_delete_setting values 
 ('COMMON',1,'w_dclose_send',5,'create_datetime',null,null,null,'Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('COMMON',2,'w_type',5,'create_datetime',null,null,null,'Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('COMMON',3,'t_ims_scm_transaction_header',5,'create_datetime',null,null,null,'Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('COMMON',4,'t_ims_scm_transaction_detail',5,'create_datetime',null,null,null,'Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('COMMON',5,'t_ims_scm_transaction_discount',5,'create_datetime',null,null,null,'Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('COMMON',6,'t_ims_scm_transaction_tax',5,'create_datetime',null,null,null,'Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('COMMON',7,'t_ims_scm_transaction_tender',5,'create_datetime',null,null,null,'Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('COMMON',8,'t_ims_pay_off_data',5,'create_datetime',null,null,null,'Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
;

insert into scm.m_error_notification_pattern values 
 ('01','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('02','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('03','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('04','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('05','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('06','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('07','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('08','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('09','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('10','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('11','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('12','01','001','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('13','04','013','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
;

insert into scm.m_error_notification_message values 
 ('001','{1} errors are detected in Canada.','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,('013','There is no error.','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
;

insert into scm.m_pay_off_summary_mapping values 
 (1,'CANADA','C001',null,'0001','17','17','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,(1,'CANADA','C007',null,'0001','17','17','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,(1,'CANADA','E001',3,'0001','17','17','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,(1,'CANADA','EX001',2,'0001','17','17','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
,(1,'CANADA','EX003',null,'0001','17','17','Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
;

insert into scm.m_trans_business_code values 
 ('17','17','0001',23,'Migration',current_timestamp,'Migration','Migration',current_timestamp,'Migration')
;

commit;
