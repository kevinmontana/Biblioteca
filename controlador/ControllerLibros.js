$(document).ready( function () {
	$('#cajage').hide();
	$('#cajain').hide();
	
	generalTable();
	cajinTable();

	setTimeout(function () {
		// body...
		$('.dt-button').addClass('btn btn-warning btn-sm')
	}
	,100
	)
	
} );

function modificarLibro(id) {
	// body...
	$( "#menus" ).load('view/modificarLibro.php?id='+id);
}

function generalTable(){
	$.ajax({
		async:false,
		url: '../modelo/ModelTablaLibros.php?general=2'
	}).done(function(d) {
		datos='';
		if (d!='') {
		datos=JSON.parse(d);
		}
		if (datos!='') 
		{
			$('#cajage').show();
			//destroy table
			if( $.fn.DataTable.isDataTable('#general') ) {
				$('#general').DataTable().destroy();
			}
			$('#general').DataTable({
				"processing": true,
				"scrollY":       "300px",
				"scrollX":        true,
				"scrollCollapse": true,
				"ordering":false,
				"oLanguage": {"sUrl":"./librerias/js/EStables.js"},
				"data": datos,
				"dom": "Bfrtip",
				"buttons": [
				"excelHtml5",
				],
				"columns": [
				{ "title": "Cota", data: "str_cota" },
				{ "title": "Coha/Notis", data: "str_coha_notis" },
				{ "title": "Nombre del Autor", data: "str_autor_nombre" },
				{ "title": "Apellido de Autor", data: "str_autor_apellido" },
				{ "title": "Titulo", data: "str_titulo" },
				{ "title": "Edicion/Reimpresion", data: "str_edicion_reimpresion" },
				{ "title": "Pais/Ciudad", data: "str_pais_ciudad" },
				{ "title": "Editorial", data: "str_editorial" },
				{ "title": "N° de Paginas", data: "int_n_paginas" },
				{ "title": "ISBN", data: "str_isbn" },
				{ "title": "N° de Ejemplares", data: "int_ejemplare" },
				{ "title": "Sala", data: "str_sala" },
				{ "title": "Año", data: "dtm_anho" },
				{ "title": "Primer Sumario", data: "padre_deweyfk" },
				{ "title": "Segundo Sumario", data: "hijo_deweyfk" },
				{ "title": "Opciones", data: "id" },
				],
				fnCreatedRow: function( elemt, data, iDataIndex ) {
					var indice = iDataIndex + 1;
					columna=$('td:eq(15)', elemt);
					botones='';
					botones+='<center id="botones'+data.id+'">';
						clas='red';
						boton1="<button type='button' id='modificalibro"+data.id+"' onclick=modificarLibro('"+data.id+"') class='btn btn-teal' style='margin-right: 10px;'><div id='estado"+data.id+"'>Modificar</div></button>";
						botones+=boton1;
						boton2="<button type='button' id='eliminalibro"+data.id+"' onclick=eliminaLibro('"+data.id+"') class='btn "+clas+"' style='margin-right: 10px;'><div id='estado"+data.id+"'>Eliminar</div></button>";
						botones+=boton2;
						botones+="</center>";
						columna=columna.html(botones);
					},
			});
		}else{
			$('#cajage').hide();
		}
	});
}

function cajinTable(){
	$.ajax({
		async:false,
		url: '../modelo/ModelTablaLibros.php?infantil=3'
	}).done(function(d) {
		datos='';
				if (d!='') {
			
		datos=JSON.parse(d);
		}
		if (datos!='') 
		{
			$('#cajain').show();
			if( $.fn.DataTable.isDataTable('#infantil') ) {
				$('#infantil').DataTable().destroy();
			}
			$('#infantil').DataTable({
				"processing": true,
				"scrollY":       "300px",
				"scrollX":        true,
				"scrollCollapse": true,
				"ordering":false,
				"oLanguage": {"sUrl":"./librerias/js/EStables.js"},
				"data": datos,
				"dom": "Bfrtip",
				"buttons": [
				"excelHtml5",
				//"csvHtml5",
				],
				"columns": [
				{ "title": "Cota", data: "str_cota" }, //0
				{ "title": "Coha/Notis", data: "str_coha_notis" }, //1
				{ "title": "Nombre del Autor", data: "str_autor_nombre" }, //2
				{ "title": "Apellido de Autor", data: "str_autor_apellido" }, //3
				{ "title": "Titulo", data: "str_titulo" }, //4
				{ "title": "Edicion/Reimpresion", data: "str_edicion_reimpresion" }, //5
				{ "title": "Pais/Ciudad", data: "str_pais_ciudad" }, //6
				{ "title": "Editorial", data: "str_editorial" }, //7
				{ "title": "N° de Paginas", data: "int_n_paginas" }, //8
				{ "title": "ISBN", data: "str_isbn" }, //9
				{ "title": "N° de Ejemplares", data: "int_ejemplare" }, //10
				{ "title": "Sala", data: "str_sala" }, //11
				{ "title": "Año", data: "dtm_anho" }, //12
				{ "title": "Genero Infantil", data: "genero_infantil" }, //13
				{ "title": "Primer Sumario", data: "padre_deweyfk" }, //14
				{"title": "Segundo Sumario", data: "hijo_deweyfk" }, //15
				{ "title": "Opciones", data: "id" }, //16
				],
				fnCreatedRow: function( elemt, data, iDataIndex ) {
					var indice = iDataIndex + 1;
					columna=$('td:eq(16)', elemt);
					botones='';
					botones+='<center id="botones'+data.id+'">';
						estado='Eliminar';
						clas='red';
						boton1="<button type='button' id='modificalibro"+data.id+"' onclick=modificarLibro('"+data.id+"') class='btn btn-teal' style='margin-right: 10px;'><div id='estado"+data.id+"'>Modificar</div></button>";
						botones+=boton1;
						boton2="<button type='button' id='eliminalibro"+data.id+"' onclick=eliminaLibro('"+data.id+"','"+estado+"') class='btn "+clas+"' style='margin-right: 10px;'><div id='estado"+data.id+"'>"+estado+"</div></button>";
						botones+=boton2;
						botones+="</center>";
						columna=columna.html(botones);
					},
			});
		}else{
			$('#cajain').hide();
		}

	});
}
