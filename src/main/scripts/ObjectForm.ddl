------------------------------------
----PASSWORD FOR user "test" is test
------------------------------------

INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES (1, 'Los Angeles', 'Los Angeles', 'United States', '1111', 'CA', 'Fake Street1', '90032');
    
INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES (2, 'Los Angeles', 'Los Angeles', 'United States', '1234', 'CA', 'Fake Street2', '91132');
    
INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES (3, 'Los Angeles', 'Los Angeles', 'United States', '4321', 'CA', 'Fake Street3', '90000');

INSERT INTO roles(role_id, name) 
	VALUES (1, 'Admin');
	
INSERT INTO roles (role_id, name) 
	VALUES (2, 'Staff');
	
INSERT INTO roles (role_id, name) 
	VALUES (3, 'User');
    
INSERT INTO members(id, email, enabled, first_name, last_name, middle_name, password, username, address_id, roles_role_id) 
	VALUES (1, 'test@gmail.com', true, 'test', 'test', 'test', '$2a$10$3pmt4bGNRF6YCCyr8gusTOwVQO8pUmFRGWjYY8eeZy23RnD4G9HhG', 'test', 1, 1);
	
INSERT INTO members(id, email, enabled, first_name, last_name, middle_name, password, username, address_id, roles_role_id) 
	VALUES (2, 'manish05@gmail.com', false, 'John', 'Doe', '', '$2a$10$3pmt4bGNRF6YCCyr8gusTOwVQO8pUmFRGWjYY8eeZy23RnD4G9HhG', 'amanish05', 2, 2);
	
INSERT INTO members(id, email, enabled, first_name, last_name, middle_name, password, username, address_id, roles_role_id) 
	VALUES (3, 'manish10@gmail.com', true, 'Jane', 'Doe', '', '$2a$10$3pmt4bGNRF6YCCyr8gusTOwVQO8pUmFRGWjYY8eeZy23RnD4G9HhG', 'amanish10', 3, 3);
        
INSERT INTO forms (id, created_date, description, modified_date, submission_date, title, ownerid) 
	VALUES (1, '2017-03-20 04:20:45.773', 'Divorce Papers', NULL, NULL,  'CONSULAR PROCESSING GENERAL INFORMATION', 1);

INSERT INTO forms (id, created_date, description, modified_date, submission_date, title, ownerid) 
	VALUES (2, '2017-04-13 01:19:45.773', 'Form 2', NULL, NULL, 'test2', NULL);
	
INSERT INTO forms (id, created_date, description, modified_date, submission_date, title, ownerid) 
	VALUES (3, '2017-04-13 01:19:53.208', 'Form 3', NULL, NULL, 'test3', NULL);
	
INSERT INTO forms (id, created_date, description, modified_date, submission_date, title, ownerid) 
	VALUES (4, '2017-04-13 01:20:00.806', 'Form 4', NULL, NULL, 'test4', NULL);
	
INSERT INTO forms (id, created_date, description, modified_date, submission_date, title, ownerid) 
	VALUES (5, '2017-04-13 02:29:42.354', 'Test for DDL Documentation', NULL, NULL, 'Test', 1);
	
INSERT INTO pages(page_id, description, page_number, form_id) 
	VALUES (1, 'Divorce Paper: page 1', 1, 1);
	
INSERT INTO pages(page_id, description, page_number, form_id) 
	VALUES (2, 'test2', 1, 2);
	
INSERT INTO pages(page_id, description, page_number, form_id) 
	VALUES (3, 'test3', 1, 3);
	
INSERT INTO pages(page_id, description, page_number, form_id) 
	VALUES (4, 'test4', 1, 4);
	
INSERT INTO pages(page_id, description, page_number, form_id) 
	VALUES (5, 'test5', 1, 5);
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id, order_id, is_in_group)
	VALUES('TextBox', 1, true, false, true, 'name', 'NAME OF APPLICANT (Last, First, Middle):', 1, 1, false);	

INSERT INTO choices(id, text)
	VALUES(1, 'Single');
	
INSERT INTO choices(id, text)
	VALUES(2, 'Married');
	
INSERT INTO choices(id, text)
	VALUES(3, 'Divorced');
	
INSERT INTO choices(id, text)
	VALUES(4, 'Widowed');
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, multiple_choice_type, number_of_allowed_select, form_Id, order_id, is_in_group)
	VALUES('MultipleChoice', 2, true, true, true, 'martialstatus', 'MARITAL STATUS:', 1, 1, 1, 24, false);
	
INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(2, 1);

INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(2, 2);

INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(2, 3);

INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(2, 4);

INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id, order_id, is_in_group)
	VALUES('TextBox', 25, true, false, true, 'numofmarriages', 'HOW MANY TIMES HAVE YOU BEEN MARRIED?', 1, 25, false);

INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 1);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 2);
	
INSERT INTO answersheet(id, member_id, page_id)
	VALUES(1, 1, 1);	
	
INSERT INTO Answer(answerType, id, textarea_value, textbox_value ,formId, memberId, answersheetid)
	VALUES('TextBox', 1,'','Hopkins,Steven', 1, 1, 1);
	
INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(1, 1);	
	
INSERT INTO Answer(answerType, id, formId, memberId, answersheetid)
	VALUES('MultipleChoice', 2, 1, 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(2, 2);		
	
INSERT INTO Answer_choices(MultipleChoiceAnswer_id, choiceAnswers_id)
	VALUES(2, 2);
	
ALTER SEQUENCE addresses_id_seq 
	RESTART WITH 4;

ALTER SEQUENCE answer_id_seq 
	RESTART WITH 3;
	
ALTER SEQUENCE choices_id_seq 
	RESTART WITH 5;
	
ALTER SEQUENCE formelement_id_seq 
	RESTART WITH 3;
	
ALTER SEQUENCE forms_id_seq 
	RESTART WITH 6;
	
ALTER SEQUENCE members_id_seq 
	RESTART WITH 4;
	
ALTER SEQUENCE pages_page_id_seq 
	RESTART WITH 6;
	
ALTER SEQUENCE roles_role_id_seq 
	RESTART WITH 4;
	
ALTER SEQUENCE answersheet_id_seq 
	RESTART WITH 2;
------------------------------------
