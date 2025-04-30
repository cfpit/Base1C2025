-- Funciones de Agrupacion
-- listar el precio del titulo mas caro
select max(price) as 'precio mas caro' from titles;-- 22.95

-- Informar la fecha de publicacion del primer titulo
select min(pubdate) as 'fecha del 1er libro' from titles;

-- listar el promedio de horas trabajadas por mes de todos los empleados
select avg(job_lvl) as 'promedio de horas' from employee;

-- listar la cantidad de autores que viven en California
select count(au_id) as cantidad from authors where state = 'ca';

-- listar el monto de todos los titulos de la base de datos
select sum(price) as total from titles; 

-- Reunimos en una unica query todas las funciones de agrupacion
select	max(price) 'titulo mas caro',
		min(price) 'titulo mas barato',
		count(title_id) cantidad,
		avg(price) promedio,
		sum(price) total
from	titles;

-- Agrupaciones
-- listar la cantidad, el mas caro y el mas barato de los titulos, agrupados
-- por categoria
select 		type categoria,
			count(title_id) cantidad,
			max(price) maximo,
			min(price) minimo
from		titles
where		type not like '%cook%'
group by	type
-- having		count(title_id) > 2
having		cantidad > 2
-- order by	type;
-- order by	categoria;
order by	1
limit		2;
        







