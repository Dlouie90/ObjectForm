
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

    create table pdf_files (
        file_id  serial not null,
        created_date timestamp,
        file_content bytea,
        file_name varchar(255),
        modified_date timestamp,
        ownerId int4,
        primary key (file_id)
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

    alter table pdf_files 
        add constraint FK7o4r63k0empq2jop6i774c6o 
        foreign key (ownerId) 
        references Members;
