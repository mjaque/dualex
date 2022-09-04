<?php
	/**
		DAO de Actividad.
		Objeto para el acceso a los datos relacionados con las actividades.
	**/

class DAOActividad{
	/**
		Devuelve un array de actividades de un ciclo ordenadas.
		@return Un array de arrays con los datos de cada actividad.
	**/
	public static function ver($idCiclo){
		$sql  = 'SELECT Actividad.id, Actividad.id_ciclo, Actividad.orden, Actividad.titulo, Actividad.descripcion ';
		$sql .= 'FROM Actividad ';
		$sql .= 'WHERE Actividad.id_ciclo = :id_ciclo ';
		$sql .= 'ORDER BY Actividad.id_ciclo ASC ';
		
		$params = array('id_ciclo' => $idCiclo);

		return BD::seleccionar($sql, $params);
	}
}
