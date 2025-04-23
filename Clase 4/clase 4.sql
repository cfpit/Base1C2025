use pubs;

-- listar los empleados cuyo nombre no empiece con a
select 		* 
from 		employee 
-- where 		fname not like 'a%'
where 		fname rlike '^[^a]'
order by	fname asc;


-- listar los empleados cuyo nombre empiece dsd a hasta h
select 		* 
from 		employee 
where 		fname rlike '^[a-h]'
order by	fname asc;


-- listar los empleados cuyo nombre empiece con a, d, m, s
select 		* 
from 		employee 
where 		fname rlike '^[a, d, m, s]'
order by	fname asc;


-- listar los empleados cuyo nombre NO empiece dsd a hasta h
select 		* 
from 		employee 
where 		fname rlike '^[^a-h]'
order by	fname asc;

