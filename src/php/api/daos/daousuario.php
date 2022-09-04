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

		$sql  = 'SELECT Alumno.id, Alumno.id_ciclo, Usuario.nombre, Usuario.apellidos, Ciclo.titulo as ciclo ';
		$sql .= 'FROM Alumno ';
		$sql .= 'JOIN Usuario ON Usuario.id = Alumno.id ';
		$sql .= 'JOIN Ciclo ON Alumno.id_ciclo = Ciclo.id  ';
		$sql .= 'WHERE email = :email';

		$params = array('email' => $email);

		$resultado = BD::seleccionar($sql, $params);
		if (count($resultado) == 1){
			$usuario->id = $resultado[0]['id'];
			$usuario->rol = 'alumno';
			$usuario->nombre = $resultado[0]['nombre'];
			$usuario->apellidos = $resultado[0]['apellidos'];
			$usuario->idCiclo = $resultado[0]['id_ciclo'];
			$usuario->ciclo = $resultado[0]['ciclo'];
		}
		else{
			$sql = 'SELECT Profesor.id, Usuario.nombre, Usuario.apellidos FROM Profesor JOIN Usuario ON Usuario.id = Profesor.id WHERE email = :email';
			$params = array('email' => $email);
			$resultado = BD::seleccionar($sql, $params);
			if (count($resultado) == 1){
				$usuario->id = $resultado[0]['id'];
				$usuario->rol = 'profesor';
				$usuario->nombre = $resultado[0]['nombre'];
				$usuario->apellidos = $resultado[0]['apellidos'];
			}
		else
			$usuario = false;
		}

		return $usuario;
	}
}
