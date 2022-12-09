-- Modificación para incluir calificaciones de tarea por módulo
DROP TABLE IF EXISTS Actividad_Modulo_Tarea;
CREATE TABLE Actividad_Modulo_Tarea(
	id_actividad INT UNSIGNED COMMENT 'Cualquier actividad del módulo relacionada con la tarea',
	id_modulo INT UNSIGNED,
	id_tarea INT UNSIGNED,
	calificacion INT UNSIGNED COMMENT 'Calificación del profesor.',
	evaluacion TEXT COMMENT 'Evaluación del profesor',
	PRIMARY KEY (id_actividad, id_modulo, id_tarea),
	FOREIGN KEY (id_actividad, id_tarea) REFERENCES Actividad_Tarea (id_actividad, id_tarea) ON DELETE CASCADE,
	FOREIGN KEY (id_actividad, id_modulo) REFERENCES Actividad_Modulo (id_actividad, id_modulo) ON DELETE CASCADE
);


ALTER TABLE Tarea DROP COLUMN calificacion;
ALTER TABLE Tarea DROP COLUMN evaluacion;


