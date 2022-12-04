-- Modificación para incluir calificaciones de tarea por módulo
CREATE TABLE Actividad_Tarea(
	id_actividad INT UNSIGNED,
	id_tarea INT UNSIGNED,
	PRIMARY KEY (id_actividad, id_tarea),
	FOREIGN KEY (id_actividad) REFERENCES Actividad (id) ON DELETE CASCADE,
	FOREIGN KEY (id_tarea) REFERENCES Tarea (id) ON DELETE CASCADE
);

ALTER TABLE Tarea DROP COLUMN calificacion;
ALTER TABLE Tarea DROP COLUMN evaluacion;


