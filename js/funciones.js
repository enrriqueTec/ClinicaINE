

//FUNCION UTILIZADA PARA MOSTRAR LOS DATOS DEL ALUMNO AGRGADO Y MANDAR UN MENSAJE!!
function agregardatos(txt_Nombre_Cirugia,txt_Fecha_Cirugia,txt_Cirujano,txt_Anest,txt_Enf1,txt_Enf2,txt_Enf3,txt_sala,txt_hr_inicio,txt_hr_fin){

	   
    cadena="txt_Nombre_Cirugia=" + txt_Nombre_Cirugia + 
			"&txt_Fecha_Cirugia=" + txt_Fecha_Cirugia +
			"&txt_Cirujano=" + txt_Cirujano +
			"&txt_Anest=" + txt_Anest +
			"&txt_Enf1=" + txt_Enf1 +
			"&txt_Enf2=" + txt_Enf2 +
			"&txt_Enf3=" + txt_Enf3 +
			"&txt_sala=" + txt_sala+
			"&txt_hr_inicio=" + txt_hr_inicio+
			"&txt_hr_fin="+txt_hr_fin;

	$.ajax({
		type:"POST",
		url:"php/agregarDatos.php",
		data:cadena,
		success:function(r){
			if(r==1){
				$('#tabla').load('componentes/tabla.php');
				 $('#buscador').load('componentes/buscador.php');
				alertify.success(" AGREGADO CON EXITO :)");
			}else{
				alertify.error("Error");
			}
		}
	});

}
//EN ESTA FUNCION SE UTILIZA PARA CARGAR LOS DATOS DE LA TABLA A LAS 
//CAJAS DE TEXTO DE EL MENU EDITAR!!!
function agregaform(datos){

	d=datos.split('||');

	$('#txt_Num_Control_Modificaciones').val(d[0]);
	$('#txt_Nombre_Modificaciones').val(d[1]);
	$('#txt_Apellido_Paterno_Modificaciones').val(d[2]);
	$('#txt_Apellido_Materno_Modificaciones').val(d[3]);
	$('#txt_Edad_Modificaciones').val(d[4]);
	$('#txt_Semestre_Modificaciones').val(d[5]);
	$('#txt_Carrera_Modificaciones').val(d[6]);
	$('#txt_tutor_Modificaciones').val(d[7]);
	
}

//EN ESTA FUNCION SE UTLIZA PARA MODIFICAR LOS DATOS DE LOS ALUMANOS!!!
function actualizaDatos(){


	txt_Num_Control_Modificaciones=$('#txt_Num_Control_Modificaciones').val();
	txt_Nombre_Modificaciones=$('#txt_Nombre_Modificaciones').val();
	txt_Apellido_Paterno_Modificaciones=$('#txt_Apellido_Paterno_Modificaciones').val();
	txt_Apellido_Materno_Modificaciones=$('#txt_Apellido_Materno_Modificaciones').val();
	txt_Edad_Modificaciones=$('#txt_Edad_Modificaciones').val();
	txt_Semestre_Modificaciones=$('#txt_Semestre_Modificaciones').val();
	txt_Carrera_Modificaciones=$('#txt_Carrera_Modificaciones').val();
	txt_tutor_Modificaciones=$('#txt_tutor_Modificaciones').val();


	cadena= "txt_Num_Control_Modificaciones=" + txt_Num_Control_Modificaciones +
			"&txt_Nombre_Modificaciones=" + txt_Nombre_Modificaciones + 
			"&txt_Apellido_Paterno_Modificaciones=" + txt_Apellido_Paterno_Modificaciones +
			"&txt_Apellido_Materno_Modificaciones=" + txt_Apellido_Materno_Modificaciones +
			"&txt_Edad_Modificaciones=" + txt_Edad_Modificaciones +
			"&txt_Semestre_Modificaciones=" + txt_Semestre_Modificaciones +
			"&txt_Carrera_Modificaciones=" + txt_Carrera_Modificaciones+
			"&txt_tutor_Modificaciones=" + txt_tutor_Modificaciones;

	$.ajax({
		type:"POST",
		url:"php/actualizaDatos.php",
		data:cadena,
		success:function(r){
			
			if(r==1){
				$('#tabla').load('componentes/tabla.php');
				alertify.success("EL ALUMNO SE HA ACTUALIZADO CON EXITO :)");
			}else{
				alertify.error("FALLÓ LA ACTUALIZACIÓN :(");
			}
		}
	});

}

//ESTA FUNCION SE UTILIZA PARA MANDAR UN MENSAJE Y PREGUNTAR SI REALMENTE SE QUIERE ELIMINAR AL ALUMNO!!
function preguntarSiNo(NumeroControl){
	alertify.confirm('Eliminar Datos', '¿ESTAS SEGURO QUE DESEAS ELIMINAR A ESTE ALUMNO?', 
					function(){ eliminarDatos(NumeroControl) }
                , function(){ alertify.error('OPERACIÓN CANCELADA')});
}
//ESTA FUNCION ES UTILIZADA PARA ELIMINAR ALGUN ALUMNO DE LA TABLA 
function eliminarDatos(NumeroControl){

	cadena="NumeroControl=" + NumeroControl;

		$.ajax({
			type:"POST",
			url:"php/eliminarDatos.php",
			data:cadena,
			success:function(r){
				if(r==1){
					$('#tabla').load('componentes/tabla.php');
					alertify.success("EL ALUMNO SE HA ELIMINADO CON EXITO!");
				}else{
					alertify.error("FALLÓ LA ELIMINACIÓN :(");
				}
			}
		});
}