<?php
  /**
    DAO de Alumno.
    Objeto para el acceso a los datos relacionados con los alumnos.
  **/

class DAOAlumno{
  /**
    Devuelve un array de alumnos de un profesor que tengan tareas registradas.
    @param $id_profesor Identificador del profesor.
    @return Un array de arrays con los datos de cada alumno.
  **/
  public static function verAlumnosPorProfesor($id_profesor){
    $sql  = 'SELECT Usuario.id, Usuario.nombre, Usuario.apellidos, Usuario.email ';
	$sql .= ', Ciclo.codigo, Ciclo.titulo, Ciclo.color_fondo, Ciclo.color_letra ';
	$sql .= 'FROM Usuario ';
	$sql .= 'JOIN Alumno ON Usuario.id = Alumno.id ';
	$sql .= 'JOIN Ciclo ON Alumno.id_ciclo = Ciclo.id '; 
	$sql .= 'WHERE Ciclo.id IN ( ';
	$sql .= 	'SELECT Modulo.id_ciclo FROM Modulo ';
	$sql .= 	'JOIN Modulo_Profesor ON Modulo.id = Modulo_Profesor.id_modulo ';
	$sql .= 	'WHERE Modulo_Profesor.id_profesor = :id_profesor) ';
	$sql .= 'AND Alumno.id IN (SELECT id_alumno FROM Tarea) ';
	$sql .= 'ORDER BY Ciclo.codigo, Usuario.apellidos, Usuario.nombre '; 

    $params = array('id_profesor' => $id_profesor);

    return BD::seleccionar($sql, $params);
  }
}
