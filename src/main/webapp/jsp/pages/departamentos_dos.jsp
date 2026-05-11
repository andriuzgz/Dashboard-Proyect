<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Permiso"%>
<%@ page import="utils.PermisosUtil"%>
<%@ page import="model.Departamento"%>
<%@page import="java.util.List"%>
<%@page import="model.Proveedor"%>
<%@ page import="methods.Estados"%>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
Departamento d = (Departamento) request.getAttribute("departamento");
%>
<title>Departamentos</title>
<div class="div-container departamentos">
	<div class="title">
		<a>Departamentos</a>
	</div>
	<p class="text">Tu Departamento</p>
	<div class="grid-content-dept">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Informacion del Departamento</a>
			</div>
			<div class="content-about-item">
				<table class="table-perfil">
					<tr class="tr-perfil">
						<td class="td-perfil">ID Departamento:</td>
						<td class="td-perfil"><%=d.getId()%></td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Departamento:</td>
						<td class="td-perfil"><%=d.getNombre()%></td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Responsable:</td>
						<td class="td-perfil"><%=d.getResponsable()%>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Fecha de Creacion:</td>
						<td class="td-perfil"><%=new java.text.SimpleDateFormat("dd/MM/yyyy").format(d.getAnioFecha())%>
						</td>
					</tr>
					<% if (PermisosUtil.tienePermiso(permisos, "departamentos", "editar")) { %>
					<tr class="tr-perfil">
						<td class="td-perfil">Editar Departamento</td>
						<td class="td-perfil">
						    <button class="button-action">✏️</button>
						</td>
					</tr>
					<% } %>
				</table>
			</div>
		</div>
		<div class="content proveedores-departamento">
			<div class="content-item">
				<a class="content-text">Mis Proveedores</a>
			</div>
			<div class="content-about-table">
				<table class="table">

					<tr>
						<th class="th-table">ID</th>
						<th class="th-table">Proveedor</th>
						<th class="th-table">CIF</th>
						<th class="th-table">Fecha Alta</th>
						<th class="th-table">Fecha Baja</th>
						<th class="th-table">Estado</th>
						<th class="th-table">Accion</th>
					</tr>
					<% @SuppressWarnings("unchecked")
					List<Proveedor> proveedores = (List<Proveedor>) request.getAttribute("proveedores");

					if (proveedores != null) {
						for (Proveedor p : proveedores) {
					%>
					<tr class="tr-table">
						<td class="td-table"><%=p.getId()%></td>
						<td class="td-table"><%=p.getNombre()%></td>
						<td class="td-table"><%=p.getCif()%></td>
						<td class="td-table"><%=p.getFechaAlta()%></td>
						<td class="td-table">
							<%
							if (p.getFechaBaja() != null) {
							%> <%=p.getFechaBaja()%> <%
							 } else {
							 %> -- <%
							 }
							 %>
						</td>
						<td class="td-table <%=p.getClaseEstado()%>"><%=p.getEstado()%></td>
						<td class="td-table">
							<button class="button-action">🔍</button>
						</td>
					</tr>
					<% }
					}
					%>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Economia Departamento</a>
			</div>
			<div class="content-about-item">
				<table class="table-perfil">
					<tr class="tr-perfil">
						<td class="td-perfil">Presupuesto:</td>
						<td class="td-perfil"><%=d.getPresupuesto()%> €</td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Usado:</td>
						<td class="td-perfil"><%=d.getUsado()%> €</td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Restante:</td>
						<td class="td-perfil"><%=d.getRestante()%> € [<%=String.format("%.1f", d.getPorcentajeRestante())%>%]</td>
					</tr>
					<tr class="tr-perfil">
						<td class="td-perfil">Estado:</td>
						<td class="td-perfil <%=d.getClaseEstado()%>"><%=d.getEstado()%></td>
					</tr>
					<% if (PermisosUtil.tienePermiso(permisos, "departamentos", "editar")) { %>
					<tr class="tr-perfil">
						<td class="td-perfil">Editar Economia</td>
						<td class="td-perfil">
						    <button class="button-action">✏️</button>
						</td>
					</tr>
					<% } %>
				</table>
			</div>
		</div>
	</div>
</div>