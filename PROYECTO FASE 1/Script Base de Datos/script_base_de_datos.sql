DROP DATABASE IF EXISTS mediateca;
CREATE DATABASE mediateca;
USE mediateca;

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