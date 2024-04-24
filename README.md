# Estructura de datos MySQL queries

Este ejercicio se centra exclusivamente en realizar consultas a una base de datos (tienda y unviersidad) utilizando MySQL

## Tienda

El repositorio modela la gestión de una tienda de productos electrónicos. Resumen de los puntos clave:

| **Entidades** | **Atributos Destacados**                      |
| ------------- | --------------------------------------------- |
| Producto      | Código, nombre, precio, código de fabricante. |
| Fabricante    | Código, nombre.                               |

### Queries de verificación en la Tienda:

- Lista el nombre de todos los productos en la tabla "Producto".
- Lista los nombres y precios de todos los productos en la tabla "Producto".
- Lista todas las columnas de la tabla "Producto".
- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD), utilizando los alias: "nombre de producto", "euros" y "dólares".
- Lista los nombres y precios de todos los productos en la tabla "Producto", convirtiendo los nombres a mayúscula.
- Lista los nombres y precios de todos los productos en la tabla "Producto", convirtiendo los nombres a minúscula.
- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtén en mayúsculas los dos primeros caracteres del nombre del fabricante.
- Lista los nombres y precios de todos los productos en la tabla "Producto", redondeando el valor del precio.
- Lista los nombres y precios de todos los productos en la tabla "Producto", truncando el valor del precio para mostrarlo sin decimales.

## Universidad

El repositorio modela la gestión de una universidad. Resumen de los puntos clave:

| **Entidades** | **Atributos Destacados**                                  |
| ------------- | --------------------------------------------------------- |
| Alumnos       | Primer apellido, segundo apellido, nombre, NIF, teléfono. |
| Profesores    | Primer apellido, segundo apellido, nombre, NIF, teléfono. |
| Asignaturas   | Nombre, año de inicio y fin, curso escolar.               |
| Departamentos | Nombre.                                                   |
| Cursos        | Año de inicio y fin del curso escolar.                    |
| Grados        | Nombre.                                                   |

### Consultas principales en la Universidad:

- Retorna un listado con el primer apellido, segundo apellido y el nombre de todos los/las alumnos/as, ordenado alfabéticamente por primer apellido, segundo apellido y nombre.
- Encuentra el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
- Retorna el listado de los alumnos que nacieron en 1999.
- Retorna el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF termina en K.
- Retorna el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado con identificador 7.
- Retorna un listado de profesores/as junto con el nombre del departamento al cual están vinculados. El listado debe contener cuatro columnas: primer apellido, segundo apellido, nombre y nombre del departamento, ordenado alfabéticamente por apellidos y nombre.
- Retorna un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
- Retorna un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
- Retorna un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

## License

This project is distributed under the Apache 2.0 license.

---

Developed by [Fanur Khusainov](https://www.linkedin.com/in/fanur-khusainov-ab86b2102/) with ❤️ and ☕.
