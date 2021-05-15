<?php
	$mysqli=new mysqli("localhost","root","","zapateria");
	$salida="";
	$query="SELECT * FROM Inventario ORDER By Id_inventario";

	if(isset($_POST['consulta'])){

		$q=$mysqli->real_escape_string($_POST['consulta']);
		//$query="SELECT Id_articulo, Tipo, Marca, Material,Talla,Precio FROM articulo WHERE Tipo LIKE '%".$q."%' OR Marca LIKE'%".$q."%' OR Material LIKE '%".$q."%'";


		$query = "SELECT * FROM Inventario WHERE Tipo LIKE '%$q%' OR Material LIKE '%$q%' OR Talla LIKE '%$q%'";//cambiar la tabla a nombre inventario y ID cambiar
	}
	
	$resultado = $mysqli->query($query);

	if($resultado->num_rows > 0){
		$salida="<table class='tabla_datos'>
		<thead>
			<tr>
			<td>ID</td>
			<td>Tipo</td>
			<td>Material</td>
			<td>Tallas</td>
			<td>Precio</td>
			<td>Color</td>
			</tr>
		</thead>
		<tbody>";

		while($fila = $resultado->fetch_assoc()){
			$salida.="<tr>
			<td>".$fila['Id_inventario']."</td>
			<td>".$fila['Tipo']."</td>
			<td>".$fila['Material']."</td>
			<td>".$fila['Talla']."</td>
			<td>".$fila['Precio']."</td>
			<td>".$fila['Color']."</td>
			</tr>";
		}
		$salida.="</tbody></table>";
	}else{
		$salida.="<p class='four'>Sin datos resultantes</p>";
	}
	echo $salida;

	$mysqli->close();
?>