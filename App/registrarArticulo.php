<?php

$conexion=new mysqli("localhost","root","","zapateria");

$tipo=$_POST["tipo"];
$material=$_POST["material"];
$talla=$_POST["talla"];
$color=$_POST["color"];
 $insertar="INSERT INTO articulo (Tipo, Material, Talla, Color)VALUES('$tipo','$material','$talla','$color')";
 $resultado=mysqli_query($conexion,$insertar);
 if(!$resultado){
 	echo '<script>alert("error al registrar Artículo");</script>';
 }else{
 	echo '<script>alert("Artículo registrado exitosamente");</script>';
 }
 mysqli_close($conexion);