<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Proveedor"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Permiso"%>
<%@ page import="utils.PermisosUtil"%>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
@SuppressWarnings("unchecked")
List<Proveedor> proveedores = (List<Proveedor>) request.getAttribute("proveedores");
%>

<!-- Include View -->
<div id="proveedores-view-template" style="display: none;">
	<jsp:include page="/jsp/views/proveedores_view.jsp" />
</div>

<!-- Include Form -->
<div id="proveedores-form-template" style="display: none;">
	<jsp:include page="/jsp/forms/proveedores_form.jsp" />
</div>

<!-- Include Update -->
<div id="proveedores-update-template" style="display: none;">
	<jsp:include page="/jsp/forms/proveedores_form.jsp" />
</div>

<!-- Include Modal -->
<jsp:include page="/jsp/components/modal.jsp" />
<jsp:include page="/jsp/modal/modal_delete.jsp" />

<title>Proveedores</title>
<div class="div-container proveedores">
	<div class="title">
		<a>Proveedores</a>
	</div>
	<p class="text">Lista de proveedores en el sistema</p>
	<div class="grid-content-departamento">
		<%
		if (PermisosUtil.tienePermiso(permisos, "proveedores", "crear")) {
		%>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Crear Proveedor</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="2">Nuevo Proveedor</th>
						<th class="th-table" colspan="3">Filtrar Proveedores</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Crear un nuevo proveedor</td>
						<td class="td-table">
							<button title="Crear Usuario" class="button-action add"
								onclick="modalCrearProveedor()">📄</button>
						</td>
						<td class="td-table">Filtra los proveedores para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<%
		} else {
		%>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Buscar Proveedores</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="3">Filtrar Proveedores</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Filtra los proveedores para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<%
		}
		%>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Lista de proveedores</a>
			</div>
			<div class="content-about-table">
				<table class="table">
					<tr>
						<th class="th-table">ID Proveedor</th>
						<th class="th-table">Nombre Proveedor</th>
						<th class="th-table">CIF</th>
						<th class="th-table">Fecha Alta</th>
						<th class="th-table">Fecha Baja</th>
						<th class="th-table">Departamentos</th>
						<th class="th-table">Estado</th>
						<th class="th-table">Accion</th>
					</tr>
					<%
					for (Proveedor p : proveedores) {
					%>
					<tr class="tr-table">
						<td class="td-table"><%=p.getId()%></td>
						<td class="td-table"><%=p.getNombre()%></td>
						<td class="td-table"><%=p.getCif()%></td>
						<td class="td-table"><%=p.getFechaAlta()%></td>
						<td class="td-table"><%=p.getFechaBaja() != null ? p.getFechaBaja() : "----/--/--"%></td>
						<td class="td-table"><%=p.getContarDept()%></td>
						<td class="td-table <%=p.getClaseEstado()%>"><%=p.getEstado()%></td>
						<td class="td-table">
							<%
							if (PermisosUtil.tienePermiso(permisos, "proveedores", "editar")) {
							%>
							<button class="button-action" data-id="<%=p.getId()%>"
								data-nombre="<%=p.getNombre()%>" data-cif="<%=p.getCif()%>"
								data-telefono="<%=p.getTelefono()%>"
								data-email="<%=p.getEmail()%>"
								data-estado="<%=p.getEstadoInt()%>"
								onclick="modalEditarProveedor(this)">✏️</button> <%
 }
 %>
							<button class="button-action" data-id="<%=p.getId()%>"
								data-nombre="<%=p.getNombre()%>" data-cif="<%=p.getCif()%>"
								data-telefono="<%=p.getTelefono()%>"
								data-email="<%=p.getEmail()%>"
								data-fechaalta="<%=p.getFechaAlta()%>"
								data-fechabaja="<%=p.getFechaBaja()%>"
								data-departamentos="<%=p.getContarDept()%>"
								data-estado="<%=p.getEstado()%>"
								onclick="modalVerProveedor(this)">🔍</button> <%
 if (PermisosUtil.tienePermiso(permisos, "proveedores", "editar")) {
 %>
							<form method="post"
								action="<%=request.getContextPath()%>/cud/proveedores"
								style="display: inline;">
								<input type="hidden" name="action" value="toggle"> <input
									type="hidden" name="id" value="<%=p.getId()%>">
								<button class="button-action" type="submit">🔄️</button>
							</form> <%
 }
 %> <%
 if (PermisosUtil.tienePermiso(permisos, "proveedores", "eliminar")) {
 %>
							<button class="button-action delete"
								onclick="modalEliminar('<%=p.getId()%>','<%=p.getNombre()%>')">🗑️</button>
							<%
							}
							%>
						</td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/js/modal/modal.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/modal_delete.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/modal_create.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/modal_update.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/modal_view.js"></script>