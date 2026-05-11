<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Pedido"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Permiso" %>
<%@ page import="utils.PermisosUtil" %>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
@SuppressWarnings("unchecked")
List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
%>

<title>Pedidos</title>
<div class="div-container pedidos">
	<div class="title">
		<a>Pedidos</a>
	</div>
	<p class="text">Lista de pedidos en el sistema</p>
	<div class="grid-content-departamento">
	<% if (PermisosUtil.tienePermiso(permisos, "pedidos", "crear")) { %>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Crear Pedido</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="2">Nuevo Pedido</th>
						<th class="th-table" colspan="2">Filtrar Pedidos</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Crear un nuevo pedido</td>
						<td class="td-table">
							<button title="Crear Usuario" class="button-action add">📄</button>
						</td>
						<td class="td-table">Filtra los pedidos para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<% } else { %>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Buscar Pedidos</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="2">Filtrar Pedidos</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Filtra los pedidos para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<% } %>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Lista de pedidos</a>
			</div>
			<div class="content-about-table">
				<table class="table">
					<tr>
						<th class="th-table">ID Pedido</th>
						<th class="th-table">Numero Pedido</th>
						<th class="th-table">Factura</th>
						<th class="th-table">Usuario</th>
						<th class="th-table">Departamento</th>
						<th class="th-table">Proveedor</th>
						<th class="th-table">Fecha Pedido</th>
						<th class="th-table">Importe Total</th>
						<th class="th-table">Estado</th>
						<th class="th-table">Accion</th>
					</tr>
					<%
					if (pedidos != null && !pedidos.isEmpty()) {
						for (Pedido p : pedidos) {
					%>
					<tr class="tr-table">
						<td class="td-table"><%=p.getId()%></td>
						<td class="td-table"><%=p.getNumero()%>/<%=p.getAnio()%></td>
						<td class="td-table"><%=p.getFactura() != null ? p.getFactura() : "Sin Factura"%></td>
						<td class="td-table"><%=p.getUsuario()%></td>
						<td class="td-table"><%=p.getDepartamento()%></td>
						<td class="td-table"><%=p.getProveedor()%></td>
						<td class="td-table"><%=p.getFecha()%></td>
						<td class="td-table"><%=p.getInversion()%> €</td>
						<td class="td-table <%=p.getClaseEstado()%>"><%=p.getEstado()%></td>
						<td class="td-table">
						<% if (PermisosUtil.tienePermiso(permisos, "pedidos", "editar")) { %>
						    <button class="button-action">✏️</button>
						<% } %>
							<button class="button-action">🔍</button>
						<% if (PermisosUtil.tienePermiso(permisos, "pedidos", "eliminar")) { %>
						    <button class="button-action delete">🗑️</button>
						<% } %>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="10" class="td-table" style="text-align: center;">
							No hay pedidos disponibles</td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</div>
	</div>
</div>