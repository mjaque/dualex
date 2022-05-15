<?php
  /**
    DAO de Alumno.
    Objeto para el acceso a los datos relacionados con los alumnos.
  **/

class DAOAlumno{
  /**
    Devuelve un array de alumnos de un profesor.
    @param $id_profesor Identificador del profesor.
    @return Un array de arrays con los datos de cada alumno.
  **/
  public static function verAlumnosPorProfesor($id_profesor){
    $sql  = 'SELECT Usuario.id, Usuario.nombre, Usuario.apellidos, Usuario.email ';
	$sql .= ', Modulo.codigo, Modulo.titulo, Modulo.color_fondo, Modulo.color_letra, Modulo.icono ';
	$sql .= 'FROM Usuario ';
	$sql .= 'JOIN Alumno ON Usuario.id = Alumno.id ';
	$sql .= 'JOIN Alumno_Modulo ON Alumno_Modulo.id_alumno = Alumno.id ';
	$sql .= 'JOIN Modulo_Profesor ON Modulo_Profesor.id_modulo = Alumno_Modulo.id_modulo ';
	$sql .= 'JOIN Modulo ON Modulo.id = Modulo_Profesor.id_modulo ';
	$sql .= 'WHERE Modulo_Profesor.id_profesor = :id_profesor ';
	$sql .= 'ORDER BY Usuario.apellidos, Usuario.nombre ';
	 
    $params = array('id_profesor' => $id_profesor);

    return BD::seleccionar($sql, $params);
  }
}
