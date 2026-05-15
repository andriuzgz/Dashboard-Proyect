<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Departamento"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Permiso"%>
<%@ page import="utils.PermisosUtil"%>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
@SuppressWarnings("unchecked")
List<Departamento> departamentos = (List<Departamento>) request.getAttribute("departamentos");
%>

<!-- Include Form -->
<div id="usuarios-form-template" style="display:none;">
    <jsp:include page="/jsp/forms/departamentos_form.jsp"/>
</div>

<!-- Include Modal -->
<jsp:include page="/jsp/components/modal.jsp" />
<jsp:include page="/jsp/modal/modal_delete.jsp" />

<title>Departamentos</title>
<div class="div-container departamentos">
	<div class="title">
		<a>Departamentos</a>
	</div>
	<p class="text">Lista de departamentos en el sistema</p>
	<div class="grid-content-departamento">
		<div class="content">
			<div class="content-item">
		<% if (PermisosUtil.tienePermiso(permisos, "departamentos", "crear")) { %>
				<a class="content-text">Crear Departamento</a>
		<% } else {%>
				<a class="content-text">Buscar Departamentos</a>
		<% } %>
			</div>
		
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<% if (PermisosUtil.tienePermiso(permisos, "departamentos", "crear")) { %>
						<th class="th-table" colspan="2">Nuevo Departamento</th>
						<% } %>
						<th class="th-table" colspan="2">Filtrar Departamento</th>
					</tr>
					<tr class="tr-table">
						<% if (PermisosUtil.tienePermiso(permisos, "departamentos", "crear")) { %>
						<td class="td-table">Crea un nuevo departamento</td>
						<td class="td-table">
							<button title="Crear Usuario" class="button-action add" onclick="modalCrear()">📄</button>
						</td>
						<% } %>
						<td class="td-table">Filtra los departamentos para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Lista de departamentos</a>
			</div>
			<div class="content-about-table">
				<table class="table">
					<tr>
						<th class="th-table">ID Departamento</th>
						<th class="th-table">Nombre</th>
						<th class="th-table">Codigo</th>
						<th class="th-table">Responsable</th>
						<th class="th-table">Año</th>
						<th class="th-table">Presupuesto</th>
						<th class="th-table">Proveedores</th>
						<th class="th-table">Accion</th>
					</tr>
					<%
					if (departamentos != null && !departamentos.isEmpty()) {
						for (Departamento d : departamentos) {
					%>
					<tr class="tr-table">
						<td class="td-table"><%=d.getId()%></td>
						<td class="td-table"><%=d.getNombre()%></td>
						<td class="td-table"><%=d.getCodigo()%></td>
						<td class="td-table"><%=d.getResponsable()%></td>
						<td class="td-table">
						    <%= new java.text.SimpleDateFormat("yyyy").format(d.getAnioFecha()) %>
						</td>
						<td class="td-table"><%=d.getPresupuesto()%> €</td>
						<td class="td-table"><%=d.getContarProv()%></td>
						<td class="td-table">
						<% if (PermisosUtil.tienePermiso(permisos, "departamentos", "editar")) { %>
						    <button class="button-action" onclick="abrirModal()">✏️</button>
						<% } %>
							<button class="button-action" onclick="abrirModal()">🔍</button>
						<% if (PermisosUtil.tienePermiso(permisos, "departamentos", "eliminar")) { %>
							<button class="button-action delete" 
							onclick="modalEliminar('<%=d.getId()%>','<%=d.getNombre()%>')">🗑️</button> 
						<% } %>
						</td>
					</tr>
					<% }
					} else {
					%>
					<tr class="tr-table">
						<td class="td-table" colspan="8">No hay departamentos</td>
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