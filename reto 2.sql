SHOW DATABASES;
USE tienda;
SHOW TABLES;

DESCRIBE empleado;
SELECT nombre 
FROM empleado 
WHERE id_puesto=4;

DESCRIBE puesto;
SELECT* 
FROM puesto 
WHERE salario>10000;

DESCRIBE articulo;
SELECT* 
FROM articulo 
WHERE precio>1000 
	AND iva>100;

DESCRIBE venta;
SELECT* 
FROM venta 
WHERE id_articulo IN (135,963) 
	AND id_empleado IN (835,369);
