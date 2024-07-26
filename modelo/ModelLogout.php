<?php 
session_start();
session_unset(); 

$respuesta = array('tipo'=>'success','msj'=>"Salio del sistema",'url'=>'../index.php',"controlador"=>"msj");

echo $respuesta=json_encode($respuesta); //muestra el mensaje
?>