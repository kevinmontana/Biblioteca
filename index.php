<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<?php 	
		session_start(); 
		if(isset($_SESSION['usuario'])){
			if (isset($_SESSION['route'])) {
				$_SESSION['route'] = $_SESSION['route'];
			}else{
				$_SESSION['route'] = 'biblioteca';
			}
		}else{
			$_SESSION['route'] = 'login';
		}
	?>
	<title>Biblioteca</title>
	<link rel="stylesheet" type="text/css" href="librerias/css/bibliotecanew.min.css">
	<link rel="stylesheet" type="text/css" href="librerias/css/bibliotecanew2.min.css" >
	<link rel="stylesheet" type="text/css" href="librerias/css/all.min.css"> 
	<link rel="stylesheet" type="text/css" href="librerias/css/datatables.min.css">
	<link rel="stylesheet" type="text/css" href="librerias/css/open.css">

	<script type="text/javascript" src="librerias/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="librerias/js/popper.min.js"></script>
	<script type="text/javascript" src="librerias/js/bibliotecanew.min.js"></script>
	<script type="text/javascript" src="librerias/js/md5.js"></script>
	<script type="text/javascript" src="librerias/js/datatables.min.js"></script>
	<script type="text/javascript" src="librerias/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="librerias/js/jszip.min.js"></script>
	<script type="text/javascript" src="librerias/js/vfs_fonts.js"></script>
	<script type="text/javascript" src="librerias/js/buttons.html5.min.js"></script>
	<script type="text/javascript" src="librerias/js/mensajes.js"></script>
	<script type="text/javascript" src="librerias/js/moment.min.js"></script>
	<script type="text/javascript" src="librerias/js/jquery.datetimepicker.full.js"></script>
	<script type="text/javascript" src="librerias/js/toastr.js"></script>
</head>
<body class="fixed-sn white-skin">
	<div id="loader-wrapper">
		<div id="loader"></div>        
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<div id="sistema"></div>
	<script type="text/javascript" src="librerias/js/bibliotecanew2.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("body").addClass("loaded");
			<?php if (!isset($_SESSION['usuario'])): ?>
				$( "#sistema" ).empty();
				$( "#sistema" ).load( "view/login.php");
			<?php else: ?>
					$( "#sistema" ).empty();
					$( "#sistema" ).load( "view/biblioteca.php");
				<?php endif ?>
			});
		</script> 
	</body>
	</html>