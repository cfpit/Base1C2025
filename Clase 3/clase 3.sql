/* 
	esto es 
	un comentario
	de bloque
*/

-- esto es un comentario de linea

-- selecciono la base de datos x defecto
use negocio;

-- veo las tablas de la base seleccionada
show tables;

-- veo la estructura de la tabla productos
describe productos;

-- queries
-- listar todos los campos de clientes
select * from clientes;-- *: todos los campos

-- listar nombre, email y telefono de los clientes
select nombre, email, telefono from clientes;

-- listar articulo, precio y marca de los productos
select 	articulo, 
		precio, 
        marca 
from 	productos;

-- listar un comentario, articulo, precio, precio con IVA y marca de los productos
select 	now() as 'Fecha de consulta',
		'esto es un comentario' as comentario, -- alias de columna
		articulo, 
		precio,
        truncate(precio * 1.21, 2)  'precio con IVA',-- alias de columna
        marca 
from 	productos;

-- filtro de registros
-- clausula WHERE
/*
	operadores aritmeticos: + - * /
    operadores relacionales: >  <  >=  <=  =  !=  <>
    operadores logicos: and  or  not
    operadores de rango: between
    operadores de lista: in
    operadores de similitud: like / rlike
    operadores de nulidad: is null / is not null
*/
-- listar los productos cuyo precio sea mayor o igual que 100 $
select * from productos where precio >= 100;

-- listar los productos cuyo precio sea mayor o igual que 100 $
-- y el stock sea mayor a 15
select * from productos where precio >= 100 and stock > 15;

-- listar los productos cuya marca sea MKF o Zara o Kosiuko
select 	* 
from 	productos 
where 	marca = 'MKF' 
or 		marca = 'Zara' 
or 		marca = 'Kosiuko';

-- variante
select 	* 
from 	productos 
where 	marca in ('MKF','Zara','Kosiuko');

-- variante con negacion
select 	* 
from 	productos 
where 	marca not in ('MKF','Zara','Kosiuko');

-- listar los productos cuyo precio este entre 100 y 200 $
select 	* 
from 	productos 
-- where 	precio >= 100 and precio <= 200;
where 	precio between 100 and 200;-- between incluye extremos

-- variante con negacion
select 	* 
from 	productos 
where 	precio not between 100 and 200;-- not between NO incluye extremos

-- listar las ventas del año 2017
select * from facturas where fecha between '2017-01-01' and '2017-12-31';

-- variante
select * from facturas where year(fecha) = 2017;

-- listar las ventas del segundo semestre del año 2017
select 	* 
from 	facturas 
where 	year(fecha) = 2017 and month(fecha) between 7 and 12;

-- clausula DISTINCT: devuelve los diferentes valores de una columna(sin repeticiones)
use pubs;

-- listar los diferentes puestos de trabajo de los empleados
select distinct(job_desc) as 'Puesto de Trabajo' from jobs;

-- listar los empleados cuyo nombre empiece con m
-- %: comodin de 0 a N caracteres
select * from employee where fname like 'm%';
select * from employee where fname rlike '^m';

-- listar los empleados cuyo nombre termine con a
select * from employee where fname like '%a';
select * from employee where fname rlike 'a$';

-- listar los empleados cuyo nombre empiece con m y termine con a
select * from employee where fname like 'm%a';
select * from employee where fname rlike '^m.*a$';
-- .* del rlike = % del like

-- listar los empleados cuyo nombre empiece con m, el 2do caracter sea
-- cualquiera, el 3er caracter sea un r y termine de cualquier manera
-- Maria, Mirtha, Moria, Marcos, Mirko, Marcela, Muriel, Martin
-- el _ es comodin de un solo caracter
select * from employee where fname like 'm_r%';
select * from employee where fname rlike '^m.r.*$';

-- ordenamiento de valores (clausula order by)
-- listar los empleados ordenados por fecha de ingreso, del
-- mas antiguo al mas reciente
select * from employee order by hire_date;-- por defecto orden asc
select * from employee order by hire_date asc;-- orden asc

-- variante orden descendente
select * from employee order by hire_date desc;-- orden desc

-- listar los libros de cocina ordenados por precio del mas caro
-- al mas barato. En caso de igualdad de precios, ordenar por
-- fecha de publicacion del mas antiguo al mas reciente
select 		* 
from 		titles
where		type like '%cook%'
order by	price desc, pubdate asc;

-- listar los libros cuyo precio sea nulo
select * from titles where price is null;

-- variante negativa
select * from titles where price is not null;























