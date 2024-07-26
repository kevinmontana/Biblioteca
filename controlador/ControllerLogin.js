$(document).on("submit",".form_login",function(e){
//funcion para atrapar los formularios y enviar los datos
e.preventDefault();
var formu=$(this);
var quien=$(this).attr("id");
if(quien=="form_login"){ var miurl="../modelo/ModelLogin.php"; var usuario=$('#usuario').val();var contrasena=$('#contrasena').val();var SISTEMA='<div id="SISTEMA"></div>';var boton='';boton=boton+'<input type="hidden" name="usuario" id="token">';boton=boton+'<input type="hidden" name="contrasena" id="prueba">';$("#SISTEMA").remove();$('#form_login').append(SISTEMA);$('#SISTEMA').empty().append(boton);$('#token').val(md5(usuario));$('#prueba').val(md5('BibliotecaUnexca'+contrasena));}
var formData = new FormData($('#'+quien+'')[0]);
$.ajax({
  url: miurl,
  type:"POST",
  data: formData,
  cache: false,
  contentType: false,
  processData: false,
  success : function(response)
  {
   console.log(response);
   if (response['controlador']=='msj') {
    mensaje=response;
  }else{
    mensaje=JSON.parse(response);
  }
  console.log(mensaje);
  if (mensaje!='') {
    dataMessage(mensaje['tipo'],mensaje['msj']);
    if (mensaje['tipo']=='success') {
      $("body").removeClass("loaded");
      setTimeout(function() {
        $("body").addClass("loaded");
        $( "#sistema" ).load( "view/biblioteca.php", function() {
        });
      }, 0);
    }

  }

},
error:function(response){
  $('.loading').hide();
  $.each(response.responseJSON, function(index, val) {
    dataMessage('error',val);
    $('#detalles').modal('hide');
  });
}

});
})

