<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Rol"%>
<%@ page import="model.Departamento"%>

<!-- INNER HTML -->
<div class="modal-bar" id="modal-title"></div>

<form class="grid-content-lista"
	action="<%=request.getContextPath()%>/cud/usuarios" method="post">
	<input type="hidden" name="action" id="form-action" value="crear">
	<input type="hidden" name="id" id="edit-id">

	<!-- NOMBRE -->
	<label>Nombre:</label> <input class="user-search" type="text"
		name="nombre" id="edit-nombre" required>

	<!-- APELLIDOS -->
	<label>Apellidos:</label> <input class="user-search" type="text"
		name="apellidos" id="edit-apellidos" required>

	<!-- FECHA NACIMIENTO -->
	<label>Fecha Nacimiento:</label> <input class="user-search" type="date"
		id="edit-fecha" name="fechaNacimiento">

	<!-- ROL -->
	<label>Asignar Rol:</label> <select class="select" name="rol"
		id="edit-rol" required>

		<option value="">Seleccionar Rol</option>

		<%
		@SuppressWarnings("unchecked")
		List<Rol> roles = (List<Rol>) request.getAttribute("roles");
		for (Rol r : roles) {
		%>

		<option value="<%=r.getId()%>"><%=r.getNombre()%></option>

		<%
		}
		%>
	</select>

	<!-- DEPARTAMENTO -->
	<label>Departamento:</label> <select class="select" name="departamento"
		id="edit-departamento" required>
		<option value="">Seleccionar Departamento</option>

		<%
		@SuppressWarnings("unchecked")
		List<Departamento> deps = (List<Departamento>) request.getAttribute("departamentos");
		for (Departamento d : deps) {
		%>

		<option value="<%=d.getId()%>"><%=d.getNombre()%> [<%=d.getCodigo()%>]
		</option>

		<%
		}
		%>
	</select>

	<div id="password-fields">

		<!-- PASSWORD -->
		<label>Contraseña:</label> <input class="user-search" type="password"
			name="password" required>

		<!-- CONFIRM -->
		<label>Confirmar Contraseña:</label> <input class="user-search"
			type="password" name="confirm_password" required>

	</div>

	<!--  ESTADO POR DEFAULT - ACTIVO -->
	<input type="hidden" name="estado" id="edit-estado" value="1">

	<!-- BOTONES -->
	<div class="modal-actions">
		<button type="button" class="button" onclick="cerrarModal()">Cancelar</button>
		<button type="submit" class="button confirm" id="submit-button">

		</button>
	</div>

</form>
