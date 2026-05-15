<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="model.Usuario"%>

<!-- TITLE -->
<div class="modal-bar" id="modal-title"></div>

<form class="grid-content-lista"
	action="<%=request.getContextPath()%>/cud/departamentos" method="post">

	<!-- ACTION -->
	<input type="hidden" name="action" id="form-action" value="crear">

	<!-- ID -->
	<input type="hidden" name="id" id="edit-id">

	<!-- NOMBRE -->
	<label>Nombre Departamento:</label> <input class="user-search"
		type="text" name="nombre" id="edit-nombre" required>

	<!-- CODIGO -->
	<label>Codigo Departamento:</label> <input class="user-search"
		type="text" name="codigo" id="edit-codigo" required>

	<!-- RESPONSABLE -->
	<label>Responsable:</label> <select class="select" name="responsable"
		id="edit-responsable" required>

		<option value="">Seleccionar Responsable</option>

		<%
		@SuppressWarnings("unchecked")
		List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuario");

		for (Usuario u : usuarios) {
		%>

		<option value="<%=u.getId()%>">

			<%=u.getNombre()%>
			<%=u.getApellidos()%>

		</option>

		<%
		}
		%>

	</select>

	<!-- BOTONES -->
	<div class="modal-actions">

		<button type="button" class="button" onclick="cerrarModal()">

			Cancelar</button>

		<button type="submit" class="button confirm" id="submit-button">

		</button>

	</div>

</form>