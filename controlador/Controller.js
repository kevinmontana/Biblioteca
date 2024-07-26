$(document).on("submit",".form_entrada",function(e){
//funcion para atrapar los formularios y enviar los datos
e.preventDefault();
var formu=$(this);
var quien=$(this).attr("id");

if(quien=="form_registrolibros"){ var miurl="../modelo/ModelRegistroLibros.php"; }
if(quien=="form_modificarlibros"){ var miurl="../modelo/ModelModificarLibros.php"; }

var formData = new FormData($('#'+quien+'')[0]);
$.ajax({
  url: miurl,
  type:"POST",
  data: formData,
  cache: false,
  contentType: false,
  processData: false,

  beforeSend: function(){
    $('.loading').show();
    $('.saved').hide();
  },
  success : function(response)
  {
    console.log(response);
    if (response['controlador']=='msj') {
      mensaje=response;
    }else{
      mensaje=JSON.parse(response);
      console.log(mensaje);
    }

    if (mensaje!='') {

      dataMessage(mensaje['tipo'],mensaje['msj']);
      $('.loading').hide();
      $('.saved').show();

      if (mensaje['tipo']=='success') {
        if (mensaje['registrolibro']) {
          $( "#menus" ).load( "view/registrolibro.php");
          $('.inicio').removeClass("active");
          $('.registrolibro').addClass("active");
        }
        if (mensaje['modificarlibro']) {
          $( "#menus" ).load( "view/listado.php");
        }
        setTimeout(function() {
          redireccionar(mensaje['url']);
        }, 2000);
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

function redireccionar(URL){
  if (URL != '') {
   location.href = ''+URL+'';
 };
}

