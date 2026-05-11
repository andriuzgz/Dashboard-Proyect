<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Presupuesto" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Permiso" %>
<%@ page import="utils.PermisosUtil" %>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
@SuppressWarnings("unchecked")
List<Presupuesto> presupuestos = (List<Presupuesto>) request.getAttribute("presupuestos");
%>

<title>Presupuestos</title>
<div class="div-container presupuestos">
	<div class="title">
		<a>Presupuestos</a>
	</div>
	<p class="text">Lista de presupuestos en el sistema</p>
	<div class="grid-content-departamento">
	<% if (PermisosUtil.tienePermiso(permisos, "presupuestos", "crear")) { %>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Crear Presupuesto</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="2">Nuevo Presupuesto</th>
						<th class="th-table" colspan="3">Filtrar Presupuesto</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Crea un nuevo presupuesto para el
							departamento</td>
						<td class="td-table">
							<button title="Crear Usuario" class="button-action add">📄</button>
						</td>
						<td class="td-table">Filtra los prespuestos para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<% } else { %>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Buscar Presupuestos</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="3">Filtrar Presupuesto</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Filtra los prespuestos para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<% } %>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Lista de presupuestos</a>
			</div>
			<div class="content-about-table">
				<table class="table">
					<tr>
						<th class="th-table">ID Presupuesto</th>
						<th class="th-table">Departamento</th>
						<th class="th-table">Año</th>
						<th class="th-table">Importe Asignado</th>
						<th class="th-table">Importe Usado</th>
						<th class="th-table">Importe Restante</th>
						<th class="th-table">Estado</th>
						<th class="th-table">Accion</th>
					</tr>
					<%
					if (presupuestos != null && !presupuestos.isEmpty()) {
						for (Presupuesto p : presupuestos) {
					%>
					<tr class="tr-table">
						<td class="td-table"><%=p.getId()%></td>
						<td class="td-table"><%=p.getDepartamento()%></td>
						<td class="td-table"><%=p.getAnio()%></td>
						<td class="td-table"><%= p.getImporte() %> €</td>
						<td class="td-table"><%= p.getGastado() %> €</td>
						<td class="td-table"><%= p.getRestante() %> €</td>
						<td class="td-table <%=p.getClaseEstado()%>"><%= p.getEstadoDinamico() %></td>
						<td class="td-table">
						<% if (PermisosUtil.tienePermiso(permisos, "presupuestos", "editar")) { %>
						    <button class="button-action">✏️</button>
						<% } %>
							<button class="button-action">🔍</button>
						<% if (PermisosUtil.tienePermiso(permisos, "presupuestos", "eliminar")) { %>
						    <button class="button-action delete">🗑️</button>
						<% } %>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="6" class="td-table" style="text-align: center;">
							No hay presupuestos disponibles</td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</div>
	</div>
</div>