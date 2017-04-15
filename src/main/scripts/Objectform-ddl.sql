--------------------------------------------------------
--  PASSWORD FOR USER "test" is "test"
--------------------------------------------------------
INSERT INTO addresses (id, area, city, country, house, state, street, zip_code) VALUES (1, '', '', '', '', '', '', NULL);
INSERT INTO addresses (id, area, city, country, house, state, street, zip_code) VALUES (2, '', '', '', '', '', '', NULL);
INSERT INTO addresses (id, area, city, country, house, state, street, zip_code) VALUES (3, '', '', '', '', '', '', NULL);

INSERT INTO roles (role_id, name) VALUES (1, 'Admin');
INSERT INTO roles (role_id, name) VALUES (2, 'Staff');
INSERT INTO roles (role_id, name) VALUES (3, 'User');

INSERT INTO members (id, email, enabled, first_name, last_name, middle_name, password, username, address_id, roles_role_id) VALUES (1, '', true, '', '', '', '$2a$10$3pmt4bGNRF6YCCyr8gusTOwVQO8pUmFRGWjYY8eeZy23RnD4G9HhG', 'test', 1, 1);
INSERT INTO members (id, email, enabled, first_name, last_name, middle_name, password, username, address_id, roles_role_id) VALUES (2, '', true, '', '', '', '$2a$10$5hm7uyBSr7FH.hrKEjJ.9OJujvS51vFaCXJUDFAT5/mwZ5K.j/5VK', 'amanish05', 2, 2);
INSERT INTO members (id, email, enabled, first_name, last_name, middle_name, password, username, address_id, roles_role_id) VALUES (3, '', true, '', '', '', '$2a$10$MqrBt.e.AuKqRWeIoddi6OCe43XKTaaa2.AgPc6S.OvtFxdwifOHq', 'amanish10', 3, 3);

INSERT INTO forms (id, created_date, description, modified_date, submission_date, title, ownerid) VALUES (1, '2017-04-13 01:19:45.773', '', NULL, NULL, 'test1', NULL);
INSERT INTO forms (id, created_date, description, modified_date, submission_date, title, ownerid) VALUES (2, '2017-04-13 01:19:53.208', '', NULL, NULL, 'test2', NULL);
INSERT INTO forms (id, created_date, description, modified_date, submission_date, title, ownerid) VALUES (3, '2017-04-13 01:20:00.806', '', NULL, NULL, 'test3', NULL);
INSERT INTO forms (id, created_date, description, modified_date, submission_date, title, ownerid) VALUES (4, '2017-04-13 02:29:42.354', 'Test for DDL Documentation', NULL, NULL, 'Test', 1);

INSERT INTO pages (page_id, description, page_number, form_id) VALUES (1, 'Contact Information', 1, 1);

INSERT INTO formelement (elementtype, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, column_value, default_value, max_length, min_length, row_value, multiple_choice_type, number_of_allowed_select, size, group_id, date_format, default_date, form_id, pdfelement_pdfelement_id) VALUES ('MultipleChoice', 2, false, NULL, true, 'Sex', 'Sex', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO formelement (elementtype, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, column_value, default_value, max_length, min_length, row_value, multiple_choice_type, number_of_allowed_select, size, group_id, date_format, default_date, form_id, pdfelement_pdfelement_id) VALUES ('MultipleChoice', 3, true, NULL, true, 'Sex', 'Sex', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO formelement (elementtype, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, column_value, default_value, max_length, min_length, row_value, multiple_choice_type, number_of_allowed_select, size, group_id, date_format, default_date, form_id, pdfelement_pdfelement_id) VALUES ('MultipleChoice', 4, true, NULL, true, 'Sex', 'Sex', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO page_formelements (page_id, formelement_id) VALUES (1, 2);
INSERT INTO page_formelements (page_id, formelement_id) VALUES (1, 2);

INSERT INTO assignedforms (id, form_id, member_id) VALUES (1, 3, 3);
INSERT INTO assignedforms (id, form_id, member_id) VALUES (2, 2, 3);