<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Permiso"%>
<%@ page import="model.Factura"%>
<%@ page import="utils.PermisosUtil"%>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
@SuppressWarnings("unchecked")
List<Factura> facturas = (List<Factura>) request.getAttribute("facturas");
%>

<!-- Include Modal -->
<jsp:include page="/jsp/components/modal.jsp" />
<jsp:include page="/jsp/modal/modal_delete.jsp" />

<title>Facturas</title>
<div class="div-container facturas">
	<div class="title">
		<a>Facturas</a>
	</div>
	<p class="text">Tus facturas de los pedidos realizados</p>
	<div class="grid-content-pedidos_dos">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Facturas</a>
			</div>
			<div class="content-about-item">
				<table class="table-perfil">
					<tr class="tr-perfil">
						<td class="td-perfil">Buscar Facturas</td>
						<td class="td-perfil"><input class="user-search" type=search>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Resumen de Facturas</a>
			</div>
			<div class="content-about-item">
				<table class="table-perfil">
					<tr class="tr-perfil">
						<td class="td-perfil">Factura Reciente:</td>
						<td class="td-perfil">N/A</td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Facturas Pagadas:</td>
						<td class="td-perfil">0</td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Facturas Pendientes de Pagar:</td>
						<td class="td-perfil">0</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="grid-content-departamento">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Mis Facturas</a>
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
						<td class="td-table"><%=f.getPedidos()%></td>
						<td class="td-table"><%=f.getFechaFactura()%></td>
						<td class="td-table"><%=f.getFechaVencimiento()%></td>
						<td class="td-table"><%=f.getNumero()%></td>
						<td class="td-table"><%=f.getImporte()%> €</td>
						<td class="td-table <%=f.getClaseEstado()%>"><%=f.getEstado()%></td>
						<td class="td-table">
							<button class="button-action" onclick="abrirModal()">🔍</button>
						<% if (PermisosUtil.tienePermiso(permisos, "facturas", "eliminar")) { %>
							<button class="button-action delete"
							onclick="modalEliminar('<%=f.getId()%>','<%=f.getNumero()%>')">🗑️</button>
						<% } %>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr class="tr-table">
						<td class="td-table" colspan="8">No hay facturas registradas
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
<script src="<%=request.getContextPath()%>/js/modal.js"></script>
<script src="<%=request.getContextPath()%>/js/modal_delete.js"></script>