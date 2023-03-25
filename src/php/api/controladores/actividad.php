<?php
/**
	Controlador de Actividades
**/
require_once('./daos/daoactividad.php');

class Actividad{
	/**
		Devuelve la lista de actividades de un ciclo.
		@param $pathParams {Array} Array de parámetros con el identificador del ciclo.
		@param $queryParams {Array} Array de parámetros. No se utiliza.
		@param $usuario {Usuario} Usuario que realiza la petición.
		@return {Array[Array[String]]}
	**/
	function get($pathParams, $queryParams, $usuario){
		$idCurso = $pathParams[0];
		$resultado = DAOActividad::ver($idCurso);
		$json = json_encode($resultado);
		header('Content-type: application/json; charset=utf-8');
		header('HTTP/1.1 200 OK');
		echo $json;
		die();
	}
}
