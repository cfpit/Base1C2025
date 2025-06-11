-- Clase 11
-- Ejercicios DML
 
use negocio;
select * from clientes;
describe clientes;

-- 1-  Insertar 5 clientes en la tabla clientes utilizando el insert into sin utilizar campos como parte de la sentencias, es decir de la forma simplificada. Deben estar todos los valores de todos los campos de la tabla clientes.

insert into clientes values 
(10, 'Juan', 'Perez','belgrano 123 caba' ,'987-8976','jp@gmail.com',12345678,1);

insert into clientes values 
(11, 'Pedro', 'Picapiedra','piedras 300 caba' ,'987-8976','pp@gmail.com',23456780,1),
(12, 'Ana', 'Gomez','av. rivadavia 456 caba' ,'123-4567','anagomez@yahoo.com',23456789,2);


-- 2-  Insertar 5 clientes en la tabla clientes utilizando los campos como parte de la sentencias, es decir de la forma extendida. Completar sólo los campos nombre, apellido y DNI.
insert into clientes (idcliente,nombre, apellido, dni) values 
(13,'Ana', 'Gomez', 12345678),
(14,'Luis', 'Martinez', 87654321),
(15,'Maria', 'Lopez', 23456789),
(16,'Carlos', 'Fernandez', 34567890),
(17,'Laura', 'Sanchez', 45678901);

-- 3-  Actualizar el nombre del cliente 1 a José.
update clientes
set nombre = 'José'
where idcliente = 1;

SELECT * FROM clientes WHERE idcliente = 1;


-- 4-  Actualizar el nombre apellido y DNI del cliente 3 a Pablo Fuentes 21053119.

UPDATE clientes
SET nombre = 'Pablo', apellido = 'Fuentes', dni = 21053119
WHERE idcliente = 3;

SELECT * FROM clientes WHERE idcliente = 3;

-- 5-  Eliminar los clientes con apellido Perez.
SELECT * FROM clientes WHERE apellido = 'Perez';

DELETE FROM clientes 
WHERE apellido = 'Perez';
-- no se puede eliminar el cliente 1 porque es una clave foránea en la tabla ventas.

-- 6-  Eliminar los clientes con DNI Terminan en 0.
SELECT * FROM clientes WHERE dni like '%0';

DELETE FROM clientes 
WHERE dni like '%0';

-- Basándose en la tabla productos, realizar los siguientes puntos.
-- 7- Aumentar un 20% los precios de los artículos con precio menor o igual a 100.
UPDATE productos
SET precio = precio * 1.2
WHERE precio <= 100;

SELECT * FROM productos WHERE precio <= 100;

-- 8- Aumentar un 15% los precios de los artículos con precio mayor a 50.
UPDATE productos
SET precio = precio * 1.15
WHERE precio > 50;

SELECT * FROM productos WHERE precio > 50;

-- 9- Bajar un 5% los precios de los artículos con precio mayor a 200.
UPDATE productos
SET precio = precio * 0.95
WHERE precio > 200;

SELECT * FROM productos WHERE precio > 200;


-- 10- Eliminar los artículos con stock igual a 0.
SELECT * FROM productos WHERE stock > 10;

DELETE FROM productos 
WHERE stock > 10;

select * from facturas;
-- no se puede eliminar por integridad referencial, la tabla facturas tiene una clave foránea que hace referencia a la tabla productos.

