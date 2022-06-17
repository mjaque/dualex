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
				if (count($resultado) > 0)
					$resultado = $this->agruparModulos($resultado);
				//El resultado tiene una fila por alumno y módulo. Debemos agruparlo.
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
		Inserta una nueva tarea en la base de datos
		@param $pathParams {Array} Array de parámetros.
		@param $queryParams {Array} Array de parámetros.
		@param $tarea {Tarea} Datos de la tarea a insertar.
		@param $usuario {Usuario} Usuario que realiza la petición.
	**/
	function post($pathParams, $queryParams, $tarea, $usuario){
    	$id = DAOTarea::insertar($tarea, $usuario);
    	//Respuesta a un POST
    	header('HTTP/1.1 201 Created');
    	$localizacion = '/tarea/'.$id; //Localización del nuevo recurso
    	echo $localizacion;
    	die();
  	}
//TODO: Refactorizar con controlador.alumno.
	/**
		Procesa un array de tareas x módulo para unificar los módulos en un array.
		Espera que los elementos iguales sean contiguos.
		@params $tareas {[Tareas]} Array de tareas con una fila por módulo de la tarea.
		@return {[Tareas]} Array de tareas con un campo de array que agrupa todos sus módulos.
	**/
	function agruparModulos($elementos){
		if (count($elementos) == 0) return [];
		
		$resultado = [];
		$elementos[0]['modulos'] = [$this->verModulo($elementos[0])];
		array_push($resultado, $elementos[0]);
		for($i = 1; $i < count($elementos); $i++){
			//Si es igual que el actual, añadimos el módulo al elemento actual
			if ($elementos[$i]['id'] == $resultado[count($resultado) - 1]['id'])
				array_push($resultado[count($resultado) -1]['modulos'], $this->verModulo($elementos[$i]));
			else{
				$elementos[$i]['modulos'] = [$this->verModulo($elementos[$i])];
				array_push($resultado, $elementos[$i]);
			}
		}
		return $resultado;
	}
	/**
		Devuelve el módulo de un elemento.
		@param $elemento {Elemento} Elemento con información de módulo.
		@return {Modulo} Módulo del elemento.
	**/
	function verModulo($elemento){
		$modulo = [];
		$modulo['codigo'] = $elemento['codigo'];
		$modulo['titulo'] = $elemento['titulo'];
		$modulo['color_fondo'] = $elemento['color_fondo'];
		$modulo['color_letra'] = $elemento['color_letra'];
		$modulo['icono'] = $elemento['icono'];
		return $modulo;
	}
}
