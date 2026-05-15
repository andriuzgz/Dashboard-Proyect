<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="modal-bar">Operacion Creacion [C]</div>

<form class="grid-content-lista" action="<%=request.getContextPath()%>/cud/PedidosCUD" method="post">
	<input type="hidden" name="action" value="insert">
	
	<!-- NOMBRE PROVEEDOR -->
	<label>Nombre Proveedor:</label> 
	<input class="user-search" type="text" name="nombre" required> 
		
	<!-- IDENTIFICACION PROVEEDOR -->	
	<label>CIF:</label> 
	<input class="user-search" type="text" name="cif" required>

	<!-- TELEFONO PROVEEDOR -->	
	<label>Telefono:</label> 
	<input class="user-search" type="text" name="cif" required>
	
	<!-- CORREO ELECTRONICO -->	
	<label>Correo Electronico:</label> 
	<input class="user-search" type="email" name="email" required>
	
	<!-- BOTONES -->
	<div class="modal-actions">
		<button type="button" class="button" onclick="cerrarModal()">Cancelar</button>
		<button type="submit" class="button confirm">Añadir</button>
	</div>
	
</form>