CREATE DATABASE IF NOT EXISTS lab1;
use lab1;

CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY,
    titulo VARCHAR(255),
    director VARCHAR(255),
    año_estreno INT,
    genero VARCHAR(255),
    actor_principal VARCHAR(255),
    actor_secundario VARCHAR(255),
    pais_origen VARCHAR(255)
);
CREATE TABLE Coches (
    id_coche INT PRIMARY KEY,
    marca VARCHAR(255),
    modelo VARCHAR(255),
    año INT,
    propietario_nombre VARCHAR(255),
    propietario_direccion VARCHAR(255),
    propietario_telefono VARCHAR(255),
    taller_nombre VARCHAR(255),
    taller_direccion VARCHAR(255)
);

CREATE TABLE EquiposFutbol (
    id_equipo INT PRIMARY KEY,
    nombre_equipo VARCHAR(255),
    estadio VARCHAR(255),
    entrenador VARCHAR(255),
    ciudad VARCHAR(255),
    jugador1 VARCHAR(255),
    jugador2 VARCHAR(255),
    jugador3 VARCHAR(255)
);

-- Ejercicio 4: Base de Datos de Canciones
CREATE TABLE Canciones (
    id_cancion INT PRIMARY KEY,
    titulo VARCHAR(255),
    artista VARCHAR(255),
    album VARCHAR(255),
    año_lanzamiento INT,
    genero VARCHAR(255),
    duracion TIME,
    compositor VARCHAR(255)
);

-- Ejercicio 5: Base de Datos de Animales
CREATE TABLE Animales (
    id_animal INT PRIMARY KEY,
    nombre VARCHAR(255),
    especie VARCHAR(255),
    edad INT,
    propietario_nombre VARCHAR(255),
    propietario_direccion VARCHAR(255),
    veterinario_nombre VARCHAR(255),
    veterinario_direccion VARCHAR(255)
);
