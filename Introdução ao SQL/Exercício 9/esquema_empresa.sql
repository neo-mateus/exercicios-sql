create table employed (
	ID integer(255),
    employed_name varchar(20),
    street varchar(50),
    city varchar(20),
    primary key (ID)
);

create table works(
	ID integer(255),
    company_name varchar(30),
    salary numeric(6,2),
    foreign key (ID) references employed(ID),
    foreign key (company_name) references company(company_name)
);
create table company(
	company_name varchar(30),
    city varchar(20),
    primary key (company_name)
);

create table manage(
	ID integer(255),
    manager_id integer(255),
    primary key(ID),
    foreign key (ID) references employed(ID)
);