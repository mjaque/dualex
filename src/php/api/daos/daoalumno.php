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
    $sql  = 'SELECT DISTINCT Usuario.id, Usuario.nombre, Usuario.apellidos, Usuario.email ';
	$sql .= ', Ciclo.codigo, Ciclo.titulo, Ciclo.color_fondo, Ciclo.color_letra ';
	$sql .= 'FROM Usuario ';
	$sql .= 'JOIN Alumno ON Usuario.id = Alumno.id ';
	$sql .= 'JOIN Ciclo ON Alumno.id_ciclo = Ciclo.id ';
	$sql .= 'JOIN Modulo ON Modulo.id_ciclo = Ciclo.id ';
	$sql .= 'JOIN Modulo_Profesor ON Modulo.id_ciclo = Ciclo.id '; 
	$sql .= 'JOIN Tarea ON Tarea.id_alumno = Alumno.id '; 
	$sql .= 'JOIN Actividad_Tarea ON Actividad_Tarea.id_tarea = Tarea.id ';
	$sql .= 'JOIN Actividad_Modulo ON Actividad_Modulo.id_actividad = Actividad_Tarea.id_actividad ';
	$sql .= 'WHERE ';
	$sql .= 'Actividad_Modulo.id_modulo = Modulo_Profesor.id_modulo ';
	$sql .= 'AND Modulo_Profesor.id_profesor = :id_profesor ';
	$sql .= 'ORDER BY Ciclo.codigo, Usuario.apellidos, Usuario.nombre '; 

    $params = array('id_profesor' => $id_profesor);

    return BD::seleccionar($sql, $params);
  }
}
