create table employed (
	ID int check (ID > 0),
    employed_name varchar(20) not null,
    street varchar(50),
    city varchar(20),
    primary key (ID)
);

create table works(
	ID int,
    company_name varchar(30),
    salary numeric(6,2),
    primary key (ID),
    foreign key (ID) references employed(ID),
    foreign key (company_name) references company(company_name)
);
create table company(
	company_name varchar(30),
    city varchar(20),
    primary key (company_name)
);

create table manage(
	ID int,
    manager_id int check (manager_id > 0),
    primary key(ID),
    foreign key (ID) references employed(ID)
);