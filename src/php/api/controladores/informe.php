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
		@param $queryParams {Array} Array de parámetros. Array con el identificador del alumno y el identificador del periodo.
		@param $usuario {Usuario} Usuario que realiza la petición.
		@return {Array} Datos del informe
	**/
	function get($pathParams, $queryParams, $usuario){
		if ($usuario->rol != 'profesor'){
      		header('HTTP/1.1 401 Unauthorized');
			die();
		}
		$resultado = [];
		$resultado['valoracion'] = DAOInforme::verValoracion($queryParams['id_alumno'], $queryParams['id_periodo'], $usuario->id);
		$resultado['evaluacion'] = DAOInforme::verEvaluacion($queryParams['id_alumno'], $queryParams['id_periodo'], $usuario->id);
		$resultado['periodo'] = DAOInforme::verPeriodo($queryParams['id_periodo'])[0]['nombre'];

		$json = json_encode($resultado);
		header('Content-type: application/json; charset=utf-8');
		header('HTTP/1.1 200 OK');
		echo $json;
		die();
	}
}
