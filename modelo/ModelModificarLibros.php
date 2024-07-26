<?php 
/*
informacion general
Se requiere archivo de conexion con la clase de php
*/
require_once '../cx.php';
$consultar=new conector_pg; // instancio la clase que usare
$libro_id=$_POST['id'];
$str_cota=$_POST['str_cota'];
$str_coha_notis=$_POST['str_coha_notis'];
$str_titulo=$_POST['str_titulo'];
$str_autor_nombre=$_POST['str_autor_nombre'];
$str_autor_apellido=$_POST['str_autor_apellido'];
$str_edicion_reimpresion=$_POST['str_edicion_reimpresion'];
$str_pais_ciudad=$_POST['str_pais_ciudad'];
$str_editorial=$_POST['str_editorial'];
$dtm_anho=$_POST['dtm_anho'];
$int_n_paginas=$_POST['int_n_paginas'];
$str_isbn=$_POST['str_isbn'];
$int_ejemplare=$_POST['int_ejemplare'];
$id_hijo_deweyfk=$_POST['id_hijo_deweyfk'];
$id_padre_deweyfk=$_POST['id_padre_deweyfk'];
if (isset($_POST['id_salafk'])) {
	$id_salafk=$_POST['id_salafk'];
}else{
	$id_salafk='';
}
if (isset($_POST['id_generoinfantil'])) {
	$id_generoinfantil=$_POST['id_generoinfantil'];
}else{
	$id_generoinfantil='';
}
$msj='';
$msj=$msj.'<ul style="margin-left:-30px;">';
$error=0;
if ($str_cota=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar el cota del libro</li>';
	$error=1;
}
if ($str_coha_notis=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar el coha o notis del libro</li>';
	$error=1;
}
if ($str_titulo=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar el titulo del libro</li>';
	$error=1;
}
if ($str_autor_nombre=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar el nombre de autor del libro</li>';
	$error=1;
}
if ($str_autor_apellido=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar el apellido de autor del libro</li>';
	$error=1;
}
if ($str_edicion_reimpresion=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar edición/re-impresión del libro</li>';
	$error=1;
}
if ($str_pais_ciudad=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar País/Ciudad del libro</li>';
	$error=1;
}
if ($str_editorial=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar editorial del libro</li>';
	$error=1;
}
if ($dtm_anho=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar año del libro</li>';
	$error=1;
}
if (strlen($dtm_anho)>4) {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar año del libro Ejemplo:1996</li>';
	$error=1;
}
if ($int_n_paginas=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar el N° de paginas del libro</li>';
	$error=1;
}
if ($str_isbn=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar el ISBN del libro</li>';
	$error=1;
}
if ($str_isbn=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe ingresar el N° de ejemplares del libro</li>';
	$error=1;
}
if ($id_salafk=='') {
	$msj=$msj.'<li style="margin-bottom:5px">Debe seleccionar el genero del libro</li>';
	$error=1;
}
if ($id_salafk==3) {
	if ($id_generoinfantil=='') {
		$msj=$msj.'<li style="margin-bottom:5px">Debe seleccionar el genero infantil o adolecente del libro</li>';
		$error=1;
	}
}
$msj=$msj.'</ul>';
//verificar si existe el libro
$query="SELECT * FROM tbl_libro WHERE  id = $libro_id;";
$libro = $consultar->consultar($query);
if (pg_num_rows($libro)>0) { 
	$libro = pg_fetch_all($libro);
	$libro = $libro['0']; 
}else{
	$msj=$msj.'<li style="margin-bottom:5px">El libro no existe</li>';
	$error=1;
}

if ($error==0) {
	$query="UPDATE
	tbl_libro
	SET
	str_cota='$str_cota',
	str_coha_notis='$str_coha_notis',
	str_titulo='$str_titulo',
	str_autor_nombre='$str_autor_nombre',
	str_autor_apellido='$str_autor_apellido',
	str_edicion_reimpresion='$str_edicion_reimpresion',
	str_pais_ciudad='$str_pais_ciudad',
	str_editorial='$str_editorial',
	dtm_anho='$dtm_anho',
	int_n_paginas='$int_n_paginas',
	str_isbn='$str_isbn',
	int_ejemplare='$int_ejemplare',
	id_hijo_deweyfk='$id_hijo_deweyfk',
	id_padre_deweyfk='$id_padre_deweyfk',
	id_salafk='$id_salafk'
	WHERE
	id='$_POST[id]';";
	$consultar->consultar($query);
}else{
	$respuesta = array('tipo'=>'warning','msj'=>"$msj",'url'=>'',"controlador"=>"msj");
	echo $respuesta=json_encode($respuesta); //muestra el mensaje
	exit();
}
//validar si es sala infantil sino elimina la relacion

if($libro['id_salafk']!=3){
	$query="DELETE FROM tbl_infantil_libro WHERE id_librofk='$libro[id]'";
	$consultar->consultar($query);
}

if ($id_salafk==3) {
	$query="DELETE FROM tbl_infantil_libro WHERE id_librofk='$libro[id]'";
	$consultar->consultar($query);
	$query2="INSERT INTO tbl_infantil_libro (id_librofk, id_generoinfantil)
	VALUES ($libro_id,$id_generoinfantil);"; 
	$Salainfantil=$consultar->consultar($query2); 
}

$respuesta = array('tipo'=>'success','msj'=>"Se Actualizo el Libro",'url'=>'',"controlador"=>"msj","modificarlibro"=>"true");
	echo $respuesta=json_encode($respuesta); //muestra el mensaje

?>