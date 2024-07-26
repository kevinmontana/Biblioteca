<?php 
/*
informacion general
Se requiere archivo de conexion con la clase de php
*/
require_once '../cx.php';
$consultar=new conector_pg; // instancio la clase que usare
if (isset($_GET['id_padre_deweyfk'])) {
	$id_padre_deweyfk=$_GET['id_padre_deweyfk'];
	$query="select * from tbl_master_dewey where id_deweyfk=$id_padre_deweyfk order by str_codigo_dewey"; 
	$consultar=$consultar->consultar($query); 
	if (pg_num_rows($consultar)>0) { 
		$array = array();
		$DatosUsuario=pg_fetch_all($consultar);
		for ($i=0; $i < count($DatosUsuario); $i++) { 
			$arrayName = array(
				'id' => $DatosUsuario[$i]['id'],
				'str_nombre_seccion' => $DatosUsuario[$i]['str_nombre_seccion'],
				'id_deweyfk' => $DatosUsuario[$i]['id_deweyfk'],
				'str_codigo_dewey' => $DatosUsuario[$i]['str_codigo_dewey'],
			);
			array_push($array,$arrayName);
		}
		echo json_encode($array);
	}
}
if (isset($_GET['id_hijo_deweyfk'])) {
	$id_hijo_deweyfk=$_GET['id_hijo_deweyfk'];
	$query="select * from tbl_master_dewey where id_deweyfk=$id_hijo_deweyfk order by str_codigo_dewey"; 
	$consultar=$consultar->consultar($query); 
	if (pg_num_rows($consultar)>0) { 
		$array = array();
		$DatosUsuario=pg_fetch_all($consultar);
		for ($i=0; $i < count($DatosUsuario); $i++) { 
			$arrayName = array(
				'id' => $DatosUsuario[$i]['id'],
				'str_nombre_seccion' => $DatosUsuario[$i]['str_nombre_seccion'],
				'id_deweyfk' => $DatosUsuario[$i]['id_deweyfk'],
				'str_codigo_dewey' => $DatosUsuario[$i]['str_codigo_dewey'],
			);
			array_push($array,$arrayName);
		}
		echo json_encode($array);
	}
}
?>