<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Presupuesto"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Permiso"%>
<%@ page import="utils.PermisosUtil"%>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
@SuppressWarnings("unchecked")
List<Presupuesto> presupuestos = (List<Presupuesto>) request.getAttribute("presupuestos");
%>

<!-- Include Form -->
<div id="presupuestos-form-template" style="display: none;">
	<jsp:include page="/jsp/forms/presupuestos_form.jsp" />
</div>

<!-- Include Update -->
<div id="presupuestos-update-template" style="display: none;">
	<jsp:include page="/jsp/forms/presupuestos_form.jsp" />
</div>

<!-- Include View -->
<div id="presupuestos-view-template" style="display: none;">
	<jsp:include page="/jsp/views/presupuestos_view.jsp" />
</div>

<!-- Include Modal -->
<jsp:include page="/jsp/components/modal.jsp" />
<jsp:include page="/jsp/modal/modal_delete.jsp" />

<title>Presupuestos</title>
<div class="div-container presupuestos">
	<div class="title">
		<a>Presupuestos</a>
	</div>
	<p class="text">Lista de presupuestos en el sistema</p>
	<div class="grid-content-departamento">
		<%
		if (PermisosUtil.tienePermiso(permisos, "presupuestos", "crear")) {
		%>
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
							<button title="Crear Usuario" class="button-action add"
								onclick="modalCrearPresupuesto()">📄</button>
						</td>
						<td class="td-table">Filtra los prespuestos para buscar</td>
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
		<%
		}
		%>
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
						<td class="td-table"><%=p.getImporte()%> €</td>
						<td class="td-table"><%=p.getGastado()%> €</td>
						<td class="td-table"><%=p.getRestante()%> €</td>
						<td class="td-table <%=p.getClaseEstado()%>"><%=p.getEstadoDinamico()%></td>
						<td class="td-table">
							<%
							if (PermisosUtil.tienePermiso(permisos, "presupuestos", "editar")) {
							%>
							<button class="button-action"
								onclick="modalEditarPresupuesto(this)" data-id="<%=p.getId()%>"
								data-importe="<%=p.getImporte()%>">✏️</button> <%
 }
 %>
							<button class="button-action" onclick="modalVerPresupuesto(this)"
								data-id="<%=p.getId()%>"
								data-departamento="<%=p.getDepartamento()%>"
								data-anio="<%=p.getAnio()%>" data-importe="<%=p.getImporte()%>"
								data-gastado="<%=p.getGastado()%>"
								data-restante="<%=p.getRestante()%>"
								data-estado="<%=p.getEstadoDinamico()%>">🔍</button> <%
 if (PermisosUtil.tienePermiso(permisos, "presupuestos", "eliminar")) {
 %>
							<button class="button-action delete"
								onclick="modalEliminar('<%=p.getId()%>','<%=p.getDepartamento()%>')">🗑️</button>
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
<script src="<%=request.getContextPath()%>/js/modal/modal.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/modal_delete.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/modal_create.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/modal_update.js"></script>
<script src="<%=request.getContextPath()%>/js/modal/modal_view.js"></script>