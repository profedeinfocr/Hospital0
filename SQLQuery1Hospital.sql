--Crear Base de Datos--
create database Biblioteca0

--Crear Tablas--
create table Libro(
codigo int,
titulo varchar(100),
autor varchar (50),
precio money
)

--Insertar registros--
Insert into Libro values (1, 'Sherlock Holmes', 'Arturo Cascante', 5000)
Insert into Libro (codigo, titulo)values (2, 'Marco Ramirez')
Insert into Libro values (3, 'La casa de papel', 'Marcela Arauz', 2000),
						(4, 'La casa de las flores', 'Pedro Pascal', 1000)

--Consultar Registros--
select *from Libro
select titulo, autor from Libro
select sum(precio) from Libro
select * from Libro where codigo in (1,3,4)
select * from Libro where codigo = 2
select * from Libro where titulo = 'la casa de papel' or codigo = 4

--Actualizar Registros--
update Libro set precio = 300 where codigo = 1
update Libro set autor = 'Carlos Luis Fallas', precio = 19000 where codigo = 2

--Borrar--
delete Libro where codigo = 4
delete Libro /*borra todos los registros de la tabla*/


/***********************INICIA HOSPITAL*****************************************/

--Borrar tabla Paciente--
drop Table Paciente;

--Crear Tabla Paciente--
create Table Paciente
(
cedula varchar (14) primary key,
nombre varchar (50) not null,
sexo char(1),
edad int,
provincia varchar (10),
canton varchar (20),
distrito varchar (20),
pais varchar (200),
telefono int,
seguro bit )

--Insertar registros--
insert Paciente values ('1', 'Angela Arauz','F',17, 'Heredia', 'Heredia', 'San Francisco', 'Costa Rica',1000000 ,1)
insert Paciente values ('2', 'Blippi','M', 27, 'Heredia', 'Heredia', 'Barreal', 'USA',2000000 ,1)
insert Paciente values ('3', 'Cristobal','M', 37, 'Heredia', 'Heredia', 'Ulloa', 'Spain',3000000 ,0)
insert Paciente values ('4', 'Diana','F',1,'Heredia','Heredia','Heredia', 'Italy',4000000 ,1)
insert Paciente values ('5', 'Elizabeth','F', 45, 'Heredia','Heredia','Heredia','Tangamandapio',5000000 ,0)
insert Paciente values ('6', 'Fiona','F',11, 'Heredia','Heredia','Heredia','Rusia',6000000 ,1)
insert Paciente values ('7', 'Guille','M', 45, 'Heredia','Heredia','Heredia', 'Nicaragua',7000000 ,0)

--Consultar Registros--
select *from Paciente

--A)Lista todos los nombres--
select nombre from Paciente

--Cuenta todos los pacientes--
SELECT COUNT(cedula) FROM Paciente

--Cuenta pacientes ninos (de 13 o menos años)--
select count (cedula) from Paciente where edad < 14

--Cuenta pacientes jovenes (desde 13 hasta 29 años)--
select count (cedula) from Paciente where edad > 13 and edad < 30

--Cuenta pacientes adults (de 29 años en adelante)--
select count (cedula) from Paciente where edad > 29

--B) Porcentaje por categoria--
select (select count (cedula) from Paciente where edad < 14) * (100) / (SELECT COUNT(cedula) FROM Paciente)
select (select count (cedula) from Paciente where edad > 13 and edad < 30) * (100) / (SELECT COUNT(cedula) FROM Paciente)
select (select count (cedula) from Paciente where edad > 29) * (100) / (SELECT COUNT(cedula) FROM Paciente)


--Lista pacientes ninos (de 13 o menos años)--
select nombre from Paciente where edad < 14

--Lista pacientes jovenes (desde 14 hasta 29 años)--
select nombre from Paciente where edad > 13 and edad < 30

--Lista pacientes adultos (de 30 años en adelante)--
select nombre from Paciente where edad > 29

--D) Muestra los datos de un paciente por codigo--
select * from Paciente where cedula = 7

--Actualizar Registros--
update Paciente set edad = 30 where cedula = 1

--Borrar--
delete Paciente where cedula = 4
delete Paciente /*borra todos los registros de la tabla Paciente*/



