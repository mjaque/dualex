<?php
  /**
    DAO de Calificación.
    Objeto para el acceso a los datos relacionados con las calificaciones.
  **/

class DAOCalificacion{
  /**
    Devuelve un array de calificaciones.
    @return Un array de arrays con los datos de cada calificacion.
  **/
  public static function verCalificaciones(){
    $sql  = 'SELECT id, titulo, descripcion FROM Calificacion ORDER BY id';
    
	$params = array();

    return BD::seleccionar($sql, $params);
  }
}
