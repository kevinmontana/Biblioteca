<?php 
session_start();
require_once '../cx.php';
$consultar=new conector_pg; // instancio la clase que usare
$id = $_GET['id'];
if($id=='' || $id==null || $id==0){
  if(!is_numeric($id)){
    header('Location: ../index.php');
  }
}

$_SESSION['route'] = 'modificarLibro';
$_SESSION['id'] = $_GET['id'];

$query="SELECT 
  tl.id,
  tl.str_cota,
  tl.str_coha_notis,
  tl.str_titulo,
  tl.str_autor_nombre,
  tl.str_autor_apellido,
  tl.str_edicion_reimpresion,
  tl.str_pais_ciudad,
  tl.str_editorial,
  tl.dtm_anho,
  tl.int_n_paginas,
  tl.str_isbn,
  tl.int_ejemplare,
  tl.id_salafk,
  tl.id_padre_deweyfk,
  tl.id_hijo_deweyfk,
  til.id_generoinfantil
  FROM tbl_libro as tl
  LEFT JOIN tbl_infantil_libro as til ON tl.id = til.id_librofk
  WHERE tl.id='$id';
";
$consultar=$consultar->consultar($query);
if (pg_num_rows($consultar)>0) { 
  $array = array();
  $datos_libro=pg_fetch_all($consultar);
  $datos_libro=$datos_libro[0];
}else{
  $datos_libro='';
}

if($datos_libro=='' || $datos_libro==null){
  echo '<script type="text/javascript">alert("No se encontraron datos");</script>';
  header('Location: ../index.php');
}

?>
<style type="text/css">
.md-form .prefix~label{
  margin-left:3.5rem;
}
.dropdown-content li>a, .dropdown-content li>span
{
  font-size: .9rem;
  color: #000 !important;
  display: block;
  padding: .5rem;
}
.dropdown-danger .dropdown-content li a, .dropdown-danger .dropdown-content li span:hover, .dropdown-danger .dropdown-content li.active
{
  background-color: #c00!important;
  color: #fff !important;
}
.dropdown-content li span:hover
{
  color: #fff !important;
}
</style>
<div class="card">
  <div class="card-body">
    <form class="form_entrada needs-validation was-validated" id="form_modificarlibros" method="POST">
      <input type="hidden" name="id" value="<?php echo $datos_libro['id']; ?>">
      <p class="h4 text-center py-4">Modificar Libro</p>
      <div class="form-row">
        <div class="md-form col-4">
          <i class="fa fa-user prefix grey-text active"></i>
          <label for="str_cota" class="font-weight-light active">Cota del Libro</label>
          <input type="text" id="str_cota" class="form-control" name="str_cota" required value="<?php echo $datos_libro['str_cota']; ?>">
        </div>
        <div class="md-form col-4">
          <i class="fa fa-user prefix grey-text active"></i>
          <input required type="text" id="str_coha_notis" class="form-control" name="str_coha_notis" value="<?php echo $datos_libro['str_coha_notis']; ?>">
          <label for="str_coha_notis" class="font-weight-light active">Coha/Notis del Libro</label>
        </div> 
        <div class="md-form  col-4">
          <i class="fa fa-user prefix grey-text active"></i>
          <input required type="text" id="str_titulo" class="form-control" name="str_titulo" value="<?php echo $datos_libro['str_titulo']; ?>">
          <label for="str_titulo" class="font-weight-light active">Título del Libro</label>
        </div>
        <div class="md-form  col-4">
          <i class="fa fa-user prefix grey-text active"></i>
          <input required type="text" id="str_autor_nombre" class="form-control" name="str_autor_nombre" value="<?php echo $datos_libro['str_autor_nombre']; ?>">
          <label for="str_autor_nombre" class="font-weight-light active">Nombre del Autor</label>
        </div>
        <div class="md-form  col-4">
          <i class="fa fa-user prefix grey-text active"></i>
          <input required type="text" id="str_autor_apellido" class="form-control" name="str_autor_apellido" value="<?php echo $datos_libro['str_autor_apellido']; ?>">
          <label for="str_autor_apellido" class="font-weight-light active">Apellido del Autor</label>
        </div> 
        <div class="md-form  col-4">
          <i class="fa fa-user prefix grey-text active"></i>
          <input required type="text" id="str_edicion_reimpresion" class="form-control" name="str_edicion_reimpresion" value="<?php echo $datos_libro['str_edicion_reimpresion']; ?>">
          <label for="str_edicion_reimpresion" class="font-weight-light active">Edición/re-impresión</label>
        </div> 
        <div class="md-form  col-4">
          <i class="fa fa-user prefix grey-text active"></i>
          <input required type="text" id="str_pais_ciudad" class="form-control" name="str_pais_ciudad" value="<?php echo $datos_libro['str_pais_ciudad']; ?>">
          <label for="str_pais_ciudad" class="font-weight-light active">País/Ciudad</label>
        </div>
        <div class="md-form  col-4">
          <i class="fa fa-user prefix grey-text active"></i>
          <input required type="text" id="str_editorial" class="form-control" name="str_editorial" value="<?php echo $datos_libro['str_editorial']; ?>">
          <label for="str_editorial" class="font-weight-light active">Editorial</label>
        </div>
        <div class="md-form  col-4">
          <i class="fa fa-user prefix grey-text active"></i>
          <input required type="number"  id="dtm_anho" class="form-control" name="dtm_anho" value="<?php echo $datos_libro['dtm_anho']; ?>" onkeypress="return valida(event)">
          <label for="dtm_anho" class="font-weight-light active">Año</label>
        </div>
       
       <div class="md-form  col-4">
        <i class="fa fa-user prefix grey-text active"></i>
        <input required type="text" onkeypress="return valida(event)" id="int_n_paginas" class="form-control" name="int_n_paginas" value="<?php echo $datos_libro['int_n_paginas']; ?>">
        <label for="int_n_paginas" class="font-weight-light active">N° Páginas</label>
      </div>
      <div class="md-form  col-4">
        <i class="fa fa-user prefix grey-text active"></i>
        <input required type="text" id="str_isbn" class="form-control" name="str_isbn" value="<?php echo $datos_libro['str_isbn']; ?>">
        <label for="str_isbn" class="font-weight-light active">ISBN</label>
      </div>
      <div class="md-form  col-4">
        <i class="fa fa-user prefix grey-text active"></i>
        <input required type="text" id="int_ejemplare" onkeypress="return valida(event)" class="form-control" name="int_ejemplare" value="<?php echo $datos_libro['int_ejemplare']; ?>">
        <label for="int_ejemplare" class="font-weight-light active">N° de Ejemplares</label>
      </div>
      <select class="mdb-select md-form col-4 dropdown-danger" name="id_salafk" id="id_salafk" required>
        <option value="0" disabled selected>Seleccione un Género</option>
        <option value="1" <?php if($datos_libro['id_salafk']==1){echo 'selected';} ?>>Sala Referencial</option>
        <option value="2" <?php if($datos_libro['id_salafk']==2){echo 'selected';} ?>>Sala General</option>
        <option value="3" <?php if($datos_libro['id_salafk']==3){echo 'selected';} ?>>Sala Infantil</option>
      </select>
      <select class="mdb-select md-form col-4 dropdown-danger" name="id_generoinfantil" id="id_generoinfantil" required>
        <option value="0" disabled selected>Seleccione un Género Infantil</option>
        <option value="1" data-icon="../img/imagenes.jpg" <?php if($datos_libro['id_generoinfantil']==1){echo 'selected';} ?>>Imágenes</option>
        <option value="2" data-icon="../img/animales.jpg" <?php if($datos_libro['id_generoinfantil']==2){echo 'selected';} ?>>Animales</option>
        <option value="3" data-icon="../img/aventura.jpg" <?php if($datos_libro['id_generoinfantil']==3){echo 'selected';} ?>>Aventura</option>
        <option value="4" data-icon="../img/hadas.jpg" <?php if($datos_libro['id_generoinfantil']==4){echo 'selected';} ?>>Hadas</option>
        <option value="5" data-icon="../img/fabulas.jpg" <?php if($datos_libro['id_generoinfantil']==5){echo 'selected';} ?>>Fabulas</option>
        <option value="6" data-icon="../img/fabulas.jpg" <?php if($datos_libro['id_generoinfantil']==6){echo 'selected';} ?>>Cuentos</option>
        <option value="7" data-icon="../img/poesias.jpg" <?php if($datos_libro['id_generoinfantil']==7){echo 'selected';} ?>>Poesías</option>
        <option value="8" data-icon="../img/venezolana.png" <?php if($datos_libro['id_generoinfantil']==8){echo 'selected';} ?>>Venezolana</option>
        <option value="9" data-icon="../img/venezolana.png" <?php if($datos_libro['id_generoinfantil']==9){echo 'selected';} ?>>Extranjera</option>
        <option value="10" data-icon="../img/venezolana.png" <?php if($datos_libro['id_generoinfantil']==10){echo 'selected';} ?>>Adolecente</option>
      </select>
      <select class="mdb-select md-form col-4 dropdown-danger" name="id_padre_deweyfk" id="id_padre_deweyfk" required>
        <option value="0" disabled selected>Selecciona Primer Sumario</option>
      </select>
      <select class="mdb-select md-form col-4 dropdown-danger" name="id_hijo_deweyfk" id="id_hijo_deweyfk" required>
        <option value="0" disabled selected>Selecciona Segundo Sumario</option>
      </select> 
    </div>
    <div class="text-center py-4 mt-3">
      <button class="btn btn-cyan" type="submit">Actualizar Libro</button>
    </div>
  </form>
</div>
</div>

<script type="text/javascript">
  $(document).ready(function() {

   id_padre_deweyfk()

   $('.datepicker').pickadate({
    format: 'yyyy',
    formatSubmit: 'yyyy',
    selectMonths: false,
  })

   $('#id_salafk').materialSelect();
   $('#id_padre_deweyfk').materialSelect();

   $('#id_salafk').on('change', function(event) {
    event.preventDefault();
    if ($('#id_salafk').val()==3) {
      $('#id_generoinfantil').val(<?php echo $datos_libro['id_generoinfantil']; ?>);
      $('#id_padre_deweyfk').trigger('change');
      $('#id_generoinfantil').materialSelect();
    } else {
      $('#id_generoinfantil').materialSelect('destroy');
    }
    
    setTimeout(function(){
      $('#id_hijo_deweyfk').materialSelect();
      $('#id_padre_deweyfk').materialSelect();
      $('#id_padre_deweyfk').val(<?php echo $datos_libro['id_padre_deweyfk']; ?>)
      $('#id_padre_deweyfk').trigger('change');
    }, 1000);
  });
  $('#id_salafk').trigger('change');
  
   $('#id_padre_deweyfk').on('change', function(event) {
    event.preventDefault();
    if ($('#id_padre_deweyfk').val()!=0) {
     $('#id_hijo_deweyfk option').remove();
     $('#id_hijo_deweyfk').append('<option value="0" disabled selected>Selecciona Segundo Sumario</option>')
     id_hijo_deweyfk()
     $('#id_hijo_deweyfk').materialSelect();
     //selected la option de la base de datos
     $('#id_hijo_deweyfk').val(<?php echo $datos_libro['id_hijo_deweyfk']; ?>)
    
   } else {
     $('#id_hijo_deweyfk option').remove();
     $('#id_hijo_deweyfk').append('<option value="0" disabled selected>Selecciona Segundo Sumario</option>')
     $('#id_hijo_deweyfk').materialSelect('destroy');
   }
 });
 });


  function valida(e){
    tecla = (document.all) ? e.keyCode : e.which;
    //Tecla de retroceso para borrar, siempre la permite
    if (tecla==8){
      return true;
    }
    // Patron de entrada, en este caso solo acepta numeros
    patron =/[0-9]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
  }

  function id_padre_deweyfk() {

    $.ajax({
      async:false,
      url: '../modelo/ModelDeweys.php?id_padre_deweyfk=1',
      type: 'GET',
    })
    .done(function(d) {
      datos=JSON.parse(d);
      if (datos!='') 
      {
        for (var i = 0; i < datos.length; i++) {
          datos[i]
          var option='<option value="'+datos[i]['id']+'">'+datos[i]['str_codigo_dewey']+' - '+datos[i]['str_nombre_seccion']+'</option>'
          $('#id_padre_deweyfk').append(option)
        }
      }
    });
  }

  function id_hijo_deweyfk() {

   $.ajax({
    async:false,
    url: '../modelo/ModelDeweys.php?id_hijo_deweyfk='+$('#id_padre_deweyfk').val(),
    type: 'GET',
  })
   .done(function(d) {
    datos=JSON.parse(d);
    if (datos!='') 
    {
      for (var i = 0; i < datos.length; i++) {
        datos[i]
        var option='<option value="'+datos[i]['id']+'">'+datos[i]['str_codigo_dewey']+' - '+datos[i]['str_nombre_seccion']+'</option>'
        $('#id_hijo_deweyfk').append(option)
      }
    }
  });
 }
 
</script>
