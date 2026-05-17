<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="model.Departamento"%>

<%
@SuppressWarnings("unchecked")
List<Departamento> deps = (List<Departamento>) request.getAttribute("departamentos");
%>

<div class="modal-bar" id="modal-title"></div>

<form id="presupuestos-form-template" class="grid-content-lista"
	action="<%=request.getContextPath()%>/cud/presupuestos" method="post">

	<input type="hidden" name="action" id="form-action" value="crear">

	<input type="hidden" name="id" id="edit-id">

	<!-- DEPARTAMENTO -->

	<div id="grupo-departamento">

		<label>Departamento:</label> <select class="select"
			name="departamento" id="edit-departamento" required>

			<option value="">Seleccionar Departamento</option>

			<%
			if (deps != null) {

				for (Departamento d : deps) {
			%>

			<option value="<%=d.getId()%>">

				<%=d.getNombre()%>

			</option>

			<%
			}
			}
			%>

		</select>

	</div>

	<!-- AÑO -->

	<div id="grupo-anio">

		<label>Año:</label> <input type="number" name="anio" id="edit-anio"
			class="user-search" value="2026" required>

	</div>

	<!-- IMPORTE -->

	<label>Importe:</label> <input type="number" step="0.01" name="importe"
		id="edit-importe" class="user-search" placeholder="Ejemplo: 1000.00"
		required>

	<!-- ESTADO -->

	<div id="grupo-estado">

		<input type="hidden" name="estado" id="edit-estado" value="1">

	</div>

	<!-- BOTONES -->

	<div class="modal-actions">

		<button type="button" class="button" onclick="cerrarModal()">

			Cancelar</button>

		<button type="submit" class="button confirm" id="submit-button">

			Asignar</button>

	</div>

</form>