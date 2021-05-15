<?php
	include_once('db.php');
?>
<!doctype html>

<?php
//Selecionar  os itens da página
$sql = "SELECT cliente.Nombre,cliente.Telefono,cliente.Direccion,articulo.Tipo,articulo.Talla,articulo.Color FROM Articulo INNER JOIN Cliente ON Articulo.Id_articulo=Cliente.Id_cliente";
$resultado = mysqli_query($conectar, $sql);
?>
<div class="tablaPedido" role="main">
  <div class="row">
    <div class="col-md-12">
      <table class="tabla_datos">
        <thead class="thead-dark">
          <tr>
            <th class="text-center">Id Pedido</th>
            <th class="text-center">Nombre</th>
            <th class="text-center">Teléfono</th>
            <th class="text-center">Dirección</th>
            <th class="text-center">Tipo</th>
            <th class="text-center">Talla</th>
            <th class="text-center">Color</th>
          </tr>
        </thead>
        <tbody>
          <?php $n=0; while($row = mysqli_fetch_array($resultado)){ $n++;?>
          <tr>
            <td class="text-center"><?php echo $n; ?></td>
            <td class="text-center"><?php echo $row["Nombre"]; ?></td>
            <td class="text-center"><?php echo $row["Telefono"]; ?></td>
            <td class="text-center"><?php echo $row["Direccion"]; ?></td>
            <td class="text-center"><?php echo $row["Tipo"]; ?></td>
            <td class="text-center"><?php echo $row["Talla"]; ?></td>
            <td class="text-center"><?php echo $row["Color"]; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
