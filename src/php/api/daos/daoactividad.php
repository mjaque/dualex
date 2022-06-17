<?php
  /**
    DAO de Actividad.
    Objeto para el acceso a los datos relacionados con las actividades.
  **/

class DAOActividad{
  /**
    Devuelve un array de actividades.
    @return Un array de arrays con los datos de cada actividad.
  **/
  public static function verActividades(){
    $sql  = 'SELECT id, titulo, descripcion FROM Actividad ORDER BY titulo';
    
	$params = array();

    return BD::seleccionar($sql, $params);
  }
}
