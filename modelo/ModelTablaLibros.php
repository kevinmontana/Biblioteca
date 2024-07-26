<?php 
/*
informacion general
Se requiere archivo de conexion con la clase de php
*/
require_once '../cx.php';
$consultar=new conector_pg; // instancio la clase que usare
if (isset($_GET['general'])) {
	$general=$_GET['general'];
	$query="select 
	a.id ,
	str_cota ,
	str_coha_notis ,
	str_titulo ,
	str_autor_nombre ,
	str_autor_apellido ,
	str_edicion_reimpresion ,
	str_pais_ciudad ,
	str_editorial ,
	int_n_paginas ,
	str_isbn,
	int_ejemplare ,
	dtm_anho ,
	b.str_nombre_seccion as padre_deweyfk,
	c.str_nombre_seccion as hijo_deweyfk,
	d.str_sala
	from tbl_libro as a 
	join tbl_sala as d on a.id_salafk=d.id
	join tbl_master_dewey as b on a.id_padre_deweyfk=b.id
	join tbl_master_dewey as c on a.id_hijo_deweyfk=c.id
	where id_salafk in (1,2);"; 
	$consultar=$consultar->consultar($query); 
	if (pg_num_rows($consultar)>0) { 
		$array = array();
		$DatosUsuario=pg_fetch_all($consultar);
		for ($i=0; $i < count($DatosUsuario); $i++) { 
			$arrayName = array(
				'id' => $DatosUsuario[$i]['id'],
				'str_cota' => $DatosUsuario[$i]['str_cota'],
				'str_coha_notis' => $DatosUsuario[$i]['str_coha_notis'],
				'str_titulo' => $DatosUsuario[$i]['str_titulo'],
				'str_autor_nombre' => $DatosUsuario[$i]['str_autor_nombre'],
				'str_autor_apellido' => $DatosUsuario[$i]['str_autor_apellido'],
				'str_edicion_reimpresion' => $DatosUsuario[$i]['str_edicion_reimpresion'],
				'str_pais_ciudad' => $DatosUsuario[$i]['str_pais_ciudad'],
				'str_editorial' => $DatosUsuario[$i]['str_editorial'],
				'int_n_paginas' => $DatosUsuario[$i]['int_n_paginas'],
				'str_isbn' => $DatosUsuario[$i]['str_isbn'],
				'int_ejemplare' => $DatosUsuario[$i]['int_ejemplare'],
				'str_sala' => $DatosUsuario[$i]['str_sala'],
				'dtm_anho' => $DatosUsuario[$i]['dtm_anho'],
				'padre_deweyfk' => $DatosUsuario[$i]['padre_deweyfk'],
				'hijo_deweyfk' => $DatosUsuario[$i]['hijo_deweyfk']
			);
			array_push($array,$arrayName);
		}
		echo json_encode($array);
	}
}
if (isset($_GET['infantil'])) {
	$infantil=$_GET['infantil'];
	$query="select 
	a.id ,
	str_cota ,
	str_coha_notis ,
	str_titulo ,
	str_autor_nombre ,
	str_autor_apellido ,
	str_edicion_reimpresion ,
	str_pais_ciudad ,
	str_editorial ,
	int_n_paginas ,
	str_isbn,
	int_ejemplare ,
	dtm_anho ,
	f.str_nombre_seccion as padre_deweyfk,
	g.str_nombre_seccion as hijo_deweyfk,
	d.str_sala,
	c.str_nombre as genero_infantil from tbl_libro as a 
	join tbl_infantil_libro as b on b.id_librofk=a.id 
	join tbl_infantil as c on c.id=b.id_generoinfantil
	join tbl_sala as d on a.id_salafk=d.id
	join tbl_master_dewey as f on a.id_padre_deweyfk=f.id
	join tbl_master_dewey as g on a.id_hijo_deweyfk=g.id
	where id_salafk=$infantil
	;"; 
	$consultar=$consultar->consultar($query); 
	if (pg_num_rows($consultar)>0) { 
		$array = array();
		$DatosUsuario=pg_fetch_all($consultar);
		for ($i=0; $i < count($DatosUsuario); $i++) { 
			$arrayName = array(
				'id' => $DatosUsuario[$i]['id'],
				'str_cota' => $DatosUsuario[$i]['str_cota'],
				'str_coha_notis' => $DatosUsuario[$i]['str_coha_notis'],
				'str_titulo' => $DatosUsuario[$i]['str_titulo'],
				'str_autor_nombre' => $DatosUsuario[$i]['str_autor_nombre'],
				'str_autor_apellido' => $DatosUsuario[$i]['str_autor_apellido'],
				'str_edicion_reimpresion' => $DatosUsuario[$i]['str_edicion_reimpresion'],
				'str_pais_ciudad' => $DatosUsuario[$i]['str_pais_ciudad'],
				'str_editorial' => $DatosUsuario[$i]['str_editorial'],
				'int_n_paginas' => $DatosUsuario[$i]['int_n_paginas'],
				'str_isbn' => $DatosUsuario[$i]['str_isbn'],
				'int_ejemplare' => $DatosUsuario[$i]['int_ejemplare'],
				'str_sala' => $DatosUsuario[$i]['str_sala'],
				'dtm_anho' => $DatosUsuario[$i]['dtm_anho'],
				'genero_infantil' => $DatosUsuario[$i]['genero_infantil'],
				'padre_deweyfk' => $DatosUsuario[$i]['padre_deweyfk'],
				'hijo_deweyfk' => $DatosUsuario[$i]['hijo_deweyfk']
			);
			array_push($array,$arrayName);
		}
		echo json_encode($array);
	}
}
if (isset($_GET['n'])) {
	$query="SELECT count(d.str_sala) as n,d.str_sala, d.id
	FROM public.tbl_libro as a
	join tbl_sala as d on a.id_salafk=d.id
	GROUP BY d.str_sala,d.id;
	"; 
	$consultar=$consultar->consultar($query); 
	if (pg_num_rows($consultar)>0) { 
		$array = array();
		$DatosUsuario=pg_fetch_all($consultar);
		for ($i=0; $i < count($DatosUsuario); $i++) { 
			$arrayName = array(
				'n' => $DatosUsuario[$i]['n'],
				'str_sala' => $DatosUsuario[$i]['str_sala'],
				'id' => $DatosUsuario[$i]['id'],
			);
			array_push($array,$arrayName);
		}
		echo json_encode($array);
	}
}
?>