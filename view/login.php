<?php 
session_start();
if (!isset($_SESSION['usuario'])): ?>
	<!DOCTYPE html>
	<html lang="es">
	<head>
		<meta charset="utf-8">
		<title>Biblioteca</title>
		<link rel="stylesheet" type="text/css" href="librerias/css/va_css_login2.css">
		<script type="text/javascript" src="controlador/ControllerLogin.js"></script>
	</head>
	<body>

		<section class="login-block">
			<div class="container">
				<div class="row">
					<div class="col-md-4 login-sec">
						<h2 class="text-center">Bienvenido a Biblioteca</h2>
						<form class="form_login" id="form_login" method="POST">
							<div class="md-form">
								<input  type="text" class="form-control"  id="usuario">
								<label for="usuario" >Usuario</label>
							</div>
							<div class="md-form">
								<input type="password" class="form-control"  id="contrasena">
								<label for="contrasena" >Contraseña</label>
							</div>

							<div class="form-check">
								<button type="submit" class="btn btn-login float-right">Entrar</button>
							</div>

						</form>
					</div>
					<div class="col-md-8 banner-sec">
						<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active">
									<img class="d-block img-fluid" style="height: 500px;width: 100vw" src="librerias/img/libros.jpg" alt="First slide">
									<div class="carousel-caption d-none d-md-block">
										<div class="banner-text">
											<h2>This is Heaven</h2>
											<p>Sistema Bibliotecario, destinado al Registro y Control</p>
										</div>	
									</div>
								</div>
								<div class="carousel-item">
									<img class="d-block img-fluid" style="height: 500px;width: 100vw" src="librerias/img/libros2.jpg" alt="First slide">
									<div class="carousel-caption d-none d-md-block">
										<div class="banner-text">
											<h2>This is Heaven</h2>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
										</div>	
									</div>
								</div>
								<div class="carousel-item">
									<img class="d-block img-fluid" style="height: 500px;width: 100vw" src="librerias/img/libros3.jpg"" alt="First slide">
									<div class="carousel-caption d-none d-md-block">
										<div class="banner-text">
											<h2>This is Heaven</h2>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
										</div>	
									</div>
								</div>
							</div>	   

						</div>
					</div>
				</div>
			</section>
			
		</body>
		</html>
		<?php endif ?>