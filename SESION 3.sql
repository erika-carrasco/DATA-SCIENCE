 ######## SESIÓN 3 #######################################################################
 
USE tienda;

#cuál es la menor y mayor cant de ventas de un artículo
SELECT* FROM venta;

SELECT clave, id_articulo, count(*) AS cantidad
FROM venta
GROUP BY clave, id_articulo
ORDER BY cantidad DESC;

SELECT id_articulo, min(cantidad) AS cantidad_min, max(cantidad) AS cantidad_max
FROM
(SELECT clave, id_articulo, count(*) AS cantidad
FROM venta
GROUP BY clave, id_articulo
ORDER BY cantidad DESC) AS subconsulta
GROUP BY id_articulo;

###### RETO 1 ###########################################################################
SELECT* FROM empleado;

#¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $20,000?

SELECT nombre, apellido_paterno, apellido_materno
FROM empleado
WHERE id_puesto IN 
(SELECT id_puesto
FROM puesto
WHERE salario>20000);

#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?

SELECT* FROM venta;

SELECT clave, id_empleado, count(*) AS no_ventas
FROM venta
GROUP BY clave, id_empleado;

SELECT id_empleado, min(no_ventas), max(no_ventas)
FROM
(SELECT clave, id_empleado, count(*) AS no_ventas
FROM venta
GROUP BY clave, id_empleado) AS subconsulta_2
GROUP BY id_empleado;

#¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?

SELECT* FROM articulo;
SELECT* FROM venta;

SELECT id_articulo
FROM articulo
WHERE precio>5000;

SELECT id_venta
FROM venta
WHERE id_venta IN
(SELECT id_articulo
FROM articulo
WHERE precio>5000);

###### RETO 2 ##################################################################################

#¿Cuál es el nombre de los empleados que realizaron cada venta?

SELECT venta.clave,empleado.nombre
FROM venta
JOIN empleado
	ON empleado.id_empleado=venta.id_empleado
ORDER BY clave;

#¿Cuál es el nombre de los artículos que se han vendido?

SELECT venta.clave,articulo.nombre
FROM articulo
JOIN venta
	ON venta.id_articulo=articulo.id_articulo
ORDER BY clave;

#¿Cuál es el total de cada venta?

SELECT venta.clave, sum(articulo.precio) AS total_de_venta
FROM articulo
JOIN venta
	ON venta.id_articulo=articulo.id_articulo
GROUP BY venta.clave
ORDER BY total_de_venta DESC;

####### RETO 3 ###################################################################################################

#Obtener el puesto de un empleado.

SELECT* FROM empleado;
SELECT* FROM puesto;

#CREATE VIEW empleado_y_puesto_118 AS
SELECT empleado.nombre, empleado.apellido_paterno, puesto.nombre
FROM empleado
JOIN puesto
ON empleado.id_puesto = puesto.id_puesto;

#Saber qué artículos ha vendido cada empleado.

SELECT* FROM empleado;
SELECT* FROM venta;
SELECT* FROM articulo;

CREATE VIEW empleado_y_articulos_118 AS
SELECT venta.clave,empleado.nombre, empleado.apellido_paterno, articulo.nombre
FROM empleado
JOIN venta
ON empleado.id_empleado= venta.id_empleado
JOIN articulo
ON venta.id_articulo= articulo.id_articulo;

#Saber qué puesto ha tenido más ventas.

CREATE VIEW empleado_y_ventas_118 AS
SELECT puesto.nombre, count(venta.clave) AS no_ventas
FROM empleado
JOIN venta
ON empleado.id_empleado= venta.id_empleado
JOIN puesto
ON empleado.id_puesto= puesto.id_puesto
GROUP BY puesto.nombre;

SELECT max(no_ventas) 
FROM empleado_y_ventas_118;


