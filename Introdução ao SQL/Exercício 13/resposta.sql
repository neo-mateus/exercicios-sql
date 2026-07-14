create table person(
	driver_id int(127) check (driver_id > 0),
    name varchar(40),
    address varchar(120),
    primary key (driver_id)
);

create table car(
	vin int(127) check (vin > 0),
    model varchar(40),
    year int(127) check (year > 1980),
    primary key (vin)
);

create table accident(
	sinister_num int(127) check (sinister_num > 0),
    year int(127) check (year > 2000),
    local varchar(120),
    primary key (sinister_num)
);

create table have(
	driver_id int(127),
    vin int(127),
    primary key (driver_id, vin),
    foreign key (driver_id) references person(driver_id),
    foreign key (vin) references car(vin)
);

create table participed(
	sinister_num int(127),
    vin int(127),
    driver_id int(127),
    damage_val numeric(8, 2) check (damage_val > 0),
    primary key (sinister_num, vin),
    foreign key (sinister_num) references accident(sinister_num),
    foreign key (vin) references car(vin),
    foreign key (driver_id) references person(driver_id)
    );