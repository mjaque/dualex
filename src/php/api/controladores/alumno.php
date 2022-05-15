<?php
/**
	Controlador de alumnos.
**/
require_once('./daos/daoalumno.php');

class Alumno{
	/**
		Devuelve la lista de alumnos.
		Si recibe un parámetro con el valor 'profesor', devuelve la lista de alumnos que cursan módulos impartidos por el profesor.
		@param $params {Array} Array de parámetros.
		@param $usuario {Usuario} Profesor del que se quieren conocer los alumnos.
		@return {Array[Usuario]}
	**/
	function get($params, $usuario){
	switch(count($params)){
		case 1:
			if ($params[0] == 'profesor'){
				if ($usuario->rol != 'profesor'){
							header('HTTP/1.1 401 Unauthorized');
							die();
				}
				$resultado = DAOAlumno::verAlumnosPorProfesor($usuario->id);
				if (count($resultado) > 0)
					$resultado = $this->agruparModulos($resultado);
				//El resultado tiene una fila por alumno y módulo. Debemos agruparlo.
				
			}
			else{
						$id = $params[0];
				die("No implementado.");
			}
			break;
		default:
			die("No implementado.");
	}
		//Adaptación del Resultado
		$json = json_encode($resultado);

		header('HTTP/1.1 200 OK');
		echo $json;
		die();
	}
	/**
		Procesa un array de alumnos x módulo para unificar los módulos en un array.
		@param $alumnos {[Alumnos]} Array de alumnos con una fila por módulo del alumno.
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
	/**
		Devuelve el módulo de un alumno.
		@param $alumno {Alumno} Alumno con información de módulo.
		@return {Modulo} Módulo del alumno.
	**/
	function verModuloAlumno($alumno){
		$modulo = [];
		$modulo['codigo'] = $alumno['codigo'];
		$modulo['titulo'] = $alumno['titulo'];
		$modulo['color_fondo'] = $alumno['color_fondo'];
		$modulo['color_letra'] = $alumno['color_letra'];
		$modulo['icono'] = $alumno['icono'];
		return $modulo;
	}
}
