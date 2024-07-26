<?php 

class conector_pg
{
	private $host;
	private $bd;
	private $usuario;
	private $password;

	function conexion($host='127.0.0.1',$port='5432', $bd='biblioteca', $user='postgres', $pass='postgres')
	{
		$this->host=$host;
		$this->bd=$bd;
		$this->usuario=$user;
		$this->password=$pass; 
		$cx=pg_connect("host=$this->host port=$port dbname=$this->bd user=$this->usuario password=$this->password") or die("Error al conectar a la base de datos");
		return $cx;
	}

	function consultar ($consulta)
	{
		$conexion= new conector_pg;
		$conexion=$conexion->conexion();
		$query=pg_query($conexion,$consulta);
		if (!$query) echo $consulta;
		return $query;
	}
}


?>
