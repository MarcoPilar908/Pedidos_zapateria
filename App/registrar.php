<?php

$conexion=new mysqli("localhost","root","","zapateria");

$nombre=$_POST["nombre"];
$telefono=$_POST["telefono"];
$direccion=$_POST["direccion"];
$correo=$_POST["correo"];
 $insertar="INSERT INTO cliente (Nombre, Telefono, Direccion, Correo)VALUES('$nombre','$telefono','$direccion','$correo')";
 $resultado=mysqli_query($conexion,$insertar);
 if(!$resultado){
 	echo '<script>alert("error al registrar Usuario");</script>';
 }else{
 	echo '<script>alert("usuario registrado exitosamente");</script>';
 }
 mysqli_close($conexion);