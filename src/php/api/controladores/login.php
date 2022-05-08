<?php
/**
  Controlador de autenticación.
**/
class Login{
  //Se configura por inyección de dependencias
  public static $clave = null;
  public static $algoritmo_encriptacion = null;
  public static $iv = 'PantUfl45--;jeu$';

  /**
    Autentifica al usuario con el email y la clave.
    Devuelve por HTTP el objeto usuario en formato JSON.
    @param $login Un objeto con los atributos email y clave.
  **/
  function post($login){
    require_once('./daos/daousuario.php');
    $usuario = DAOUsuario::autenticar($login->email, $login->clave);
    if (!$usuario){
      header('HTTP/1.1 401 Unauthorized');
      die();
    }

    $usuario->autorizacion = openssl_encrypt(json_encode($usuario), self::$algoritmo_encriptacion, self::$clave, 0, self::$iv);
    //print_r(openssl_get_cipher_methods()); //Muestra los algoritmos de encriptación disponibles

    header('HTTP/1.1 200 OK');
    echo json_encode($usuario);
    die();
  }

  /**
    Desencripta un mensaje.
    @param {String} $mensaje El texto del mensaje a desencriptar.
    @return {String} Texto del mensaje desencriptado o false si no se pudo desencriptar.
  **/
  public static function desencriptar($mensaje) {
      return openssl_decrypt($mensaje, self::$algoritmo_encriptacion, self::$clave, 0, self::$iv);
  }
}
