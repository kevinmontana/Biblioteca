<?php
require_once('../cx.php');
$nombre=$_POST['nombre'];
$estado=$_POST['estado'];
$fecha=date('Y-m-d H:i:s');
if (!empty($nombre)) {
//INSERT INTO clientes(nombre, fecha, estado) VALUES ('asdasd','2018-10-04 14:47:23','0')
	$sql="INSERT INTO clientes(nombre, fecha, estado) VALUES ('$nombre','$fecha','$estado')";

	mysqli_query($con,$sql);

	$respuesta = array('tipo'=>'success','msj'=>"Se registro un cliente",'url'=>'index.php',"controlador"=>"msj");

	echo $respuesta=json_encode($respuesta);

}else{
	$respuesta = array('tipo'=>'warning','msj'=>"Debe colocar un nombre",'url'=>'',"controlador"=>"msj");

	echo $respuesta=json_encode($respuesta);
}

?>

