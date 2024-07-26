<?php 
session_start();
if (isset($_SESSION['usuario'])): ?>
	
	<style type="text/css">
	@-webkit-keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}@keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}.chartjs-render-monitor{-webkit-animation:chartjs-render-animation 0.001s;animation:chartjs-render-animation 0.001s;}
</style>
<?php require_once 'header.php'; ?>

<main>
	<div class="container-fluid">
		<div class="">
			<div id="menus" class="" style="height: 100%;min-height: 800px">
				
				<h2 style="text-align: center;">BIENVENIDO AL SISTEMA BIBLIOTECARIO</h2>
				<br>
				<h5 style="text-align: center">Información Relevante del Sistema</h5>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript">
	$(document).ready(function() {
		$(".button-collapse").sideNav()
		<?php switch ($_SESSION['route']) {
			case 'biblioteca':
			?>
				$( "#menus" ).load( "view/inicio.php");
			<?php break;
			case 'listado':
			?>
				$( "#menus" ).load( "view/listado.php");
			<?php break;
			case 'registrolibro':
			?>
				$( "#menus" ).load( "view/registrolibro.php");
			<?php break;
			case 'modificarLibro':
			?>
				$( "#menus" ).load( "view/modificarLibro.php?id="+<?php echo $_SESSION['id']; ?>);
			<?php break;
			default:
			?>
				$( "#menus" ).load( "view/inicio.php");
			<?php break;
		} ?>
	});
</script>
<script type="text/javascript" src="controlador/ControllerLogout.js"></script>
<script type="text/javascript" src="controlador/Controller.js"></script>
<script type="text/javascript" src="controlador/ControllerMenu.js"></script>




<?php endif ?>
