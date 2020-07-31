INSERT INTO scm.m_store_batch_config(resource, action, task_definition, cluster_name, container_name, create_user_id, create_datetime, create_program_id, update_user_id, update_datetime, update_program_id) VALUES
('error-notification','create','scm-batch-scm-error-notification','scm-batch-ecs','batch-scm-error-notification','init',now(),'init',null,null,null),
('ec-settlement-data','create','scm-batch-scm-create-ec-settlement-data','scm-batch-ecs','batch-scm-create-ec-settlement-data','init',now(),'init',null,null,null),
('scm-productively-settlement-data','create','scm-batch-scm-productively-settlement-data','scm-batch-ecs','batch-scm-productively-settlement-data','init',now(),'init',null,null,null),
('ims-transaction-data','create','scm-batch-scm-create-ims-transaction-data','scm-batch-ecs','batch-scm-create-ims-transaction-data','init',now(),'init',null,null,null),
('ims-business-date-close','create','scm-batch-scm-create-dclose-data-file','scm-batch-ecs','batch-scm-create-dclose-data-file','init',now(),'init',null,null,null),
('ims-settlement-data','create','scm-batch-scm-create-ims-settlement-data','scm-batch-ecs','batch-scm-create-ims-settlement-data','init',now(),'init',null,null,null),
('jobnet-parameter','get','scm-batch-scm-get-job-net-parameter','scm-batch-ecs','batch-scm-get-job-net-parameter','init',now(),'init',null,null,null),
('business-end-of-date','update','scm-batch-scm-update-business-end-of-date','scm-batch-ecs','batch-scm-update-business-end-of-date','init',now(),'init',null,null,null),
('general-data','delete','scm-batch-scm-delete-general-data','scm-batch-ecs','batch-scm-delete-general-data','init',now(),'init',null,null,null),
('general-master','import','scm-batch-scm-import-general-master','scm-batch-ecs','batch-scm-import-general-master','init',now(),'init',null,null,null);

commit;
