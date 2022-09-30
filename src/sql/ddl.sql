SET foreign_key_checks = 0;

DROP TABLE IF EXISTS Dualex;
CREATE TABLE Dualex(
	parametro VARCHAR(256) PRIMARY KEY,
	valor VARCHAR(256)
);
INSERT INTO Dualex VALUES('versión', '1.0');

DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(256),
	apellidos VARCHAR(256),
	email VARCHAR(256) UNIQUE
);

DROP TABLE IF EXISTS Alumno;
CREATE TABLE Alumno(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	id_ciclo INT UNSIGNED,
	FOREIGN KEY (id) REFERENCES Usuario (id) ON DELETE CASCADE,
	FOREIGN KEY (id_ciclo) REFERENCES Ciclo (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Profesor;
CREATE TABLE Profesor(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	FOREIGN KEY (id) REFERENCES Usuario (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Ciclo;
CREATE TABLE Ciclo(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	codigo VARCHAR(256),
	titulo VARCHAR(256),
	grado ENUM ('Grado Superior', 'Grado Medio'),
	id_profesor INT UNSIGNED COMMENT 'Coordinador del ciclo',
	color_fondo VARCHAR(256) DEFAULT '#0000FF',
	color_letra VARCHAR(256) DEFAULT '#FFFFFF',
	FOREIGN KEY (id_profesor) REFERENCES Profesor (id) ON DELETE RESTRICT
);

DROP TABLE IF EXISTS Modulo;
CREATE TABLE Modulo(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	id_ciclo INT UNSIGNED,
	orden INT UNSIGNED COMMENT 'Orden en el que aparecerán en el informe',
	codigo VARCHAR(256),
	titulo VARCHAR(256),
	color_fondo VARCHAR(256) DEFAULT '#0000FF',
	color_letra VARCHAR(256) DEFAULT '#FFFFFF',
	FOREIGN KEY (id_ciclo) REFERENCES Ciclo (id) ON DELETE CASCADE,
	UNIQUE INDEX (id_ciclo, orden)
);

DROP TABLE IF EXISTS Modulo_Profesor;
CREATE TABLE Modulo_Profesor(
	id_modulo INT UNSIGNED,
	id_profesor INT UNSIGNED,
	PRIMARY KEY (id_modulo, id_profesor),
	FOREIGN KEY (id_modulo) REFERENCES Modulo (id) ON DELETE CASCADE,
	FOREIGN KEY (id_profesor) REFERENCES Profesor (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Actividad;
CREATE TABLE Actividad(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	id_ciclo INT UNSIGNED,
	orden INT UNSIGNED COMMENT 'Orden en el que aparecerán en la app y el informe',
	titulo VARCHAR(1024),
	descripcion TEXT,
	FOREIGN KEY (id_ciclo) REFERENCES Ciclo (id) ON DELETE CASCADE,
	UNIQUE INDEX (id_ciclo, orden)
);

DROP TABLE IF EXISTS Actividad_Modulo;
CREATE TABLE Actividad_Modulo(
	id_actividad INT UNSIGNED,
	id_modulo INT UNSIGNED,
	PRIMARY KEY (id_actividad, id_modulo),
	FOREIGN KEY (id_actividad) REFERENCES Actividad (id) ON DELETE CASCADE,
	FOREIGN KEY (id_modulo) REFERENCES Modulo (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Calificacion;
CREATE TABLE Calificacion(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(256),
	valor INT NOT NULL,
	descripcion TEXT
)
COMMENT="Valores de la calificación de la empresa";

INSERT INTO Calificacion VALUES
(1, 'Óptima', 10, null), (2, 'Buena', 7, null), (3, 'Aceptable', 5, null), (4, 'Mejorable', 3, null);

DROP TABLE IF EXISTS Tarea;
CREATE TABLE Tarea(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	id_alumno INT UNSIGNED,
	titulo VARCHAR(256),
	descripcion TEXT,
	fecha DATE COMMENT 'Fecha de realización de la tarea',
	id_calificacion_empresa INT UNSIGNED COMMENT 'Calificación del tutor de empresa',
	comentario_calificacion_empresa TEXT,
	calificacion INT UNSIGNED COMMENT 'Calificación del profesor.',
	evaluacion TEXT COMMENT 'Evaluación del profesor',
	FOREIGN KEY (id_alumno) REFERENCES Alumno (id) ON DELETE CASCADE,
	FOREIGN KEY (id_calificacion_empresa) REFERENCES Calificacion (id) ON DELETE RESTRICT
);

DROP TABLE IF EXISTS Actividad_Tarea;
CREATE TABLE Actividad_Tarea(
	id_actividad INT UNSIGNED,
	id_tarea INT UNSIGNED,
	PRIMARY KEY (id_actividad, id_tarea),
	FOREIGN KEY (id_actividad) REFERENCES Actividad (id) ON DELETE CASCADE,
	FOREIGN KEY (id_tarea) REFERENCES Tarea (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Periodo;
CREATE TABLE Periodo(
	id INT PRIMARY KEY,
	nombre VARCHAR(256),
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL
)
COMMENT = 'Fechas de los periodos de evaluación';

DROP TABLE IF EXISTS Log;
CREATE TABLE Log(
	timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
	usuario VARCHAR(256),
	controlador VARCHAR(256),
	metodo VARCHAR(256),
	pathParams TEXT,
	queryParams TEXT,
	body TEXT
);

