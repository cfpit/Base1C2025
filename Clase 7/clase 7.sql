-- Laboratorio Agrupaciones
-- Un negocio registra en una tabla llamada "clientes" algunos datos de las personas que compran para luego enviarle publicidad de sus productos.

-- Creación de la base de datos:

Create database Agrupacionesclientes;

Use Agrupacionesclientes;

-- Creación de la tabla:

Create table clientes(
nombre varchar(30),
edad tinyint unsigned,
sexo char(1),
domicilio varchar(30),
ciudad varchar(20),
telefono varchar(11),
montocompra decimal (6,2) unsigned
 );
 
 drop table clientes;

-- Ingreso de registros:

Insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50); 
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);

-- Consultamos todos los registros:
select * from clientes;


-- 1- Informar la cantidad de clientes por ciudad
select		ciudad,
			count(*) as 'cantidad de clientes'
from		clientes
group by	ciudad;

select	count(telefono) as 'cantidad sin nulos'from clientes;-- 8
select	count(*) as 'cantidad con y sin nulos'from clientes;-- 10

-- elimino todos los registros de la tabla clientes
truncate table clientes;

-- 2- Cantidad de clientes por ciudad, que no sean de Villa Dolores
select		ciudad,
			count(*) as 'cantidad de clientes'
from		clientes
where		ciudad <> 'villa dolores'
group by	ciudad;


-- 3- Cual es la cantidad de clientes con teléfono no nulo, de cada ciudad, 
-- ordenados por ciudad en forma alfabética:
select		ciudad,
			count(*) as 'cantidad de clientes'
from		clientes
where		telefono is not null
group by	ciudad
-- order by	ciudad;
order by	1;


-- 4- Informar el total de las compras agrupadas por sexo:
select		sexo,
			sum(montocompra) as 'total de las compras'
from		clientes
group by	sexo;


-- 5- Obtener el máximo y mínimo valor de compra agrupados por sexo:
select		sexo,
			min(montocompra) as 'minimo valor',
            max(montocompra) as 'maximo valor'
from		clientes
group by	sexo;


-- 6- Informar el promedio del valor de compra (redondeado a 2 decimales) agrupados por 
-- ciudad (No incluir a la ciudad de La Falda) cuyo promedio(avg) sea superior a 20 $. 
-- Ordenar por promedio en forma descendente:
select		ciudad,
			round(avg(montocompra), 2) as promedio
from		clientes
where		ciudad != 'la falda'
group by	ciudad
-- having		avg(montocompra) > 20;	
having		promedio > 20
order by	promedio desc;	
        
-- 7- Informar la cantidad de clientes que no residan en la ciudad de Córdoba, 
-- ordenados por cantidad de clientes, de mayor a menor:
select 		count(*) as cantidad
from 		clientes
where		ciudad <> 'Cordoba'; -- 5

select 		ciudad,
			count(*) as cantidad
from 		clientes
where		ciudad <> 'Cordoba'
group by	ciudad
order by 	2 desc;






