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

### Análisis de Redundancias y Dependencias

    Dependencias transitivas: Los campos director, genero, y pais_origen son dependencias transitivas.
    Redundancias: Los actores (actor_principal, actor_secundario) y los géneros pueden repetirse en múltiples películas.

### Tabla Normalizada (3FN)

    Tras aplicar la normalización, descomponemos la tabla original en varias tablas relacionadas:

```sql
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
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor)
);

```



## Bases de Datos Desarrolladas

### 1. Base de Datos de Películas
- Originalmente contiene información sobre películas, incluyendo actores, directores, año de estreno, género y país de origen.
- **Tablas Originales**: `Peliculas`
- **Tablas Normalizadas**: 
  - `Peliculas(id_pelicula, titulo, director_id, año_estreno, genero_id, pais_id)`
  - `Directores(id_director, nombre_director)`
  - `Generos(id_genero, nombre_genero)`
  - `Paises(id_pais, nombre_pais)`
  - `Actores(id_actor, nombre_actor)`
  - `Peliculas_Actores(id_pelicula, id_actor, rol)`

### 2. Base de Datos de Coches
- Contiene información sobre coches, propietarios y talleres.
- **Tablas Originales**: `Coches`
- **Tablas Normalizadas**:
  - `Coches(id_coche, marca, modelo, año, propietario_id, taller_id)`
  - `Propietarios(id_propietario, nombre_propietario, direccion_propietario, telefono_propietario)`
  - `Talleres(id_taller, nombre_taller, direccion_taller)`

### 3. Base de Datos de Equipos de Fútbol
- Contiene información sobre equipos de fútbol, jugadores, entrenadores, estadios y ciudades.
- **Tablas Originales**: `EquiposFutbol`
- **Tablas Normalizadas**:
  - `Equipos(id_equipo, nombre_equipo, estadio_id, entrenador_id, ciudad_id)`
  - `Estadios(id_estadio, nombre_estadio)`
  - `Entrenadores(id_entrenador, nombre_entrenador)`
  - `Ciudades(id_ciudad, nombre_ciudad)`
  - `Jugadores(id_jugador, nombre_jugador)`
  - `Equipos_Jugadores(id_equipo, id_jugador)`

### 4. Base de Datos de Canciones
- Contiene información sobre canciones, incluyendo artista, álbum, género, duración y compositor.
- **Tablas Originales**: `Canciones`
- **Tablas Normalizadas**:
  - `Canciones(id_cancion, titulo, album_id, año_lanzamiento, genero_id, duracion, compositor_id)`
  - `Artistas(id_artista, nombre_artista)`
  - `Albumes(id_album, nombre_album, artista_id)`
  - `Generos(id_genero, nombre_genero)`
  - `Compositores(id_compositor, nombre_compositor)`

### 5. Base de Datos de Animales
- Contiene información sobre animales, propietarios y veterinarios.
- **Tablas Originales**: `Animales`
- **Tablas Normalizadas**:
  - `Animales(id_animal, nombre, especie, edad, propietario_id, veterinario_id)`
  - `Propietarios(id_propietario, nombre_propietario, direccion_propietario)`
  - `Veterinarios(id_veterinario, nombre_veterinario, direccion_veterinario)`

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

### 3. Verificación y Validación
- Asegúrate de que las tablas resultantes cumplan con los principios de la **Tercera Forma Normal (3FN)**.
- Verifica la integridad referencial entre las claves primarias y foráneas.

## Análisis de Dependencias y Normalización
El proceso de normalización se centró en eliminar las dependencias parciales y transitivas, asegurando que las tablas estén en su forma más eficiente posible.

Los principales pasos incluyen:
1. **Identificación de dependencias funcionales**: Descomposición de las tablas basadas en dependencias parciales y transitivas.
2. **Creación de nuevas entidades**: Generación de tablas intermedias y claves foráneas para establecer relaciones entre las entidades.
3. **Validación en 3FN**: Garantizar que todas las tablas estén libres de redundancias y que las dependencias sean correctas.

## Autores
Este proyecto fue desarrollado como parte de una práctica de normalización de bases de datos. La metodología empleada sigue las mejores prácticas de diseño de bases de datos y normalización.

## Licencia
Este proyecto está bajo la licencia MIT. Siéntete libre de utilizar y modificar el código según tus necesidades, siempre y cuando atribuyas al autor original.

---

¡Gracias por revisar el proyecto! Para cualquier consulta o comentario, no dudes en ponerte en contacto con nosotros a través de [tu_email@ejemplo.com](mailto:tu_email@ejemplo.com).
