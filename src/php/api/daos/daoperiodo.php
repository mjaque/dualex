<?php
  /**
    DAO de Periodo.
    Objeto para el acceso a los datos relacionados con los periodos.
  **/

class DAOPeriodo{
  /**
    Devuelve un array de periodos.
    @return Un array de arrays con los datos de cada periodo.
  **/
  public static function verPeriodos(){
    $sql  = 'SELECT id, nombre, fecha_inicio, fecha_fin FROM Periodo ORDER BY id';
    
	$params = array();

    return BD::seleccionar($sql, $params);
  }
}
