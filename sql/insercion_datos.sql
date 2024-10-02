USE lab01;

INSERT INTO Peliculas (id_pelicula, titulo, director, año_estreno, genero, actor_principal, actor_secundario, pais_origen) VALUES
(1, 'The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama', 'Tim Robbins', 'Morgan Freeman', 'USA'),
(2, 'The Godfather', 'Francis Ford Coppola', 1972, 'Crime', 'Marlon Brando', 'Al Pacino', 'USA'),
(3, 'The Dark Knight', 'Christopher Nolan', 2008, 'Action', 'Christian Bale', 'Heath Ledger', 'USA'),
(4, 'Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 'Tom Hanks', 'Robin Wright', 'USA'),
(5, 'Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 'John Travolta', 'Samuel L. Jackson', 'USA'),
(6, 'Inception', 'Christopher Nolan', 2010, 'Sci-Fi', 'Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'USA'),
(7, 'Titanic', 'James Cameron', 1997, 'Romance', 'Leonardo DiCaprio', 'Kate Winslet', 'USA'),
(8, 'The Matrix', 'The Wachowskis', 1999, 'Sci-Fi', 'Keanu Reeves', 'Laurence Fishburne', 'USA'),
(9, 'Avatar', 'James Cameron', 2009, 'Sci-Fi', 'Sam Worthington', 'Zoe Saldana', 'USA'),
(10, 'Gladiator', 'Ridley Scott', 2000, 'Action', 'Russell Crowe', 'Joaquin Phoenix', 'USA');

INSERT INTO Coches (id_coche, marca, modelo, año, propietario_nombre, propietario_direccion, propietario_telefono, taller_nombre, taller_direccion) VALUES
(1, 'Toyota', 'Corolla', 2018, 'Juan Pérez', 'Calle Principal 123', '123-456-7890', 'Taller Juan', 'Avenida Central 456'),
(2, 'Honda', 'Civic', 2017, 'María López', 'Avenida Libertad 456', '987-654-3210', 'Taller Martínez', 'Calle Independencia 789'),
(3, 'Ford', 'Mustang', 2020, 'Pedro García', 'Calle Sur 789', '456-789-0123', 'Taller Rodríguez', 'Avenida Norte 123'),
(4, 'Chevrolet', 'Camaro', 2019, 'Ana Martínez', 'Calle Este 567', '321-654-0987', 'Taller Sánchez', 'Avenida Oeste 567'),
(5, 'Nissan', 'Altima', 2016, 'Luisa Torres', 'Avenida Central 789', '789-012-3456', 'Taller Gómez', 'Calle Principal 234'),
(6, 'BMW', 'X5', 2021, 'Carlos Ruiz', 'Calle Norte 345', '210-987-6543', 'Taller López', 'Avenida Sur 890'),
(7, 'Mercedes-Benz', 'C-Class', 2019, 'Sofía Rodríguez', 'Avenida Oeste 890', '543-210-9876', 'Taller Martín', 'Calle Este 678'),
(8, 'Audi', 'A4', 2018, 'Javier Gómez', 'Calle Este 789', '012-345-6789', 'Taller Pérez', 'Avenida Norte 345'),
(9, 'Hyundai', 'Elantra', 2017, 'Laura Sánchez', 'Avenida Libertad 678', '876-543-2109', 'Taller Hernández', 'Calle Sur 456'),
(10, 'Kia', 'Optima', 2019, 'Diego Martín', 'Calle Principal 567', '234-567-8901', 'Taller Ruiz', 'Avenida Central 678');



INSERT INTO EquiposFutbol (id_equipo, nombre_equipo, estadio, entrenador, ciudad, jugador1, jugador2, jugador3) VALUES
(1, 'Real Madrid', 'Santiago Bernabéu', 'Carlo Ancelotti', 'Madrid', 'Karim Benzema', 'Luka Modric', 'Sergio Ramos'),
(2, 'FC Barcelona', 'Camp Nou', 'Ronald Koeman', 'Barcelona', 'Lionel Messi', 'Gerard Piqué', 'Sergio Busquets'),
(3, 'Liverpool FC', 'Anfield', 'Jürgen Klopp', 'Liverpool', 'Mohamed Salah', 'Virgil van Dijk', 'Sadio Mané'),
(4, 'Manchester City', 'Etihad Stadium', 'Pep Guardiola', 'Manchester', 'Kevin De Bruyne', 'Raheem Sterling', 'Phil Foden'),
(5, 'Juventus FC', 'Allianz Stadium', 'Massimiliano Allegri', 'Turín', 'Cristiano Ronaldo', 'Paulo Dybala', 'Giorgio Chiellini'),
(6, 'Bayern Munich', 'Allianz Arena', 'Julian Nagelsmann', 'Múnich', 'Robert Lewandowski', 'Thomas Müller', 'Manuel Neuer'),
(7, 'Paris Saint-Germain', 'Parc des Princes', 'Mauricio Pochettino', 'París', 'Kylian Mbappé', 'Neymar Jr.', 'Marco Verratti'),
(8, 'Chelsea FC', 'Stamford Bridge', 'Thomas Tuchel', 'Londres', 'N Golo Kanté', 'Mason Mount', 'Christian Pulisic'),
(9, 'Atlético de Madrid', 'Wanda Metropolitano', 'Diego Simeone', 'Madrid', 'Luis Suárez', 'João Félix', 'Jan Oblak'),
(10, 'AC Milan', 'San Siro', 'Stefano Pioli', 'Milán', 'Zlatan Ibrahimović', 'Gianluigi Donnarumma', 'Franck Kessié');



INSERT INTO Canciones (id_cancion, titulo, artista, album, año_lanzamiento, genero, duracion, compositor) VALUES
(1, 'Bohemian Rhapsody', 'Queen', 'A Night at the Opera', 1975, 'Rock', '00:05:55', 'Freddie Mercury'),
(2, 'Shape of You', 'Ed Sheeran', '÷', 2017, 'Pop', '00:03:53', 'Ed Sheeran'),
(3, 'Rolling in the Deep', 'Adele', '21', 2010, 'Pop', '00:03:48', 'Adele Adkins'),
(4, 'Despacito', 'Luis Fonsi', 'Vida', 2017, 'Pop', '00:03:48', 'Luis Fonsi, Daddy Yankee'),
(5, 'Billie Jean', 'Michael Jackson', 'Thriller', 1982, 'Pop', '00:04:54', 'Michael Jackson'),
(6, 'Hotel California', 'Eagles', 'Hotel California', 1976, 'Rock', '00:06:30', 'Don Felder, Glenn Frey, Don Henley'),
(7, 'Stairway to Heaven', 'Led Zeppelin', 'Led Zeppelin IV', 1971, 'Rock', '00:08:02', 'Jimmy Page, Robert Plant'),
(8, 'Thinking Out Loud', 'Ed Sheeran', '×', 2014, 'Pop', '00:04:41', 'Ed Sheeran, Amy Wadge'),
(9, 'Shape of You', 'Ed Sheeran', '÷ (Divide)', 2017, 'Pop', '00:03:54', 'Ed Sheeran'),
(10, 'Thriller', 'Michael Jackson', 'Thriller', 1982, 'Pop', '00:05:57', 'Rod Temperton');

INSERT INTO Animales (id_animal, nombre, especie, edad, propietario_nombre, propietario_direccion, veterinario_nombre, veterinario_direccion) VALUES
(1, 'Max', 'Perro', 5, 'Ana Martínez', 'Calle Principal 123', 'Dr. Pérez', 'Avenida Central 456'),
(2, 'Whiskers', 'Gato', 3, 'Luisa Rodríguez', 'Calle Libertad 456', 'Dr. Gómez', 'Avenida Sur 789'),
(3, 'Buddy', 'Perro', 7, 'Carlos Sánchez', 'Avenida Norte 789', 'Dra. López', 'Calle Este 123'),
(4, 'Oliver', 'Gato', 2, 'Laura Pérez', 'Calle Oeste 567', 'Dr. Martínez', 'Avenida Central 890'),
(5, 'Luna', 'Perro', 4, 'Diego Gómez', 'Calle Principal 234', 'Dra. Rodríguez', 'Avenida Libertad 678'),
(6, 'Simba', 'Gato', 1, 'María López', 'Avenida Sur 890', 'Dr. Hernández', 'Calle Norte 345'),
(7, 'Charlie', 'Perro', 6, 'Javier Ruiz', 'Calle Este 678', 'Dra. Sánchez', 'Avenida Oeste 456'),
(8, 'Milo', 'Gato', 5, 'Sofía Martín', 'Avenida Norte 345', 'Dr. Pérez', 'Calle Principal 567'),
(9, 'Bella', 'Perro', 3, 'Pablo Hernández', 'Calle Oeste 678', 'Dra. Gómez', 'Avenida Central 789'),
(10, 'Oreo', 'Gato', 2, 'Lucía Rodríguez', 'Calle Libertad 890', 'Dr. Martínez', 'Avenida Sur 456');



