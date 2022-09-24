-- No anulamos las FOREIGN KEYS para garantizar la integridad de los datos.
-- Primero borramos, las que tienen FOREIGN KEYs primero
DELETE FROM Actividad_Tarea;
DELETE FROM Actividad_Modulo;
DELETE FROM Tarea;
DELETE FROM Actividad;
DELETE FROM Modulo_Profesor;
DELETE FROM Modulo;
DELETE FROM Ciclo;

-- Las que no tienen FOREIGN KEYs después
DELETE FROM Alumno;
DELETE FROM Profesor;
DELETE FROM Usuario;
DELETE FROM Periodo;
DELETE FROM Log;

-- Tablas que se cargan en el DDL y por lo tanto, NO SE BORRAN
-- Dualex, Calificacion

-- Luego insertamos
INSERT INTO Usuario (id, nombre, apellidos, email) VALUES
(1, 'Antonio', 'Portero Flores', 'aportero@fundacionloyola.es'),
(2, 'Diego', 'Camisón', 'dcamison@fundacionloyola.es'),
(3, 'Manuel', 'Molano Elías', 'mmolano@fundacionloyola.es'),
(4, 'Antonio', 'Sánchez Díaz', 'asanchez@fundacionloyola.es'),
(5, 'Pedro', 'Risco Aguilera', 'prisco@fundacionloyola.es'),
(6, 'José Antonio', 'Hernández Masero', 'jahernandez@fundacionloyola.es'),
(7, 'Tamara', 'Mora Carreño', 'tmora@fundacionloyola.es'),
(8, 'Mariano', 'Fuentes Morato', 'mfuentes@fundacionloyola.es'),
(9, 'Bonifacio', 'Durán López', 'bduran@fundacionloyola.es'),
(11, 'Alumno1', 'MI', 'alumno1.guadalupe@alumnado.fundacionloyola.net'),
(12, 'Alumno2', 'MI', 'alumno2.guadalupe@alumnado.fundacionloyola.net'),
(13, 'Alumno3', 'MI', 'alumno3.guadalupe@alumnado.fundacionloyola.net'),
(14, 'Alumno4', 'EMV', 'alumno4.guadalupe@alumnado.fundacionloyola.net'),
(15, 'Alumno5', 'EMV', 'alumno5.guadalupe@alumnado.fundacionloyola.net'),
(16, 'Alumno6', 'EMV', 'alumno6.guadalupe@alumnado.fundacionloyola.net'),
(17, 'Alumno7', 'ME', 'alumno7.guadalupe@alumnado.fundacionloyola.net'),
(18, 'Alumno8', 'ME', 'alumno8.guadalupe@alumnado.fundacionloyola.net'),
(19, 'Alumno9', 'ME', 'alumno9.guadalupe@alumnado.fundacionloyola.net'),

(100, 'Díaz Mellado', 'Carmen', 'carmendiazmellado.guadalupe@alumnado.fundacionloyola.net'),
(101, 'Ángel', 'Pintiado Caro', 'apintiadocaro.guadalupe@alumnado.fundacionloyola.net'),
(102, 'Manuel', 'Llera González', 'manuellleragonzalez.guadalupe@alumnado.fundacionloyola.net'),
(103, 'Jesús María', 'González Galán', 'jesusmariagonzalezgalan.guadalupe@alumnado.fundacionloyola.net'),
(104, 'Pablo', 'Mimbrero González', 'pablomimbrerogonzalez.guadalupe@alumnado.fundacionloyola.net'),
(105, 'Daniel', 'Merino Sánchez', 'danielmerinosanchez.guadalupe@alumnado.fundacionloyola.net'),
(106, 'Estaban José', 'Méndez Díaz', 'estebanjosemendezdiaz.guadalupe@alumnado.fundacionloyola.net'),

(107, 'Hugo', 'Bartol Cortés', 'hugobartolcortes.guadalupe@alumnado.fundacionloyola.net'),
(108, 'Alfonso', 'de la Concepción Chaparro', 'alfonsodelaconcepcionchaparro.guadalupe@alumnado.fundacionloyola.net'),
(109, 'Roberto', 'Guerrero López', 'robertoguerrerolopez.guadalupe@alumnado.fundacionloyola.net'),
(110, 'Francisco José', 'Hernández Fernández', 'franciscojosehernandezfernandez.guadalupe@alumnado.fundacionloyola.net'),
(111, 'Brian', 'Hernández Holguera', 'brianhernandezholguera.guadalupe@alumnado.fundacionloyola.net'),
(112, 'Antonio', 'Méndez García', 'antoniomendezgarcia.guadalupe@alumnado.fundacionloyola.net'),
(113, 'Fernando', 'Moreno Rico', 'fernandomorenorico.guadalupe@alumnado.fundacionloyola.net'),
(114, 'Javier', 'Rodríguez Carnerero', 'javierrodriguezcarnerero.guadalupe@alumnado.fundacionloyola.net'),
(115, 'Néstor', 'Sopa Perera', 'nestorsopaperera.guadalupe@alumnado.fundacionloyola.net'),
(116, 'Mario', 'Torres Ruíz', 'mariotorresruiz.guadalupe@alumnado.fundacionloyola.net');
-- (1, '', '', '.guadalupe@alumnado.fundacionloyola.net'),

INSERT INTO Profesor (id) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9);

INSERT INTO Ciclo (id, codigo, titulo, id_profesor, color_fondo, color_letra) VALUES 
(1, 'MI', 'Mecatrónica Industrial', 5, '#0000FF', '#FFFFFF'),
(2, 'EMV', 'Electromecánica de Vehículos', 6, '#00FF00', '#FFFFFF'),
(3, 'ME', 'Mantenimiento Electromecánico', 9, '#FF3344', '#FFFFFF');

INSERT INTO Alumno (id, id_ciclo) VALUES (11,1), (12,1), (13,1), (14,2), (15,2), (16,2), (17,3), (18,3), (19,3),
(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),
(107,2),(108,2),(109,2),(110,2),(111,2),(112,2),(113,2),(114,2),(115,2),(116,2)
 ;

INSERT INTO Modulo (id, id_ciclo, orden, codigo, titulo, color_fondo, color_letra) VALUES
(1, 1, 1, 'PRFB', 'Procesos de Fabricación', '#0000FF', '#FFFFFF'),
(2, 1, 2, 'SM', 'Sistemas Mecánicos',  '#FF00FF', '#FFFFFF'),
(3, 1, 3, 'SEYE', 'Sistemas Eléctricos y Electrónicos',  '#CD853F', '#000000'),
(4, 1, 4, 'IS', 'Integración de Sistemas',  '#6B8E23', '#000000'),
(5, 1, 5, 'SHYN', 'Sistemas Hidráulicos y Neumáticos',  '#00FFFF', '#FFFFFF'),
(6, 1, 6, 'EMA', 'Elementos de Máquinas',  '#B0E0E6', '#000000'),
(7, 1, 7, 'CSM', 'Configuración de Sistemas Mecatrónicos',  '#FFFF00', '#000000'),

(8, 2, 1, 'MOT', 'Motores',  '#696969', '#000000'),
(9, 2, 2, 'STF', 'Sistemas de Transmisión y Frenado',  '#00FA9A', '#000000'),
(10, 2, 3, 'CEAV', 'Circuitos Eléctricos Auxiliares del Vehículo',  '#228B22', '#000000'),
(11, 2, 4, 'CFSD', 'Circuitos de Fluidos, Suspensión y Dirección',  '#F5DEB3', '#000000'),
(12, 2, 5, 'SCA', 'Sistemas de Carga y Arranque',  '#9400D3', '#000000'),
(13, 2, 6, 'SSC', 'Sistemas de Seguridad y Confortabilidad',  '#FFE4B5', '#000000'),
(14, 2, 7, 'SAM', 'Sistemas Auxiliares del Motor',  '#3CB371', '#000000'),

(15, 3, 1, 'MMEE', 'Montaje y Mantenimiento Eléctrico y Electrónico',  '#B22222', '#000000'),
(16, 3, 2, 'MMLA', 'Montaje y Mantenimiento de Líneas Automatizadas',  '#7FFF00', '#000000'),
(17, 3, 3, 'MMM', 'Montaje y Mantenimiento Mecánico',  '#DAA520', '#000000');

INSERT INTO Modulo_Profesor(id_modulo, id_profesor) VALUES
(1, 1), (2, 1), (3, 2), (3, 3), (4, 4), (5, 3), (5, 2), (6, 5), (7, 3), (8, 6), (9, 6), (10, 6), (11, 7), (11, 8), (12, 7), (12, 4), (13, 8), (14, 8), (15, 9), (15, 8), (16, 3), (17, 1);

INSERT INTO Actividad (id, id_ciclo, orden, titulo, descripcion) VALUES
(1, 1, 1, 'Aplicar reglamentos y normativa referidos a la Prevención de Riesgos Laborales', ''), 
(2, 1, 2, 'Planifica la fabricación o reparación de elementos mecánicos de las máquinas, estableciendo las etapas y fijando los recursos', ''), 
(3, 1, 3, 'Colabora en la fabricación de componentes mecánicos utilizando las máquinas-herramientas del taller de mantenimiento', ''), 
(4, 1, 4, 'Colabora en la reparación de componentes mecánicos de la máquinas utilizando procesos de soldadura', ''), 
(5, 1, 5, 'Planificar el montaje de sistemas mecánicos', ''), 
(6, 1, 6, 'Colaborar en la ejecución del montaje de sistemas mecánicos', ''), 
(7, 1, 7, 'Puesta en marcha o servicio sistemas mecánicos colaborando en la ejecución', ''), 
(8, 1, 8, 'Control del mantenimiento preventivo de los sistemas mecánicos y mecatrónicos', ''), 
(9, 1, 9, 'Control de los sistemas mecánicos y mecatrónicos. Diagnóstico del estado de elementos', ''), 
(10, 1, 10, 'Colaborar en la reparación de sistemas mecánicos de equipos industriales a partir de
planes y especificaciones técnicas contenidas en la documentación de la máquina', ''), 
(11, 1, 11, 'Reparación e instalación de circuitos neumáticos e hidráulicos para maquinaria y
equipo industrial a partir de planos, normas y especificaciones técnicas.', ''), 
(12, 1, 12, 'Diagnóstico del estado, fallo y/o avería de elementos mecánicos, sistemas hidráulicos y
neumáticos, así como su reparación utilizando manuales de instrucción y planos.', ''), 
(13, 1, 13, 'Obtención de croquis de los elementos mecánicos y/o circuitos neumáticos o
hidráulicos a partir de datos recogidos del elemento deteriorado y de la documentación
técnica disponible para su reconstrucción o reparación.', ''), 
(14, 1, 14, 'Montaje y reparación de equipos y circuitos eléctricos para maquinaria y equipo
industrial a partir de planos y especificaciones estableciendo el proceso de montaje y
desmontaje de acuerdo con las instrucciones técnicas.', ''), 
(15, 1, 15, 'Determinar el estado de elementos eléctricos realizando mediciones y comprobaciones', ''), 
(16, 1, 16, 'Obtención de croquis de circuitos y elementos de los sistemas eléctricos y electrónicos para su reconstrucción o reparación', ''), 
(17, 1, 17, 'Identifica la Integración del PLC en el montaje de sistemas mecatrónicos de procesos
discretos y continuos, conexionándolo, programándolo, comprobando y manteniendo su funcionamiento.', ''), 
(18, 1, 18, 'Diagnostica averías en sistemas mecatrónicos discretos y continuos simulados,
identificando la naturaleza de la avería, realizando las intervenciones correctivas
necesarias para eliminar la disfuncionalidad y restablecer el funcionamiento', ''), 

(21, 2, 1, 'Reparación de un motor de combustión interna alternativo de ciclo Otto y ciclo Diésel', ''),
(22, 2, 2, 'Reparación de los sistemas de engrase y refrigeración del motor', ''),
(23, 2, 3, 'Reparación del sistema de encendido de un motor de ciclo Otto', ''),
(24, 2, 4, 'Reparación del sistema de alimentación de un motor de ciclo Otto y Diésel', ''),
(25, 2, 5, 'Reparación del sistema de sobrealimentación de un motor de ciclo Otto y un motor de ciclo Diésel', ''),
(26, 2, 6, 'Reparación del sistema de anticontaminación de un motor de ciclo Otto y un motor de ciclo Diésel', ''),
(27, 2, 7, 'Reparación de suspensiones metálicas, neumáticas e hidráulicas', ''),
(28, 2, 8, 'Reparación del sistema de dirección', ''),
(29, 2, 9, 'Reparación del sistema de frenos', ''),
(30, 2, 10, 'Reparación del sistema de embrague', ''),
(31, 2, 11, 'Reparación del sistema de transmisión', ''),
(32, 2, 12, 'Reparación y sustitución de ruedas y neumáticos', ''),
(33, 2, 13, 'Mantenimiento periódico de vehículos equipados con motores de ciclo Otto y de ciclo Diésel', ''),
(34, 2, 14, 'Diagnosis de reparación y comunicaciones', ''),
(35, 2, 15, 'Reparación del circuito de aire acondicionado o climatización del vehículo', ''),
(36, 2, 16, 'Reparación del circuito de iluminación del vehículo y de ayuda a la conducción. Reparación de instalación eléctrica del vehículo', ''),
(37, 2, 17, 'Reparación del circuito de carga y arranque del vehículo', ''),
(38, 2, 18, 'Reparación o sustitución de equipos de sonido e imagen del vehículo', ''),
(39, 2, 19, 'Reparación o sustitución de lunas y de sistemas de seguridad del vehículo. Desmontaje y montaje de elementos de chasis y/o carrocería', ''),
(40, 2, 20, 'Mantenimiento y reparación  de vehículos híbridos y eléctricos', ''),

(41, 3, 1, 'Identifica montajes en base a PLCs en una máquina, equipo o línea de producción automatizada para el control de esta. Analizando el conexionado, sugiriendo mejoras y, reproduce y/o elabora sencillos programas de implementación, y su posible comprobación y mantenimiento para su correcto funcionamiento', ''),
(42, 3, 2, 'Identifica la posibilidad de Integrar un manipulador y/o un robot en el montaje global de una máquina, equipo o línea de producción automatizada controlada por PLC, instalándolo, conexionándolo y realizando sencillos programas para su posible implementación.', ''),
(43, 3, 3, 'Analiza las comunicaciones industriales en el montaje global de una máquina, equipo o línea de producción automatizada controlada por PLC, realizando propuestas y esquemas de instalación y conexionando sus componentes físicos, así como posibles mejoras', ''),
(44, 3, 4, 'Diagnostica y propone actuaciones para la detección averías en los sistemas de producción automáticos, identificando la naturaleza de la avería, proponiendo y/o realizando las intervenciones correctivas para eliminar la disfuncionalidad y restablecer su funcionamiento.', ''),
(45, 3, 5, 'Colaborar en las tareas de montaje e instalación de equipos y circuitos eléctricos/electrónicos para maquinaria y equipo industrial a partir de planos y especificaciones técnicas..', ''),
(46, 3, 6, 'Participar en las tareas de reparación por sustitución de elementos de los sistemas eléctrico y electrónico y de los circuitos eléctricos estableciendo el proceso de desmontaje/montaje de acuerdo con instrucciones técnica.', ''),
(47, 3, 7, 'Participar en el análisis del estado de los elementos electrónicos de potencia, mando, adquisición de datos, unidades de mando y señalización eléctrica/electrónica y de tratamiento de la información realizando mediciones y comprobaciones, utilizando instrucciones técnicas y procedimientos establecidos e informando de los resultados al superior.', ''),
(48, 3, 8, 'Participar en el análisis de los croquis de los circuitos y de los elementos de los sistemas eléctrico y electrónico e información de sus características y especificaciones técnicas a partir de los datos recogidos de los propios sistemas y de la documentación técnica disponible de la máquina para su reconstrucción o reparación.', ''),
(49, 3, 9, 'Aplicar reglamentos y normativa referidos a la Prevención de
Riesgos Laborales', ''),
(50, 3, 10, 'Participar en las tareas de montaje de equipos e instalaciones, estableciendo las etapas, fijando los recursos y aplicando las normas de seguridad.', ''),
(51, 3, 11, 'Colaborar en la puesta en servicio de los equipos, siguiendo los procedimientos establecidos', ''),
(52, 3, 12, 'Realizar operaciones de mantenimiento preventivo en los equipos industriales siguiendo los planes establecidos en la empresa.', ''),
(53, 3, 13, 'Colaborar en el diagnóstico y reparación de averías y disfunciones de los equipos mecánicos, aplicando técnicas y procedimientos de mantenimiento correctivo.', ''),
(54, 3, 14, 'Reparación de elementos mediante técnicas de mecanizado manual (roscado, taladrado).', ''),
(55, 3, 15, 'Reparación de elementos mediante soldadura eléctrica.', ''),
(56, 3, 16, 'Identificación, reparación y/o sustitución de elementos de unión no soldados (roscas, remaches, pasadores).', '');

INSERT INTO Actividad_Modulo (id_actividad, id_modulo) VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7), (2,1),(2,6),(2,7), (3,1),(3,6),(3,7), (4,1),(4,7), (5,2),(5,7), (6,2),(6,7), (7,2),(7,7), (8,1),(8,2),(8,3),(8,4),(8,5), (9,2),(9,3),(9,5), (10,2),(10,3),(10,5), (11,5), (12,2),(12,5),(12,7), (13,2),(13,5), (14,2),(14,3), (15,3),(15,7), (16,3),(16,7), (17,4), (18,2), (18,4),
(21, 9), (21,14), (22,9),(23,14),(24,14),(25,14),(26,14),(27,11),(28,11),(29,9),(30,9),(31,9),(32,11),(33,8),(33,14),(34,8),(34,12),(34,11),(34,10),(34,9),(34,14),(34,13),(35,13),(36,10),(36,13),(37,12),(38,13),(39,13),(40,8),(40,12),(40,11),(40,10),(40,9),(40,14),(40,13),
(41,16),(42,16),(43,16),(44,16),(45,15),(46,15),(47,15),(48,15),(49,17),(50,17),(51,17),(52,17),(53,17),(54,17),(55,17),(56,17)
;

INSERT INTO Periodo (id, nombre, fecha_inicio, fecha_fin) VALUES
(1, 'Periodo 1', '2022-09-01', '2022-12-31'), (2, 'Periodo 2', '2023-01-01', '2023-04-30');

