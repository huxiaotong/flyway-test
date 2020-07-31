INSERT INTO scm.m_store_batch_config(resource, action, task_definition, cluster_name, container_name, create_user_id, create_datetime, create_program_id, update_user_id, update_datetime, update_program_id) VALUES
 ('purge-item','delete','scm-batch-purgeitem-delete','scm-batch-ecs','batch-purgeitem-delete','Migration',CURRENT_TIMESTAMP,'Migration','Migration',CURRENT_TIMESTAMP,'Migration'),
 ('scm-payoff-integrity','check','scm-batch-payoff-integrity-check','scm-batch-ecs','batch-payoff-integrity-check','Migration',CURRENT_TIMESTAMP,'Migration','Migration',CURRENT_TIMESTAMP,'Migration'),
 ('tender-sub-number','update','scm-batch-update-tender-subnumber','scm-batch-ecs','batch-update-tender-subnumber','Migration',CURRENT_TIMESTAMP,'Migration','Migration',CURRENT_TIMESTAMP,'Migration'),
 ('transaction-data','delete','scm-batch-transaction-data-delete','scm-batch-ecs','batch-transaction-data-delete','Migration',CURRENT_TIMESTAMP,'Migration','Migration',CURRENT_TIMESTAMP,'Migration');
 