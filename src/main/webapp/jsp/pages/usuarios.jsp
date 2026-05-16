<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Usuario"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Permiso"%>
<%@ page import="utils.PermisosUtil"%>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
@SuppressWarnings("unchecked")
List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
%>

<title>Usuarios</title>

<!-- Include Form -->
<div id="usuarios-form-template" style="display: none;">
	<jsp:include page="/jsp/forms/usuarios_form.jsp" />
</div>

<!-- Include View -->
<div id="usuarios-view-template" style="display: none;">
	<jsp:include page="/jsp/views/usuarios_view.jsp" />
</div>

<!-- Include Update Form -->
<div id="usuarios-update-template" style="display: none;">
	<jsp:include page="/jsp/forms/usuarios_form.jsp" />
</div>

<!-- Include Modal -->
<jsp:include page="/jsp/components/modal.jsp" />
<jsp:include page="/jsp/modal/modal_delete.jsp" />

<div class="div-container usuarios">
	<div class="title">
		<a>Usuarios</a>
	</div>
	<p class="text">Lista de usuarios registrados en el sistema</p>
	<div class="grid-content-usuario">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Crear Usuario</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<%
						if (PermisosUtil.tienePermiso(permisos, "usuarios", "crear")) {
						%>
						<th class="th-table" colspan="2">Nuevo Usuario</th>
						<%
						}
						%>
						<th class="th-table" colspan="2">Filtrar Usuario</th>
					</tr>
					<tr class="tr-table">
						<%
						if (PermisosUtil.tienePermiso(permisos, "usuarios", "crear")) {
						%>
						<td class="td-table">Crea una nueva cuenta</td>
						<td class="td-table">
							<button title="Crear Usuario" class="button-action add"
								onclick="modalCrear()">📄</button>
						</td>
						<%
						}
						%>
						<td class="td-table">Filtra los usuarios para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Lista de usuarios</a>
			</div>
			<div class="content-about-table">
				<table class="table">
					<tr>
						<th class="th-table">ID Usuario</th>
						<th class="th-table">Nombre</th>
						<th class="th-table">Apellidos</th>
						<th class="th-table">Rol</th>
						<th class="th-table">Departamento</th>
						<th class="th-table">Fecha Alta</th>
						<th class="th-table">Fecha Baja</th>
						<th class="th-table">Estado</th>
						<th class="th-table">Accion</th>
					</tr>
					<%
					if (usuarios != null && !usuarios.isEmpty()) {
						for (Usuario u : usuarios) {
					%>
					<tr class="tr-table">
						<td class="td-table"><%=u.getId()%></td>
						<td class="td-table"><%=u.getNombre()%></td>
						<td class="td-table"><%=u.getApellidos()%></td>
						<td class="td-table"><%=u.getRolNombre()%></td>
						<td class="td-table"><%=u.getDepartamentoNombre()%> [<%=u.getDepartamentoCodigo()%>]</td>
						<td class="td-table"><%=u.getFechaAlta()%></td>
						<td class="td-table"><%=u.getFechaBaja() != null ? u.getFechaBaja() : "Sin Fecha"%></td>
						<td class="td-table <%=u.getClaseEstado()%>"><%=u.getEstado()%></td>
						<td class="td-table">
							<%
							if (PermisosUtil.tienePermiso(permisos, "usuarios", "editar")) {
							%>

							<button class="button-action" data-id="<%=u.getId()%>"
								data-nombre="<%=u.getNombre()%>"
								data-apellidos="<%=u.getApellidos()%>"
								data-fecha="<%=u.getFechaNacimiento()%>"
								data-rol="<%=u.getRol()%>"
								data-departamento="<%=u.getDepartamento()%>"
								data-estado="<%=u.getEstadoInt()%>"
								onclick="modalEditarUsuario(this)">✏️</button>

							<form method="post"
								action="<%=request.getContextPath()%>/cud/usuarios"
								style="display: inline;">

								<input type="hidden" name="action" value="toggle"> <input
									type="hidden" name="id" value="<%=u.getId()%>">

								<button class="button-action" type="submit">🔄️</button>

							</form> <%
 }
 %>

							<button class="button-action" data-id="<%=u.getId()%>"
								data-nombre="<%=u.getNombre()%>"
								data-apellidos="<%=u.getApellidos()%>"
								data-fecha-nacimiento="<%=u.getFechaNacimiento()%>"
								data-rol="<%=u.getRolNombre()%>"
								data-departamento="<%=u.getDepartamentoNombre()%> [<%=u.getDepartamentoCodigo()%>]"
								data-fecha-alta="<%=u.getFechaAlta()%>"
								data-fecha-baja="<%=u.getFechaBaja() != null ? u.getFechaBaja() : "Sin Fecha"%>"
								data-estado="<%=u.getEstado()%>" onclick="modalVerUsuario(this)">

								🔍</button> <%
								 if (PermisosUtil.tienePermiso(permisos, "usuarios", "eliminar")) {
								 %>
							<button class="button-action delete"
								onclick="modalEliminar('<%=u.getId()%>','<%=u.getNombre()%>')">🗑️</button>
							<%
							}
							%>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr class="tr-table">
						<td class="td-table" colspan="10">No hay usuarios</td>
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