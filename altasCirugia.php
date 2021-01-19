<?php 
  session_start();
  
  require_once "php/conexion.php";
  $conexion=conexion();
  $sql1="SELECT * from doctores  WHERE especialidad='Cirujano'";
  $sql2="SELECT * from doctores WHERE especialidad='Anestesiologo'";
  $sql3="SELECT * FROM `enfermero`";
  $sql4="SELECT * FROM `enfermero`";
  $sql5="SELECT * FROM `enfermero`";
  $result1=$conexion->query($sql1);
  $result2=$conexion->query($sql2);
  $result3=$conexion->query($sql3);
  $result4=$conexion->query($sql4);
  $result5=$conexion->query($sql5);

 ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">

   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="librerias/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="librerias/alertifyjs/css/alertify.css">
	<link rel="stylesheet" type="text/css" href="librerias/alertifyjs/css/themes/default.css">
  <link rel="stylesheet" type="text/css" href="librerias/select2/css/select2.css">

    <title>Altas cirugía</title>
</head>
<body>

<!-- Inicio Body-->

<body>


	<div class="container">

    <div id="buscador">
    <?php 
     
      require_once "componentes/buscador.php";

    ?></div>
		<div id="tabla">

    <?php 
      require_once "componentes/tabla.php";
      
    ?>
    <!-- Button trigger modal -->

<!-- Modal -->
<form method="POST" action="php/agregarDatos.php" >
<div class="modal fade" id="AgregarCirugia" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="exampleModalLongTitle">Agregar cirugía</h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="container-fluid">
       <div class="row">
       <div class="col-md-8">
        <label for="">Nombre:</label>
      <input type="text" id="txt_Nombre_Cirugia" name="txt_Nombre_Cirugia" class="form-control input-sm">
       </div>
       </div>
      
       <div class="row">
       <div class="col-md-8">
         <label for="">Fecha</label>
      <input type="date" id="txt_Fecha_Cirugia" name="txt_Fecha_Cirugia" class="form-control input-sm">
       </div>
       </div>

      
       <div class="row">
       <div class="col-md-6">
        <label for="">Cirujano:</label>
      <select  id="txt_Cirujano" name="txt_Cirujano"class="form-control" input-sm>
      <option value="0">mostrar todos</option>
      <?php
				foreach ($result1 as $cirujano):
			 ?>
				<option value="<?php echo $cirujano[0] ?>">
					<?php echo $cirujano[1]." ".$cirujano[2]." ".$cirujano[3] ?>
				</option>
        
			<?php endforeach; ?>
      </select>
       </div>
       <div class="col-md-6">
        <label for="">Anestesiologo:</label>
      <select  id="txt_Anest" name="txt_Anest" class="form-control" input-sm>
      <option value="0">mostrar todos</option>
      <?php
				foreach ($result2 as $cirujano):
			 ?>
				<option value="<?php echo $cirujano[0] ?>">
					<?php echo $cirujano[1]." ".$cirujano[2]." ".$cirujano[3] ?>
				</option>
        
			<?php endforeach; ?>
      </select>
       </div>
       </div>

       <div class="row">
       <div class="col-md-6">
        <label for="">Enf. Instrume:</label>
      <select  id="txt_Enf1" name="txt_Enf1"class="form-control" input-sm>
      <option value="0">mostrar todos</option>
      <?php
				foreach ($result3 as $enf1):
			 ?>
				<option value="<?php echo $enf1[0] ?>">
					<?php echo $enf1[1]." ".$enf1[2]." ".$enf1[3] ?>
				</option>
        
			<?php endforeach; ?>
      </select>
       </div>

       <div class="col-md-6">
         <label for="">Enf. Circulan 1:</label>
      <select  id="txt_Enf2" name="txt_Enf2"class="form-control" input-sm>
      <option value="0">mostrar todos</option>
      <?php
				foreach ($result4 as $enf2):
			 ?>
				<option value="<?php echo $enf2[0] ?>">
					<?php echo $enf2[1]." ".$enf2[2]." ".$enf2[3] ?>
				</option>
        
			<?php endforeach; ?>
      </select>

       </div>
       </div>

       <div class="row">
       <div class="col-md-6">
        <label for="">Enf. circulan 2:</label>
      <select  id="txt_Enf3" name="txt_Enf3"class="form-control" input-sm>
      <option value="0">mostrar todos</option>
      <?php
				foreach ($result5 as $enf3):
			 ?>
				<option value="<?php echo $enf3[0] ?>">
					<?php echo $enf3[1]." ".$enf3[2]." ".$enf3[3] ?>
				</option>
        
			<?php endforeach; ?>
      </select>
       </div>


       <div class="col-md-6">
       <label for="">Sala</label>
       <select id="txt_sala" name="txt_sala"class="form-control" input-sm>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="10">10</option>
       </select>
       </div>
       </div>

       <div class="row">
       <div class="col-md-6">
        <label for="">Hora Inicio</label>
        <input type="time" name="txt_hr_inicio" id="txt_hr_inicio" class="form-control input-sm">
       </div>

       <div class="col-md-6">
       <label for="">Hora Fin</label>
        <input type="time" name="txt_hr_fin" id="txt_hr_fin" class="form-control input-sm">
       </div>
       </div>
      </div>
     
    
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary" id="AgregarCirugia">Guardar</button>
      </div>
    </div>
  </div>
</div>
 </div>
 
	</div>

  </form>



<script src="librerias/jquery-3.2.1.min.js"></script>
  
	<script src="librerias/bootstrap/js/bootstrap.js"></script>
	
</body>
</html>

