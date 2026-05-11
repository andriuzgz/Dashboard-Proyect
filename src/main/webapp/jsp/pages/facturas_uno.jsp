<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Factura"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Permiso" %>
<%@ page import="utils.PermisosUtil" %>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
@SuppressWarnings("unchecked")
List<Factura> facturas = (List<Factura>) request.getAttribute("facturas");
%>

<title>Facturas</title>
<div class="div-container facturas">
	<div class="title">
		<a>Facturas</a>
	</div>
	<p class="text">Lista de facturas en el sistema</p>
	<div class="grid-content-departamento">
	<% if (PermisosUtil.tienePermiso(permisos, "facturas", "crear")) { %>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Crear Factura</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="2">Nueva Factura</th>
						<th class="th-table" colspan="3">Filtrar Facturas</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Crear una nueva factura</td>
						<td class="td-table">
							<button title="Crear Usuario" class="button-action add">📄</button>
						</td>
						<td class="td-table">Filtra las facturas para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<% } else { %>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Buscar Facturas</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="3">Filtrar Facturas</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Filtra las facturas para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<% } %>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Lista de facturas</a>
			</div>
			<div class="content-about-table">
				<table class="table">
					<tr>
						<th class="th-table">ID Factura</th>
						<th class="th-table">Pedido Asociado</th>
						<th class="th-table">Fecha Factura</th>
						<th class="th-table">Vencimiento</th>
						<th class="th-table">Numero Factura</th>
						<th class="th-table">Importe</th>
						<th class="th-table">Estado</th>
						<th class="th-table">Accion</th>
					</tr>
					<%
					if (facturas != null && !facturas.isEmpty()) {
						for (Factura f : facturas) {
					%>
					<tr class="tr-table">
						<td class="td-table"><%=f.getId()%></td>
						<td class="td-table"><%=f.getPedidos() != null ? f.getPedidos() : "Pedido Sin Factura"%></td>
						<td class="td-table"><%=f.getFechaFactura()%></td>
						<td class="td-table"><%=f.getFechaVencimiento() != null ? f.getFechaVencimiento() : "Sin Fecha"%></td>
						<td class="td-table"><%=f.getNumero()%></td>
						<td class="td-table"><%=f.getImporte()%> €</td>
						<td class="td-table <%=f.getClaseEstado()%>"><%=f.getEstado()%></td>
						<td class="td-table">
						<% if (PermisosUtil.tienePermiso(permisos, "facturas", "editar")) { %>
						    <button class="button-action">✏️</button>
						<% } %>
							<button class="button-action">🔍</button>
						<% if (PermisosUtil.tienePermiso(permisos, "facturas", "eliminar")) { %>
						    <button class="button-action delete">🗑️</button>
						<% } %>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="7" class="td-table" style="text-align: center;">
							No hay facturas disponibles</td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</div>
	</div>
</div>