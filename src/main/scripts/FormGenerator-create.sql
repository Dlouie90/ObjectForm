
    create table Addresses (
        Id  serial not null,
        Area varchar(50),
        City varchar(50),
        Country varchar(30),
        House varchar(40),
        State varchar(40),
        Street varchar(40),
        Zip_Code int4,
        primary key (Id)
    );

    create table Answer (
        answerType varchar(31) not null,
        id  serial not null,
        textarea_value varchar(255),
        textbox_value varchar(255),
        date_value timestamp,
        formId int4,
        memberId int4,
        primary key (id)
    );

    create table Answer_choices (
        MultipleChoiceAnswer_id int4 not null,
        choiceAnswers_id int4 not null
    );

    create table AssignedForms (
        Id  serial not null,
        FORM_ID int4,
        MEMBER_ID int4,
        primary key (Id)
    );

    create table choices (
        id  serial not null,
        text varchar(255),
        primary key (id)
    );

    create table FormElement (
        elementType varchar(31) not null,
        id  serial not null,
        is_enabled boolean,
        is_multiple_answer_allowed boolean,
        is_required boolean,
        name varchar(255),
        title varchar(255),
        column_value int4,
        default_value varchar(255),
        max_length int4,
        min_length int4,
        row_value int4,
        multiple_choice_type int4,
        number_of_allowed_select int4,
        size int4,
        group_Id int4,
        date_format varchar(255),
        default_date timestamp,
        form_Id int4,
        pdfElement_pdfElement_Id int4,
        primary key (id)
    );

    create table formElement_answers (
        answer_id int4 not null,
        formElement_id int4 not null
    );

    create table FormElement_choices (
        MultipleChoice_id int4 not null,
        choices_id int4 not null
    );

    create table FormElement_FormElement (
        GroupElement_id int4 not null,
        groupFormElements_id int4 not null
    );

    create table forms (
        Id  serial not null,
        Created_Date timestamp,
        Description varchar(100),
        Modified_Date timestamp,
        Submission_Date timestamp,
        Title varchar(40),
        ownerId int4,
        primary key (Id)
    );

    create table Members (
        Id  serial not null,
        Email varchar(255),
        Enabled boolean,
        First_Name varchar(255),
        Last_Name varchar(255),
        Middle_Name varchar(255),
        Password varchar(100),
        Username varchar(255),
        address_Id int4,
        roles_Role_Id int4,
        primary key (Id)
    );

    create table page_formElements (
        page_id int4 not null,
        formElement_id int4 not null
    );

    create table pages (
        Page_Id  serial not null,
        Description varchar(255),
        Page_Number int2,
        Form_Id int4,
        primary key (Page_Id)
    );

    create table PDFElement (
        pdfElement_Id  serial not null,
        name varchar(255),
        formElement_id int4,
        primary key (pdfElement_Id)
    );

    create table PDFForm (
        pdfForm_Id  serial not null,
        path varchar(255),
        form_Id int4,
        owner_Id int4,
        primary key (pdfForm_Id)
    );

    create table Roles (
        Role_Id  serial not null,
        Name varchar(255) not null,
        primary key (Role_Id)
    );

    alter table Answer_choices 
        add constraint UK_5pytliwcfpu4s3ackf198rxr4 unique (choiceAnswers_id);

    alter table FormElement_choices 
        add constraint UK_e27wl75sqvy7w9phqms4so4l unique (choices_id);

    alter table Members 
        add constraint UK_ctwhq1mhwjtrsvpl0kp2iqhw unique (Username);

    alter table Answer 
        add constraint FKf6ofc87u4wjyf300c3aisy6el 
        foreign key (formId) 
        references forms;

    alter table Answer 
        add constraint FK32j5552csr2itnpo37g5ht57f 
        foreign key (memberId) 
        references Members;

    alter table Answer_choices 
        add constraint FK9j0b9drih3acthy5ll4nms74m 
        foreign key (choiceAnswers_id) 
        references choices;

    alter table Answer_choices 
        add constraint FKt1oirg3nqfenxouwed7jv8keu 
        foreign key (MultipleChoiceAnswer_id) 
        references Answer;

    alter table AssignedForms 
        add constraint FKabtjv10st4ug0gsk5pr9qig0n 
        foreign key (FORM_ID) 
        references forms;

    alter table AssignedForms 
        add constraint FKhtu4qkcxhwnqh2rhos9f0fu3k 
        foreign key (MEMBER_ID) 
        references Members;

    alter table FormElement 
        add constraint FK7koo28nnw76tn0mi9ao61pqtx 
        foreign key (form_Id) 
        references forms;

    alter table FormElement 
        add constraint FKlf1d6pyyndrmx87qy8tt1p95j 
        foreign key (pdfElement_pdfElement_Id) 
        references PDFElement;

    alter table formElement_answers 
        add constraint FKqdr9wqcki5m6anpnlqdx5m1pb 
        foreign key (formElement_id) 
        references FormElement;

    alter table formElement_answers 
        add constraint FK9r71yurusbyvv29ljcumj105i 
        foreign key (answer_id) 
        references Answer;

    alter table FormElement_choices 
        add constraint FK6byatdcdbtuf0p94mhyp4vn2m 
        foreign key (choices_id) 
        references choices;

    alter table FormElement_choices 
        add constraint FKmrir97g7bblth4wcfxios49of 
        foreign key (MultipleChoice_id) 
        references FormElement;

    alter table FormElement_FormElement 
        add constraint FKfvkfckkc5p9iafwmihafbkmn7 
        foreign key (groupFormElements_id) 
        references FormElement;

    alter table FormElement_FormElement 
        add constraint FKoxvs3bg2w2osogxuq06xt4q3v 
        foreign key (GroupElement_id) 
        references FormElement;

    alter table forms 
        add constraint FKkwdwbg91iugvww1i1exsohuuy 
        foreign key (ownerId) 
        references Members;

    alter table Members 
        add constraint FK7fj6n2lr2xr32o18bxuwft5wm 
        foreign key (address_Id) 
        references Addresses;

    alter table Members 
        add constraint FKcrj6a1533qhkjdl2mtyaj5aje 
        foreign key (roles_Role_Id) 
        references Roles;

    alter table page_formElements 
        add constraint FK3iruri89oijg6u3np0l9pssrs 
        foreign key (formElement_id) 
        references FormElement;

    alter table page_formElements 
        add constraint FK3j68h33t25ww0frl2j2s6exbh 
        foreign key (page_id) 
        references pages;

    alter table pages 
        add constraint FKlsq56jsg42mm80q2cr7evs6xj 
        foreign key (Form_Id) 
        references forms;

    alter table PDFElement 
        add constraint FK4ipq5n6otm49stsj9t3iic6hx 
        foreign key (formElement_id) 
        references FormElement;

    alter table PDFForm 
        add constraint FKeecbtcl8aqy7rtbgko0gxfct3 
        foreign key (form_Id) 
        references forms;

    alter table PDFForm 
        add constraint FK49wbs09vujlgdt9i1yvnirofn 
        foreign key (owner_Id) 
        references Members;

        

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
	VALUES (2, 'manish05@gmail.com', false, 'John', 'Doe', '', '$2a$10$5hm7uyBSr7FH.hrKEjJ.9OJujvS51vFaCXJUDFAT5/mwZ5K.j/5VK', 'amanish05', 2, 2);
	
INSERT INTO members(id, email, enabled, first_name, last_name, middle_name, password, username, address_id, roles_role_id) 
	VALUES (3, 'manish10@gmail.com', true, 'Jane', 'Doe', '', '$2a$10$MqrBt.e.AuKqRWeIoddi6OCe43XKTaaa2.AgPc6S.OvtFxdwifOHq', 'amanish10', 3, 3);
        
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
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 1, true, false, true, 'name', 'NAME OF APPLICANT (Last, First, Middle):', 1);

INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, date_format, form_Id)
	VALUES('DateText', 2, true, false, true, 'date', 'DATE OF BIRTH (Mo./Day/Year):', 'mm/dd/yyyy', 1);

INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 3, true, false, true, 'placeOfbirth', 'PLACE OF BIRTH (City and Country):', 1);

INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 4, true, false, true, 'nationality', 'NATIONALITY:', 1);

INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, group_Id, form_Id)
	VALUES('Group', 5, true, false, true, 'CONTACT_INFORMATION', 'CONTACT INFORMATION', 1, 1);

INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 6, true, false, true, 'priphonenumber', 'Primary Phone Number:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (5, 6);	

INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 7, true, false, true, 'secphonenumber', 'Secondary Phone Number:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (5, 7);	

INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 8, true, false, true, 'workphonenumber', 'Work Phone Number:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (5, 8);	
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 9, true, false, true, 'email', 'Email Address:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (5, 9);

INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, group_Id, form_Id)
	VALUES('Group', 10, true, false, true, 'CURRENT RESIDENCE', 'CURRENT RESIDENCE', 2, 1);	
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 11, true, false, true, 'homeaddress', 'Street Address:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (10, 11);	
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 12, true, false, true, 'city', 'City:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (10, 12);	
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 13, true, false, true, 'state', 'State:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (10, 13);		
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 14, true, false, true, 'zip', 'Zip:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (10, 14);	
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 15, true, false, true, 'country', 'Country:', 1);

INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (10, 15);

INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, group_Id, form_Id)
	VALUES('Group', 16, true, false, true, 'CURRENT_OCCUPATION', 'CURRENT OCCUPATION', 3, 1);		
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 17, true, false, true, 'companyname','Company Name:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 17);	
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 18, true, false, true, 'companyaddress', 'Street Address:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 18);	
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 19, true, false, true, 'citystate', 'City/State:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 19);	
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 20, true, false, true, 'companyzip', 'Zip/ Postal Code (If any):', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 20);	
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 21, true, false, true, 'occupation', 'Occupation:', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 21);	
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, date_format, form_Id)
	VALUES('DateText', 22, true, false, true, 'comstartdate', 'From (Mo./Day/Year):', 'mm/dd/yyyy', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 22);	
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, date_format, form_Id)
	VALUES('DateText', 23, true, false, true, 'comenddate', 'To (Mo./Day/Year):', 'mm/dd/yyyy', 1);
	
INSERT INTO FormElement_FormElement(GroupElement_id, groupFormElements_id)
	VALUES (16, 23);	

INSERT INTO choices(id, text)
	VALUES(1, 'Single');
	
INSERT INTO choices(id, text)
	VALUES(2, 'Married');
	
INSERT INTO choices(id, text)
	VALUES(3, 'Divorced');
	
INSERT INTO choices(id, text)
	VALUES(4, 'Widowed');
	
INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, multiple_choice_type, number_of_allowed_select, form_Id)
	VALUES('MultipleChoice', 24, true, true, true, 'martialstatus', 'MARITAL STATUS:', 1, 1, 1);
	
INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(24, 1);

INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(24, 2);

INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(24, 3);

INSERT INTO FormElement_choices( MultipleChoice_id, choices_id)	
	VALUES(24, 4);

INSERT INTO FormElement(elementType, id, is_enabled, is_multiple_answer_allowed, is_required, name, title, form_Id)
	VALUES('TextBox', 25, true, false, true, 'numofmarriages', 'HOW MANY TIMES HAVE YOU BEEN MARRIED?', 1);

INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 1);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 2);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 3);

INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 4);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 5);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 6);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 7);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 8);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 9);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 10);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 11);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 12);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 13);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 14);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 15);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 16);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 17);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 18);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 19);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 20);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 21);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 22);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 23);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 24);
	
INSERT INTO page_formelements (page_id, formelement_id) 
	VALUES (1, 25);
	
INSERT INTO Answer(answerType, id, textarea_value, textbox_value ,formId, memberId)
	VALUES('TextBox', 1,'','Hopkins,Steven', 1, 1);
	
INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(1, 1);	

INSERT INTO Answer(answerType, id, date_value, formId, memberId)
	VALUES('TextDateA', 2,'09/23/1985', 1, 1);

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(2, 2);

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 3,'Los Angeles, United States', 1, 1);

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(3, 3);

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 4,'American', 1, 1);

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(4, 4);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 5,'(606)-432-2223', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(6, 5);	

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 6,'(606)-563-8732', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(7, 6);

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 7,'(324)-621-6547', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(8, 7);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 8,'steven12@yahoo.com', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(9, 8);

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 9,'1212 Fair Oaks', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(11, 9);

INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 10,'Passadena', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(12, 10);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 11,'California', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(13, 11);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 12,'90122', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(14, 12);		
			
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 13, 'United States', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(15, 13);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 14,'Hido Co.', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(17, 14);					
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 15,'22 Fare Oaks', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(18, 15);
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 16,'Passadena', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(19, 16);		
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 17,'90101', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(20, 17);			
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 18,'Software Engineer', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(21, 18);
	
INSERT INTO Answer(answerType, id, date_value, formId, memberId)
	VALUES('TextBox', 19,'01/01/2015', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(22, 19);							
	
INSERT INTO Answer(answerType, id, date_value, formId, memberId)
	VALUES('TextBox', 20,'01/12/2016', 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(23, 20);	
	
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('MultipleChoice', 21, 1, 1);	

INSERT INTO formElement_answers(formElement_id, answer_id)
	VALUES(24, 21);		
	
INSERT INTO Answer_choices(MultipleChoiceAnswer_id, choiceAnswers_id)
	VALUES(21, 2);		
	
INSERT INTO Answer(answerType, id, textbox_value ,formId, memberId)
	VALUES('TextBox', 22, 'One', 1, 1);	

INSERT INTO formElement_answers(formElement_id,answer_id)
	VALUES(25, 22);

	
ALTER SEQUENCE addresses_id_seq 
	RESTART WITH 4;

ALTER SEQUENCE answer_id_seq 
	RESTART WITH 23;
	
ALTER SEQUENCE choices_id_seq 
	RESTART WITH 5;
	
ALTER SEQUENCE formelement_id_seq 
	RESTART WITH 26;
	
ALTER SEQUENCE forms_id_seq 
	RESTART WITH 6;
	
ALTER SEQUENCE members_id_seq 
	RESTART WITH 4;
	
ALTER SEQUENCE pages_page_id_seq 
	RESTART WITH 6;
	
ALTER SEQUENCE roles_role_id_seq 
	RESTART WITH 4;
