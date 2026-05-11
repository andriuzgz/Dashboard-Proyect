<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Usuario" %>	
<%@ page import="java.util.List" %>
<%@ page import="model.Permiso" %>
<%@ page import="utils.PermisosUtil" %>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
Usuario u = (Usuario) request.getAttribute("usuario");
%>

<title>Mi Perfil</title>
<div class="div-container perfil">
	<div class="title">
		<a>Mi Perfil</a>
	</div>
	<p class="text">Tu perfil con datos y información sobre ti</p>
	<div class="grid-content-perfil">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Mi Perfil</a>
			</div>
			<div class="grid-tab-perfil">
				<div class="tab-perfil">
					<a> <img class="avatar-perfil"
						src="<%=request.getContextPath()%>/img/<%=u.getFoto()%>">
					</a>
				</div>
				<div class="tab-perfil">
					<h2 class="usuario-perfil">
						<%=u.getNombre()%>
						<%=u.getApellidos()%>
					</h2>
					<h4 class="rol-perfil">
						<%=u.getRolNombre()%>
					</h4>
				</div>
				<div class="tab-perfil button-perfil">
					<% if (PermisosUtil.tienePermiso(permisos, "perfil", "editar")) { %>
					<button class="btn-perfil">Editar Mi Perfil</button>
						<% } %>
					<button class="btn-perfil">Reiniciar Contraseña</button>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Informacion del Panel</a>
			</div>
			<div class="content-about-item">
				<table class="table-perfil">
					<tr class="tr-perfil">
						<td class="td-perfil">Mes y Año de Desarrollo:</td>
						<td class="td-perfil">Abril 2026</td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Desarrollador:</td>
						<td class="td-perfil">Andriu Joshua Rodriguez Correa</td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Alias Dev:</td>
						<td class="td-perfil">ZekyyCZ</td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Version:</td>
						<td class="td-perfil">Indev v0.3 - 26.5</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Informacion Personal</a>
			</div>
			<div class="content-about-item">
				<table class="table-perfil">
					<tr class="tr-perfil">
						<td class="td-perfil">ID Usuario:</td>
						<td class="td-perfil"><%=u.getId()%></td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Nombre:</td>
						<td class="td-perfil"><%=u.getNombre()%></td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Apellidos:</td>
						<td class="td-perfil"><%=u.getApellidos()%></td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Fecha Nacimiento:</td>
						<td class="td-perfil"><%=u.getFechaNacimiento()%></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Detalles de la Cuenta</a>
			</div>
			<div class="content-about-item">
				<table class="table-perfil">
					<tr class="tr-perfil">
						<td class="td-perfil">Rol:</td>
						<td class="td-perfil"><%=u.getRolNombre()%></td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Departamento:</td>
						<td class="td-perfil"><%=u.getDepartamentoNombre()%> [<%=u.getDepartamentoCodigo()%>]
						</td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Fecha Alta</td>
						<td class="td-perfil"><%=u.getFechaAlta()%></td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Estado:</td>
						<td class="td-perfil"><%= u.getEstado() %></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>