![Normalizacion y Relaciones](https://github.com/ciberzerone/1erBaseDattos_Iron_Hack/blob/main/img/encabezado.jpg)

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

