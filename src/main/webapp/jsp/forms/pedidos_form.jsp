<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Proveedor" %>

<div class="modal-bar">Operacion Creacion [C]</div>

<form class="grid-content-lista" action="<%=request.getContextPath()%>/cud/pedidos" method="post">
	<input type="hidden" name="action" value="insert">
	
	<!--  ORDENAR PEDIDO -->
	<label>Ordenar</label>
	<textarea name="observaciones"></textarea>
	
	<!-- PROVEEDOR -->
	<label>Proveedor:</label> <select class="select" name="departamento" required>
		<option value="">Seleccionar Proveedor</option>

		<%
		@SuppressWarnings("unchecked")
		List<Proveedor> proveedores = (List<Proveedor>) request.getAttribute("proveedores");
		
		for (Proveedor p : proveedores) {
		%>

		<option value="<%=p.getId()%>"><%=p.getNombre()%></option>

		<% } %>
	</select>
	
	<!-- BOTONES -->
	<div class="modal-actions">
		<button type="button" class="button" onclick="cerrarModal()">Cancelar</button>
		<button type="submit" class="button confirm">Añadir</button>
	</div>
	
</form>