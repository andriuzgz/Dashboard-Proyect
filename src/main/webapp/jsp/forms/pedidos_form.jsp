<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="model.Usuario"%>
<%@ page import="model.Proveedor"%>

<%
@SuppressWarnings("unchecked")
List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
%>

<%
@SuppressWarnings("unchecked")
List<Proveedor> proveedores = (List<Proveedor>) request.getAttribute("proveedores");
%>

<div class="modal-bar" id="modal-title"></div>

<form class="grid-content-lista"
	action="<%=request.getContextPath()%>/cud/pedidos" method="post">

	<!-- ACTION -->
	<input type="hidden" name="action" id="form-action" value="crear">

	<!-- ID -->
	<input type="hidden" name="id" id="edit-id">

	<!-- USUARIO -->
	<div id="grupo-usuario">

		<label>Usuario:</label> <select class="select" name="usuario"
			id="edit-usuario" required>

			<option value="">Seleccionar Usuario</option>

			<%
			if (usuarios != null) {

				for (Usuario u : usuarios) {
			%>

			<option value="<%=u.getId()%>"
				data-departamento="<%=u.getDepartamentoId()%>">

				<%=u.getNombre()%>
				<%=u.getApellidos()%> -

				<%=u.getDepartamentoNombre()%> [<%=u.getDepartamentoCodigo()%>]

			</option>

			<%
			}
			}
			%>

		</select>

	</div>

	<!-- PROVEEDOR -->
	<div id="grupo-proveedor">

		<label>Proveedor:</label> <select class="select" name="proveedor"
			id="edit-proveedor" required>

			<option value="">Seleccionar Proveedor</option>

			<%
			if (proveedores != null) {

				for (Proveedor p : proveedores) {
			%>

			<option value="<%=p.getId()%>">

				<%=p.getNombre()%>

			</option>

			<%
			}
			}
			%>

		</select>

	</div>

	<!-- CANTIDAD -->
	<label>Cantidad:</label> <input class="user-search" type="number"
		name="cantidad" id="edit-cantidad" required>

	<!-- OBSERVACIONES -->
	<label>Observaciones:</label>

	<textarea class="textarea" name="observaciones" id="edit-observaciones">

	</textarea>

	<!-- HIDDEN CONTEXT -->
	<div id="hidden-context"></div>

	<!-- BOTONES -->
	<div class="modal-actions">

		<button type="button" class="button" onclick="cerrarModal()">

			Cancelar</button>

		<button type="submit" class="button confirm" id="submit-button">
			Crear</button>

	</div>

</form>