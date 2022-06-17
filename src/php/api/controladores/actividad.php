<?php
/**
	Controlador de actividades.
**/
require_once('./daos/daoactividad.php');

class Actividad{
	/**
		Devuelve la lista de actividades.
		@param $pathParams {Array} Array de parámetros.
		@param $queryParams {Array} Array de parámetros. Array con el identificador del alumno.
		@param $usuario {Usuario} Usuario que realiza la petición.
		@return {Array[Actividad]}
	**/
	function get($pathParams, $queryParams, $usuario){
		$resultado = DAOActividad::verActividades();
		//Adaptación del Resultado
		$json = json_encode($resultado);
		header('Content-type: application/json; charset=utf-8');
		header('HTTP/1.1 200 OK');
		echo $json;
		die();
	}
}
