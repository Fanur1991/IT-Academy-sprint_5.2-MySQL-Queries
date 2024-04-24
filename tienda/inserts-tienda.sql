USE tienda;

-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

-- 3. Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre AS nombre_producto, precio AS precio_euros, precio * 1.1 AS precio_dólares FROM producto;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
-- Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS nombre_producto, precio AS euros, precio * 1.1 AS dólares FROM producto;

-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre) AS nombre_producto, precio FROM producto;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre) AS nombre_producto, precio FROM producto;

-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtén en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, SUBSTRING(UPPER(nombre), 1, 2) AS abreviatura FROM fabricante;

-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio) AS precio_redondeado FROM producto;

-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio, 0) AS precio_truncado FROM producto;

-- 11. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT codigo_fabricante FROM producto;

-- 12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;

-- 13. Lista los nombres de los fabricantes ordenados de manera ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. Lista los nombres de los fabricantes ordenados de manera descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. Lista los nombres de los productos ordenados, en primer lugar, por el nombre de manera ascendente y, en segundo lugar, por el precio de manera descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. Retorna una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

-- 17. Retorna una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también debe incluirse en la respuesta.
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18. Lista el nombre y el precio del producto más barato. (Utiliza solamente las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MIN(precio), necesitarías GROUP BY.
SELECT 
    producto.nombre AS nombre_producto, 
    producto.precio AS precio 
FROM 
    producto 
ORDER BY 
    producto.precio ASC 
LIMIT 1;

-- 19. Lista el nombre y el precio del producto más caro. (Utiliza solamente las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MAX(precio), necesitarías GROUP BY.
SELECT 
    producto.nombre AS nombre_producto, 
    producto.precio AS precio
FROM 
    producto 
ORDER BY 
    producto.precio DESC 
LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT producto.nombre AS nombre_producto FROM producto WHERE codigo_fabricante = 2;

-- 21. Retorna una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 22. Retorna una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, en orden alfabético.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY 
    fabricante.nombre ASC;

-- 23. Retorna una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT
    producto.codigo AS codigo_producto,
    producto.nombre AS nombre_producto,
    fabricante.codigo AS codigo_fabricante,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 24. Retorna el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY 
    producto.precio ASC 
LIMIT 1;

-- 25. Retorna el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY 
    producto.precio DESC 
LIMIT 1;

-- 26. Retorna una lista de todos los productos del fabricante Lenovo.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre = 'Lenovo';

-- 27. Retorna una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200 €.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre = 'Crucial' AND producto.precio > 200
ORDER BY 
    producto.precio;

-- 28. Retorna un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT
    producto.nombre AS nombre_producto, 
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

-- 29. Retorna un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Haciendo uso del operador IN.
SELECT
    producto.nombre AS nombre_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30. Retorna un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre LIKE '%e';

-- 31. Retorna un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre LIKE '%w%';

-- 32. Retorna un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180 €. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN 
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    producto.precio >= 180
ORDER BY 
    producto.precio DESC, producto.nombre ASC;

-- 33. Retorna un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT
    fabricante.codigo AS codigo_fabricante,
    fabricante.nombre AS nombre_fabricante
FROM
    fabricante
JOIN 
    producto ON fabricante.codigo = producto.codigo_fabricante;

-- 34. Retorna un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT
    fabricante.nombre AS nombre_fabricante,
    producto.nombre AS nombre_producto
FROM
    fabricante
LEFT JOIN 
    producto ON fabricante.codigo = producto.codigo_fabricante;

-- 35. Retorna un listado donde solo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT
    fabricante.nombre AS nombre_fabricante
FROM
    fabricante
LEFT JOIN 
    producto ON fabricante.codigo = producto.codigo_fabricante
WHERE 
    producto.nombre IS NULL;

-- 36. Retorna todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre = 'Lenovo';

-- 37. Retorna todas las datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin usar INNER JOIN).
SELECT
	producto.codigo AS codigo_producto,
	producto.nombre AS nombre_producto,
	producto.precio AS precio,
	producto.codigo_fabricante,
	fabricante.nombre AS nombre_fabricante
FROM
	producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
	producto.precio = (
	SELECT MAX(producto.precio)
	FROM
		producto
	JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
	WHERE
		fabricante.nombre = 'Lenovo'
  );

-- 38. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    producto.precio = (
        SELECT MAX(producto.precio)
        FROM producto
        JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
        WHERE fabricante.nombre = 'Lenovo'
    );

-- 39. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN 
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    producto.precio = (
        SELECT MIN(producto.precio)
        FROM producto
        JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
        WHERE fabricante.nombre = 'Hewlett-Packard'
    );

-- 40. Retorna todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    producto.precio >= (
        SELECT MAX(producto.precio)
        FROM producto
        JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
        WHERE fabricante.nombre = 'Lenovo'
    );

-- 41. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    fabricante.nombre = 'Asus' AND producto.precio > (
        SELECT AVG(producto.precio)
        FROM producto
        JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
        WHERE fabricante.nombre = 'Asus'
    );