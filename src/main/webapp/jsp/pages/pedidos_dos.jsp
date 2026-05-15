<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Pedido"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Permiso"%>
<%@ page import="utils.PermisosUtil"%>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
@SuppressWarnings("unchecked")
List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
%>

<!-- Include Form -->
<div id="usuarios-form-template" style="display:none;">
    <jsp:include page="/jsp/forms/pedidos_form.jsp"/>
</div>

<!-- Include Modal -->
<jsp:include page="/jsp/components/modal.jsp" />
<jsp:include page="/jsp/modal/modal_delete.jsp" />

<title>Pedidos</title>
<div class="div-container pedidos">
	<div class="title">
		<a>Pedidos</a>
	</div>
	<p class="text">Tus Pedidos realizados del Departamento</p>
	<div class="grid-content-pedidos_dos">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Pedidos</a>
			</div>
			<div class="content-about-item">
				<table class="table-perfil">
					<%
					if (PermisosUtil.tienePermiso(permisos, "pedidos", "crear")) {
					%>
					<tr class="tr-perfil">
						<td class="td-perfil">Crear Pedido</td>
						<td class="td-perfil">
							<button class="button-action" onclick="modalCrear()">📄</button>
						</td>
					</tr>
					<%
					}
					%>
					<tr class="tr-perfil">
						<td class="td-perfil">Buscar Pedidos</td>
						<td class="td-perfil"><input class="user-search" type=search>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Resumen de Mis Pedidos</a>
			</div>
			<div class="content-about-item">
				<table class="table-perfil">
					<tr class="tr-perfil">
						<td class="td-perfil">Pedido Reciente:</td>
						<td class="td-perfil">N/A</td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Pedidos Realizados:</td>
						<td class="td-perfil">0</td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Pedidos Pendientes de Factura:</td>
						<td class="td-perfil">0</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="grid-content-lista">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Mis Pedidos</a>
			</div>
			<div class="content-about-table">
				<table class="table">
					<tr>
						<th class="th-table">ID Pedido</th>
						<th class="th-table">Numero Pedido</th>
						<th class="th-table">Factura</th>
						<th class="th-table">Proveedor</th>
						<th class="th-table">Fecha Pedido</th>
						<th class="th-table">Importe Total</th>
						<th class="th-table">Estado</th>
						<th class="th-table">Accion</th>
					</tr>
					<% if (pedidos != null && !pedidos.isEmpty()) {
						for (Pedido p : pedidos) { %>

					<tr class="tr-table">
						<td class="td-table"><%=p.getId()%></td>
						<td class="td-table"><%=p.getNumero()%>/<%=p.getAnio()%></td>
						<td class="td-table"><%=p.getFecha()%></td>
						<td class="td-table"><%=p.getProveedor()%></td>
						<td class="td-table"><%=p.getFactura() != null ? p.getFactura() : "Sin Factura"%></td>
						<td class="td-table"><%=p.getInversion()%> €</td>
						<td class="td-table <%=p.getClaseEstado()%>"><%=p.getEstado()%></td>
						<td class="td-table">
							<button class="button-action delete"
							onclick="modalEliminar('<%=p.getId()%>', 'Pedido <%=p.getNumero()%>/<%=p.getAnio()%>')">🗑️</button>
						</td>
					</tr>
					<% } } else { %>

					<tr class="tr-table">
						<td class="td-table" colspan="7">No hay pedidos registrados</td>
					</tr>
					<% } %>
				</table>
			</div>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/js/modal.js"></script>
<script src="<%=request.getContextPath()%>/js/modal_delete.js"></script>
<script src="<%=request.getContextPath()%>/js/modal_create.js"></script>