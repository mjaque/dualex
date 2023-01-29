<?php
	/**
		DAO de Actividad.
		Objeto para el acceso a los datos relacionados con las actividades.
	**/

class DAOActividad{
	/**
		Devuelve un array de actividades de un curso ordenadas.
		@return Un array de arrays con los datos de cada actividad.
	**/
	public static function ver($idCurso){
		$sql  = 'SELECT Actividad.id, Actividad_Curso.id_curso, Actividad_Curso.orden, Actividad.titulo, Actividad.descripcion ';
		$sql .= 'FROM Actividad ';
		$sql .= 'JOIN Actividad_Curso ON Actividad_Curso.id_actividad = Actividad.id ';
		$sql .= 'WHERE Actividad_Curso.id_curso = :id_curso ';
		$sql .= 'ORDER BY Actividad_Curso.id_curso ASC ';
		
		$params = array('id_curso' => $idCurso);

		return BD::seleccionar($sql, $params);
	}
}
