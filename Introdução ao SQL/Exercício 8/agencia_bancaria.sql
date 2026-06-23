create table branch(
	branch_name varchar(50),
    branch_city varchar(60),
    actives numeric(8,2),
    primary key (branch_name)
);

create table client(
	ID integer(255),
    client_name varchar(20),
    client_address varchar(70),
    client_city varchar(60),
    primary key (ID)
);

create table loan(
	loan_num integer(255),
    branch_name varchar(50),
    value numeric(6,2),
    primary key (loan_num),
    foreign key (branch_name) references branch(branch_name)
);

create table applicant(
	ID integer(255),
    loan_num integer(255),
    primary key (ID,loan_num),
    foreign key (ID) references client(ID),
    foreign key (loan_num) references loan(loan_num)
);

create table account(
	acc_num integer(255),
    branch_name varchar(50),
    balance numeric(6,2),
    primary key (acc_num),
    foreign key (branch_name) references branch(branch_name)
);

create table depositor(
	ID integer(255),
    acc_num integer(255),
    primary key (ID, acc_num),
    foreign key (ID) references client(ID),
    foreign key (acc_num) references account(acc_num)
);
