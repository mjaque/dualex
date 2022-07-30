<?php
/**
	Controlador de Periodos.
**/
//TODO: ¿Es posible hacer un controlador de POJOs?
require_once('./daos/daoperiodo.php');

class Periodo{
	/**
		Devuelve la lista de periodos.
		@param $pathParams {Array} Array de parámetros.
		@param $queryParams {Array} Array de parámetros. Array con el identificador del alumno.
		@param $usuario {Usuario} Usuario que realiza la petición.
		@return {Array[Periodo]}
	**/
	function get($pathParams, $queryParams, $usuario){
		$resultado = DAOPeriodo::verPeriodos();
		//Adaptación del Resultado
		$json = json_encode($resultado);
		header('Content-type: application/json; charset=utf-8');
		header('HTTP/1.1 200 OK');
		echo $json;
		die();
	}
}
