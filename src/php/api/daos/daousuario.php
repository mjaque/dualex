<?php
	/**
		DAO de Usuario.
		Objeto para el acceso a los datos relacionados con usuarios.
	**/

require_once('./modelos/usuario.php');


class DAOUsuario{
	/**
		Consulta la base de datos para autenticar al usuario y devolver sus datos.
		@param $email Email del usuario.
		@param $clave Clave del usuario.
		@return {Usuario} Devuelve los datos del usuario o false si no existe el usuario.
	**/
	public static function autenticar($email, $clave){
		$usuario = new Usuario();
		$usuario->email = $email;

		$sql = 'SELECT Alumno.id, Usuario.nombre, Usuario.apellidos FROM Alumno JOIN Usuario ON Usuario.id = Alumno.id WHERE email = :email AND clave = SHA2(:clave, 256)	';
		$params = array('email' => $email, 'clave' => $clave);
		$resultado = BD::seleccionar($sql, $params);
		if (count($resultado) == 1){
			$usuario->id = $resultado[0]['id'];
			$usuario->nombre = $resultado[0]['nombre'];
			$usuario->apellidos = $resultado[0]['apellidos'];
			$usuario->rol = 'alumno';
		}
		else{
			$sql = 'SELECT Profesor.id, Usuario.nombre, Usuario.apellidos FROM Profesor JOIN Usuario ON Usuario.id = Profesor.id WHERE email = :email AND clave = SHA2(:clave, 256)	';
			$params = array('email' => $email, 'clave' => $clave);
			$resultado = BD::seleccionar($sql, $params);
			if (count($resultado) == 1){
				$usuario->id = $resultado[0]['id'];
				$usuario->nombre = $resultado[0]['nombre'];
				$usuario->apellidos = $resultado[0]['apellidos'];
				$usuario->rol = 'profesor';
			}
		else
			$usuario = false;
		}

		return $usuario;
	}
}
