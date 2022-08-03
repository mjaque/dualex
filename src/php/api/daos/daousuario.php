<?php
	/**
		DAO de Usuario.
		Objeto para el acceso a los datos relacionados con usuarios.
	**/

require_once('./modelos/usuario.php');


class DAOUsuario{
	/**
		Consulta la base de datos para autenticar al usuario y devolver sus datos.
		El email ha sido autenticado por Google.
		@param $email Email del usuario.
		@return {Usuario} Devuelve los datos del usuario o false si no existe el usuario.
	**/
	public static function autenticar($email){
		$usuario = new Usuario();
		$usuario->email = $email;

		$sql = 'SELECT Alumno.id FROM Alumno JOIN Usuario ON Usuario.id = Alumno.id WHERE email = :email';
		$params = array('email' => $email);
		$resultado = BD::seleccionar($sql, $params);
		if (count($resultado) == 1){
			$usuario->id = $resultado[0]['id'];
			$usuario->rol = 'alumno';
		}
		else{
			$sql = 'SELECT Profesor.id FROM Profesor JOIN Usuario ON Usuario.id = Profesor.id WHERE email = :email';
			$params = array('email' => $email);
			$resultado = BD::seleccionar($sql, $params);
			if (count($resultado) == 1){
				$usuario->id = $resultado[0]['id'];
				$usuario->rol = 'profesor';
			}
		else
			$usuario = false;
		}

		return $usuario;
	}
}
