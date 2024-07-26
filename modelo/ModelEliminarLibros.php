<?php 
/*
informacion general
Se requiere archivo de conexion con la clase de php
*/
require_once '../cx.php';
$consultar=new conector_pg; // instancio la clase que usare
$id=$_POST['id'];

if ($id!='') {
	//eliminar relacion tbl_infantil_libro
	$query="DELETE FROM tbl_infantil_libro WHERE id_librofk='$id'";
	$consultar->consultar($query);
	$query="DELETE FROM tbl_libro WHERE id='$id'";
	$consultar->consultar($query); 
	$respuesta = array('tipo'=>'success','msj'=>"Se ha eliminado el Libro",'url'=>'',"controlador"=>"msj","estado"=>"Eliminar", "id"=>$id);
echo $respuesta=json_encode($respuesta); //muestra el mensaje
}else{
	$respuesta = array('tipo'=>'warning','msj'=>"Verifique los datos",'url'=>'',"controlador"=>"msj");

echo $respuesta=json_encode($respuesta); //muestra el mensaje
}




?>