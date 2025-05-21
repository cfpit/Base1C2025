create database relaciones;

use relaciones;

-- creo ambas tablas
create table sucursales(suc_id int, suc_nombre char(20));
create table empleados(emp_id int, emp_nombre char(20), suc_id int);

-- carga de registros en las tablas
insert into sucursales values(1, 'Centro'),(2, 'Congreso'),(3, 'Almagro'),(4, 'Palermo');
insert into empleados values(1, 'Juan', 1),(2, 'Carlos', 2),(3, 'Jose', 2),(4, 'Maria', null);

select * from sucursales;
select * from empleados;

-- INNER JOIN : devuelve aquellos registros de ambas tablas en los cuales coinciden los valores
-- de los campos por los que se relacionan.
-- El orden de las tablas es indistinto.
-- La clausula ON indica a traves de que campos se relacionan las tablas

-- listar el nombre de los empleados y de las sucursales donde trabajan
select		emp_nombre,
			suc_nombre
from		sucursales
inner join	empleados
on			sucursales.suc_id = empleados.suc_id;

/*
	Juan	Centro
	Carlos	Congreso
	Jose	Congreso
*/

-- variante: uso de alias de tabla
select		emp_nombre,
			suc_nombre
from		sucursales as s
inner join	empleados e
on			s.suc_id = e.suc_id;

-- variante 2: No ANSI
select		emp_nombre,
			suc_nombre
from		sucursales s, empleados e
where 		s.suc_id = e.suc_id;

-- Producto Cartesiano: cross join
-- No ANSI
select		emp_nombre,
			suc_nombre
from		sucursales s, empleados e;

-- ANSI
select		emp_nombre,
			suc_nombre
from		sucursales 
cross join	empleados;

-- outer join: devuelve aquellos registros en donde existen 
-- coincidencias y NO coincidencias de los valores de los campos 
-- por los cuales se relacionan las tablas.
-- Me interesa filtrar y quedarme con las No coincidencias.
-- El ejercicio que se resuelva con outer join suele tener
-- un enunciado negativo(por ejemplo: libros que no fueron vendidos
-- o autores que no escribieron libros o sucursales que no tienen
-- empleados, etc.).

-- Tipos de Outer Join:
-- a) left outer join = left join
-- a) right outer join = right join

-- Con cualquiera de ambos, debe dar el mismo resultado

-- listar las sucursales que no tienen empleados
-- tabla ppal: es aquella de la cual deseo obtener datos
-- en este ejemplo, la tabla ppal es sucursales
select	s.suc_nombre
		-- ,e.*
from	empleados e right join sucursales s
on		s.suc_id = e.suc_id
where	e.emp_id is null;-- pk de la tabla secundaria debe ser null

-- listar los empleados que no trabajan en ninguna sucursal
-- tabla ppal: empleados
select		e.emp_nombre
			-- , s.* -- todos los campos de la tabla secundaria
from		empleados e
left join	sucursales s
on			e.suc_id = s.suc_id
where		s.suc_id is null;

-- Ejercicios sobre consultas relacionadas Base Negocio
use negocio;
 -- 1) Listar la cantidad de clientes que hicieron alguna compra en 
 -- el segundo semestre de 2017.
 select 	count(c.idcliente) as 'cantidad de clientes'
			-- ,f.fecha
from		clientes c
inner join	facturas f
on			c.idcliente = f.idcliente
where		year(f.fecha)= 2017 and month(f.fecha) between 7 and 12;
-- group by	f.fecha;
 

  -- 2) Informar la cantidad de compras por cliente. Informar el 
-- nombre y apellido en una única columna de dichos clientes. 
-- Ordenar por cantidad de compras en forma descendente.
-- select concat(nombre,' ',apellido) as cliente

  -- 3) Informar las ventas por artículo. Cuál es el artículo 
-- más comprado? Ordenar por cantidad de ventas del más vendido 
-- al menos vendido.
select		articulo,
			count(*) 'cantidad de ventas'
from		productos p
inner join	facturas f
on			p.idproducto = f.idproducto
group by	articulo
order by	2 desc
limit 		1;


-- 4) Listar nombre y apellido de los clientes que compraron pantalones.
-- Indicar cuando lo compraron y cuanto pagaron.
select		c.nombre,
			c.apellido,
			p.articulo,
			f.fecha,
			p.precio
from		clientes c 
inner join 	facturas f on c.idcliente = f.idcliente
inner join	productos p on p.idproducto = f.idproducto
where		p.articulo like '%pantalon%';

-- Ejercitacion Base Pubs
use pubs;

-- 32. Mostrar el nombre del libro y el nombre de la editorial la cual lo publicó 
-- sólo de las editoriales que tengan residencia en USA. Mostrar un apodo para cada 
-- columna. 
select		t.title titulo,
			p.pub_name editorial
from		titles t
inner join 	publishers p
on			t.pub_id = p.pub_id
where		p.country = 'usa';

-- 35. Mostrar los libros junto a su autor y su editorial. 
-- Se debe mostrar los datos en una unica columna de la siguiente manera 
-- con los siguientes textos literales: 'El libro XXXXXXXXXXXXX fue 
-- escrito por XXXXXXXXXXXXX y publicado por la editorial XXXXXXXXXXXXX'
select	concat('El libro ', t.title,' fue escrito por ', 
a.au_fname,' ', a.au_lname,' y publicado por la editorial ', p.pub_name) as query
from		authors a 
inner join	titleauthor ta  on a.au_id = ta.au_id
inner join	titles t on t.title_id = ta.title_id
inner join	publishers p on p.pub_id = t.pub_id;








