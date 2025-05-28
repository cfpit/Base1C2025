-- Clase 9

-- TP N4 Consultas Relacionadas
use pubs;
-- Ej 31: Seleccionar todos los libros junto a todos los datos de 
-- la editorial la cual lo publicó. 
select  	*
from		titles t
inner join	publishers p
on			t.pub_id = p.pub_id;

-- variante
select  	p.*, t.*
from		titles t
inner join	publishers p
on			t.pub_id = p.pub_id;

-- 33. Listar los autores que residan en el mismo estado que las 
-- tiendas. Mostrar el nombre y apellido del autor en una columna 
-- y el nombre de la tienda en otra. Apodar ambas columnas. 
-- Ordenar por la columna 1. 
select 		concat(a.au_fname,' ', a.au_lname) as autor,
			s.stor_name tienda
from		stores s
inner join	authors a
on			a.state = s.state
order by	1;

-- 34. Mostrar el nombre y apellido del autor y el nombre de los 
-- libros publicados por el mismo. Mostrar un apodo para cada 
-- columna. Ordenar por la primera columna de la consulta.
select		concat(a.au_fname,' ', a.au_lname) as autor,
			t.title libro
from		authors a
inner join	titleauthor ta on a.au_id =ta.au_id
inner join	titles t on t.title_id =ta.title_id
order by 	1;

-- 36. Mostrar el nombre de las editoriales que no hayan 
-- publicado ningún libro. 
-- tabla ppal: publishers
select		p.pub_name editorial
			-- ,t.* -- todos los campos de la tabla secundaria
from		publishers p
left join	titles t
on			t.pub_id = p.pub_id
where		t.title_id is null;

-- 37. Mostrar el nombre de los libros que nunca fueron vendidos
-- tabla ppal: titles
-- tabla secundaria: sales
select		t.title titulo
			-- , s.*
from		sales s
right join	titles t  on t.title_id = s.title_id
where		s.stor_id is null;

-- 38. Mostrar el nombre y apellido de los empleados y la 
-- descripción del trabajo que realiza. Basar la relación en el 
-- nivel de trabajo.
select		concat(e.fname,' ',e.lname) as empleado,
			j.job_desc as puesto
from		employee e
inner join	jobs j on j.job_id = e.job_id
-- where		e.job_lvl between j.min_lvl and j.max_lvl;
where		e.job_lvl between 100 and 150;

-- 39. Mostrar el producto cartesiano entre los libros de negocio 
-- (business) y las tiendas ubicadas en California (CA). 
-- Mostrar el nombre de la tienda y el nombre del libro. Ordenar 
-- por nombre de tienda. 
select		st.stor_name tienda,
			t.title libro,
            t.type categoria,
            st.state estado
from		stores st
cross join	titles t
where		t.type = 'business' and st.state = 'ca'
order by	1;




-- operaciones entre consultas
create database operaciones;

use operaciones;

create table A (pais varchar(30));
create table B (pais varchar(30));

insert into A values('Argentina'),('Brasil'),('Uruguay');
insert into B values('Argentina'),('Colombia'),('Venezuela');

select * from A;
select * from B;

-- union
select 	pais from A
union
select 	pais from B;

-- union all
select 	pais from A
union all
select 	pais from B;

-- intersect

-- en SQL Server
/*
select 	pais from A
intersect
select 	pais from B;
*/

SELECT A.pais
FROM A
WHERE A.pais IN (SELECT B.pais FROM B);

-- except

-- en SQL Server
/*
select 	pais from A
except
select 	pais from B;
*/
-- A except B
SELECT 	DISTINCT *
FROM 	A
WHERE NOT EXISTS
		(
			SELECT NULL 
			FROM B
			WHERE A.pais = B.pais
		);

-- B except A
SELECT 	DISTINCT *
FROM 	B
WHERE NOT EXISTS
		(
			SELECT NULL 
			FROM A
			WHERE B.pais = A.pais
		);









        













