<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal-bar">Operacion Creacion [C]</div>

<form class="grid-content-lista" action="<%=request.getContextPath()%>/cud/PedidosCUD" method="post">
	<input type="hidden" name="action" value="insert">
	
	<!-- PEDIDO ASOCIADO -->
	<label>Pedido Asociado:</label>
	<select class="select" name="pedidos" required> 
		<option value="">Seleccionar Pedido</option>
	</select>
	
	<!-- IMPORTE -->
	<label>Importe:</label>
	<input type="text" class="select" placeholder="Ejemplo: 1000, 2000 en Euros (€)">
	
	<!-- BOTONES -->
	<div class="modal-actions">
		<button type="button" class="button" onclick="cerrarModal()">Cancelar</button>
		<button type="submit" class="button confirm">Añadir</button>
	</div>
	
</form>