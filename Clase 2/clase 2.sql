-- selecciono la base negocio por defecto
use negocio;

-- listar las tablas de la base negocio
show tables;

-- veo la estructura de la tabla productos
describe productos;

-- listar todos los clientes
select * from clientes;-- *: todos los campos

-- listar nombre, apellido y direccion de los clientes
select nombre, apellido, direccion  from clientes;

-- listar articulo, precio, marca de los productos
select articulo, precio, marca  from productos;

-- uso de columnas calculadas y agregadas
select 	articulo, 
		precio,
        round(precio * 1.21, 2),-- columna calculada 
        marca,
        'esto es un comentario'-- columna agregada
from 	productos; 

-- uso de alias de columna
select 	articulo, 
		precio,
        round(precio * 1.21, 2) as 'precio con IVA',-- columna calculada 
        marca,
        'esto es un comentario'-- columna agregada
from 	productos;

/*
	operadores aritmeticos: + - * /
    operadores relacionales: >  <   >=  <=  =  <> o !=
    operadores logicos: and  or  not
    operadores de intervalo: between
    operadores de lista: in
    operadores de similitud: like, rlike
    
*/

-- Filtros de registros
-- listar productos cuyo precio sea mayor a 150 $
-- clausula WHERE para filtrar registros
select 	* 
from 	productos
where	precio > 150;

-- listar los productos que no sean de color morado
select 	* 
from 	productos
-- where	color <> 'morado';
where	color != 'morado';

-- listar los productos que no sean ni morado ni marron
select 	* 
from 	productos
where	color != 'morado' and color != 'marron';

-- listar los productos entre 100 y 200 $
select 	* 
from 	productos
-- where	precio >= 100 and precio <= 200;
where	precio between 100 and 200;
-- where	precio not between 100 and 200;
-- where	precio  between 200 and 100;

-- between incluye extremos

-- listar las ventas del 2017
select	*
from	facturas
-- where	fecha between '2017-01-01' and '2017-12-31';
where	year(fecha) = 2017;

-- listar las ventas del 2do semestre del 2017
select	*
from	facturas
where	year(fecha) = 2017 and month(fecha) > 6;

-- listar los productos de las marcas Kosiuko o MKF
select 	* 
from 	productos
-- where	marca = 'Kosiuko' or marca = 'MKF';
-- where	marca in ('Kosiuko','MKF');
where	marca not in ('Kosiuko','MKF');

-- listar los articulos q empiecen con c
select 	* 
from 	productos
-- where	articulo like 'c%';
where	articulo not like 'c%';








