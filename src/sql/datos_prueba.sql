DELETE FROM Usuario;
INSERT INTO Usuario (id, nombre, apellidos, email, clave) VALUES
(1, 'Antonio', 'Portero', 'aportero@fundacionloyola.es', SHA2('aportero', 256 )),
(2, 'Diego', 'Camisón', 'dcamison@fundacionloyola.es', SHA2('dcamison', 256 )),
(3, 'Manuel', 'Molano', 'mmolano@fundacionloyola.es', SHA2('mmolano', 256 )),
(4, 'Antonio', 'Sánchez', 'asanchez@fundacionloyola.es', SHA2('asanchez', 256 )),
(5, 'Pedro', 'Risco', 'prisco@fundacionloyola.es', SHA2('prisco', 256 )),
(10, 'Alumno', '1', 'alumno1.guadalupe@alumnado.fundacionloyola.net', SHA2('alumno1', 256 )),
(11, 'Alumno', '2', 'alumno2.guadalupe@alumnado.fundacionloyola.net', SHA2('alumno2', 256 )),
(12, 'Alumno', '3', 'alumno3.guadalupe@alumnado.fundacionloyola.net', SHA2('alumno3', 256 )),
(13, 'Alumno', '4', 'alumno4.guadalupe@alumnado.fundacionloyola.net', SHA2('alumno4', 256 ));

DELETE FROM Alumno;
INSERT INTO Alumno (id) VALUES (10), (11), (12), (13);

DELETE FROM Profesor;
INSERT INTO Profesor (id) VALUES (1), (2), (3), (4), (5);

DELETE FROM Modulo;
INSERT INTO Modulo (id, codigo, titulo, color_fondo, color_letra) VALUES
(1, 'PRFB', 'Procesos de Fabricación', '#0000FF', '#FFFFFF'),
(2, 'SMEC', 'Sistemas Mecánicos',  '#FF00FF', '#FFFFFF'),
(3, 'SHYN', 'Sistemas Hidráulicos y Neumáticos',  '#00FFFF', '#FFFFFF'),
(4, 'CSM', 'Configuración de Sistemas Mecatrónicos',  '#FFFF00', '#000000'),
(5, 'SEYE', 'Sistemas Eléctricos y Electrónicos',  '#FFFF00', '#000000'),
(6, 'SSM', 'Simulación de Sistemas Mecatrónicos',  '#FFFF00', '#000000'),
(7, 'IS', 'Integración de Sistemas',  '#FFFF00', '#000000');

DELETE FROM Modulo_Profesor;
INSERT INTO Modulo_Profesor(id_modulo, id_profesor) VALUES
(1, 1), (2, 1), (3, 2), (3, 3), (4, 4), (5, 3), (5, 2), (6, 5), (7, 3);

DELETE FROM Actividad;
INSERT INTO Actividad (id, titulo, descripcion) VALUES
(1, 'Aplicar reglamentos y normativa referidos a la Prevención de Riesgos Laborales', ''), 
(2, 'Planifica la fabricación o reparación de elementos mecánicos de las máquinas, estableciendo las etapas y fijando los recursos', ''), 
(3, 'Colabora en la fabricación de componentes mecánicos utilizando las máquinas-herramientas del taller de mantenimiento', ''), 
(4, 'Colabora en la reparación de componentes mecánicos de la máquinas utilizando procesos de soldadura', ''), 
(5, 'Planificar el montaje de sistemas mecánicos', ''), 
(6, 'Colaborar en la ejecución del montaje de sistemas mecánicos', ''), 
(7, 'Poner en marcha o servicio sistemas mecánicos colaborando en la ejecución', ''), 
(8, 'Mantenimiento preventivo de los sistemas mecánicos y mecatrónicos', ''), 
(9, 'Diagnosticar el estado de los elementos', ''), 
(10, 'Colaborar en la reparación de sistemas mecánicos de equipos industriales', ''), 
(11, 'Reparar instalaciones de circuitos neumáticos e hidráulicos', ''), 
(12, 'Diagnosticar el estado, fallo y/o avería sistemas hidráulicos y neumáticos', ''), 
(13, 'Obtener croquis circuitos neumáticos o hidráulicos para su reconstrucción o reparación', ''), 
(14, 'Montar y reparar equipos y circuitos eléctricos de máquinas y equipos', ''), 
(15, 'Determinar el estado de elementos eléctricos realizando mediciones y comprobaciones', ''), 
(16, 'Obtener croquis de circuitos y elementos de los sistemas eléctricos y electrónicos para su reconstrucción o reparación', ''), 
(17, 'Integrar el PLC, conexionar, programar, comprobar y mantener', ''), 
(18, 'Integrar manipuladores y/o robots en sistemas mecatrónicos', ''), 
(19, 'Integrar las comunicaciones industriales verificando su funcionamiento', ''), 
(20, 'Diagnosticar averías, realizando las intervenciones correctivas', ''); 

DELETE FROM Actividad_Modulo;
INSERT INTO Actividad_Modulo (id_actividad, id_modulo) VALUES
(1, 1),(2, 1),(3, 1),(4, 1),(5, 2),(6, 2),(7, 2),(8, 2),(9, 2),(10, 2),(11, 3),(12, 3),(13, 3),(13, 4),(14, 5),(15, 5),(16, 4),(16, 6),(17, 7),(18, 7),(19, 7),(20, 7);

DELETE FROM Alumno_Modulo;
INSERT INTO Alumno_Modulo (id_alumno, id_modulo) VALUES
(10, 1), (11, 3), (12, 1), (10, 2), (13, 5), (13, 6), (13, 7);

DELETE FROM Tarea;
INSERT INTO Tarea (id, id_alumno, titulo, descripcion, fecha) VALUES
(1, 10, 'Tarea 10.1', 'Descripción de la tarea 10.1', '2022-06-21'),
(2, 10, 'Tarea 10.2', 'Descripción de la tarea 10.2', '2022-06-22'),
(3, 13, 'Tarea 13.1', 'Descripción de la tarea 13.1', '2022-10-22'),
(4, 13, 'Tarea 13.3', 'Descripción de la tarea 13.2', '2022-11-22'),
(5, 13, 'Tarea 13.3', 'Descripción de la tarea 13.3', '2022-12-22'),
(6, 13, 'Tarea 13.4', 'Descripción de la tarea 13.4', '2023-01-22'),
(7, 13, 'Tarea 13.5', 'Descripción de la tarea 13.5', '2023-02-22');

UPDATE Tarea SET id_calificacion_empresa = 1, calificacion = 7 WHERE id = 3;
UPDATE Tarea SET id_calificacion_empresa = 2, calificacion = 8 WHERE id = 4;
UPDATE Tarea SET id_calificacion_empresa = 3, calificacion = 6 WHERE id = 5;
UPDATE Tarea SET id_calificacion_empresa = 4, calificacion = 4 WHERE id = 6;
UPDATE Tarea SET id_calificacion_empresa = 2, calificacion = 6 WHERE id = 7;

DELETE FROM Actividad_Tarea;
INSERT INTO Actividad_Tarea (id_actividad, id_tarea) VALUES
(1, 1), (2, 1), (2, 2), (5,2), (14, 3), (14, 4), (16, 5), (17, 6), (18, 7);

DELETE FROM Periodo;
INSERT INTO Periodo (id, nombre, fecha_inicio, fecha_fin) VALUES
(1, 'Periodo 1', '2022-09-01', '2022-12-31'), (2, 'Periodo 2', '2023-01-01', '2023-04-30');

