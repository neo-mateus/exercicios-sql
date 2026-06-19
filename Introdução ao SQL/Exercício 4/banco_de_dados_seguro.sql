/*Foi criado um novo esquema de relação para responder este
exercício, segue abaixo as tabelas constituintes do esquema*/

create table people(
	id_driver int(255),
    name varchar(50),
    address varchar(100),
    primary key (id_driver)
);
create table car(
	vin int(255),
    model varchar(30),
    year int(255),
    primary key (vin)
);

create table accident(
	sinister_num int(255),
    year int(255),
    local varchar(100),
    primary key (sinister_num)
    );
    
create table have(
	id_driver int(255),
    vin int(255),
    primary key (id_driver),
    foreign key (id_driver) references people(id_driver),
    foreign key (vin) references car(vin)
    );
    
create table participed(
	sinister_num int(255),
    vin int(255),
    id_driver int(255),
    damage_value numeric(7,2),
    primary key (sinister_num, vin),
	foreign key (id_driver) references people(id_driver),
    foreign key (vin) references car(vin),
    foreign key (sinister_num) references accident(sinister_num)
);