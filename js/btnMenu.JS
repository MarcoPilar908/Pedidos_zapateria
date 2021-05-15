$(document).ready(function(){
	$("#Buscar").click(function(event){
		$("#ContenidoBuscar").load('buscar.html #ContenidoBuscar');
		$("#Buscar").addClass("active");
		$("#Registrar,#Pedido").removeClass("active");
	});
	$("#Registrar").click(function(event){
		$("#ContenidoBuscar").load('registrar.html #ContenidoRegistrar');
		$("#Registrar").addClass("active");
		$("#Buscar,#Pedido").removeClass("active");
	});
	$("#Pedido").click(function(event){
		$("#ContenidoBuscar").load('pedido.php');
		$("#Pedido").addClass("active");
		$("#Buscar,#Registrar").removeClass("active");
	});
});


