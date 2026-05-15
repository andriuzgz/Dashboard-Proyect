<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal-bar">Operacion Creacion [C]</div>

<form class="grid-content-lista" action="<%=request.getContextPath()%>/cud/PedidosCUD" method="post">
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
	</select>
	
	<!-- PRESUPUESTO  -->
	<label>Presupuesto:</label>
	<input class="user-search" type="text" name="presupuesto">
	
	<!-- BOTONES -->
	<div class="modal-actions">
		<button type="button" class="button" onclick="cerrarModal()">Cancelar</button>
		<button type="submit" class="button confirm">Añadir</button>
	</div>
	
</form>