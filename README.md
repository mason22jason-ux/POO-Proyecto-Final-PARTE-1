# Proyecto Final PARTE 1 POO - Mediateca

## Descripción

Aplicación de escritorio desarrollada en Java para la gestión de una mediateca.  
Permite trabajar con materiales como libros, revistas, CDs de audio y DVDs.

El proyecto utiliza:

- Apache NetBeans
- Java
- MySQL Workbench
- MySQL Server
- MySQL Connector/J
- JDBC

---

## Distribución de tareas

| Integrante | Responsabilidad |
|---|---|
| Integrante 1 | Crear la base de datos, tablas principales, proyecto base en NetBeans, conexión con MySQL y pruebas iniciales. |
| Integrante 2 | Desarrollar el módulo de Libros. |
| Integrante 3 | Desarrollar el módulo de Revistas. |
| Integrante 4 | Desarrollar el módulo de CDs de audio. |
| Integrante 5 | Desarrollar el módulo de DVDs y listado general de materiales. |

---

## Base de datos

La base de datos se llama:

mediateca

Tablas principales:

- material
- libro
- revista
- cd_audio
- dvd

---

## Indicaciones para ejecutar el proyecto

1. Abrir MySQL Workbench.
2. Ejecutar el archivo `script_base_datos.sql`.
3. Verificar que se haya creado la base de datos `mediateca`.
4. Abrir el proyecto `MediatecaApp` en Apache NetBeans.
5. Agregar MySQL Connector/J si NetBeans no lo reconoce.
6. Abrir la clase `dao.Conexion.java`.
7. Cambiar la contraseña de MySQL en esta línea:

private static final String PASSWORD = "TU_CONTRASEÑA_MYSQL";

8. Ejecutar la clase `PruebaConexion.java`.
9. Si aparece el mensaje “Conexión exitosa a MySQL”, el proyecto está listo para continuar.

---

## Importante

Cada integrante debe colocar su propia contraseña de MySQL en `Conexion.java`.

No subir contraseñas reales al repositorio.

No cambiar el nombre de la base de datos. Debe llamarse:

mediateca

El usuario recomendado es:

root

El puerto usado es:

3306

---

## Pruebas realizadas

Se realizaron las siguientes pruebas iniciales:

- Creación de la base de datos en MySQL.
- Creación de las tablas principales.
- Conexión exitosa desde NetBeans hacia MySQL.
- Inserción de prueba desde Java.
- Verificación de datos en MySQL Workbench.

---

## Limpieza de datos de prueba

Después de hacer pruebas, se pueden borrar los datos de ejemplo con:

DELETE FROM material WHERE codigo = 'LIB001';

---

## Errores comunes

### Access denied for user 'root'@'localhost'

La contraseña de MySQL es incorrecta.  
Cada integrante debe revisar y colocar su propia contraseña en `Conexion.java`.

### Unknown database 'mediateca'

La base de datos no existe.  
Se debe ejecutar primero el archivo `script_base_datos.sql`.

### No suitable driver found

Falta agregar MySQL Connector/J al proyecto.  
Agregar el archivo `.jar` desde:

Project Properties > Libraries > Add JAR/Folder

---

## Estado actual

La base inicial del proyecto está lista.

Ya se cuenta con:

- Base de datos creada.
- Tablas principales creadas.
- Proyecto base en NetBeans.
- Conexión Java con MySQL funcionando.
- Pruebas iniciales realizadas correctamente.

Los demás integrantes pueden continuar con sus módulos asignados.
