# Proyecto Final PARTE 1 POO - Sistema de Mediateca

## Descripción

Aplicación de escritorio desarrollada en Java para la gestión de una mediateca o biblioteca institucional.

El sistema permitirá registrar usuarios, documentos de información, ejemplares, préstamos, devoluciones, consultas de disponibilidad y cálculo de mora.

El proyecto corresponde a la Fase I del Proyecto Final de Programación Orientada a Objetos.

---

## Software utilizado

El proyecto utiliza:

- Apache NetBeans
- Java
- SQL Server
- SQL Server Management Studio
- JDBC
- Microsoft JDBC Driver for SQL Server

---

## Objetivo general

Crear una aplicación de escritorio que permita administrar los materiales de una mediateca, controlar usuarios con diferentes privilegios y gestionar préstamos, devoluciones y mora.

---

## Tipos de usuarios del sistema

El sistema manejará 3 tipos de usuarios principales:

- Administrador
- Profesor
- Alumno

Cada tipo de usuario tendrá diferentes privilegios dentro del sistema.

---

## Distribución de tareas del equipo

| Integrante | Parte asignada | Responsabilidades principales | Entregables |
|---|---|---|---|
| Integrante 1 | Gestión de usuarios y privilegios | Crear los 3 tipos de usuario: Administrador, Profesor y Alumno. Definir qué puede hacer cada uno dentro del sistema. Diseñar el acceso/login y la asignación de privilegios. | Tabla de usuarios, roles, permisos, pantalla de login y CRUD básico de usuarios. |
| Integrante 2 | Registro de documentos y ejemplares | Investigar los campos necesarios para cada tipo de documento: libros, obras, revistas, CD, tesis u otros. Crear el módulo para ingresar nuevos ejemplares al sistema. | Formulario de registro, estructura de datos de documentos y validaciones básicas. |
| Integrante 3 | Consulta y búsqueda de ejemplares | Crear la parte del sistema que permita buscar documentos por ubicación, cantidad de ejemplares, disponibles, prestados, tipo de documento, título, autor, etc. | Pantalla de búsqueda, filtros, listado de resultados y consulta de ejemplares. |
| Integrante 4 | Préstamos, devoluciones y control de disponibilidad | Desarrollar el módulo para prestar documentos únicamente a usuarios registrados y sin mora. Registrar préstamos, devoluciones y actualizar disponibilidad de ejemplares. | Módulo de préstamos, módulo de devoluciones, validación de disponibilidad y mora. |
| Integrante 5 | Configuración de préstamos, mora y documentación general | Configurar cuántos ejemplares se pueden prestar, definir la mora diaria por año, apoyar con el cálculo de mora, documentación final, pruebas generales y presentación. | Módulo de configuración, cálculo de mora, pruebas del sistema, manual o presentación. |

---

## Base de datos

La base de datos se trabajará en SQL Server.

Nombre recomendado de la base de datos:

MediatecaDB

Tablas principales sugeridas:

- Usuarios
- Roles
- Permisos
- RolPermiso
- Documentos
- TiposDocumento
- Ejemplares
- Prestamos
- DetallePrestamo
- Devoluciones
- ConfiguracionPrestamos
- Moras

---

## Indicaciones para ejecutar el proyecto

1. Abrir SQL Server Management Studio.
2. Ejecutar el script principal de creación de la base de datos.
3. Verificar que se haya creado la base de datos `MediatecaDB`.
4. Verificar que las tablas principales se hayan creado correctamente.
5. Abrir el proyecto en Apache NetBeans.
6. Agregar el Microsoft JDBC Driver for SQL Server si NetBeans no lo reconoce.
7. Abrir la clase de conexión del proyecto.
8. Verificar el nombre del servidor, usuario y contraseña de SQL Server.
9. Ejecutar la clase de prueba de conexión.
10. Si aparece el mensaje de conexión exitosa, el proyecto está listo para continuar.

---

## Conexión a SQL Server

La conexión desde Java debe usar JDBC.

Ejemplo de conexión:

```java
private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=MediatecaDB;encrypt=true;trustServerCertificate=true";
private static final String USER = "sa";
private static final String PASSWORD = "TU_CONTRASEÑA";
