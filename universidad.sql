--SQL 
create table departamento( depa_nombre varchar(50), edificio varchar(50), presupuesto integer ); 
create table profesor( id_profesor integer, nombre varchar(50), prim_ap varchar(50), segu_ap varchar(50), fecha_naci date, fk_depa_nombre varchar(50) ); 
create table estudiante( id_estudiante integer, nombre varchar(50), prim_ap varchar(50), segu_ap varchar(50), depa_nombre varchar(50), fk_depa_nombre varchar(50) ); 
create table telefono( fk_id_estudiante integer, personal varchar(50), hogar varchar(50) ); 
create table curso( id_curso integer, creditos integer, nombre varchar(50), fk_depa_nombre varchar(50) );
create table prerequisitos( fk_id_curso0 integer, fk_id_curso1 integer ); 
create table clase( clase_id_edificio varchar(45), clase_id_numero integer, capacidad integer ); 
create table horario( id_horario integer, hora_final varchar(45), hora_inicio varchar(45), dia varchar(50) ); 
create table seccion( id_seccion integer, semestre integer, anio integer, fk_edificio varchar(45), fk_numero integer ); 
create table horario_seccion( fk_seccion integer, fk_horario integer ); 
create table profesor_seccion( fk_seccion integer, fk_profesor integer ); 
create table estudiante_seccion( fk_seccion integer, fk_estudiante integer ); 
--departamento 
alter table departamento add primary key(depa_nombre);
--profesor 
alter table profesor add primary key(id_profesor); 
alter table profesor add foreign key(fk_depa_nombre) references departamento(depa_nombre); 
--estudiante 
alter table estudiante add primary key(id_estudiante); 
alter table estudiante add foreign key(fk_depa_nombre) references departamento(depa_nombre); 
--telefono 
alter table telefono add primary key(fk_id_estudiante); 
alter table telefono add foreign key(fk_id_estudiante) references estudiante(id_estudiante); 
--curso 
alter table curso add primary key(id_curso); 
alter table curso add foreign key(fk_depa_nombre) references departamento(depa_nombre); 
--prerequisitos 
alter table prerequisitos add primary key(fk_id_curso0, fk_id_curso1); 
alter table prerequisitos add foreign key(fk_id_curso0) references curso(id_curso); 
alter table prerequisitos add foreign key(fk_id_curso1) references curso(id_curso); 
--clase 
alter table clase add primary key(clase_id_edificio, clase_id_numero); 
--SECCION 
alter table seccion add primary key(id_seccion); 
alter table seccion add foreign key(fk_edificio, fk_numero) references clase(clase_id_edificio, clase_id_numero); 
--HORARIO 
alter table horario add primary key(id_horario); 
--HORARIO SECCION 
alter table horario_seccion add primary key(fk_seccion, fk_horario); 
alter table horario_seccion add foreign key(fk_seccion) references seccion(id_seccion); 
alter table horario_seccion add foreign key(fk_horario) references horario(id_horario); 
--profesor_seccion 
alter table profesor_seccion add primary key(fk_seccion, fk_profesor); 
alter table profesor_seccion add foreign key(fk_seccion) references seccion(id_seccion); 
alter table profesor_seccion add foreign key(fk_profesor) references profesor(id_profesor); 
--estudiante_seccion 
alter table estudiante_seccion add primary key(fk_seccion, fk_estudiante); 
alter table estudiante_seccion add foreign key(fk_seccion) references seccion(id_seccion); 
alter table estudiante_seccion add foreign key(fk_estudiante) references estudiante(id_estudiante);
