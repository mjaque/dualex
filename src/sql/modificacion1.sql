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


INSERT INTO Actividad_Modulo_Tarea (id_actividad, id_modulo, id_tarea) 
SELECT Actividad_Modulo.id_actividad, Actividad_Modulo.id_modulo, Tarea.id AS id_tarea
FROM Tarea
JOIN Actividad_Tarea ON Tarea.id = Actividad_Tarea.id_tarea
JOIN Actividad_Modulo ON Actividad_Tarea.id_actividad = Actividad_Modulo.id_actividad  
ORDER BY `id_tarea`  ASC

SELECT Tarea.id AS id_tarea
FROM Tarea
JOIN Actividad_Tarea ON Tarea.id = Actividad_Tarea.id_tarea
JOIN Actividad_Modulo ON Actividad_Tarea.id_actividad = Actividad_Modulo.id_actividad  
GROUP BY(Tarea.id)
HAVING COUNT(Actividad_Modulo.id_modulo) = 1

