CREATE DATABASE ddl_dml DEFAULT CHARACTER SET = 'utf8mb4';

use ddl_dml;

-- Ejercicio 1 Según la siguiente tabla:

create table cursos (
    codigo int,
    nombre varchar(20),
    dias varchar(10),
    inscriptos int,
    primary key (codigo)
);

-- Mostrar las tablas de la base seleccionada.
show TABLES;

-- Insercion de datos en la tabla cursos.
insert into
    cursos
values (1, 'PHP', 'lunes', 10),
    (2, 'Java', 'lunes', 5),
    (3, 'Corel Draw', 'martes', 2),
    (4, 'Java', 'martes', 5),
    (5, 'MySQL', 'martes', 5),
    (6, 'Oracle', 'miercoles', 6),
    (7, 'C#.net', 'jueves', 5),
    (8, 'C#.net', 'viernes', 4),
    (9, 'PHP', 'lunes', 10),
    (10, 'C#.net', 'lunes', 5),
    (11, 'Corel Draw', 'martes', 2),
    (12, 'Oracle', 'martes', 5),
    (13, 'PHP', 'martes', 5),
    (14, 'Oracle', 'miercoles', 6),
    (15, 'C#.net', 'jueves', 5),
    (16, 'Java', 'viernes', 4);

-- Realizar las siguientes consultas.
-- 1 - Agregar un alumno inscripto al curso Java de los días Lunes.
SELECT * FROM cursos WHERE nombre = 'Java' AND dias = 'lunes';

UPDATE cursos
SET inscriptos = inscriptos + 1
WHERE nombre = 'Java' AND dias = 'lunes';

-- 2 - Poner en 0 la cantidad de alumnos inscriptos de los cursos de los días Martes.
SELECT * FROM cursos WHERE dias = 'martes';

UPDATE cursos
SET inscriptos = 0
WHERE dias = 'martes';

-- 3 - Borrar los cursos de Java en día Martes
SELECT * FROM cursos WHERE nombre = 'Java' AND dias = 'martes';

DELETE FROM cursos
WHERE nombre = 'Java' AND dias = 'martes';


-- 4 - Sumar 5 inscriptos en los cursos que tengan menos de 5 alumnos inscriptos.
SELECT * FROM cursos WHERE inscriptos < 5;

UPDATE cursos
SET inscriptos = inscriptos + 5
WHERE inscriptos < 5;


-- 5 - Cambiar el nombre de los cursos Java por Java 2 SE.
SELECT * FROM cursos WHERE nombre = 'Java';

UPDATE cursos
SET nombre = 'Java 2 SE'    
WHERE nombre = 'Java';

SELECT * FROM cursos WHERE nombre = 'Java 2 SE';





-- Ejercicio 2
use ddl_dml;
-- Según la siguiente tabla:
create table empleados(
        codigo int auto_increment,
        nombre varchar(20) not null,
        apellido varchar(20) not null,
        seccion varchar(20),
        sueldo float,
        primary key (codigo)
);

insert into empleados (nombre,apellido,seccion,sueldo) values
        ('juan','perez','administracion',7200),
        ('diego','torres','ventas',3520),
        ('laura','gomez','ventas',4600),
        ('mario','lopez','produccion',4500),
        ('dario','sanchez','administracion',8600),
        ('juan','boneli','administracion',7200),
        ('diego','martinez','ventas',3520),
        ('laura','moretti','ventas',4600),
        ('sandra','lazante','produccion',4500),
        ('susana','mendez','administracion',8600);

        SELECT * FROM empleados;

-- 1 Cambiar al empleado Mario López de la sección producción a administración.
UPDATE empleados
SET seccion = 'administracion'
WHERE nombre = 'mario' AND apellido = 'lopez';

SELECT * FROM empleados WHERE nombre = 'mario' AND apellido = 'lopez';

-- 2 Aplicar un aumento de sueldo básico del 15% a los empleados de ventas.
SELECT * FROM empleados WHERE seccion = 'ventas';

UPDATE empleados
SET sueldo = sueldo * 1.15
WHERE seccion = 'ventas';


-- 3 Aplicar un aumento del 8% a todos los empleados de producción que tengan un sueldo básico menor a 6000 pesos.
SELECT * FROM empleados WHERE seccion = 'produccion' AND sueldo < 6000;

UPDATE empleados
SET sueldo = sueldo * 1.08
WHERE seccion = 'produccion' AND sueldo < 6000;

-- 4 Dar de baja al empleado Susana Méndez.
SELECT * FROM empleados WHERE nombre = 'susana' AND apellido = 'mendez';

DELETE FROM empleados
WHERE nombre = 'susana' AND apellido = 'mendez';


-- 5 Aplicar un aumento de sueldo del 4% a todos los empleados que tengan un básico mayor o igual a 5000 pesos.
SELECT * FROM empleados WHERE sueldo >= 5000;


UPDATE empleados
SET sueldo = sueldo * 1.04
WHERE sueldo >= 5000;


-- 6 Aplicar un aumento de sueldo del 8% a todos los empleados que tengan un básico menor a 5000 pesos.
SELECT * FROM empleados WHERE sueldo < 5000;

UPDATE empleados
SET sueldo = sueldo * 1.08
WHERE sueldo < 5000;




-- CLONACION DE TABLAS 
use ddl_dml;


create table clientes(
						codigo int primary key auto_increment,
						nombre varchar(40) not null,
						dni int not null unique,
						sexo char(1) not null default 'F',
						categoria int not null check (categoria between 1 and 10) 
  
						);

-- insercion de algunos registros
insert into clientes (nombre,dni,sexo,categoria)
values	('carlos',25765981,'M',6),
        ('jose',24578965,'M',3),
        ('maria',19653827,'F',8),
        ('mariana',20123456,'F',5);

-- verificacion de la insercion
SELECT * FROM clientes;


-- clonar la tabla clientes sin datos
create table clientes2 like clientes; 

show TABLES;

SELECT * FROM clientes2;

--clona la tabla clientes con los datos
CREATE TABLE clientes3 LIKE clientes;
INSERT INTO clientes3 SELECT * FROM clientes;

-- verificacion de la insercion
SELECT * FROM clientes3;


-- no cumple restriccion(constraint) check	
insert into clientes (nombre,dni,categoria)
values ('maria',9653827,18);


--no cumple restriccion unique

insert into clientes (nombre,dni,categoria)
values ('jorge',24578965,9);

SELECT * FROM clientes;

-- no cumple restriccion PK
insert into clientes (codigo,nombre,dni,categoria)
values (3,'jorge',12345123,9);


--clonacion parcial de la tabla clientes
CREATE TABLE clientes4 LIKE clientes;

insert into clientes4(nombre,dni,sexo,categoria)
select nombre,dni,sexo,categoria
from clientes
where codigo>2;

SELECT * FROM clientes;
SELECT * FROM clientes4;


-- si quiero clonar algunos campos de la tabla clientes
-- por ejemplo codigo y nombre
CREATE TABLE clientes5 AS
SELECT codigo, nombre
FROM clientes;


select * from clientes5;



