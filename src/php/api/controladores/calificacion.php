<?php
/**
	Controlador de Calificaciones.
**/
//TODO: ¿Es posible hacer un controlador de POJOs?
require_once('./daos/daocalificacion.php');

class Calificacion{
	/**
		Devuelve la lista de calificaciones.
		@param $pathParams {Array} Array de parámetros.
		@param $queryParams {Array} Array de parámetros. Array con el identificador del alumno.
		@param $usuario {Usuario} Usuario que realiza la petición.
		@return {Array[Calificacion]}
	**/
	function get($pathParams, $queryParams, $usuario){
		$resultado = DAOCalificacion::verCalificaciones();
		//Adaptación del Resultado
		$json = json_encode($resultado);
		header('Content-type: application/json; charset=utf-8');
		header('HTTP/1.1 200 OK');
		echo $json;
		die();
	}
}
