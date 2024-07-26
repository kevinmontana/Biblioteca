<?php 
session_start();
$_SESSION['route'] = 'listado';
?>
<script type="text/javascript" src="controlador/ControllerLibros.js"></script>
<script type="text/javascript" src="controlador/ControllerEliminarLibros.js"></script>
<div class="container-fluid">
	<div class="row">
		<div class="card col-12 mb-5" id="cajage">	
			<div class="card-body">
				<section>
					<h2 class="section-heading mb-4">Sala General y Sala Referencial</h2>
					<table id="general"></table>
				</section>
			</div>
		</div>
		<div class="card col-12 mb-5" id="cajain">	
			<div class="card-body">
				<section>
					<h2 class="section-heading mb-4">Sala Infantil</h2>
					<table id="infantil"></table>
				</section>
			</div>
		</div>
	</div>
</div>
