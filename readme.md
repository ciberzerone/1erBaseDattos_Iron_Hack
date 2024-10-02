![Normalizacion y Relaciones](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/encabezado.png)

![Database](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Proceso de Normalización de Bases de Datos

Este repositorio documenta el proceso de normalización de varias tablas de bases de datos no normalizadas. El objetivo es descomponer las tablas siguiendo las reglas de normalización hasta alcanzar la **3ra Forma Normal (3FN)**.

## Ejercicio 1: Normalización de la Base de Datos de Películas

### Tabla Inicial

La tabla `Peliculas` contiene información sobre las películas, incluyendo actores principales y secundarios, el director, el género, y el país de origen.

```plaintext
Peliculas
---------
id_pelicula | titulo | director | año_estreno | genero | actor_principal | actor_secundario | pais_origen

```

![Database](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/tablapeliculas.jpg)

### Análisis de Redundancias y Dependencias

    Dependencias transitivas: Los campos director, genero, y pais_origen son dependencias transitivas.
    Redundancias: Los actores (actor_principal, actor_secundario) y los géneros pueden repetirse en múltiples películas.

### Tabla Normalizada (3FN)

    Tras aplicar la normalización, descomponemos la tabla original en varias tablas relacionadas:

```sql
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

```

![Normalizacion y Relaciones](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/eipeliculas.jpg)

<hr>

## Ejercicio 2: Normalización de la Base de Datos de Coches


### Tabla Inicial

La tabla Coches contiene información sobre los coches, sus propietarios y los talleres asociados.

```plaintext

Coches
------
id_coche | marca | modelo | año | propietario_nombre | propietario_direccion | propietario_telefono | taller_nombre | taller_direccion
```
![Database](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/tablacoche.jpg)

### Análisis de Redundancias y Dependencias

    Dependencias transitivas: Los detalles del propietario y del taller son dependencias transitivas.
    Redundancias: Los propietarios y talleres pueden repetirse para varios coches.

### Tabla Normalizada (3FN)

```sql

-- Crear primero las tablas que serán referenciadas por claves foráneas
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

-- Ahora crear la tabla Coches, incluyendo las claves foráneas
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
```

![Database](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/tablasCoches01.jpg)

### Diagrama de Relaciones

El diagrama muestra la relación entre las tablas Coches, Propietarios y Talleres, asegurando una estructura sin redundancias.

![Database](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/eicoches.jpg)

<hr>

### Ejercicio 3: Normalización de la Base de Datos de Equipos de Fútbol


## Tabla Inicial

La tabla EquiposFutbol contiene información sobre equipos de fútbol, incluyendo detalles del estadio, entrenador y jugadores.

```plaintext

EquiposFutbol
-------------
id_equipo | nombre_equipo | estadio | entrenador | ciudad | jugador1 | jugador2 | jugador3
```
### Análisis de Redundancias y Dependencias

    Dependencias transitivas: La relación entre equipo, estadio, ciudad y entrenador puede generar redundancias.
    Redundancias: Los jugadores pueden aparecer en múltiples equipos.

### Tabla Normalizada (3FN)

```sql

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

```
![Database](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/insertEquipos.jpg)

### Diagrama de Relaciones

Este diagrama muestra cómo las relaciones entre los equipos, entrenadores y jugadores han sido estructuradas de manera eficiente.

![Database](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/eiequipos.jpg)
<hr>


## Ejercicio 4: Normalización de la Base de Datos de Canciones

### Tabla Inicial
La tabla Canciones contiene información sobre canciones, incluyendo detalles del artista, álbum, año de lanzamiento y género.

```plaintext

Canciones
---------
id_cancion | titulo | artista | album | año_lanzamiento | genero | duracion | compositor
```
![Database](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/tablacanciones.jpg)
### Análisis de Redundancias y Dependencias

    **Dependencias transitivas:** Los artistas, álbumes, géneros y compositores tienen dependencias transitivas.
    **Redundancias:** Estos datos pueden repetirse para varias canciones.

### Tabla Normalizada (3FN)

```sql


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

```
![Database](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/tablasCanciones01.jpg)

### Diagrama de Relaciones

Las tablas normalizadas permiten una representación más clara y flexible de la información sobre canciones.


<hr>

## Ejercicio 5: Normalización de la Base de Datos de Animales

### Tabla Inicial

La tabla Animales contiene información sobre animales, sus propietarios y veterinarios.

```plaintext

Animales
--------
id_animal | nombre | especie | edad | propietario_nombre | propietario_direccion | veterinario_nombre | veterinario_direccion
```

![Database](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/tablasCoches01.jpg) 

### Análisis de Redundancias y Dependencias

    Dependencias transitivas: La información del propietario y del veterinario tiene dependencias transitivas.
    Redundancias: Los mismos propietarios y veterinarios pueden estar relacionados con múltiples animales.

### Tabla Normalizada (3FN)

```sql

-- Creación de las tablas base
USE lab01;
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

```
![Database](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/tablasAnimales01.jpg)


### Diagrama de Relaciones

El diagrama de relaciones garantiza que cada animal, propietario y veterinario estén correctamente estructurados sin redundancias.

![Database](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/eianimales.jpg)


<hr>


## Instrucciones para Ejecutar el Proyecto

### 1. Requisitos Previos
- **Base de Datos**: MySQL o MariaDB.
- **Herramienta de Administración**: DBeaver, MySQL Workbench, HeidiSQL, o cualquier otra de tu preferencia.

### 2. Pasos para Ejecutar los Scripts
1. Conecta a tu base de datos utilizando tu herramienta preferida.
2. Ejecuta el script `creacion_bd.sql` para crear las bases de datos y tablas originales.
3. Inserta los datos de ejemplo utilizando el script `insercion_datos.sql`.
4. Para realizar la normalización y crear las tablas en 3FN, ejecuta el script `normalizacion.sql`.
5. Verifica que las tablas normalizadas se hayan creado correctamente y que las relaciones entre tablas estén bien definidas.



## Análisis de Dependencias y Normalización
El proceso de normalización se centró en eliminar las dependencias parciales y transitivas, asegurando que las tablas estén en su forma más eficiente posible.

Los principales pasos incluyen:
1. **Identificación de dependencias funcionales**: Descomposición de las tablas basadas en dependencias parciales y transitivas.
2. **Creación de nuevas entidades**: Generación de tablas intermedias y claves foráneas para establecer relaciones entre las entidades.
3. **Validación en 3FN**: Garantizar que todas las tablas estén libres de redundancias y que las dependencias sean correctas.

## Author

### Nombre
**Yimmy Beltran**

## Información de Contacto

- **LinkedIn**: [https://www.linkedin.com/in/gianmarco-beltran-13959b232/](https://www.linkedin.com/in/gianmarco-beltran-13959b232/)
- **GitHub**: [https://github.com/ciberzerone](https://github.com/ciberzerone)
- **Correo Electrónico**: [tucorreo@dominio.com](mailto:gianmarcobeltran@gmail.com)