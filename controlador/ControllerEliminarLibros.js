
function eliminaLibro(id) {
	$.post('../modelo/ModelEliminarLibros.php', {id: id}, function(data, textStatus, xhr) {
		if (data['controlador']=='msj') {
			mensaje=data;
		}else{
			mensaje=JSON.parse(data);
		}
		console.log(mensaje)
		if (mensaje!='') {
			dataMessage(mensaje['tipo'],mensaje['msj']);
			$('.loading').hide();
			$('.saved').show();
			if (mensaje['tipo']=='success') {
				redireccionar(mensaje['url']);	 
			}
			if (mensaje['estado']=='Activar') {
				clase='teal';
				console.log(clase)
			}else{
				clase='red'
			console.log(clase)
			}
			//find parent tr and delete it
			generalTable();
			cajinTable();
		}
	});
}
