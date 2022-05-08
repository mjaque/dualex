DELETE FROM Usuario;
INSERT INTO Usuario (id, nombre, apellidos, email, clave) VALUES
(1, 'nombre 1', 'apellidos 1', 'email1@email.es', SHA2('clave 1', 256 )),
(2, 'nombre 2', 'apellidos 2', 'email2@email.es', SHA2('clave 2', 256 )),
(3, 'nombre 3', 'apellidos 3', 'email3@email.es', SHA2('clave 3', 256 )),
(4, 'Ana', 'García Torres', 'email4@email.es', SHA2('clave 4', 256 )),
(5, 'Juan Manuel', 'González Pérez', 'email5@email.es', SHA2('clave 5', 256 )),
(6, 'nombre 6', 'apellidos 6', 'email6@email.es', SHA2('clave 3', 256 ));

DELETE FROM Alumno;
INSERT INTO Alumno (id) VALUES (1), (3), (4), (5);

DELETE FROM Profesor;
INSERT INTO Profesor (id) VALUES (2), (6);

DELETE FROM Modulo;
INSERT INTO Modulo (id, codigo, titulo, colorFondo, colorLetra) VALUES
(1, 'MOD1', 'Módulo 1', '#0000FF', '#FFFFFF'),
(2, 'MOD2', 'Módulo 2',  '#FF00FF', '#FFFFFF'),
(3, 'C2223-2DAW-DWEC', 'Desarrollo Web en Entorno Cliente',  '#00FFFF', '#FFFFFF'),
(4, 'C2223-2DAW-DIW', 'Diseño de Interfaces Web',  '#FFFF00', '#000000');

