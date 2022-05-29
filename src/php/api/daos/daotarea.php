<?php
  /**
    DAO de Tarea.
    Objeto para el acceso a los datos relacionados con las tareas.
  **/

class DAOTarea{
  /**
    Devuelve un array de tareas de un alumno.
	@param $id_alumno Identificador del alumno.
    @return Un array de arrays con los datos de cada tarea.
  **/
  public static function verTareasDeAlumno($id_alumno){
    $sql  = 'SELECT Tarea.id AS id, Tarea.titulo AS titulo, Tarea.descripcion, Tarea.fecha ';
	$sql .= ', Tarea.comentario_calificacion_empresa, Tarea.calificacion, Tarea.evaluacion ';
	$sql .= ', Calificacion.titulo AS calificacion_empresa ';
	$sql .= ', Actividad.id AS id_actividad, Actividad.titulo AS actividad_titulo, Actividad.descripcion ';
	$sql .= ', Modulo.id AS id_modulo, Modulo.codigo, Modulo.titulo AS modulo_titulo, Modulo.color_fondo, Modulo.color_letra, Modulo.icono ';
	$sql .= 'FROM Tarea ';
	$sql .= 'JOIN Alumno ON Alumno.id = Tarea.id_alumno ';
	$sql .= 'LEFT JOIN Calificacion ON Calificacion.id = Tarea.id_calificacion_empresa ';
	$sql .= 'LEFT JOIN Actividad_Tarea ON Actividad_Tarea.id_tarea = Tarea.id ';
	$sql .= 'LEFT JOIN Actividad ON Actividad_Tarea.id_actividad = Actividad.id ';
	$sql .= 'LEFT JOIN Actividad_Modulo ON Actividad_Modulo.id_actividad = Actividad.id ';
	$sql .= 'LEFT JOIN Modulo ON Modulo.id = Actividad_Modulo.id_modulo ';
	$sql .= 'WHERE Alumno.id = :id_alumno ';
	$sql .= 'ORDER BY Actividad.titulo, Tarea.titulo ';
    
	$params = array('id_alumno' => $id_alumno);

    return BD::seleccionar($sql, $params);
  }
  /**
    Devuelve un array de tareas de un alumno.
	El alumno debe estar inscrito en algún módulo impartido por el profesor.
	@param $id_alumno Identificador del alumno.
    @param $id_profesor Identificador del profesor.
    @return Un array de arrays con los datos de cada tarea.
  **/
  public static function verTareasDeAlumnoComoProfesor($id_alumno, $id_profesor){
	//TODO 
    $params = array('id_profesor' => $id_profesor);

    return BD::seleccionar($sql, $params);
  }
}
