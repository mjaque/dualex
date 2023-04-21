-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-04-2023 a las 07:44:15
-- Versión del servidor: 10.3.28-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `guadalupe_dualex`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Actividad`
--

CREATE TABLE `Actividad` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(1024) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Actividad`
--

INSERT INTO `Actividad` (`id`, `titulo`, `descripcion`) VALUES
(1, 'Aplicar reglamentos y normativa referidos a la Prevención de Riesgos Laborales', ''),
(2, 'Planifica la fabricación o reparación de elementos mecánicos de las máquinas, estableciendo las etapas y fijando los recursos', ''),
(3, 'Colabora en la fabricación de componentes mecánicos utilizando las máquinas-herramientas del taller de mantenimiento', ''),
(4, 'Colabora en la reparación de componentes mecánicos de la máquinas utilizando procesos de soldadura', ''),
(5, 'Planificar el montaje de sistemas mecánicos', ''),
(6, 'Colaborar en la ejecución del montaje de sistemas mecánicos', ''),
(7, 'Puesta en marcha o servicio sistemas mecánicos colaborando en la ejecución', ''),
(8, 'Control del mantenimiento preventivo de los sistemas mecánicos y mecatrónicos', ''),
(9, 'Control de los sistemas mecánicos y mecatrónicos. Diagnóstico del estado de elementos', ''),
(10, 'Colaborar en la reparación de sistemas mecánicos de equipos industriales a partir de\r\nplanes y especificaciones técnicas contenidas en la documentación de la máquina', ''),
(11, 'Reparación e instalación de circuitos neumáticos e hidráulicos para maquinaria y\r\nequipo industrial a partir de planos, normas y especificaciones técnicas.', ''),
(12, 'Diagnóstico del estado, fallo y/o avería de elementos mecánicos, sistemas hidráulicos y\r\nneumáticos, así como su reparación utilizando manuales de instrucción y planos.', ''),
(13, 'Obtención de croquis de los elementos mecánicos y/o circuitos neumáticos o\r\nhidráulicos a partir de datos recogidos del elemento deteriorado y de la documentación\r\ntécnica disponible para su reconstrucción o reparación.', ''),
(14, 'Montaje y reparación de equipos y circuitos eléctricos para maquinaria y equipo\r\nindustrial a partir de planos y especificaciones estableciendo el proceso de montaje y\r\ndesmontaje de acuerdo con las instrucciones técnicas.', ''),
(15, 'Determinar el estado de elementos eléctricos realizando mediciones y comprobaciones', ''),
(16, 'Obtención de croquis de circuitos y elementos de los sistemas eléctricos y electrónicos para su reconstrucción o reparación', ''),
(17, 'Identifica la Integración del PLC en el montaje de sistemas mecatrónicos de procesos\r\ndiscretos y continuos, conexionándolo, programándolo, comprobando y manteniendo su funcionamiento.', ''),
(18, 'Diagnostica averías en sistemas mecatrónicos discretos y continuos simulados,\r\nidentificando la naturaleza de la avería, realizando las intervenciones correctivas\r\nnecesarias para eliminar la disfuncionalidad y restablecer el funcionamiento', ''),
(21, 'Reparación de un motor de combustión interna alternativo de ciclo Otto y ciclo Diésel', ''),
(22, 'Reparación de los sistemas de engrase y refrigeración del motor', ''),
(23, 'Reparación del sistema de encendido de un motor de ciclo Otto', ''),
(24, 'Reparación del sistema de alimentación de un motor de ciclo Otto y Diésel', ''),
(25, 'Reparación del sistema de sobrealimentación de un motor de ciclo Otto y un motor de ciclo Diésel', ''),
(26, 'Reparación del sistema de anticontaminación de un motor de ciclo Otto y un motor de ciclo Diésel', ''),
(27, 'Reparación de suspensiones metálicas, neumáticas e hidráulicas', ''),
(28, 'Reparación del sistema de dirección', ''),
(29, 'Reparación del sistema de frenos', ''),
(30, 'Reparación del sistema de embrague', ''),
(31, 'Reparación del sistema de transmisión', ''),
(32, 'Reparación y sustitución de ruedas y neumáticos', ''),
(33, 'Mantenimiento periódico de vehículos equipados con motores de ciclo Otto y de ciclo Diésel', ''),
(34, 'Diagnosis de reparación y comunicaciones', ''),
(35, 'Reparación del circuito de aire acondicionado o climatización del vehículo', ''),
(36, 'Reparación del circuito de iluminación del vehículo y de ayuda a la conducción. Reparación de instalación eléctrica del vehículo', ''),
(37, 'Reparación del circuito de carga y arranque del vehículo', ''),
(38, 'Reparación o sustitución de equipos de sonido e imagen del vehículo', ''),
(39, 'Reparación o sustitución de lunas y de sistemas de seguridad del vehículo. Desmontaje y montaje de elementos de chasis y/o carrocería', ''),
(40, 'Mantenimiento y reparación  de vehículos híbridos y eléctricos', ''),
(41, 'Identifica montajes en base a PLCs en una máquina, equipo o línea de producción automatizada para el control de esta. Analizando el conexionado, sugiriendo mejoras y, reproduce y/o elabora sencillos programas de implementación, y su posible comprobación y mantenimiento para su correcto funcionamiento', ''),
(42, 'Identifica la posibilidad de Integrar un manipulador y/o un robot en el montaje global de una máquina, equipo o línea de producción automatizada controlada por PLC, instalándolo, conexionándolo y realizando sencillos programas para su posible implementación.', ''),
(43, 'Analiza las comunicaciones industriales en el montaje global de una máquina, equipo o línea de producción automatizada controlada por PLC, realizando propuestas y esquemas de instalación y conexionando sus componentes físicos, así como posibles mejoras', ''),
(44, 'Diagnostica y propone actuaciones para la detección averías en los sistemas de producción automáticos, identificando la naturaleza de la avería, proponiendo y/o realizando las intervenciones correctivas para eliminar la disfuncionalidad y restablecer su funcionamiento.', ''),
(45, 'Colaborar en las tareas de montaje e instalación de equipos y circuitos eléctricos/electrónicos para maquinaria y equipo industrial a partir de planos y especificaciones técnicas..', ''),
(46, 'Participar en las tareas de reparación por sustitución de elementos de los sistemas eléctrico y electrónico y de los circuitos eléctricos estableciendo el proceso de desmontaje/montaje de acuerdo con instrucciones técnica.', ''),
(47, 'Participar en el análisis del estado de los elementos electrónicos de potencia, mando, adquisición de datos, unidades de mando y señalización eléctrica/electrónica y de tratamiento de la información realizando mediciones y comprobaciones, utilizando instrucciones técnicas y procedimientos establecidos e informando de los resultados al superior.', ''),
(48, 'Participar en el análisis de los croquis de los circuitos y de los elementos de los sistemas eléctrico y electrónico e información de sus características y especificaciones técnicas a partir de los datos recogidos de los propios sistemas y de la documentación técnica disponible de la máquina para su reconstrucción o reparación.', ''),
(49, 'Aplicar reglamentos y normativa referidos a la Prevención de\r\nRiesgos Laborales', ''),
(50, 'Participar en las tareas de montaje de equipos e instalaciones, estableciendo las etapas, fijando los recursos y aplicando las normas de seguridad.', ''),
(51, 'Colaborar en la puesta en servicio de los equipos, siguiendo los procedimientos establecidos', ''),
(52, 'Realizar operaciones de mantenimiento preventivo en los equipos industriales siguiendo los planes establecidos en la empresa.', ''),
(53, 'Colaborar en el diagnóstico y reparación de averías y disfunciones de los equipos mecánicos, aplicando técnicas y procedimientos de mantenimiento correctivo.', ''),
(54, 'Reparación de elementos mediante técnicas de mecanizado manual (roscado, taladrado).', ''),
(55, 'Reparación de elementos mediante soldadura eléctrica.', ''),
(56, 'Identificación, reparación y/o sustitución de elementos de unión no soldados (roscas, remaches, pasadores).', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Actividad_Curso`
--

CREATE TABLE `Actividad_Curso` (
  `id_actividad` int(10) UNSIGNED NOT NULL,
  `id_curso` int(10) UNSIGNED NOT NULL,
  `orden` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Actividad_Curso`
--

INSERT INTO `Actividad_Curso` (`id_actividad`, `id_curso`, `orden`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(21, 2, 1),
(22, 2, 2),
(23, 2, 3),
(24, 2, 4),
(25, 2, 5),
(26, 2, 6),
(27, 2, 7),
(28, 2, 8),
(29, 2, 9),
(30, 2, 10),
(31, 2, 11),
(32, 2, 12),
(33, 2, 13),
(34, 2, 14),
(35, 2, 15),
(36, 2, 16),
(37, 2, 17),
(38, 2, 18),
(39, 2, 19),
(40, 2, 20),
(41, 3, 1),
(42, 3, 2),
(43, 3, 3),
(44, 3, 4),
(45, 3, 5),
(46, 3, 6),
(47, 3, 7),
(48, 3, 8),
(49, 3, 9),
(50, 3, 10),
(51, 3, 11),
(52, 3, 12),
(53, 3, 13),
(54, 3, 14),
(55, 3, 15),
(56, 3, 16),
(1, 4, 1),
(2, 4, 2),
(3, 4, 3),
(4, 4, 4),
(5, 4, 5),
(6, 4, 6),
(7, 4, 7),
(8, 4, 8),
(9, 4, 9),
(10, 4, 10),
(11, 4, 11),
(12, 4, 12),
(13, 4, 13),
(14, 4, 14),
(15, 4, 15),
(16, 4, 16),
(17, 4, 17),
(18, 4, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Actividad_Modulo`
--

CREATE TABLE `Actividad_Modulo` (
  `id_actividad` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Actividad_Modulo`
--

INSERT INTO `Actividad_Modulo` (`id_actividad`, `id_modulo`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(2, 6),
(2, 7),
(3, 1),
(3, 6),
(3, 7),
(4, 1),
(4, 7),
(5, 2),
(5, 7),
(6, 2),
(6, 7),
(7, 2),
(7, 7),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(9, 2),
(9, 3),
(9, 5),
(9, 7),
(10, 2),
(10, 3),
(10, 5),
(10, 7),
(11, 5),
(11, 7),
(12, 2),
(12, 5),
(12, 7),
(13, 2),
(13, 5),
(13, 7),
(14, 2),
(14, 3),
(14, 7),
(15, 3),
(15, 7),
(16, 3),
(16, 7),
(17, 4),
(18, 2),
(18, 4),
(18, 7),
(21, 8),
(21, 14),
(22, 8),
(23, 14),
(24, 14),
(25, 14),
(26, 14),
(27, 11),
(28, 11),
(29, 9),
(30, 9),
(31, 9),
(32, 11),
(33, 8),
(33, 14),
(34, 8),
(34, 9),
(34, 10),
(34, 11),
(34, 12),
(34, 13),
(34, 14),
(35, 13),
(36, 10),
(36, 13),
(37, 12),
(38, 13),
(39, 13),
(40, 8),
(40, 9),
(40, 10),
(40, 11),
(40, 12),
(40, 13),
(40, 14),
(41, 16),
(42, 16),
(43, 16),
(44, 16),
(45, 15),
(46, 15),
(47, 15),
(48, 15),
(49, 17),
(50, 17),
(51, 17),
(52, 17),
(53, 17),
(54, 17),
(55, 17),
(56, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Actividad_Modulo_Tarea`
--

CREATE TABLE `Actividad_Modulo_Tarea` (
  `id_actividad` int(10) UNSIGNED NOT NULL COMMENT 'Cualquier actividad del módulo relacionada con la tarea',
  `id_modulo` int(10) UNSIGNED NOT NULL,
  `id_tarea` int(10) UNSIGNED NOT NULL,
  `calificacion` int(10) UNSIGNED DEFAULT NULL COMMENT 'Calificación del profesor.',
  `evaluacion` text DEFAULT NULL COMMENT 'Evaluación del profesor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Actividad_Modulo_Tarea`
--


-- --------------------------------------------------------

CREATE TABLE `Actividad_Tarea` (
  `id_actividad` int(10) UNSIGNED NOT NULL,
  `id_tarea` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estructura de tabla para la tabla `Alumno`
--

CREATE TABLE `Alumno` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_curso` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Alumno`
--

INSERT INTO `Alumno` (`id`, `id_curso`) VALUES
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(106, 1),
(118, 1),
(99, 2),
(107, 2),
(108, 2),
(109, 2),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(116, 2),
(119, 3),
(120, 3),
(121, 3),
(122, 3),
(123, 3),
(124, 3),
(125, 3),
(105, 4),
(126, 4),
(127, 4),
(128, 4),
(129, 4),
(130, 4),
(131, 4),
(132, 4),
(133, 4),
(134, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Calificacion`
--

CREATE TABLE `Calificacion` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(256) DEFAULT NULL,
  `valor` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Valores de la calificación de la empresa';

--
-- Volcado de datos para la tabla `Calificacion`
--

INSERT INTO `Calificacion` (`id`, `titulo`, `valor`, `descripcion`) VALUES
(1, 'Óptima', 8, NULL),
(2, 'Buena', 6, NULL),
(3, 'Aceptable', 5, NULL),
(4, 'Mejorable', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Curso`
--

CREATE TABLE `Curso` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(256) DEFAULT NULL,
  `titulo` varchar(256) DEFAULT NULL,
  `grado` enum('Grado Superior','Grado Medio') DEFAULT NULL,
  `id_profesor` int(10) UNSIGNED DEFAULT NULL COMMENT 'Coordinador del curso',
  `color_fondo` varchar(256) DEFAULT '#0000FF',
  `color_letra` varchar(256) DEFAULT '#FFFFFF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Curso`
--

INSERT INTO `Curso` (`id`, `codigo`, `titulo`, `grado`, `id_profesor`, `color_fondo`, `color_letra`) VALUES
(1, '2MI', 'Mecatrónica Industrial', 'Grado Superior', 5, '#0000FF', '#FFFFFF'),
(2, '2EMV', 'Electromecánica de Vehículos', 'Grado Medio', 6, '#00FF00', '#FFFFFF'),
(3, '2ME', 'Mantenimiento Electromecánico', 'Grado Medio', 9, '#FF3344', '#FFFFFF'),
(4, '1MI', 'Mecatrónica Industrial', 'Grado Superior', 5, '#0000FF', '#FFFFFF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Curso_Modulo`
--

CREATE TABLE `Curso_Modulo` (
  `id_curso` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Curso_Modulo`
--

INSERT INTO `Curso_Modulo` (`id_curso`, `id_modulo`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(3, 15),
(3, 16),
(3, 17),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Dualex`
--

CREATE TABLE `Dualex` (
  `parametro` varchar(256) NOT NULL,
  `valor` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Dualex`
--

INSERT INTO `Dualex` (`parametro`, `valor`) VALUES
('versión', '2.0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Log`
--

CREATE TABLE `Log` (
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` varchar(256) DEFAULT NULL,
  `controlador` varchar(256) DEFAULT NULL,
  `metodo` varchar(256) DEFAULT NULL,
  `pathParams` text DEFAULT NULL,
  `queryParams` text DEFAULT NULL,
  `body` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Log`
--

-- --------------------------------------------------------

CREATE TABLE `Modulo` (
  `id` int(10) UNSIGNED NOT NULL,
  `orden` int(10) UNSIGNED DEFAULT NULL COMMENT 'Orden en el que aparecerán en el informe',
  `codigo` varchar(256) DEFAULT NULL,
  `titulo` varchar(256) DEFAULT NULL,
  `color_fondo` varchar(256) DEFAULT '#0000FF',
  `color_letra` varchar(256) DEFAULT '#FFFFFF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
--
-- Estructura de tabla para la tabla `Modulo_Profesor`
--

CREATE TABLE `Modulo_Profesor` (
  `id_modulo` int(10) UNSIGNED NOT NULL,
  `id_profesor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Modulo_Profesor`
--

INSERT INTO `Modulo_Profesor` (`id_modulo`, `id_profesor`) VALUES
(1, 1),
(1, 5),
(1, 98),
(2, 1),
(2, 5),
(3, 2),
(3, 3),
(3, 5),
(3, 10),
(4, 4),
(4, 5),
(5, 2),
(5, 3),
(5, 5),
(5, 10),
(6, 1),
(6, 5),
(7, 3),
(7, 5),
(7, 10),
(8, 6),
(9, 6),
(10, 6),
(11, 7),
(11, 8),
(12, 4),
(12, 7),
(13, 8),
(14, 8),
(15, 8),
(15, 9),
(16, 3),
(16, 10),
(17, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Periodo`
--

CREATE TABLE `Periodo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(256) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Fechas de los periodos de evaluación';

--
-- Volcado de datos para la tabla `Periodo`
--

INSERT INTO `Periodo` (`id`, `nombre`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'Periodo 1', '2022-09-01', '2022-12-31'),
(2, 'Periodo 2', '2023-01-01', '2023-03-23'),
(3, 'Periodo 3', '2023-03-24', '2023-06-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Profesor`
--

CREATE TABLE `Profesor` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Profesor`
--

INSERT INTO `Profesor` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(98);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tarea`
--

CREATE TABLE `Tarea` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_alumno` int(10) UNSIGNED DEFAULT NULL,
  `titulo` varchar(256) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date DEFAULT NULL COMMENT 'Fecha de realización de la tarea',
  `id_calificacion_empresa` int(10) UNSIGNED DEFAULT NULL COMMENT 'Calificación del tutor de empresa',
  `comentario_calificacion_empresa` text DEFAULT NULL,
  `calificacion_v1` int(10) UNSIGNED DEFAULT NULL COMMENT 'Calificación del profesor.',
  `evaluacion_v1` text DEFAULT NULL COMMENT 'Evaluación del profesor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Tarea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(256) DEFAULT NULL,
  `apellidos` varchar(256) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`id`, `nombre`, `apellidos`, `email`) VALUES
(1, 'Antonio', 'Portero Flores', 'aportero@fundacionloyola.es'),
(2, 'Diego', 'Camisón', 'dcamison@fundacionloyola.es'),
(3, 'Manuel', 'Molano Elías', 'mmolano@fundacionloyola.es'),
(4, 'Antonio', 'Sánchez Díaz', 'asanchez@fundacionloyola.es'),
(5, 'Pedro', 'Risco Aguilera', 'prisco@fundacionloyola.es'),
(6, 'José Antonio', 'Hernández Masero', 'jhernandez@fundacionloyola.es'),
(7, 'Tamara', 'Mora Carreño', 'tmora@fundacionloyola.es'),
(8, 'Mariano', 'Fuentes Morato', 'mfuentes@fundacionloyola.es'),
(9, 'Bonifacio', 'Durán López', 'bduran@fundacionloyola.es'),
(10, 'David', 'Cancho Franco', 'dcancho@fundacionloyola.es'),
(98, 'Miguel', 'Jaque Barbero', 'mjaque@fundacionloyola.es'),
(99, 'Alumno1', 'Pruebas', 'alumno1.guadalupe@alumnado.fundacionloyola.net'),
(100, 'Carmen', 'Díaz Mellado', 'carmendiazmellado.guadalupe@alumnado.fundacionloyola.net'),
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
(116, 'Mario', 'Torres Ruíz', 'mariotorresruiz.guadalupe@alumnado.fundacionloyola.net'),
(118, 'Alfredo', 'Elías Segador', 'aeliassegador.guadalupe@alumnado.fundacionloyola.net'),
(119, 'Alejandro', 'Aparicio María', 'alejandroapariciomaria.guadalupe@alumnado.fundacionloyola.net'),
(120, 'Fernando Rubén', 'Díaz Cama', 'Fernandorubendiazcama.guadalupe@alumnado.fundacionloyola.net'),
(121, 'José Ramón', 'Guerrero Rodríguez', 'joseramonguerrerorodriguez.guadalupe@alumnado.fundacionloyola.net'),
(122, 'Adrián', 'Lara Núñez', 'alaranuñez.guadalupe@alumnado.fundacionloyola.net'),
(123, 'Ivo Miguel', 'Martín Meseiro', 'Ivomiguelmartinsmeseiro.guadalupe@alumnado.fundacionloyola.net'),
(124, 'Kevin Giancarlo', 'Porcel Hinojosa', 'kevingiancarloporcelhinojosa.guadalupe@alumnado.fundacionloyola.net'),
(125, 'Severiano', 'Trinidad Hernández', 'strinidadhernandez.guadalupe@alumnado.fundaciónloyola.net'),
(126, 'Julian', 'Fagundez Barrena', 'jfagundezbarrena.guadalupe@alumnado.fundacionloyola.net'),
(127, 'Joan', 'Simón Boza Cadavid', 'joansimonbozacadavid.guadalupe@alumnado.fundacionloyola.net'),
(128, 'José', 'Marcelo Quispe', 'josemarceloquispesanabria.guadalupe@alumnado.fundacionloyola.net'),
(129, 'Mario', 'Baselga Lozano', 'mariobaselgalozano.guadalupe@alumnado.fundacionloyola.net'),
(130, 'Adrián', 'Martín Rodríguez', 'amartinrodriguez.guadalupe@alumnado.fundacionloyola.net'),
(131, 'Pedro Pablo', 'Sánchez Rosa', 'pedropablosanchezrosa.guadalupe@alumnado.fundacionloyola.net'),
(132, 'Carlos', 'Plaza Nevado', 'cplazanevado.guadalupe@alumnado.fundacionloyola.net'),
(133, 'Ángel', 'Sierra Núñez', 'asierranunez.guadalupe@alumnado.fundacionloyola.net'),
(134, 'Ariel', 'Sosa Campos', 'asosaocampos.guadalupe@alumnado.fundacionloyola.net');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Actividad`
--
ALTER TABLE `Actividad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Actividad_Curso`
--
ALTER TABLE `Actividad_Curso`
  ADD PRIMARY KEY (`id_actividad`,`id_curso`),
  ADD UNIQUE KEY `id_curso_uq` (`id_curso`,`orden`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `Actividad_Modulo`
--
ALTER TABLE `Actividad_Modulo`
  ADD PRIMARY KEY (`id_actividad`,`id_modulo`),
  ADD KEY `id_modulo` (`id_actividad`,`id_modulo`),
  ADD KEY `Actividad_Modulo_ibfk_2` (`id_modulo`);

--
-- Indices de la tabla `Actividad_Modulo_Tarea`
--
ALTER TABLE `Actividad_Modulo_Tarea`
  ADD PRIMARY KEY (`id_actividad`,`id_modulo`,`id_tarea`),
  ADD KEY `id_actividad` (`id_actividad`,`id_tarea`);

-- Indices de la tabla `Actividad_Tarea`
--
ALTER TABLE `Actividad_Tarea`
  ADD PRIMARY KEY (`id_actividad`,`id_tarea`),
  ADD KEY `id_tarea` (`id_tarea`);

--
--
-- Indices de la tabla `Alumno`
--
ALTER TABLE `Alumno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `Calificacion`
--
ALTER TABLE `Calificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Curso`
--
ALTER TABLE `Curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `Curso_Modulo`
--
ALTER TABLE `Curso_Modulo`
  ADD PRIMARY KEY (`id_curso`,`id_modulo`),
  ADD KEY `Curso_Modulo_ibfk_2` (`id_modulo`);

--
-- Indices de la tabla `Dualex`
--
ALTER TABLE `Dualex`
  ADD PRIMARY KEY (`parametro`);

--
-- Indices de la tabla `Modulo`
--
ALTER TABLE `Modulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Modulo_Profesor`
--
ALTER TABLE `Modulo_Profesor`
  ADD PRIMARY KEY (`id_modulo`,`id_profesor`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `Periodo`
--
ALTER TABLE `Periodo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Profesor`
--
ALTER TABLE `Profesor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Tarea`
--
ALTER TABLE `Tarea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_calificacion_empresa` (`id_calificacion_empresa`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Actividad`
--
ALTER TABLE `Actividad`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `Alumno`
--
ALTER TABLE `Alumno`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT de la tabla `Calificacion`
--
ALTER TABLE `Calificacion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Curso`
--
ALTER TABLE `Curso`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Modulo`
--
ALTER TABLE `Modulo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `Profesor`
--
ALTER TABLE `Profesor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT de la tabla `Tarea`
--
ALTER TABLE `Tarea`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=581;

--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Actividad_Curso`
--
ALTER TABLE `Actividad_Curso`
  ADD CONSTRAINT `Actividad_Curso_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `Actividad` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Actividad_Curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `Curso` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Actividad_Modulo`
--
ALTER TABLE `Actividad_Modulo`
  ADD CONSTRAINT `Actividad_Modulo_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `Actividad` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Actividad_Modulo_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `Modulo` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Actividad_Modulo_Tarea`
--
ALTER TABLE `Actividad_Modulo_Tarea`
  ADD CONSTRAINT `Actividad_Modulo_Tarea_ibfk_1` FOREIGN KEY (`id_actividad`,`id_tarea`) REFERENCES `Actividad_Tarea` (`id_actividad`, `id_tarea`) ON DELETE CASCADE,
  ADD CONSTRAINT `Actividad_Modulo_Tarea_ibfk_2` FOREIGN KEY (`id_actividad`,`id_modulo`) REFERENCES `Actividad_Modulo` (`id_actividad`, `id_modulo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Actividad_Tarea`
--
ALTER TABLE `Actividad_Tarea`
  ADD CONSTRAINT `Actividad_Tarea_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `Actividad` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Actividad_Tarea_ibfk_2` FOREIGN KEY (`id_tarea`) REFERENCES `Tarea` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Alumno`
--
ALTER TABLE `Alumno`
  ADD CONSTRAINT `Alumno_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Alumno_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `Curso` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Curso`
--
ALTER TABLE `Curso`
  ADD CONSTRAINT `Curso_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `Profesor` (`id`);

--
-- Filtros para la tabla `Curso_Modulo`
--
ALTER TABLE `Curso_Modulo`
  ADD CONSTRAINT `Curso_Modulo_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `Curso` (`id`),
  ADD CONSTRAINT `Curso_Modulo_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `Modulo` (`id`);

--
-- Filtros para la tabla `Modulo_Profesor`
--
ALTER TABLE `Modulo_Profesor`
  ADD CONSTRAINT `Modulo_Profesor_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `Modulo` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Modulo_Profesor_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `Profesor` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Profesor`
--
ALTER TABLE `Profesor`
  ADD CONSTRAINT `Profesor_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Tarea`
--
ALTER TABLE `Tarea`
  ADD CONSTRAINT `Tarea_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `Alumno` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Tarea_ibfk_2` FOREIGN KEY (`id_calificacion_empresa`) REFERENCES `Calificacion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
