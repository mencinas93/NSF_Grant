DROP TABLE IF EXISTS Orgs;
DROP TABLE IF EXISTS Programs;
DROP TABLE IF EXISTS Fields;
DROP TABLE IF EXISTS Managers;
DROP TABLE IF EXISTS Researcher;
DROP TABLE IF EXISTS Grants;
DROP TABLE IF EXISTS Grant_Programs;
DROP TABLE IF EXISTS Grant_Fields;
DROP TABLE IF EXISTS Grant_Researchers;



create table Orgs 
(
   Org_ID int,
   Name varchar(30) not null,
   Streetaddr varchar(30),
   City varchar(15),
   State char(2),
   Zip char(5),
   Phone char(10),
   primary key (Org_ID)
);

create table Programs
(
    Program_ID int,
    Name varchar(20),
    Directorate char(10),
    primary key (Program_ID)
);

create table Fields
(
    Fields_ID int,
    Name varchar(20),
    primary key (Fields_ID)
);

create table Managers
(
    Manager_ID int,
    Name varchar(20) not null,
    primary key(Manager_ID)
);

create table Researcher
(
    Researcher_ID int,
    Name varchar (20) not null,
    Org_ID int,
    primary key (Researcher_ID),
    foreign key(Org_ID) references Orgs(Org_ID) on delete set null
);

create table Grants
(
 Grant_ID int,
 Title varchar (20),
 Amount float (10),
 Org_ID int,
 Researcher_ID int,
 Manager_ID int,
 Started DATE,
 Ended DATE,
 Abstract text,
 Primary Key (Grant_ID),
 foreign key (Org_ID) references Orgs(Org_ID) on delete set null,
 foreign key (Researcher_ID) references Researcher(Researcher_ID) on delete set null,
 foreign key (Manager_ID) references Managers(Manager_ID) on delete set null
);

create table Grant_Programs
(
    Grant_ID int,
    Program_ID int,
    primary key(Grant_ID, Program_ID),
    foreign key (Grant_ID) references Grants(Grant_ID) on delete cascade,
    foreign key (Program_ID) references Programs(Program_ID) on delete cascade
);



create table Grant_Fields
(
    Grant_ID int,
    Fields_ID int,
    primary key (Grant_ID, Fields_ID),
    foreign key (Grant_ID) references Grants(Grant_ID) on delete cascade,
    foreign key (Fields_ID) references Fields(Fields_ID) on delete cascade
);

create table Grant_Researchers
(
    Researcher_ID int,
    Grant_ID int,
    primary key (Researcher_ID, Grant_ID),
    foreign key (Researcher_ID) references Researcher(Researcher_ID) on delete cascade,
    foreign key (Grant_ID) references Grants(Grant_ID) on delete cascade
);


