USE lab01;
-- Creación de las tablas base
CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY,
    titulo VARCHAR(255),
    año_estreno INT,
    id_genero INT,
    id_director INT,
    pais_origen VARCHAR(255)
);

CREATE TABLE Directores (
    id_director INT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE Generos (
    id_genero INT PRIMARY KEY,
    genero VARCHAR(255)
);

CREATE TABLE Actores (
    id_actor INT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE Peliculas_Actores (
    id_pelicula INT,
    id_actor INT,
    rol VARCHAR(255),
    PRIMARY KEY (id_pelicula, id_actor)
);

-- Agregar claves foráneas después de la creación de las tablas
ALTER TABLE Peliculas
    ADD CONSTRAINT fk_genero FOREIGN KEY (id_genero) REFERENCES Generos(id_genero);

ALTER TABLE Peliculas
    ADD CONSTRAINT fk_director FOREIGN KEY (id_director) REFERENCES Directores(id_director);

ALTER TABLE Peliculas_Actores
    ADD CONSTRAINT fk_pelicula FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula);

ALTER TABLE Peliculas_Actores
    ADD CONSTRAINT fk_actor FOREIGN KEY (id_actor) REFERENCES Actores(id_actor);
    


CREATE TABLE Propietarios (
    id_propietario INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(255)
);

CREATE TABLE Talleres (
    id_taller INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255)
);

CREATE TABLE Coches (
    id_coche INT PRIMARY KEY,
    marca VARCHAR(255),
    modelo VARCHAR(255),
    año INT,
    id_propietario INT,
    id_taller INT,
    CONSTRAINT fk_propietario FOREIGN KEY (id_propietario) REFERENCES Propietarios(id_propietario),
    CONSTRAINT fk_taller FOREIGN KEY (id_taller) REFERENCES Talleres(id_taller)
);


-- Crear la tabla Entrenadores
CREATE TABLE Entrenadores (
    id_entrenador INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Crear la tabla Jugadores
CREATE TABLE Jugadores (
    id_jugador INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Crear la tabla Equipos con la clave foránea hacia Entrenadores
CREATE TABLE Equipos (
    id_equipo INT PRIMARY KEY,
    nombre_equipo VARCHAR(255),
    estadio VARCHAR(255),
    ciudad VARCHAR(255),
    id_entrenador INT,
    CONSTRAINT fk_entrenador FOREIGN KEY (id_entrenador) REFERENCES Entrenadores(id_entrenador)
);

-- Crear la tabla de relación muchos a muchos entre Equipos y Jugadores
CREATE TABLE Equipos_Jugadores (
    id_equipo INT,
    id_jugador INT,
    PRIMARY KEY (id_equipo, id_jugador),
    CONSTRAINT fk_equipo FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo),
    CONSTRAINT fk_jugador FOREIGN KEY (id_jugador) REFERENCES Jugadores(id_jugador)
);



CREATE TABLE Artistas_Canciones (
    id_artista INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Crear la tabla Albumes
CREATE TABLE Albumes (
    id_album INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Crear la tabla Generos
CREATE TABLE Generos_Canciones (
    id_genero INT PRIMARY KEY,
    genero VARCHAR(255)
);

-- Crear la tabla Compositores
CREATE TABLE Compositores (
    id_compositor INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Crear la tabla Canciones con claves foráneas hacia Artistas, Albumes y Generos
CREATE TABLE Canciones (
    id_cancion INT PRIMARY KEY,
    titulo VARCHAR(255),
    id_artista INT,
    id_album INT,
    ano_lanzamiento INT,
    id_genero INT,
    duracion TIME
);


alter table Canciones
   add CONSTRAINT fk_artista_canciones FOREIGN KEY (id_artista) REFERENCES Artistas_Canciones(id_artista);
alter table Canciones
    add CONSTRAINT fk_album FOREIGN KEY (id_album) REFERENCES Albumes(id_album);
alter table Canciones
    add CONSTRAINT fk_genero_canciones FOREIGN KEY (id_genero) REFERENCES Generos_Canciones(id_genero);



USE lab01;
-- Crear la tabla Artistas
CREATE TABLE Propietarios_Animales (
    id_propietario INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255)
);

CREATE TABLE Veterinarios (
    id_veterinario INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255)
);

CREATE TABLE Animales (
    id_animal INT PRIMARY KEY,
    nombre VARCHAR(255),
    especie VARCHAR(255),
    edad INT,
    id_propietario INT,
    id_veterinario INT,
    CONSTRAINT fk_propietario_animales FOREIGN KEY (id_propietario) REFERENCES Propietarios_Animales(id_propietario),
    CONSTRAINT fk_veterinario_animales FOREIGN KEY (id_veterinario) REFERENCES Veterinarios(id_veterinario)
);


