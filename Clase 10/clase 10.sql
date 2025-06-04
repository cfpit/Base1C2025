use pubs;

-- 40. Listar todas las ciudades mencionadas en la base de datos.
select city from publishers
union
select city from stores
union
select city from authors;

-- SUBCONSULTAS = SUBQUERYS = SUBSELECT = CONSULTAS ANIDADAS
-- consultas que devuelven escalares(un unico valor)
-- informar la fecha en la cual ingreso el ultimo empleado en la empresa 
SELECT max(hire_date) FROM employee;

-- consultas que devuelven una lista de valores
-- informar el nombre y apellido de todos los empleados que trabajan entre 100 y 150 horas mensuales
SELECT  concat(fname,' ',lname) as empleado
FROM    employee
WHERE  job_lvl BETWEEN 100 and 150;

-- consultas que devuelven una tabla de valores
-- listar todos los empleados que trabajan en la empresa
SELECT  *
FROM    employee;

-- subconsultas que devuelven escalares
-- informar el nombre y apellido del empleado de mayor antiguedad
SELECT  concat(fname,' ',lname) as empleado
FROM    employee
WHERE   hire_date = (SELECT min(hire_date) FROM employee);

-- informar el nombre y apellido del autor que escribio el ultimo libro de cocina
SELECT      concat(a.au_fname,' ',a.au_lname) as autor,
            t.pubdate as fecha_publicacion
FROM        authors a
INNER JOIN  titleauthor ta ON a.au_id = ta.au_id
INNER JOIN  titles t ON ta.title_id = t.title_id 
WHERE       t.pubdate = (   SELECT   max(pubdate)
                            FROM     titles
                            WHERE    type LIKE '%cook%'
                        );


-- Sentencia CASE
-- 41.	Listar el nombre de los libros junto a su categoría de precio. La categoría de precio se calcula de la siguiente manera: Si el precio está entre 0 y 10 la categoría es Económica. Si la categoría está entre 10 Y 20, Normal y si su valor es mayor a 20 la categoría es Caro. Colocar un apodo a las dos columnas. 
SELECT  title as libro,
        price as precio,
        (CASE
            WHEN price < 10 THEN 'Económica'
            WHEN price BETWEEN 10 AND 20 THEN 'Normal'
            WHEN price > 20 THEN 'Cara'
            ELSE 'No categorizado'
        END) as categoria
FROM    titles;

-- 42. Listar los 5 libros más caros.
SELECT  title as libro,
        price as precio
FROM    titles
ORDER BY price DESC
LIMIT 5;

-- por subconsulta
SELECT  title as libro,
        price as precio
FROM    titles
WHERE   price IN (SELECT price FROM titles ORDER BY price DESC LIMIT 5);

-- 43. Listar la mitad de los empleados. 
SET @inicio=0; SET @cantidadRegistros=(select (count(*) div 2 + 1) from employee);
PREPARE sentencia FROM 'SELECT * FROM employee LIMIT ? , ?';
EXECUTE sentencia USING @inicio, @cantidadRegistros;

-- 47.	Listar la cantidad de libros vendidos por cada tienda, sólo de aquellas tiendas que su cantidad de venta sea mayor al promedio de venta general. Promedio = 58
SELECT  st.stor_name as tienda,      
        sum(s.qty) as 'ventas por tienda'
FROM    stores st
INNER JOIN sales s ON st.stor_id = s.stor_id
GROUP BY st.stor_name
HAVING sum(s.qty) > (SELECT SUM(qty)/COUNT(DISTINCT stor_id) FROM sales)
ORDER BY 2 DESC;

SELECT AVG(qty) FROM sales;-- 23,2
select COUNT(stor_id) from stores;-- 6
select COUNT(stor_id) from sales;-- 15
select COUNT(DISTINCT stor_id) from sales;-- 6

SELECT SUM(qty)/COUNT(stor_id) FROM sales;-- 23,2

SELECT SUM(qty)/COUNT(DISTINCT stor_id) FROM sales;-- 58

























