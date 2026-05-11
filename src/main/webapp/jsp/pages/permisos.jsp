<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Permiso"%>
<%@ page import="utils.PermisosUtil"%>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisosSesion = (List<Permiso>) session.getAttribute("permisos");
boolean puedeEditar = PermisosUtil.tienePermiso(permisosSesion, "permisos", "editar");
%>

<title>Permisos</title>
<div class="div-container permisos">
	<div class="title">
		<a>Permisos</a>
	</div>
	<p class="text">Gestionar la visibilidad de modulos y acciones por
		rol</p>
	<div class="grid-content-permisos">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Rol</a>
			</div>
			<div class="content-about-item">
				<label for="opciones">Seleccione el Rol</label> <select
					class="select" name="opciones" id="opciones">
					<option class="option-select" value="administrador">Administrador</option>
					<option class="option-select" value="contable" selected>Contable</option>
					<option class="option-select" value="jefe_departamento">Jefe
						de Departamento</option>
				</select>
				<% if (PermisosUtil.tienePermiso(permisos, "departamentos", "editar")) { %>
				<button class="guardar">Guardar
					Cambios 💾</button>
				<% } %>
			</div>
			<div class="content-about-table">
				<div class="content-item-flat">
					<a class="content-text">Modulos y Permisos</a>
				</div>
				<table class="table">
					<tr>
						<th class="th-table">Nombre del Modulo</th>
						<th class="th-table">Visible</th>
						<th class="th-table">Crear - C | 8</th>
						<th class="th-table">Leer - R | 4</th>
						<th class="th-table">Editar - U | 2</th>
						<th class="th-table">Eliminar - D | 1</th>
						<th class="th-table">Nivel del Permiso</th>
					</tr>
					<tr class="tr-table" data-modulo="inicio">
						<td class="td-table">Inicio</td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="visible" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="crear" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="leer" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="editar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="eliminar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table nivel">0</td>
					</tr>
					<tr class="tr-table" data-modulo="perfil">
						<td class="td-table">Mi Perfil</td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="visible" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="crear" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="leer" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="editar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="eliminar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table nivel">0</td>
					</tr>
					<tr class="tr-table" data-modulo="permisos">
						<td class="td-table">Permisos</td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="visible" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="crear" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="leer" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="editar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="eliminar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table nivel">0</td>
					</tr>
					<tr class="tr-table" data-modulo="usuarios">
						<td class="td-table">Usuarios</td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="visible" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="crear" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="leer" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="editar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="eliminar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table nivel">0</td>
					</tr>
					<tr class="tr-table" data-modulo="departamentos">
						<td class="td-table">Departamentos</td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="visible" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="crear" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="leer" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="editar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="eliminar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table nivel">0</td>
					</tr>
					<tr class="tr-table" data-modulo="proveedores">
						<td class="td-table">Proveedores</td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="visible" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="crear" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="leer" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="editar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="eliminar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table nivel">0</td>
					</tr>
					<tr class="tr-table" data-modulo="pedidos">
						<td class="td-table">Pedidos</td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="visible" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="crear" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="leer" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="editar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="eliminar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table nivel">0</td>
					</tr>
					<tr class="tr-table" data-modulo="facturas">
						<td class="td-table">Facturas</td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="visible" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="crear" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="leer" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="editar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="eliminar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table nivel">0</td>
					</tr>
					<tr class="tr-table" data-modulo="presupuestos">
						<td class="td-table">Presupuestos</td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="visible" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="crear" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="leer" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="editar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="eliminar" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table nivel">0</td>
					</tr>
					<tr class="tr-table" data-modulo="historico">
						<td class="td-table">Historico</td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="visible" <%=!puedeEditar ? "disabled" : ""%>></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="crear" disabled></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="leer" disabled></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="editar" disabled></td>
						<td class="td-table"><input class="cbox-perm" type="checkbox"
							data-accion="eliminar" disabled></td>
						<td class="td-table nivel">0</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>