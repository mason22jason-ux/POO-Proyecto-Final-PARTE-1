DROP DATABASE IF EXISTS mediateca;
CREATE DATABASE mediateca;
USE mediateca;

/* =========================================================
   TABLAS DE MATERIALES
   ========================================================= */

CREATE TABLE material (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    estado VARCHAR(30) DEFAULT 'Disponible'
);

CREATE TABLE libro (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    id_material INT NOT NULL,
    autor VARCHAR(100) NOT NULL,
    editorial VARCHAR(100),
    anio_publicacion INT,
    numero_paginas INT,
    genero VARCHAR(50),
    FOREIGN KEY (id_material) REFERENCES material(id_material)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE revista (
    id_revista INT AUTO_INCREMENT PRIMARY KEY,
    id_material INT NOT NULL,
    editorial VARCHAR(100),
    periodicidad VARCHAR(50),
    fecha_publicacion DATE,
    FOREIGN KEY (id_material) REFERENCES material(id_material)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE cd_audio (
    id_cd INT AUTO_INCREMENT PRIMARY KEY,
    id_material INT NOT NULL,
    artista VARCHAR(100),
    genero VARCHAR(50),
    duracion VARCHAR(20),
    numero_canciones INT,
    FOREIGN KEY (id_material) REFERENCES material(id_material)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE dvd (
    id_dvd INT AUTO_INCREMENT PRIMARY KEY,
    id_material INT NOT NULL,
    director VARCHAR(100),
    duracion VARCHAR(20),
    genero VARCHAR(50),
    anio INT,
    FOREIGN KEY (id_material) REFERENCES material(id_material)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

/* =========================================================
   INTEGRANTE 1 - USUARIOS, ROLES Y PERMISOS
   ========================================================= */

CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(30) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

CREATE TABLE permisos (
    id_permiso INT AUTO_INCREMENT PRIMARY KEY,
    codigo_permiso VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150) NOT NULL
);

CREATE TABLE rol_permiso (
    id_rol INT NOT NULL,
    id_permiso INT NOT NULL,
    PRIMARY KEY (id_rol, id_permiso),
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_permiso) REFERENCES permisos(id_permiso)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    codigo_usuario VARCHAR(25) NOT NULL UNIQUE,
    nombres VARCHAR(80) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    correo VARCHAR(120) UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(64) NOT NULL,
    id_rol INT NOT NULL,
    estado TINYINT(1) NOT NULL DEFAULT 1,
    debe_cambiar_password TINYINT(1) NOT NULL DEFAULT 0,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

/* =========================================================
   DATOS INICIALES - ROLES
   ========================================================= */

INSERT INTO roles (nombre_rol, descripcion)
VALUES 
('ADMINISTRADOR', 'Usuario con acceso completo al sistema'),
('PROFESOR', 'Usuario profesor con permisos de consulta y préstamo'),
('ALUMNO', 'Usuario alumno con permisos limitados de consulta');

/* =========================================================
   DATOS INICIALES - PERMISOS
   ========================================================= */

INSERT INTO permisos (codigo_permiso, descripcion)
VALUES
('USUARIOS_GESTIONAR', 'Crear, modificar y desactivar usuarios'),
('PASSWORD_RESTABLECER', 'Restablecer contraseña de usuarios'),
('EJEMPLARES_CONSULTAR', 'Consultar ejemplares registrados'),
('EJEMPLARES_REGISTRAR', 'Registrar nuevos ejemplares'),
('PRESTAMOS_REGISTRAR', 'Registrar préstamos de ejemplares'),
('DEVOLUCIONES_REGISTRAR', 'Registrar devoluciones'),
('MORA_CONFIGURAR', 'Configurar mora diaria del sistema');

/* =========================================================
   ASIGNACIÓN DE PERMISOS A ROLES
   ========================================================= */

SET @id_admin = (SELECT id_rol FROM roles WHERE nombre_rol = 'ADMINISTRADOR');
SET @id_profesor = (SELECT id_rol FROM roles WHERE nombre_rol = 'PROFESOR');
SET @id_alumno = (SELECT id_rol FROM roles WHERE nombre_rol = 'ALUMNO');

/* Administrador: todos los permisos */
INSERT INTO rol_permiso (id_rol, id_permiso)
SELECT @id_admin, id_permiso
FROM permisos;

/* Profesor: consultar, préstamos y devoluciones */
INSERT INTO rol_permiso (id_rol, id_permiso)
SELECT @id_profesor, id_permiso
FROM permisos
WHERE codigo_permiso IN (
    'EJEMPLARES_CONSULTAR',
    'PRESTAMOS_REGISTRAR',
    'DEVOLUCIONES_REGISTRAR'
);

/* Alumno: solo consultar */
INSERT INTO rol_permiso (id_rol, id_permiso)
SELECT @id_alumno, id_permiso
FROM permisos
WHERE codigo_permiso IN (
    'EJEMPLARES_CONSULTAR'
);

/* =========================================================
   USUARIO ADMINISTRADOR INICIAL
   Usuario: admin
   Contraseña: admin123
   La contraseña se guarda como SHA-256.
   ========================================================= */

INSERT INTO usuarios (
    codigo_usuario,
    nombres,
    apellidos,
    correo,
    username,
    password_hash,
    id_rol,
    estado,
    debe_cambiar_password
)
VALUES (
    'ADM001',
    'Administrador',
    'Sistema',
    'admin@mediateca.com',
    'admin',
    '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9',
    @id_admin,
    1,
    0
);
