<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="model.Permiso"%>
<%@ page import="utils.PermisosUtil"%>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
String nombre = (String) session.getAttribute("nombre");
%>

<div class="nav">
	<img class="logo" src="<%=request.getContextPath()%>/img/icon.png">
	<a class="username">Hola <%=nombre%></a>

	<% if (PermisosUtil.tienePermiso(permisos, "inicio", "visible")) { %>
	<button class="button button-nav" data-url="inicio" type="button"
		onclick="window.location.href='<%=request.getContextPath()%>/inicio'">
		🏚️ | Inicio</button>
	<% } %>

	<% if (PermisosUtil.tienePermiso(permisos, "perfil", "visible")) { %>
	<button class="button button-nav" data-url="perfil" type="button"
		onclick="window.location.href='<%=request.getContextPath()%>/perfil'">
		👤 | Mi Perfil</button>
	<% } %>

	<% if (PermisosUtil.tienePermiso(permisos, "permisos", "visible")) { %>
	<button class="button button-nav" data-url="permisos" type="button"
		onclick="window.location.href='<%=request.getContextPath()%>/permisos'">
		🔐 | Permisos</button>
	<% } %>

	<% if (PermisosUtil.tienePermiso(permisos, "usuarios", "visible")) { %>
	<button class="button button-nav" data-url="usuarios" type="button"
		onclick="window.location.href='<%=request.getContextPath()%>/usuarios'">
		👥 | Usuarios</button>
	<% } %>

	<% if (PermisosUtil.tienePermiso(permisos, "departamentos", "visible")) { %>
	<button class="button button-nav" data-url="departamentos" type="button"
		onclick="window.location.href='<%=request.getContextPath()%>/departamentos'">
		🏢 | Departamentos</button>
	<% } %>

	<% if (PermisosUtil.tienePermiso(permisos, "proveedores", "visible")) { %>
	<button class="button button-nav" data-url="proveedores" type="button"
		onclick="window.location.href='<%=request.getContextPath()%>/proveedores'">
		🚚 | Proveedores</button>
	<% } %>

	<% if (PermisosUtil.tienePermiso(permisos, "pedidos", "visible")) { %>
	<button class="button button-nav" data-url="pedidos" type="button"
		onclick="window.location.href='<%=request.getContextPath()%>/pedidos'">
		📦 | Pedidos</button>
	<% } %>

	<% if (PermisosUtil.tienePermiso(permisos, "facturas", "visible")) { %>
	<button class="button button-nav" data-url="facturas" type="button"
		onclick="window.location.href='<%=request.getContextPath()%>/facturas'">
		📋 | Facturas</button>
	<% } %>

	<% if (PermisosUtil.tienePermiso(permisos, "presupuestos", "visible")) { %>
	<button class="button button-nav" data-url="presupuestos" type="button"
		onclick="window.location.href='<%=request.getContextPath()%>/presupuestos'">
		💶 | Presupuestos</button>
	<% } %>

	<% if (PermisosUtil.tienePermiso(permisos, "historico", "visible")) { %>
	<button class="button button-nav" data-url="historico" type="button"
		onclick="window.location.href='<%=request.getContextPath()%>/historico'">
		📓 | Historico</button>
	<% } %>

	<button class="button salir" onclick="abrirModalLogout()">Cerrar Sesión</button>
</div>

<script src="<%=request.getContextPath()%>/js/inicio.js"></script>