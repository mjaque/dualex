<?php
/**
	Controlador de tareas.
**/
require_once('./daos/daotarea.php');

class Tarea{
	/**
		Devuelve la lista de tareas.
		Si recibe el parámetro con el valor 'alumno', devuelve la lista de tareas del alumno.
		No está permitido que un alumno consulte las tareas de otro alumno. Un profesor solo puede consultar las tareas de sus alumnos.
		@param $pathParams {Array} Array de parámetros.
		@param $queryParams {Array} Array de parámetros. Array con el identificador del alumno.
		@param $usuario {Usuario} Usuario que realiza la petición.
		@return {Array[Usuario]}
	**/
	function get($pathParams, $queryParams, $usuario){
	switch(count($pathParams)){
		case 1:
			if ($pathParams[0] == 'alumno'){
				if (!array_key_exists('id', $queryParams)){
					header('HTTP/1.1 403 Forbidden');
					die();
				}
				if ($usuario->rol == 'profesor')
					$resultado = DAOTarea::verTareasDeAlumnoComoProfesor($queryParams['id'], $usuario->id);
				if ($usuario->rol == 'alumno')
					$resultado = DAOTarea::verTareasDeAlumno($usuario->id);
			}
			else{
				$id = $pathParams[0];
				die("No implementado.");
			}
			break;
		default:
			die("No implementado.");
	}
		//Adaptación del Resultado
		$json = json_encode($resultado);
		header('Content-type: application/json; charset=utf-8');
		header('HTTP/1.1 200 OK');
		echo $json;
		die();
	}
	/**
		Procesa un array de alumnos x módulo para unificar los módulos en un array.
		@params $alumnos {[Alumnos]} Array de alumnos con una fila por módulo del alumno.
		@return {[Alumno]} Array de alumnos con un campo de array que agrupa todos sus módulos.
	**/
	function agruparModulos($alumnos){
		if (count($alumnos) == 0) return [];
		
		$resultado = [];
		$alumnos[0]['modulos'] = [$this->verModuloAlumno($alumnos[0])];
		array_push($resultado, $alumnos[0]);
		for($i = 1; $i < count($alumnos); $i++){
			//Si es igual que el actual, añadimos el módulo al alumno actual
			if ($alumnos[$i]['id'] == $resultado[count($resultado) - 1]['id'])
				array_push($resultado[count($resultado) -1]['modulos'], $this->verModuloAlumno($alumnos[$i]));
			else{
				$alumnos[$i]['modulos'] = [$this->verModuloAlumno($alumnos[$i])];
				array_push($resultado, $alumnos[$i]);
			}
		}
		return $resultado;
	}
}
