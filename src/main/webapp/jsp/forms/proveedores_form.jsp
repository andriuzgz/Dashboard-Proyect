<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal-bar" id="modal-title"></div>

<form class="grid-content-lista"
	action="<%=request.getContextPath()%>/cud/proveedores" method="post">

	<!-- ACTION -->
	<input type="hidden" name="action" id="form-action" value="crear">

	<!-- ID -->
	<input type="hidden" name="id" id="edit-id">

	<!-- NOMBRE -->
	<label>Proveedor:</label> <input class="user-search" type="text"
		name="nombre" id="edit-nombre" required>

	<!-- CIF -->
	<label>CIF:</label> <input class="user-search" type="text" name="cif"
		id="edit-cif" required>

	<!-- TELEFONO -->
	<label>Telefono:</label> <input class="user-search" type="text"
		name="telefono" id="edit-telefono" required>

	<!-- EMAIL -->
	<label>Email:</label> <input class="user-search" type="email"
		name="email" id="edit-email" required>

	<!-- BOTONES -->
	<div class="modal-actions">

		<button type="button" class="button" onclick="cerrarModal()">

			Cancelar</button>

		<button type="submit" class="button confirm" id="submit-button">

		</button>

	</div>

</form>