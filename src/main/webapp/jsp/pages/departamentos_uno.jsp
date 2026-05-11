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

<title>Departamentos</title>
<div class="div-container departamentos">
	<div class="title">
		<a>Departamentos</a>
	</div>
	<p class="text">Lista de departamentos en el sistema</p>
	<div class="grid-content-departamento">
		<% if (PermisosUtil.tienePermiso(permisos, "departamentos", "crear")) { %>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Crear Departamento</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="2">Nuevo Departamento</th>
						<th class="th-table" colspan="2">Filtrar Departamento</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Crea un nuevo departamento</td>
						<td class="td-table">
							<button title="Crear Usuario" class="button-action add">📄</button>
						</td>
						<td class="td-table">Filtra los departamentos para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<% } else { %>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Buscar Departamento</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="2">Filtrar Departamento</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Filtra los departamentos para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<% } %>
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
						    <button class="button-action">✏️</button>
						<% } %>
							<button class="button-action">🔍</button>
						<% if (PermisosUtil.tienePermiso(permisos, "departamentos", "eliminar")) { %>
						    <button class="button-action delete">🗑️</button>
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