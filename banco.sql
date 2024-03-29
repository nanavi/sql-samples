create table banco( cod_banco integer, name_banco varchar(50) ); 
create table agencia( cod_angencia integer, name_agencia varchar(50), fk_banco integer ); 
create table cuenta( number_cuenta integer, balance integer, tipo varchar(50) ); 
create table agencia_cuenta( fk_agencia_m integer, fk_cuenta_m integer ); 
create table cliente( dni integer, name_ varchar(50), genre varchar(50), calle_d varchar(50), numero_d integer, complement_d varchar(50), city_d varchar(50), state_d varchar(50) ); 
create table telefono( residential varchar(50), business varchar(50), cellphone varchar(50), fk_cliente integer); 
create table cuenta_cliente( fk_cuenta integer, fk_cliente integer ); 
--banco
alter table banco add primary key(cod_banco); 
--agencia 
alter table agencia add primary key(cod_angencia); 
alter table agencia add foreign key(fk_banco) references banco(cod_banco); 
--cuenta 
alter table cuenta add primary key(number_cuenta); 
--agencia cuenta 
alter table agencia_cuenta add primary key(fk_agencia_m,fk_cuenta_m); 
alter table agencia_cuenta add foreign key(fk_agencia_m) references agencia(cod_angencia); 
alter table agencia_cuenta add foreign key(fk_cuenta_m) references cuenta(number_cuenta); 
--clientes 
alter table cliente add primary key(dni); 
--telephone 
alter table telefono add primary key(fk_cliente); 
alter table telefono add foreign key(fk_cliente) references cliente(dni); 
--cuenta cliente 
alter table cuenta_cliente add primary key(fk_cuenta,fk_cliente); 
alter table cuenta_cliente add foreign key(fk_cuenta) references cuenta(number_cuenta); 
alter table cuenta_cliente add foreign key(fk_cliente) references cliente(dni);
