DELETE FROM Usuario;
INSERT INTO Usuario (id, nombre, apellidos, email) VALUES
(1, 'Antonio', 'Portero', 'aportero@fundacionloyola.es'),
(2, 'Diego', 'Camisón', 'dcamison@fundacionloyola.es'),
(3, 'Manuel', 'Molano', 'mmolano@fundacionloyola.es'),
(4, 'Antonio', 'Sánchez', 'asanchez@fundacionloyola.es'),
(5, 'Pedro', 'Risco', 'prisco@fundacionloyola.es'),
(6, 'José Antonio', 'Hernández', 'jahernandez@fundacionloyola.es'),
(7, 'Tamara', 'Mora', 'tmora@fundacionloyola.es'),
(8, 'Mariano', 'Fuentes', 'mfuentes@fundacionloyola.es'),
(9, 'Bonifacio', 'Durán', 'bduran@fundacionloyola.es'),
(10, 'Alumno', '1', 'alumno1.guadalupe@alumnado.fundacionloyola.net'),
(11, 'Alumno', '2', 'alumno2.guadalupe@alumnado.fundacionloyola.net'),
(12, 'Alumno', '3', 'alumno3.guadalupe@alumnado.fundacionloyola.net'),
(13, 'Alumno', '4', 'alumno4.guadalupe@alumnado.fundacionloyola.net'),
(14, 'Alumno', '5', 'alumno5.guadalupe@alumnado.fundacionloyola.net'),
(42, 'Miguel', 'Jaque', 'mjaque@fundacionloyola.es');

DELETE FROM Profesor;
INSERT INTO Profesor (id) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (42);

DELETE FROM Ciclo;
INSERT INTO Ciclo (id, codigo, titulo, id_profesor, color_fondo, color_letra) VALUES 
(1, 'MI', 'Mecatrónica Industrial', 42, '#0000FF', '#FFFFFF'),
(2, 'EMV', 'Electromecánica de Vehículos', 42, '#00FF00', '#FFFFFF'),
(3, 'ME', 'Mantenimiento Electromecánico', 42, '#FF3344', '#FFFFFF');

DELETE FROM Alumno;
INSERT INTO Alumno (id, id_ciclo) VALUES (10,1), (11,1), (12,1), (13,1), (14,2);

DELETE FROM Modulo;
INSERT INTO Modulo (id, id_ciclo, orden, codigo, titulo, color_fondo, color_letra) VALUES
(1, 1, 1, 'PRF', 'Procesos de Fabricación', '#0000FF', '#FFFFFF'),
(2, 1, 2, 'SMEC', 'Sistemas Mecánicos',  '#FF00FF', '#FFFFFF'),
(3, 1, 3, 'SHYN', 'Sistemas Hidráulicos y Neumáticos',  '#00FFFF', '#FFFFFF'),
(4, 1, 4, 'CSM', 'Configuración de Sistemas Mecatrónicos',  '#FFFF00', '#000000'),
(5, 1, 5, 'SEYE', 'Sistemas Eléctricos y Electrónicos',  '#CD853F', '#000000'),
(6, 1, 6, 'SSM', 'Simulación de Sistemas Mecatrónicos',  '#B0E0E6', '#000000'),
(7, 1, 7, 'IS', 'Integración de Sistemas',  '#6B8E23', '#000000'),
(8, 2, 1, 'MOT', 'Motores',  '#696969', '#000000'),
(9, 2, 2, 'STF', '?',  '#00FA9A', '#000000'),
(10, 2, 3, 'CEAV', '?',  '#228B22', '#000000'),
(11, 2, 4, 'CFSD', '?',  '#F5DEB3', '#000000'),
(12, 2, 5, 'SCA', '?',  '#9400D3', '#000000'),
(13, 2, 6, 'SSC', '?',  '#FFE4B5', '#000000'),
(14, 2, 7, 'SAM', '?',  '#3CB371', '#000000'),
(15, 3, 1, 'MMEE', '?',  '#B22222', '#000000'),
(16, 3, 2, 'MMLA', '?',  '#7FFF00', '#000000'),
(17, 3, 3, 'MMM', '?',  '#DAA520', '#000000');

DELETE FROM Modulo_Profesor;
INSERT INTO Modulo_Profesor(id_modulo, id_profesor) VALUES
(1, 1), (2, 1), (3, 2), (3, 3), (4, 4), (5, 3), (5, 2), (6, 5), (7, 3), (8, 6), (9, 6), (10, 6), (11, 7), (11, 8), (12, 7), (12, 4), (13, 8), (14, 8), (15, 9), (15, 3), (16, 3), (17, 1);

DELETE FROM Actividad;
INSERT INTO Actividad (id, id_ciclo, orden, titulo, descripcion) VALUES
(1, 1, 1, 'Aplicar reglamentos y normativa referidos a la Prevención de Riesgos Laborales', ''), 
(2, 1, 2, 'Planifica la fabricación o reparación de elementos mecánicos de las máquinas, estableciendo las etapas y fijando los recursos', ''), 
(3, 1, 3, 'Colabora en la fabricación de componentes mecánicos utilizando las máquinas-herramientas del taller de mantenimiento', ''), 
(4, 1, 4, 'Colabora en la reparación de componentes mecánicos de la máquinas utilizando procesos de soldadura', ''), 
(5, 1, 5, 'Planificar el montaje de sistemas mecánicos', ''), 
(6, 1, 6, 'Colaborar en la ejecución del montaje de sistemas mecánicos', ''), 
(7, 1, 7, 'Poner en marcha o servicio sistemas mecánicos colaborando en la ejecución', ''), 
(8, 1, 8, 'Mantenimiento preventivo de los sistemas mecánicos y mecatrónicos', ''), 
(9, 1, 9, 'Diagnosticar el estado de los elementos', ''), 
(10, 1, 10, 'Colaborar en la reparación de sistemas mecánicos de equipos industriales', ''), 
(11, 1, 11, 'Reparar instalaciones de circuitos neumáticos e hidráulicos', ''), 
(12, 1, 12, 'Diagnosticar el estado, fallo y/o avería sistemas hidráulicos y neumáticos', ''), 
(13, 1, 13, 'Obtener croquis circuitos neumáticos o hidráulicos para su reconstrucción o reparación', ''), 
(14, 1, 14, 'Montar y reparar equipos y circuitos eléctricos de máquinas y equipos', ''), 
(15, 1, 15, 'Determinar el estado de elementos eléctricos realizando mediciones y comprobaciones', ''), 
(16, 1, 16, 'Obtener croquis de circuitos y elementos de los sistemas eléctricos y electrónicos para su reconstrucción o reparación', ''), 
(17, 1, 17, 'Integrar el PLC, conexionar, programar, comprobar y mantener', ''), 
(18, 1, 18, 'Integrar manipuladores y/o robots en sistemas mecatrónicos', ''), 
(19, 1, 19, 'Integrar las comunicaciones industriales verificando su funcionamiento', ''), 
(20, 1, 20, 'Diagnosticar averías, realizando las intervenciones correctivas', ''),
(21, 2, 1, 'Actividad 1 del Módulo 2', ''); 

DELETE FROM Actividad_Modulo;
INSERT INTO Actividad_Modulo (id_actividad, id_modulo) VALUES
(1, 1),(2, 1),(3, 1),(4, 1),(5, 2),(6, 2),(7, 2),(8, 2),(9, 2),(10, 2),(11, 3),(12, 3),(13, 3),(13, 4),(14, 5),(15, 5),(16, 4),(16, 6),(17, 7),(18, 7),(19, 7),(20, 7),(21,8);

DELETE FROM Tarea;
INSERT INTO Tarea (id, id_alumno, titulo, descripcion, fecha) VALUES
(1, 10, 'Tarea 10.1', 'Descripción de la tarea 10.1', '2022-06-21'),
(2, 10, 'Tarea 10.2', 'Descripción de la tarea 10.2', '2022-06-22'),
(3, 13, 'Tarea 13.1', 'Descripción de la tarea 13.1', '2022-10-22'),
(4, 13, 'Tarea 13.3', 'Descripción de la tarea 13.2', '2022-11-22'),
(5, 13, 'Tarea 13.3', 'Descripción de la tarea 13.3', '2022-12-22'),
(6, 13, 'Tarea 13.4', 'Descripción de la tarea 13.4', '2023-01-22'),
(7, 13, 'Tarea 13.5', 'Descripción de la tarea 13.5', '2023-02-22'),
(8, 14, 'Tarea 14.1', 'Descripción de la tarea 14.1', '2023-02-22');

UPDATE Tarea SET id_calificacion_empresa = 1, calificacion = 7 WHERE id = 3;
UPDATE Tarea SET id_calificacion_empresa = 2, calificacion = 8 WHERE id = 4;
UPDATE Tarea SET id_calificacion_empresa = 3, calificacion = 6 WHERE id = 5;
UPDATE Tarea SET id_calificacion_empresa = 4, calificacion = 4 WHERE id = 6;
UPDATE Tarea SET id_calificacion_empresa = 2, calificacion = 6 WHERE id = 7;

DELETE FROM Actividad_Tarea;
INSERT INTO Actividad_Tarea (id_actividad, id_tarea) VALUES
(1, 1), (2, 1), (2, 2), (5,2), (14, 3), (14, 4), (16, 5), (17, 6), (18, 7), (21,8);

DELETE FROM Periodo;
INSERT INTO Periodo (id, nombre, fecha_inicio, fecha_fin) VALUES
(1, 'Periodo 1', '2022-09-01', '2022-12-31'), (2, 'Periodo 2', '2023-01-01', '2023-04-30');

