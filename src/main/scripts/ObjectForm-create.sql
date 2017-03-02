
------------------------------------------------------------
--  Create all the tables and other schema elements you want
------------------------------------------------------------

---------------------------
--  DDL for Table Addresses
---------------------------

	create table Addresses 
	(
        Id int4 not null,
        Area varchar(50),
        City varchar(50),
        Country varchar(30),
        House varchar(40),
        State varchar(40),
        Street varchar(40),
        Zip_Code int4,
        primary key (Id)
    );
    
     CREATE UNIQUE INDEX "ADDRESSES_UNIQUE" ON Addresses (Id);

---------------------------
--  DDL for Table Answer
---------------------------
    create table Answer 
    (
        answerType varchar(31) not null,
        id int4 not null,
        date_value timestamp,
        textarea_value varchar(255),
        textbox_value varchar(255),
        formId int4,
        memberId int4,
        primary key (id)
    );
    
    CREATE UNIQUE INDEX "ANSWER_UNIQUE" ON Answer (id);
    --------------------------------------------------------
	--  Constraints for Table Answer
	--------------------------------------------------------
     alter table Answer add constraint FKf6ofc87u4wjyf300c3aisy6el 
        foreign key (formId) 
        references forms;
        
     alter table Answer add constraint FK32j5552csr2itnpo37g5ht57f 
        foreign key (memberId) 
        references Members;

--------------------------------
--  DDL for Table Answer_choices
--------------------------------
    create table Answer_choices 
    (
        MultipleChoiceAnswer_id int4 not null,
        choiceAnswers_id int4 not null
    );
    CREATE UNIQUE INDEX "ANSWER-CHOICES_UNIQUE" ON Answer (id);
    --------------------------------------------------------
	--  Constraints for Table Answer_choices
	--------------------------------------------------------
    
    alter table Answer_choices add constraint UK_5pytliwcfpu4s3ackf198rxr4 
    	unique (choiceAnswers_id);
        
   	 alter table Answer_choices add constraint FK9j0b9drih3acthy5ll4nms74m 
        foreign key (choiceAnswers_id) 
        references choices;

    alter table Answer_choices add constraint FKt1oirg3nqfenxouwed7jv8keu 
        foreign key (MultipleChoiceAnswer_id) 
        references Answer;
        
--------------------------------
--  DDL for Table choices
--------------------------------

    create table choices 
    (
        id int4 not null,
        text varchar(255),
        primary key (id)
    );
    
--------------------------------
--  DDL for Table FormElement
--------------------------------

    create table FormElement (
        elementType varchar(31) not null,
        id int4 not null,
        is_enabled boolean,
        is_multiple_answer_allowed boolean,
        is_required boolean,
        name varchar(255),
        title varchar(255),
        group_Id int4,
        value varchar(255),
        default_value varchar(255),
        max_length int4,
        size int4,
        column_value int4,
        min_length int4,
        row_value int4,
        text_value varchar(255),
        date_format varchar(255),
        default_date timestamp,
        multiple_choice_type int4,
        number_of_allowed_select int4,
        form_Id int4,
        pdfElement_pdfElement_Id int4,
        primary key (id)
    );
    
    --------------------------------------------------------
	--  Constraints for Table FormElement
	--------------------------------------------------------
    
   	alter table FormElement add constraint FK7koo28nnw76tn0mi9ao61pqtx 
        foreign key (form_Id) 
        references forms;

    alter table FormElement add constraint FKlf1d6pyyndrmx87qy8tt1p95j 
        foreign key (pdfElement_pdfElement_Id) 
        references PDFElement;
    
-------------------------------------
--  DDL for Table formElement_answers
-------------------------------------
    
    create table formElement_answers 
    (
        formElement_id int4 not null,
        answer_id int4 not null
    );    
    
   	--------------------------------------------------------
	--  Constraints for Table formElement_answers
	-------------------------------------------------------- 
    alter table formElement_answers add constraint FK9r71yurusbyvv29ljcumj105i 
        foreign key (answer_id) 
        references Answer;

    alter table formElement_answers add constraint FKqdr9wqcki5m6anpnlqdx5m1pb 
        foreign key (formElement_id) 
        references FormElement;

-------------------------------------
--  DDL for Table FormElement_choices
-------------------------------------
    create table FormElement_choices 
    (
        MultipleChoice_id int4 not null,
        choices_id int4 not null
    );
   	
    --------------------------------------------------------
	--  Constraints for Table FormElement_choices
	--------------------------------------------------------     
     alter table FormElement_choices add constraint UK_e27wl75sqvy7w9phqms4so4l 
     	unique (choices_id);
        
     alter table FormElement_choices add constraint FK6byatdcdbtuf0p94mhyp4vn2m 
        foreign key (choices_id) 
        references choices;

    alter table FormElement_choices add constraint FKmrir97g7bblth4wcfxios49of 
        foreign key (MultipleChoice_id) 
        references FormElement;

-----------------------------------------
--  DDL for Table FormElement_FormElement
-----------------------------------------

    create table FormElement_FormElement (
        GroupElement_id int4 not null,
        groupFormElements_id int4 not null
    );
	
    -------------------------------------------------
	--  Constraints for Table FormElement_FormElement
	--------------------------------------------------     
    alter table FormElement_FormElement add constraint FKfvkfckkc5p9iafwmihafbkmn7 
        foreign key (groupFormElements_id) 
        references FormElement;

    alter table FormElement_FormElement add constraint FKoxvs3bg2w2osogxuq06xt4q3v 
        foreign key (GroupElement_id) 
        references FormElement;
        
------------------------
--  DDL for Table forms
------------------------
    
    create table forms 
    (
        Id int4 not null,
        Created_Date timestamp,
        Description varchar(100),
        Modified_Date timestamp,
        Submission_Date timestamp,
        Title varchar(40),
        ownerId int4,
        primary key (Id)
    );
    
    -------------------------------------------------
	--  Constraints for Table forms
	--------------------------------------------------    
    
      alter table forms add constraint FKkwdwbg91iugvww1i1exsohuuy foreign key (ownerId) 
        references Members;

        
------------------------------
--  DDL for Table member_roles
------------------------   -----


    create table member_roles 
    (
        member_id int4 not null,
        role_id int4 not null
    );
    
    -------------------------------------------------
	--  Constraints for Table member_roles
	--------------------------------------------------        
    
    alter table member_roles 
        add constraint FK5h9y7jfa0x18ffnnuicfpr78m foreign key (role_id) 
        references Roles;

    alter table member_roles 
        add constraint FK2540hlyieprylcidoaniysi68 foreign key (member_id) 
        references Members;

------------------------------
--  DDL for Table Members
------------------------------        
    
   create table Members 
   (
        Id int4 not null,
        Email varchar(255),
        First_Name varchar(255),
        Last_Name varchar(255),
        Middle_Name varchar(255),
        Passcode varchar(30),
        address_Id int4,
        primary key (Id)
    );
    
    
    alter table Members add constraint FK7fj6n2lr2xr32o18bxuwft5wm 
        foreign key (address_Id) 
        references Addresses;

------------------------------
--  DDL for Table page_formElements
------------------------------           
    create table page_formElements 
    (
        page_id int4 not null,
        formElement_id int4 not null
    );
    
    alter table page_formElements add constraint FK3iruri89oijg6u3np0l9pssrs 
        foreign key (formElement_id) 
        references FormElement;

    alter table page_formElements add constraint FK3j68h33t25ww0frl2j2s6exbh 
        foreign key (page_id) 
        references pages;
        
------------------------------
--  DDL for Table pages
------------------------------         
    create table pages 
    (
        Page_Id int4 not null,
        Is_Submitted boolean,
        Page_Number int2,
        Form_Id int4,
        primary key (Page_Id)
    );
    
      alter table pages add constraint FKlsq56jsg42mm80q2cr7evs6xj 
        foreign key (Form_Id) 
        references forms;

        
------------------------------
--  DDL for Table PDFElement
------------------------------ 
    create table PDFElement 
    (
        pdfElement_Id int4 not null,
        name varchar(255),
        formElement_id int4,
        primary key (pdfElement_Id)
    );
    
     alter table PDFElement add constraint FK4ipq5n6otm49stsj9t3iic6hx 
        foreign key (formElement_id) 
        references FormElement;
        
------------------------------
--  DDL for Table PDFForm
------------------------------ 
    create table PDFForm 
    (
        pdfForm_Id int4 not null,
        path varchar(255),
        form_Id int4,
        owner_Id int4,
        primary key (pdfForm_Id)
    );    
    
     alter table PDFForm add constraint FKeecbtcl8aqy7rtbgko0gxfct3 
        foreign key (form_Id) 
        references forms;

    alter table PDFForm add constraint FK49wbs09vujlgdt9i1yvnirofn 
        foreign key (owner_Id) 
        references Members;
        
------------------------------
--  DDL for Table Roles
------------------------------ 

    create table Roles
    (
        Role_Id int4 not null,
        Name varchar(255),
        primary key (Role_Id)
    );

 
    
    

--------------------------------------------------------
--  Add three users: one administrator, one staff, and one regular user.
--------------------------------------------------------

--FIRST MEMBER
INSERT INTO members(id, email, first_name, last_name, middle_name, passcode)
    VALUES ('1', 'test@test.com', 'Manish', '', 'Kumar', 'Xyz@123');

INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES ('1', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032');

INSERT INTO roles(role_id, name)
    VALUES ('1', 'Admin');
    
    
--SECOND MEMBER
INSERT INTO members(id, email, first_name, last_name, middle_name, passcode)
    VALUES ('2', 'test@test.com', 'Kumar', '', 'Manish', 'Xyz@123');

INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES ('2', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032');

INSERT INTO roles(role_id, name)
    VALUES ('2', 'Staff');
    
    
--THIRD MEMBER
INSERT INTO members(id, email, first_name, last_name, middle_name, passcode)
    VALUES ('3', 'test@test.com', 'Manish', '', 'Kumar', 'Xyz@123');

INSERT INTO addresses(id, area, city, country, house, state, street, zip_code)
    VALUES ('3', 'College Square', 'Los Angeles', 'United States', '3', 'CA', 'Street', '90032');

INSERT INTO roles( role_id, name)
    VALUES ('3', 'User');
    

    
    

------------------------------------------------------------------------
--  Add one form which includes Fields 1-9 of the VISA INFO SHEET form.
------------------------------------------------------------------------

-- Form for fields 1-9
INSERT INTO forms(id, Description, Title, ownerId)
VALUES(1, 'Divorce Papers', 'CONSULAR PROCESSING GENERAL INFORMATION', 1);
    
-- 1. Text Box for Name Of Applicant
INSERT INTO FormElement(elementType, id, name, title, value)
	VALUES('TextBox', 01, 'name', 'NAME OF APPLICANT (Last, First, Middle):', 'Trump, Donald, John');

-- 2. DateText for Date of Birth
INSERT INTO FormElement(elementType, id, name, title, date_format, value)
	VALUES('DateText', 02, 'date', 'DATE OF BIRTH (Mo./Day/Year):', 'mm/dd/yyyy', '06/14/1946');

-- 3. Text Box for Place of Birth
INSERT INTO FormElement(elementType, id, name, title, value)
	VALUES('TextBox', 03, 'placeOfbirth', 'PLACE OF BIRTH (City and Country):', 'New York, United States of America');

-- 4. Text Box for Nationality
INSERT INTO FormElement(elementType, id, name, title, value)
	VALUES('TextBox', 04, 'nationality', 'NATIONALITY:', 'American');

-- 5. Group Element with Text Boxes for Contact Information
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 05, 'priphonenumber', 'Primary Phone Number:', '(111) 111-1111', 1);

INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 06, 'secphonenumber', 'Secondary Phone Number:', '(222) 222-2222', 1);

INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 07, 'workphonenumber', 'Work Phone Number:', '(333) 333-3333', 1);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 08, 'email', 'Email Address:', 'donaldjtrump@gmail.com', 1);

-- 6. Group Element with Text Boxes for Current Residence
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 09, 'homeaddress', 'Street Address:', '123 Fake Street', 2);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 10, 'hcity', 'City:', 'Los Angeles', 2);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 11, 'hstate', 'State:', 'CA', 2);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 12, 'hzip', 'Zip:', '11111', 2);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 13, 'hcountry', 'Country:', 'USA', 2);

-- 7. Group Element with Text Boxes and Date Texts for Current Occupation
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 14, 'companyname','Company Name:', 'Donald Trump', 3);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 15, 'companyaddress', 'Street Address:', '123 Real Street', 3);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 16, 'citystate', 'City/State:', 'Los Angeles, CA', 3);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 17, 'companyzip', 'Zip/ Postal Code (If any):', '12345', 3);
	
INSERT INTO FormElement(elementType, id, name, title, value, group_Id)
	VALUES('TextBox', 18, 'occupation', 'Occupation:', 'Freeloader', 3);
	
INSERT INTO FormElement(elementType, id, name, title, date_format, value, group_Id)
	VALUES('DateText', 19, 'comstartdate', 'From (Mo./Day/Year):', 'mm/dd/yyyy', '01/01/1946', 3);
	
INSERT INTO FormElement(elementType, id, name, title, date_format, value, group_Id)
	VALUES('DateText', 20, 'comenddate', 'To (Mo./Day/Year):', 'mm/dd/yyyy', '03/01/2017', 3);

-- 8. Multiple Choice for Marital Status
INSERT INTO choices(id, text)
	VALUES(1, 'Single');
	
INSERT INTO choices(id, text)
	VALUES(2, 'Married');
	
INSERT INTO choices(id, text)
	VALUES(3, 'Divorced');
	
INSERT INTO choices(id, text)
	VALUES(4, 'Widowed');
	
INSERT INTO FormElement(elementType, id, name, title, multiple_choice_type, number_of_allowed_select)
	VALUES('MultipleChoice', 21, 'martialstatus', 'MARITAL STATUS:', 1, 1);

-- 9. Text Box for Number of Marriages
INSERT INTO FormElement(elementType, id, name, title, value)
	VALUES('TextBox', 22, 'numofmarriages', 'HOW MANY TIMES HAVE YOU BEEN MARRIED?', '500 times');
	
	
------------------------------------------------------------------------
--  Add one set of answers to the form by a user.
------------------------------------------------------------------------

-- TextBox Answer Insert
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 81, 1, 1, 'Trump, Donald, John');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 82, 1, 1, 'New York, United States of America');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 83, 1, 1, 'American');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 84, 1, 1, '(111) 111-1111');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 85, 1, 1, '(222) 222-2222');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 86, 1, 1, '(333) 333-3333');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 87, 1, 1, 'donaldjtrump@gmail.com');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 88, 1, 1, '123 Fake Street');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 89, 1, 1, 'Los Angeles');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 90, 1, 1, 'CA');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 91, 1, 1, '11111');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 92, 1, 1, 'USA');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 93, 1, 1, 'Donald Trump');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 94, 1, 1, '123 Real Street');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 95, 1, 1, 'Los Angeles, CA');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 96, 1, 1, '12345');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 97, 1, 1, 'Freeloader');
	
INSERT INTO Answer(answerType, id, formId, memberId, textbox_value)
	VALUES('TextBox', 98, 1, 1, '500 times');
	
-- Form Elements and Answer table insert
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('TextArea', 2, 1, 1);

-- Multiple Choice and Multiple Choice Answer Table insert
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('MultipleChoice', 3, 1, 1);
	
INSERT INTO Answer_choices(MultipleChoiceAnswer_id, choiceAnswers_id)
	VALUES(3, 2);

-- Text Area Answer insert
INSERT INTO Answer(answerType, id, formId, memberId)
	VALUES('TextArea', 6, 1, 1);
