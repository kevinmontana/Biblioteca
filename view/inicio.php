
<?php 
session_start();
$_SESSION['route'] = 'inicio';
?>
<div class="container" id="menus">
	<h2 class="header center red-text">
		<center>
			<b>BIENVENIDO AL SISTEMA BIBLIOTECARIO</b><br>
		</center>
	</h2>

		<div class="row center">
			<div class="row">
				<!--Subheading-->
				<div class="col-md-4">

					<!-- Card Wider -->
					<div class="card card-cascade wider mb-4">

						<!-- Card image -->
						<div class="view view-cascade overlay">
							<img class="card-img-top" src="librerias/img/sala-general.jpg" alt="Card image cap">
							<a href="#!">
								<div class="mask rgba-white-slight waves-effect waves-light"></div>
							</a>
						</div>

						<!-- Card content -->
						<div class="card-body card-body-cascade text-center">

							<!-- Title -->
							<h4 class="card-title"><strong>Sala General</strong></h4>
							<!-- Text -->
							<p class="card-text">Es un espacio destinado a recibir jóvenes y adultos, para que realicen sus consultas en Internet y en el material bibliográfico encontrado en varios estantes organizados por temas.</p>

							<!-- Linkedin -->
							<a class="px-1 fa-lg li-ic">Libros Existentes</i></a>
							<a class="px-1 fa-lg fb-ic" id="n_general">0</a>

						</div>

					</div>
					<!-- Card Wider -->



				</div>

				<!--Subheading-->
				<div class="col-md-4">

					<!-- Card Wider -->
					<div class="card card-cascade wider mb-4">

						<!-- Card image -->
						<div class="view view-cascade overlay">
							<img class="card-img-top" src="librerias/img/sala-infantil.jpg" alt="Card image cap">
							<a href="#!">
								<div class="mask rgba-white-slight waves-effect waves-light"></div>
							</a>
						</div>

						<!-- Card content -->
						<div class="card-body card-body-cascade text-center">

							<!-- Title -->
							<h4 class="card-title"><strong>Sala Infantil</strong></h4>

							<!-- Text -->
							<p class="card-text">Este espacio está creado para niños y niñas de 0 a 11 años, allí los infantes realizan diferentes actividades de lectura, pintura,plastilina, títeres, baile, rondas infantiles, repetición y articulación de palabras, proyección de películas para niños y enseñanza de valores a través de la literatura. </p>

							<!-- Linkedin -->
							<a class="px-1 fa-lg li-ic">Libros Existentes</i></a>
							<a class="px-1 fa-lg fb-ic" id="n_infantil">0</a>

						</div>

					</div>
					<!-- Card Wider -->



				</div>

				<!--Subheading-->
				<div class="col-md-4">

					<!-- Card Wider -->
					<div class="card card-cascade wider mb-4">

						<!-- Card image -->
						<div class="view view-cascade overlay">
							<img class="card-img-top" src="librerias/img/sala-referencia.jpg" alt="Card image cap">
							<a href="#!">
								<div class="mask rgba-white-slight waves-effect waves-light"></div>
							</a>
						</div>

						<!-- Card content -->
						<div class="card-body card-body-cascade text-center">

							<!-- Title -->
							<h4 class="card-title"><strong>Sala Referencia</strong></h4>
							<!-- Subtitle -->

							<!-- Text -->
							<p class="card-text">Formado por obras de consulta rápida y de fácil acceso, la componen: diccionarios, enciclopedias directorios, anuarios, bibliografías, boletines de sumarios, etc. Estos libros no se prestan, solo pueden ser consultados en sala.</p>

							<!-- Linkedin -->
							<a class="px-1 fa-lg li-ic">Libros Existentes</i></a>
							<a class="px-1 fa-lg fb-ic" id="n_referencia">0</a>
						</div>

					</div>
					<!-- Card Wider -->



				</div>

			</div>
		</div>
	</div>
<script type="text/javascript" src="controlador/ControllerNlibros.js"></script>