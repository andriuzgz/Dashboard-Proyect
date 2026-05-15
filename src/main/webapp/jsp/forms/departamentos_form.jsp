<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Proveedor" %>
<%@ page import="model.Usuario" %>

<div class="modal-bar">Operacion Creacion [C]</div>

<form class="grid-content-lista" action="<%=request.getContextPath()%>/cud/departamentos" method="post">

	<input type="hidden" name="action" value="insert">
	<!-- NOMBRE DEPARTAMENTO -->
	<label>Nombre Departamento:</label> 
	<input class="user-search" type="text" name="nombre" required> 
		
	<!-- CODIGO DEPARTAMENTO -->	
	<label>Codigo Departamento:</label> 
	<input class="user-search" type="text" name="codigo" required>

	<!--  RESPONSABLE  -->
	<label>Responsable:</label>
	<select class="select" name="usuario" required>
		<option value="">Seleccionar Usuario</option>
		
		<%
		@SuppressWarnings("unchecked")
		List<Usuario> usuario = (List<Usuario>) request.getAttribute("usuario");
		
		for (Usuario u : usuario) {
		%>

		<option value="<%=u.getId()%>"><%=u.getNombre()%> <%=u.getApellidos()%></option>

		<% } %>
	</select>
	
	<!-- ASIGNAR PROVEEDORES -->
	<label>Asignar Proveedor:</label>
	<select name="proveedores" class="select" multiple>

</select>
	
	<!-- BOTONES -->
	<div class="modal-actions">
		<button type="button" class="button" onclick="cerrarModal()">Cancelar</button>
		<button type="submit" class="button confirm">Añadir</button>
	</div>
	
</form>