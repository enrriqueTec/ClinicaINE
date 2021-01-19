<?php 
session_start();
if($_SESSION["autenticado"]!=1){
     header("Location: login.php");

 }
	require_once "conexion.php";
	$conexion=conexion();
	$nc=$_POST['txt_Num_Control_Modificaciones'];
	$n=$_POST['txt_Nombre_Modificaciones'];
	$ap=$_POST['txt_Apellido_Paterno_Modificaciones'];
	$am=$_POST['txt_Apellido_Materno_Modificaciones'];
	$e=$_POST['txt_Edad_Modificaciones'];
	$s=$_POST['txt_Semestre_Modificaciones'];
	$c=$_POST['txt_Carrera_Modificaciones'];
	$t=$_POST['txt_tutor_Modificaciones'];

	$sql="UPDATE alumnos set Nombre=?, primerAp=?, segundoAp=?, edad=?, semestre=?, carrera=? clave_tutor=? where numControl=?";
	$stm=$conexion->prepare($sql);
          $stm->bindValue(1,$n);	
          $stm->bindValue(2,$ap);
          $stm->bindValue(3,$am);
          $stm->bindValue(4,$e);
          $stm->bindValue(5,$s);
          $stm->bindValue(6,$c);
          $stm->bindValue(7,$t);
          $stm->bindValue(8,$nc);					
	echo $result=$stm->execute();

 ?>