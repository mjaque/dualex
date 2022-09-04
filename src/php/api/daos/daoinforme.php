<?php
	/**
		DAO de Informe.
		Objeto para el acceso a los datos relacionados con los informes de evaluación.
	**/

class DAOInforme{
	/**
		Devuelve un array con las valoraciones del alumno en cada actividad.
		La valoración de cada actividad se calcula como la media entre la calificación de la empresa y la calificación del profesor de todas las tareas del periodo asociadas a la actividad.
		@param $idAlumno Identificador del alumno.
		@param $idPeriodo Identificador del periodo solicitado.
		@param $idProfesor Identificador del profesor.
		@return Un array de arrays con los datos de cada tarea.
	**/
	public static function verValoracion($idAlumno, $idPeriodo, $idProfesor){
		$sql  = 'SELECT CONCAT(Actividad.orden, ".-", Actividad.titulo) AS titulo, ';
		$sql .= 'ROUND(( ';
		$sql .= 'SELECT AVG((Tarea.calificacion + Calificacion.valor)/2) FROM Tarea '; 
		$sql .= 'JOIN Calificacion ON Tarea.id_calificacion_empresa = Calificacion.id ';
		$sql .= 'JOIN Actividad_Tarea ON Tarea.id = Actividad_Tarea.id_tarea ';
		$sql .= 'WHERE id_alumno = :id_alumno1 ';
		$sql .= 'AND Actividad_Tarea.id_actividad = Actividad.id ';
		$sql .= 'AND Tarea.fecha BETWEEN ';
		$sql .= '(SELECT fecha_inicio from Periodo WHERE id = :id_periodo1) AND ';
		$sql .= '(SELECT fecha_fin from Periodo WHERE id = :id_periodo2) ';
		$sql .= ')) as calificacion ';
		$sql .= 'FROM `Actividad` ';
		$sql .= 'WHERE Actividad.id_ciclo = ';
		$sql .= '(SELECT id_ciclo FROM Alumno WHERE Alumno.id = :id_alumno2) ';
		$sql .= 'ORDER BY Actividad.orden';

		$params = array('id_alumno1' => $idAlumno, 'id_alumno2' => $idAlumno, 'id_periodo1' => $idPeriodo, 'id_periodo2' => $idPeriodo);

		return BD::seleccionar($sql, $params);
	}
	/**
		Devuelve un array con las evaluaciones del alumno en cada módulo.
		La valoración de cada módulo se calcula como la media entre la calificación de la empresa y la calificación del profesor de todas las tareas del periodo asociadas a actividades que corresponden con el módulo.
		@param $idAlumno Identificador del alumno.
		@param $idPeriodo Identificador del periodo solicitado.
		@param $idProfesor Identificador del profesor.
		@return Un array de arrays con los datos de cada tarea.
	**/
	public static function verEvaluacion($idAlumno, $idPeriodo, $idProfesor){
		$sql  = 'SELECT CONCAT(Modulo.codigo, " - ", Modulo.titulo) AS titulo, ';
		$sql .= 'ROUND((SELECT AVG((Tarea.calificacion + Calificacion.valor)/2) FROM Tarea ';
 		$sql .= 'JOIN Calificacion ON Tarea.id_calificacion_empresa = Calificacion.id ';
 		$sql .= 'JOIN Actividad_Tarea ON Tarea.id = Actividad_Tarea.id_tarea ';
		$sql .= 'JOIN Actividad_Modulo ON Actividad_Tarea.id_actividad = Actividad_Modulo.id_actividad ';
		$sql .= 'WHERE id_alumno = :id_alumno1 ';
		$sql .= 'AND Actividad_Modulo.id_modulo = Modulo.id ';
		$sql .= 'AND Tarea.fecha BETWEEN ';
		$sql .= '(SELECT fecha_inicio from Periodo WHERE id = :id_periodo1) AND ';
		$sql .= '(SELECT fecha_fin from Periodo WHERE id = :id_periodo2) ';
		$sql .= 'GROUP BY id_modulo),1) AS calificacion ';
		$sql .= 'FROM Modulo ';
		$sql .= 'WHERE Modulo.id_ciclo = ';
		$sql .= '(SELECT id_ciclo FROM Alumno WHERE Alumno.id = :id_alumno2) ';
		$sql .= 'ORDER BY Modulo.orden ';

		$params = array('id_alumno1' => $idAlumno, 'id_alumno2' => $idAlumno, 'id_periodo1' => $idPeriodo, 'id_periodo2' => $idPeriodo);

		return BD::seleccionar($sql, $params);
	}
	/**
		Devuelve un array con el nombre del periodo indicado.
		@param $idPeriodo Identificador del periodo solicitado.
		@return Un array de arrays con el nombre del periodo.
	**/
	public static function verPeriodo($idPeriodo){
		$sql  = 'SELECT  nombre ';
		$sql .= 'FROM Periodo ';
		$sql .= 'WHERE id = :id_periodo ';

		$params = array('id_periodo' => $idPeriodo);

		return BD::seleccionar($sql, $params);
	}
}
