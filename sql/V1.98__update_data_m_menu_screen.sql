UPDATE scm.m_menu_screen SET
 display_order=1,
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE menu_name='sls-transaction-correction' AND screen_name='scm-transaction-error-list' AND version='v1';

UPDATE scm.m_menu_screen SET
 display_order=2,
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE menu_name='sls-transaction-correction' AND screen_name='unmatched-scm-list' AND version='v1';

UPDATE scm.m_menu_screen SET
 display_order=3,
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE menu_name='sls-transaction-correction' AND screen_name='data-upload' AND version='v1';

UPDATE scm.m_menu_screen SET
 display_order=4,
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE menu_name='sls-transaction-correction' AND screen_name='scm-transaction-recovery' AND version='v1';

UPDATE scm.m_menu_screen SET
 display_order=5,
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE menu_name='sls-transaction-correction' AND screen_name='scm-transaction-history-list' AND version='v1';

UPDATE scm.m_menu_screen SET
 display_order=6,
 update_user_id='Migration',
 update_datetime=CURRENT_TIMESTAMP,
 update_program_id='Migration'
 WHERE menu_name='sls-transaction-correction' AND screen_name='scm-settlement-correction-history' AND version='v1';

