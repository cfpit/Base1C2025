-- TP N1
use negocio;

-- 1 - Basándose en la tabla productos obtener los siguientes listados.
-- a- artículos con precio mayor a 100
select * from productos where precio > 100;

-- b- artículos con precio entre 100 y 200 (usar < y >)
select * from productos where precio > 100 and precio < 200;

-- c- artículos con precio entre 100 y 200 (usar BETWEEN)
select * from productos where precio between 100 and 200;

-- d- artículos con precio = 200 y stock mayor a 15
select * from productos where precio = 200 and stock > 15;

-- e- artículos con precio (120,200,300) no usar IN
select * from productos where precio = 120 or precio = 200 or precio = 300;

-- f- artículos con precio (120,200,300) usar el IN
select * from productos where precio in (120,200,300);

-- g- artículos que su precio no sea (120,200,300)
select * from productos where precio not in (120,200,300);

-- 4- Listar todos los artículos incluyendo una columna denominada 
-- “cantidad de cuotas” y otra “valor de cuota”, la cantidad es fija y es 3, 
-- el valor de cuota corresponde a 1/3 del monto con un 5% deinterés.
select 	*,
		3 as 'cantidad de cuotas',
        round((precio / 3) * 1.05, 2) as 'valor de cuota'
from 	productos;


-- TP N2
-- 1. Posicionar el Analizador de Consultas en la base de datos PUBS. 
use pubs;

-- 4. Mostrar la estructura de la tabla STORES
describe stores;

-- 6.	Mostrar el código, nombre completo y fecha de ingreso de los empleados que 
-- trabajan para la editorial 877. Tener en cuenta que el nombre completo es el 
-- resultado de la concatenación del nombre y apellido. Las columnas deben estar 
-- apodadas según las siguientes leyendas: "Número de Empleado", "Nombre de 
-- Empleado" y "Fecha de Inicio". 
select	emp_id as 'Número de Empleado',
		concat(fname,' ',lname)	 as 'Nombre de Empleado',
        hire_date 'Fecha de Inicio'
from	employee
where	pub_id = 877;

-- 9. Listar los países de residencia de las editoriales. Evitar las 
-- repeticiones.
select distinct (country) as pais from publishers;

-- 14.Listar los libros vendidos cuya condición de pago es sobre 
-- facturación y cuya cantidad de venta(qty = quantity) esté entre 13 y 40. No utilizar 
-- el operador BETWEEN. 
select payterms from sales;-- net 30, net 60 , on invoice

select	*
from	sales
where	payterms = 'on invoice'
and		qty >= 13 and qty <= 40;








