<?php
	/**
		DAO de Informe.
		Objeto para el acceso a los datos relacionados con los informes de evaluación.
	**/

class DAOInforme{
	/**
		Devuelve un array de tareas de un alumno.
		@param $idAlumno Identificador del alumno.
		@param $idProfesor Identificador del profesor.
		@return Un array de arrays con los datos de cada tarea.
	**/
	public static function verInforme($idAlumno, $idProfesor){
		$sql	= 'SELECT Tarea.id AS id, Tarea.titulo AS titulo, Tarea.descripcion AS descripcion, Tarea.fecha ';
		$sql .= ', Tarea.id_calificacion_empresa, Tarea.comentario_calificacion_empresa, Tarea.calificacion, Tarea.evaluacion ';
		$sql .= ', Calificacion.titulo AS calificacion_empresa ';
		$sql .= ', Actividad.id AS id_actividad, Actividad.titulo AS actividad_titulo, Actividad.descripcion AS actividad_descripcion';
		$sql .= ', Modulo.id AS id_modulo, Modulo.codigo, Modulo.titulo AS modulo_titulo, Modulo.color_fondo, Modulo.color_letra, Modulo.icono ';
		$sql .= 'FROM Tarea ';
		$sql .= 'JOIN Alumno ON Alumno.id = Tarea.id_alumno ';
		$sql .= 'LEFT JOIN Calificacion ON Calificacion.id = Tarea.id_calificacion_empresa ';
		$sql .= 'LEFT JOIN Actividad_Tarea ON Actividad_Tarea.id_tarea = Tarea.id ';
		$sql .= 'LEFT JOIN Actividad ON Actividad_Tarea.id_actividad = Actividad.id ';
		$sql .= 'LEFT JOIN Actividad_Modulo ON Actividad_Modulo.id_actividad = Actividad.id ';
		$sql .= 'LEFT JOIN Modulo ON Modulo.id = Actividad_Modulo.id_modulo ';
		$sql .= 'LEFT JOIN Alumno_Modulo ON Modulo.id = Alumno_Modulo.id_modulo AND Alumno_Modulo.id_alumno = :id_alumno1 ';
		$sql .= 'WHERE Alumno.id = :id_alumno2 ';
		$sql .= 'ORDER BY Actividad.titulo, Tarea.titulo ';
		
		$params = array('id_alumno1' => $idAlumno, 'id_alumno2' => $idAlumno);

		return BD::seleccionar($sql, $params);
	}
}
