<?php
/**
	Controlador de informes.
**/
require_once('./daos/daoinforme.php');

class Informe{
	/**
		Devuelve los datos del informe de evaluación de un alumno.
		Solo los profesores que tienen asignado al alumno a uno de sus módulos pueden consultar el informe de evaluación.
		@param $pathParams {Array} Array de parámetros.
		@param $queryParams {Array} Array de parámetros. Array con el identificador del alumno.
		@param $usuario {Usuario} Usuario que realiza la petición.
		@return {Array} Datos del informe
	**/
	function get($pathParams, $queryParams, $usuario){
		DAOInforme::verInforme($queryParams['id_alumno']), $usuario->id);

		//Adaptación del Resultado
		//El resultado tiene una fila por tarea, actividad módulo. Debemos agruparlo.
		if (count($resultado) > 0)
			$resultado = $this->agruparPorModulosYActividades($resultado);
		$json = json_encode($resultado);
		header('Content-type: application/json; charset=utf-8');
		header('HTTP/1.1 200 OK');
		echo $json;
		die();
	}
}
