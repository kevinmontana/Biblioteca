<?php 
/*
 informacion general
Se requiere archivo de conexion con la clase de php
*/
require_once '../cx.php';
// print_r($_POST);
if (isset($_POST['usuario'],$_POST['contrasena'])) { // se precunta si las variables existe estan definidas
	if ($_POST['usuario']!='d41d8cd98f00b204e9800998ecf8427e' && $_POST['contrasena']!='e19a015f2e0e2f61c061e02f4364bbfe') { // pregunto si las variables estan vacias
		$usuario=$_POST['usuario'];
		$contrasena=$_POST['contrasena'];
		$consultar=new conector_pg; // instancio la clase que usare
		$query="select md5(str_nombre_usuario),str_clave_usuario,id,str_nombre from tbl_usuario_biblioteca where str_md5='$usuario' and str_clave_usuario='$contrasena';"; // creacion de query para la consulta si existe el usuario
		$consultar=$consultar->consultar($query); // ejecuto el query
		if (pg_num_rows($consultar)>0) { // si es mayor a 0 es por que si existe el dato
			$DatosUsuario=pg_fetch_array($consultar); // transformo la consulta en un arreglo
			session_start(); // inicio la variables de sesion
			if ($usuario==$DatosUsuario[0] AND $contrasena==$DatosUsuario[1]) {
			$_SESSION['id']=$DatosUsuario[2]; // posision 0 es id
			$_SESSION['usuario']=$DatosUsuario[3]; // posision 1 es name del usuario
			$respuesta = array('tipo'=>'success','msj'=>"Ingreso al sistema",'url'=>'',"controlador"=>"msj");
			echo $respuesta=json_encode($respuesta); //muestra el mensaje
		}
		else{
		$respuesta = array('tipo'=>'warning','msj'=>"Usuario o Contraseña incorrecto",'url'=>'',"controlador"=>"msj");

			echo $respuesta=json_encode($respuesta); //muestra el mensaje
		}
	}else{
		$respuesta = array('tipo'=>'warning','msj'=>"Usuario o Contraseña incorrecto",'url'=>'',"controlador"=>"msj");

			echo $respuesta=json_encode($respuesta); //muestra el mensaje
		}
	}
	else{
		$respuesta = array('tipo'=>'info','msj'=>"Datos Vacios",'url'=>'',"controlador"=>"msj");

		echo $respuesta=json_encode($respuesta); //muestra el mensaje
	}
}
?>
