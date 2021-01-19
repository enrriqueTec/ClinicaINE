
<?php 
session_start();
if($_SESSION["autenticado"]!=1){
     header("Location: login.php");

 }
	require_once "conexion.php";
	$conexion=conexion();
	$NumeroControl=$_POST['NumeroControl'];

	$sql="DELETE from alumnos where numControl=?";
	$stm=$conexion->prepare($sql);
          $stm->bindValue(1,$NumeroControl);	
         					
	echo $result=$stm->execute();
	
 ?>