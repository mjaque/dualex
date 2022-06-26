<?php
	/**
		Fachada del backend de la aplicación.
		Su responsabilidad es procesar la petición HTTP para decidir a qué controlador llamar (routing).
		También identifica al usuario (autenticación).
		Es un interfaz RESTful (https://www.rfc-editor.org/rfc/rfc7231)
	**/
	
	//Cargamos la configuración
	$config = require_once('config.php');
	if ($config['debug']){
		ini_set('display_errors', 1);
		ini_set('display_startup_errors', 1);
		error_reporting(E_ALL);
	}

	try{
		require_once('./servicios/bd.php');

		//Inyección de dependencias
		BD::$host = $config['host'];
		BD::$bd = $config['bd'];
		BD::$usuario = $config['usuario'];
		BD::$clave = $config['clave'];

		//Peticiones especiales de depuración
		if ($config['debug']){
			if ($_SERVER['QUERY_STRING'] == 'cargarBDPruebas'){
				$salida = [];
				//Establecemos los locales
				$locale='es_ES.UTF-8';
				setlocale(LC_ALL,$locale);
				putenv('LC_ALL='.$locale);
				//echo exec('locale charmap');
				exec('mysql -u dualex --password=dualex dualex < ../../sql/datos_prueba.sql', $salida);
				die('Cargada BD Pruebas.');
			}
		}

		//Procesamos la petición para identificar el recurso solicitado
		$metodo = $_SERVER['REQUEST_METHOD'];
		$pathParams = explode('/', $_SERVER['PATH_INFO']);
		$queryParams = [];
		parse_str($_SERVER['QUERY_STRING'], $queryParams);
		$recurso = $pathParams[1];	//El primer elemento es la /.
		array_splice($pathParams, 0, 2);	//Quitamos la / y el recurso solicitado.
		//Procesamos los nulos
		for($i = 0; $i < count($pathParams); $i++)
			if ($pathParams[$i] == 'null')
				$pathParams[$i] = null;

		//Autenticación
		$usuario = null;
		require_once('./controladores/login.php');
		//Inyección de dependencias
		Login::$clave = $config['clave_encriptacion'];
		Login::$algoritmo_encriptacion = $config['algoritmo_encriptacion'];
		if(array_key_exists('Authorization', apache_request_headers())){
			$autorizacion = apache_request_headers()['Authorization'];
			if ($autorizacion != "null")
				$usuario = json_decode(Login::desencriptar($autorizacion));
		}

		//Routing
		$controlador = false;
		switch($recurso){
			case 'login':
				require_once('./controladores/login.php');
				$controlador = new Login();
				break;
			case 'alumno':
				require_once('./controladores/alumno.php');
				$controlador = new Alumno();
				break;
			case 'tarea':
				require_once('./controladores/tarea.php');
				$controlador = new Tarea();
				break;
			case 'actividad':
				require_once('./controladores/actividad.php');
				$controlador = new Actividad();
				break;
			case 'calificacion':
				require_once('./controladores/calificacion.php');
				$controlador = new Calificacion();
				break;
			default:
				header('HTTP/1.1 501 Not Implemented');
				die();
		}
		if ($controlador)
			switch($metodo){
					case 'GET':
						$controlador->get($pathParams, $queryParams, $usuario);
						die();
					case 'POST':
						$body = json_decode(file_get_contents('php://input'));
						$controlador->post($pathParams, $queryParams, $body, $usuario);
						die();
					case 'DELETE':
						$controlador->delete($pathParams, $queryParams, $usuario);
						die();
					case 'PUT':
						$body = json_decode(file_get_contents('php://input'));
						$controlador->put($pathParams, $queryParams, $body, $usuario);
						die();
					default:
						header('HTTP/1.1 501 Not Implemented');
						die();
			}
		else{
			header('HTTP/1.1 501 Not Implemented');
			die();
		}
	}catch(Throwable $excepcion){	//Throwable (interfaz) incluye Error y Exception
		header('HTTP/1.1 500 Internal Server Error');
		echo $excepcion;
		die();
	}
