UPDATE scm.m_store_batch_config SET
 task_definition='scm-batch-update-business-end-of-date',
 container_name='batch-update-business-end-of-date',
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE resource='business-end-of-date' AND action='update';

UPDATE scm.m_store_batch_config SET
 task_definition='scm-batch-create-ec-settlement-data',
 container_name='batch-create-ec-settlement-data',
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE resource='ec-settlement-data' AND action='create';

UPDATE scm.m_store_batch_config SET
 task_definition='scm-batch-error-notification',
 container_name='batch-error-notification',
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE resource='error-notification' AND action='create';

UPDATE scm.m_store_batch_config SET
 task_definition='scm-batch-delete-general-data',
 container_name='batch-delete-general-data',
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE resource='general-data' AND action='delete';

UPDATE scm.m_store_batch_config SET
 task_definition='scm-batch-import-general-master',
 container_name='batch-import-general-master',
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE resource='general-master' AND action='import';

UPDATE scm.m_store_batch_config SET
 task_definition='scm-batch-create-dclose-data-file',
 container_name='batch-create-dclose-data-file',
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE resource='ims-business-date-close' AND action='create';

UPDATE scm.m_store_batch_config SET
 task_definition='scm-batch-create-ims-settlement-data',
 container_name='batch-create-ims-settlement-data',
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE resource='ims-settlement-data' AND action='create';

UPDATE scm.m_store_batch_config SET
 task_definition='scm-batch-create-ims-transaction-data',
 container_name='batch-create-ims-transaction-data',
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE resource='ims-transaction-data' AND action='create';

UPDATE scm.m_store_batch_config SET
 task_definition='scm-batch-get-job-net-parameter',
 container_name='batch-get-job-net-parameter',
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE resource='jobnet-parameter' AND action='get';

UPDATE scm.m_store_batch_config SET
 task_definition='scm-batch-productively-settlement-data',
 container_name='batch-productively-settlement-data',
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE resource='scm-productively-settlement-data' AND action='create';

commit;
