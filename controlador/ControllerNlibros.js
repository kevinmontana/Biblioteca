$(document).ready( function () {
	$.ajax({
		async:false,
		url: '../modelo/ModelTablaLibros.php?n=true'
	}).done(function(d) {
		datos='';
		if (d!='') {
			
			datos=JSON.parse(d);
			console.log(datos);
			for (var i = datos.length - 1; i >= 0; i--) {
				console.log(datos[i]['id']);
				switch(datos[i]['str_sala']) {
					case 'Infantil':
					console.log('Infantil');
					$('#n_infantil').empty();
					$('#n_infantil').append(datos[i]['n']);
					break;
					case 'General':
					console.log('General');
					$('#n_general').empty();
					$('#n_general').append(datos[i]['n']);
					case 'Referencial':
					console.log('Referencial');
					$('#n_referencia').empty();
					$('#n_referencia').append(datos[i]['n']);
					break;
					default:
					console.log('no');
				}
			}
			
			
		}

	});
});

