##### RETO 1 #########3
USE tienda;
SHOW TABLES FROM tienda;
DESCRIBE articulo;

#¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT*
FROM articulo
WHERE nombre LIKE '%Pasta%';

#¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT*
FROM articulo
WHERE nombre LIKE '%Cannelloni%';

#¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT*
FROM articulo
WHERE nombre LIKE '%-%';

DESCRIBE puesto;
#¿Qué puestos incluyen la palabra Designer?
SELECT*
FROM puesto
WHERE nombre LIKE '%Designer%';

#¿Qué puestos incluyen la palabra Developer?
SELECT*
FROM puesto
WHERE nombre LIKE '%Developer%';

####### RETO 2 #######

#¿Cuál es el promedio de salario de los puestos?
SELECT avg(salario) AS "Promedio Salarios"
FROM puesto;

#¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*) AS "No. de artículos de pasta"
FROM articulo
WHERE nombre LIKE '%pasta%';

#¿Cuál es el salario mínimo y máximo?
SELECT min(salario) AS "Min", max(salario) AS "Max"
FROM puesto;

#¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT sum(salario)
FROM puesto
WHERE id_puesto>995;

SELECT sum(salario)
FROM puesto
WHERE id_puesto> 
	((SELECT max(id_puesto) 
    FROM puesto)-5);

###### RETO 3 ######3

#¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) AS "Total"
FROM puesto
GROUP BY nombre;

#¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) AS "Total de Salario"
FROM puesto
GROUP BY nombre;

SELECT* FROM venta;

#¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(*) AS "Total de Ventas por Vendedor"
FROM venta
GROUP BY id_empleado;

#¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) AS "Total de Ventas por Artículo"
FROM venta
GROUP BY id_articulo;

####### EJERCICIOS #######

USE classicmodels;
SHOW TABLES FROM classicmodels;

#Dentro de la tabla employees, obten el número de empleado, apellido y nombre 
#de todos los empleados cuyo nombre empiece con a.

DESCRIBE employees;

SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'a%';

#Dentro de la tabla employees, obten el número de empleado, apellido y nombre
#de todos los empleados cuyo nombre termina con on.

SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE '%on';

#Dentro de la tabla employees, obten el número de empleado, apellido y nombre 
#de todos los empleados cuyo nombre incluye la cadena on.

SELECT employeeNumber, lastName,firstName
FROM employees
WHERE firstName LIKE '%on%';

#Dentro de la tabla employees, obten el número de empleado, apellido y nombre
#de todos los empleados cuyos nombres tienen tres letras e inician con T y finalizan con m.

SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'T_m';

#Dentro de la tabla employees, obten el número de empleado, apellido y nombre
#de todos los empleados cuyo nombre no inicia con B.

SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstNAme NOT LIKE 'b%';

#Dentro de la tabla products, obten el código de producto y nombre
#de los productos cuyo código incluye la cadena _20.

DESCRIBE products;

SELECT productCode, productName
FROM products
WHERE productCode LIKE '%_20%';

#Dentro de la tabla orderdetails, obten el total de cada orden.

DESCRIBE orderdetails;

SELECT orderNumber, sum(priceEach) AS Total
FROM orderdetails
GROUP BY orderNumber
ORDER BY Total DESC;

