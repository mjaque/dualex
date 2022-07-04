<?php
	/**
		DAO de Tarea.
		Objeto para el acceso a los datos relacionados con las tareas.
	**/

class DAOTarea{
	/**
		Devuelve un array de tareas de un alumno.
		@param $idAlumno Identificador del alumno.
		@return Un array de arrays con los datos de cada tarea.
	**/
	public static function verTareasDeAlumno($idAlumno){
		$sql	= 'SELECT Tarea.id AS id, Tarea.titulo AS titulo, Tarea.descripcion AS descripcion, Tarea.fecha ';
		$sql .= ', Tarea.id_calificacion_empresa, Tarea.comentario_calificacion_empresa, Tarea.calificacion, Tarea.evaluacion ';
		$sql .= ', Calificacion.titulo AS calificacion_empresa ';
		$sql .= ', Actividad.id AS id_actividad, Actividad.titulo AS actividad_titulo, Actividad.descripcion AS actividad_descripcion';
		$sql .= ', Modulo.id AS id_modulo, Modulo.codigo, Modulo.titulo AS modulo_titulo, Modulo.color_fondo, Modulo.color_letra, Modulo.icono ';
		$sql .= 'FROM Tarea ';
		$sql .= 'JOIN Alumno ON Alumno.id = Tarea.id_alumno ';
		$sql .= 'LEFT JOIN Calificacion ON Calificacion.id = Tarea.id_calificacion_empresa ';
		$sql .= 'LEFT JOIN Actividad_Tarea ON Actividad_Tarea.id_tarea = Tarea.id ';
		$sql .= 'LEFT JOIN Actividad ON Actividad_Tarea.id_actividad = Actividad.id ';
		$sql .= 'LEFT JOIN Actividad_Modulo ON Actividad_Modulo.id_actividad = Actividad.id ';
		$sql .= 'LEFT JOIN Modulo ON Modulo.id = Actividad_Modulo.id_modulo ';
		$sql .= 'LEFT JOIN Alumno_Modulo ON Modulo.id = Alumno_Modulo.id_modulo AND Alumno_Modulo.id_alumno = :id_alumno1 ';
		$sql .= 'WHERE Alumno.id = :id_alumno2 ';
		$sql .= 'ORDER BY Actividad.titulo, Tarea.titulo ';
		
		$params = array('id_alumno1' => $idAlumno, 'id_alumno2' => $idAlumno);

		return BD::seleccionar($sql, $params);
	}
	/**
		Devuelve una tarea de un alumno.
		@param $idTarea Identificador de la tarea solicitada.
		@param $idAlumno Identificador del alumno.
		@return Un array de arrays con los datos de cada tarea.
	**/
	public static function verTareaDeAlumno($idTarea, $idAlumno){
		$sql	= 'SELECT Tarea.id AS id, Tarea.titulo AS titulo, Tarea.descripcion AS descripcion, Tarea.fecha ';
		$sql .= ', Tarea.id_calificacion_empresa, Tarea.comentario_calificacion_empresa, Tarea.calificacion, Tarea.evaluacion ';
		$sql .= ', Calificacion.titulo AS calificacion_empresa ';
		$sql .= ', Actividad.id AS id_actividad, Actividad.titulo AS actividad_titulo, Actividad.descripcion AS actividad_descripcion';
		$sql .= ', Modulo.id AS id_modulo, Modulo.codigo, Modulo.titulo AS modulo_titulo, Modulo.color_fondo, Modulo.color_letra, Modulo.icono ';
		$sql .= 'FROM Tarea ';
		$sql .= 'LEFT JOIN Calificacion ON Calificacion.id = Tarea.id_calificacion_empresa ';
		$sql .= 'LEFT JOIN Actividad_Tarea ON Actividad_Tarea.id_tarea = Tarea.id ';
		$sql .= 'LEFT JOIN Actividad ON Actividad_Tarea.id_actividad = Actividad.id ';
		$sql .= 'LEFT JOIN Actividad_Modulo ON Actividad_Modulo.id_actividad = Actividad.id ';
		$sql .= 'LEFT JOIN Modulo ON Modulo.id = Actividad_Modulo.id_modulo ';
		$sql .= 'WHERE Tarea.id_alumno = :id_alumno AND Tarea.id = :id_tarea ';
		$sql .= 'ORDER BY Actividad.titulo, Tarea.titulo ';
		
		$params = array('id_alumno' => $idAlumno, 'id_tarea' => $idTarea);

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
		$sql  = 'SELECT Tarea.id AS id, Tarea.titulo AS titulo, Tarea.descripcion AS descripcion, Tarea.fecha ';
		$sql .= ', Tarea.id_calificacion_empresa, Tarea.comentario_calificacion_empresa, Tarea.calificacion, Tarea.evaluacion ';
		$sql .= ', Calificacion.titulo AS calificacion_empresa ';
		$sql .= ', Actividad.id AS id_actividad, Actividad.titulo AS actividad_titulo, Actividad.descripcion AS actividad_descripcion';
		$sql .= ', Modulo.id AS id_modulo, Modulo.codigo, Modulo.titulo AS modulo_titulo, Modulo.color_fondo, Modulo.color_letra, Modulo.icono ';
		$sql .= 'FROM Tarea ';
		$sql .= 'JOIN Alumno ON Alumno.id = Tarea.id_alumno ';
		$sql .= 'LEFT JOIN Calificacion ON Calificacion.id = Tarea.id_calificacion_empresa ';
		$sql .= 'LEFT JOIN Actividad_Tarea ON Actividad_Tarea.id_tarea = Tarea.id ';
		$sql .= 'LEFT JOIN Actividad ON Actividad_Tarea.id_actividad = Actividad.id ';
		$sql .= 'LEFT JOIN Actividad_Modulo ON Actividad_Modulo.id_actividad = Actividad.id ';
		$sql .= 'LEFT JOIN Modulo ON Modulo.id = Actividad_Modulo.id_modulo ';
		$sql .= 'LEFT JOIN Modulo_Profesor ON Modulo.id = Modulo_Profesor.id_modulo ';
		$sql .= 'WHERE Alumno.id = :id_alumno ';
		$sql .= 'AND Modulo_Profesor.id_profesor = :id_profesor ';
		$sql .= 'ORDER BY Actividad.titulo, Tarea.titulo ';

		$params = array('id_alumno' => $id_alumno, 'id_profesor' => $id_profesor);

		return BD::seleccionar($sql, $params);
	}
	/**
		Inserta una nueva tarea.
		@param tarea {Tarea} Datos de la tarea a insertar.
		@param usuario {Usuario} Datos del usuario loggeado.
		@return id {Integer} Identificador de la tarea insertada.
	**/
	public static function insertar($tarea, $usuario){
		if (!BD::iniciarTransaccion())
			throw new Exception('No es posible iniciar la transacción.');
		$sql = 'INSERT INTO Tarea (id_alumno, titulo, descripcion , fecha, id_calificacion_empresa, comentario_calificacion_empresa) ';
		$sql .= 'VALUES (:id_alumno, :titulo, :descripcion, :fecha, :idCalificacionEmpresa, :comentarioCalificacionEmpresa)';
		
		$params = array('id_alumno' => $usuario->id, 'titulo'=>$tarea->titulo, 'descripcion'=>$tarea->descripcion, 'fecha'=>$tarea->fecha, 'idCalificacionEmpresa'=>$tarea->idCalificacionEmpresa, 'comentarioCalificacionEmpresa'=>$tarea->comentarioCalificacionEmpresa);

		$idNuevo = BD::insertar($sql, $params);

		if (count($tarea->actividades) > 0){
			$sql = 'INSERT INTO Actividad_Tarea (id_actividad, id_tarea) VALUES ';
			$values = array();
			for ($i = 0; $i < count($tarea->actividades); $i++)
				array_push($values, '('.$tarea->actividades[$i].', '.$idNuevo.')');
			$sql .= join(",", $values);
//echo $sql;
			BD::insertar($sql);
		}

		if (!BD::commit())
			throw new Exception('No se pudo confirmar la transacción.');
	}
	/**
		Modificación de tarea por alumno.
		Condiciones: la tarea tiene que pertenceder al alumno y no puede tener calificación ni de empresa ni del profesor.
		@param tarea {Tarea} Datos de la tarea a modificar.
		@param usuario {Usuario} Datos del usuario loggeado.
	**/
	public static function modificar($tarea, $usuario){
		if (!BD::iniciarTransaccion())
			throw new Exception('No es posible iniciar la transacción.');
		$sql = 'UPDATE Tarea SET titulo = :titulo, descripcion = :descripcion , fecha = :fecha, id_calificacion_empresa = :idCalificacionEmpresa, ';
		$sql .= 'comentario_calificacion_empresa = :comentarioCalificacionEmpresa ';
		$sql .= 'WHERE Tarea.id = :id AND Tarea.id_alumno = :idAlumno AND Tarea.id_calificacion_empresa IS NULL AND Tarea.calificacion IS NULL AND Tarea.evaluacion IS NULL';
		
		$params = array('id'=>$tarea->id, 'titulo'=>$tarea->titulo, 'descripcion'=>$tarea->descripcion, 'fecha'=>$tarea->fecha, 'idCalificacionEmpresa'=>$tarea->idCalificacionEmpresa, 'comentarioCalificacionEmpresa'=>$tarea->comentarioCalificacionEmpresa, 'idAlumno'=>$usuario->id);

		$idNuevo = BD::actualizar($sql, $params);

		//Borramos sus actividades
		$sql = 'DELETE FROM Actividad_Tarea WHERE id_tarea = :id AND id_tarea IN (SELECT id FROM Tarea WHERE Tarea.id_alumno = :idAlumno)';
		$params = array('id' => $tarea->id, 'idAlumno' => $usuario->id);
		BD::borrar($sql, $params);

		//Las volvemos a insertar
		if (count($tarea->actividades) > 0){
			$sql = 'INSERT INTO Actividad_Tarea (id_actividad, id_tarea) VALUES ';
			$values = array();
			for ($i = 0; $i < count($tarea->actividades); $i++)
				array_push($values, '('.$tarea->actividades[$i].', '.$tarea->id.')');

			$sql .= join(",", $values);

			BD::insertar($sql);
		}

		if (!BD::commit())
			throw new Exception('No se pudo confirmar la transacción.');
	}
	/**
		Borrado de tarea por alumno.
		Condiciones: la tarea tiene que pertenceder al alumno y no puede tener calificación ni de empresa ni del profesor.
		@param idTarea {Number} Identificador de la tarea a eliminar.
		@param usuario {Usuario} Datos del usuario loggeado.
	**/
	public static function borrar($idTarea, $usuario){
		$sql = 'DELETE FROM Tarea ';
		$sql .= 'WHERE Tarea.id = :id AND Tarea.id_alumno = :idAlumno AND Tarea.id_calificacion_empresa IS NULL AND Tarea.calificacion IS NULL AND Tarea.evaluacion IS NULL';
		
		$params = array('id'=>$idTarea, 'idAlumno'=>$usuario->id);

		$idNuevo = BD::borrar($sql, $params);
	}
}
