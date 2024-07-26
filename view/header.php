<style type="text/css">
.sn-bg-libros {
	background-image: url(../librerias/img/libros.jpg);
}
</style>
<header>
	<div id="slide-out" class="side-nav sn-bg-libros fixed">
		<ul class="custom-scrollbar">
			<li>
				<div class="logo-wrapper waves-light mb-5" style="height: 100px;">
					<a href="#">
						<img src="../librerias/img/logo.webp" class="img-fluid flex-center ">
					</a>
				</div>
			</li>
			<li>
				<ul class="collapsible collapsible-accordion">
					<li class="inicio">
						<a class="collapsible-header waves-effect arrow-r"><i class="fa fa-chevron-right"></i>Inicio</a>
					</li>
					<li class="listado">
						<a class="collapsible-header waves-effect arrow-r"><i class="fa fa-chevron-right"></i>Listado</a>
					</li>
					<li class="registrolibro">
						<a class="collapsible-header waves-effect arrow-r"><i class="fa fa-chevron-right"></i>Registro</a>
					</li>
				</ul>
			</li>
		</ul>
		<div class="sidenav-bg mask-strong"></div>
	</div>
	<nav class="navbar fixed-top navbar-toggleable-md navbar-expand-lg scrolling-navbar double-nav">

		<div class="float-left">
			<a href="#" data-activates="slide-out" class="button-collapse"><i class="fa fa-bars"></i></a>
		</div>
		<div class="float-left">
			<a class="navbar-brand" style="margin-left: 20px">
				<img src="../librerias/img/logo.webp"" height="30" alt="Biblioteca Pública">
			</a>
		</div>
		<div class="breadcrumb-dn mr-auto">
			<h3><b>Biblioteca Pública</b></h3>
		</div>

		<ul class="nav navbar-nav nav-flex-icons ml-auto">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
				<i class="fa fa-user"></i> <?php echo $_SESSION['usuario'] ?>
			</a>
			<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
				<!-- <a class="dropdown-item" href="#">Perfil</a> -->
				<!-- <a class="dropdown-item" href="#">Cambio de Contraseña</a> -->
				<a class="dropdown-item logout" >Cerrar Sesión</a>
			</div>
		</li>
	</ul>
</nav>
</header>