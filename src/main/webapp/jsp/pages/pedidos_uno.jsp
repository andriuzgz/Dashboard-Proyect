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
<div id="usuarios-form-template" style="display: none;">
	<jsp:include page="/jsp/forms/pedidos_form.jsp" />
</div>

<!-- Include Modal -->
<jsp:include page="/jsp/components/modal.jsp" />
<jsp:include page="/jsp/modal/modal_delete.jsp" />

<title>Pedidos</title>
<div class="div-container pedidos">
	<div class="title">
		<a>Pedidos</a>
	</div>
	<p class="text">Lista de pedidos en el sistema</p>
	<div class="grid-content-pedidos">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Crear Pedido</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<%
						if (PermisosUtil.tienePermiso(permisos, "pedidos", "crear")) {
						%>
						<th class="th-table" colspan="2">Nuevo Pedido</th>
						<%
						}
						%>
						<th class="th-table" colspan="2">Filtrar Pedidos</th>
					</tr>
					<tr class="tr-table">
						<%
						if (PermisosUtil.tienePermiso(permisos, "pedidos", "crear")) {
						%>
						<td class="td-table">Crear un nuevo pedido</td>
						<td class="td-table">
							<button title="Crear Usuario" class="button-action add"
								onclick="modalCrear()">📄</button>
						</td>
						<%
						}
						%>
						<td class="td-table">Filtra los pedidos para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
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
							<%
							if (PermisosUtil.tienePermiso(permisos, "pedidos", "editar")) {
							%>
							<button class="button-action" onclick="abrirModal()">✏️</button>
							<%
							}
							%>
							<button class="button-action" onclick="abrirModal()">🔍</button>
							<%
							if (PermisosUtil.tienePermiso(permisos, "pedidos", "eliminar")) {
							%>
							<button class="button-action delete"
								onclick="modalEliminar('<%=p.getId()%>','<%=p.getNumero()%>/<%=p.getAnio()%>')">🗑️</button>
							<%
							}
							%>
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
<script src="<%=request.getContextPath()%>/js/modal/modal.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/modal_delete.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/modal_create.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/modal_update.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/pedidos_view.js"></script>