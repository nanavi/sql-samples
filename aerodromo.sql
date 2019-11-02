create table persona(
	id_persona integer, 
	nombre varchar(45),
	apellido varchar(45)
);
create table telefono(
	numero_telef varchar(45),--2pk
	fk_persona integer
);
--Personas
create table proprietario(
	fk_persona integer,
	fecha_adquisicion date
);
create table piloto(
	num_licencia integer,
	anios_xp integer,
	fk_persona integer
);
create table mecanico(
	salario integer,
	turno integer,
	fk_persona integer
);
--Avion stuff
create table hangar(
	num integer,
	capacidad integer,
	ubicacion varchar(50)
);
create table avion(
	num_matricula integer,
	tipo varchar(45),
	fk_hangar integer,
	fk_piloto integer,
	fk_proprietario integer
);
--M-to-M
create table mecanico_registra(
	fecha date,
	hora time(0),
	tipo_trabajo varchar(45),
	fk_mecanico integer, -- 2 pk
	fk_avion integer		--
);
--persona
alter table persona add primary key(id_persona);
--telefono
alter table telefono add foreign key(fk_persona) references persona(id_persona);
alter table telefono add primary key(numero_telef, fk_persona);
--proprietario
alter table proprietario add foreign key(fk_persona) references persona(id_persona);
alter table proprietario add primary key(fk_persona);
--piloto
alter table piloto add foreign key(fk_persona) references persona(id_persona);
alter table piloto add primary key(fk_persona);
--mecanico
alter table mecanico add foreign key(fk_persona) references persona(id_persona);
alter table mecanico add primary key(fk_persona);
--hangar
alter table hangar add primary key(num);
--avion
alter table avion add primary key(num_matricula);
alter table avion add foreign key(fk_hangar) references hangar(num);
alter table avion add foreign key(fk_piloto) references piloto(fk_persona);
alter table avion add foreign key(fk_proprietario) references proprietario(fk_persona);
--mecanico-avion
alter table mecanico_registra add foreign key (fk_mecanico) references mecanico(fk_persona);
alter table mecanico_registra add foreign key (fk_avion) references avion(num_matricula);
