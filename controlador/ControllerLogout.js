$('.logout').click(function(event) {
	$.get('../modelo/ModelLogout.php', function(response) {
		if (response['controlador']=='msj') {
			mensaje=response;
		}else{
			mensaje=JSON.parse(response);
		}
		if (mensaje!='') {
			dataMessage(mensaje['tipo'],mensaje['msj']);
			$('.loading').hide();
			$('.saved').show();
			if (mensaje['tipo']=='success') {
				redireccionar(mensaje['url']);	 
			}
		}
	});
});