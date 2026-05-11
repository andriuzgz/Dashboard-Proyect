<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Alerta"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Permiso" %>
<%@ page import="utils.PermisosUtil" %>

<%
@SuppressWarnings("unchecked")
List<Permiso> permisos = (List<Permiso>) session.getAttribute("permisos");
%>

<%
@SuppressWarnings("unchecked")
List<Alerta> alertas = (List<Alerta>) request.getAttribute("alertas");
%>
<%
String nombre = (String) session.getAttribute("nombre");
Integer rol = (Integer) session.getAttribute("rol");
%>

<title>Inicio</title>
<body>
<div class="div-container inicio">
	<div class="title">
		<a>Inicio</a>
	</div>
	<p class="text">
		Bienvenido <%=nombre%> a la aplicación de gestión de pedidos 
		y presupuestos. Aquí podrás administrar usuarios, departamentos 
		,pedidos, presupuestos y proveedores de manera eficiente.
	</p>
	<div class="grid-content-alerts">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Busqueda y Filtracion de Alertas</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="2">Filtrar Alertas</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Filtrar las alertas</td>
						<td class="td-table"><input class="user-search" type=search>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Alertas</a>
			</div>
			<div class="content-about-table">
				<table class="table">
					<tr>
						<th class="th-table">ID Alerta</th>
						<th class="th-table">Gravedad</th>
						<th class="th-table">Descripcion</th>
						<th class="th-table">Procedencia</th>
						<th class="th-table">Usuario</th>
						<th class="th-table">Rol</th>
						<th class="th-table">Departamento</th>
						<th class="th-table">Fecha</th>
						<th class="th-table">Estado</th>
						<th class="th-table">Accion</th>
					</tr>
					<% if (alertas != null && !alertas.isEmpty()) {
						for (Alerta a : alertas)
					{ %>
					<tr class="tr-table">

						<td class="td-table"><%=a.getId()%></td>
						<td class="td-table <%=a.getClaseGravedad()%>"><%=a.getGravedad()%></td>
						<td class="td-table"><%=a.getDescripcion()%></td>
						<td class="td-table"><%=a.getModulo()%></td>
						<td class="td-table"><%=a.getUsuario()%></td>
						<td class="td-table"><%=a.getRol()%></td>
						<td class="td-table"><%=a.getDepartamento()%></td>
						<td class="td-table"><%=a.getFecha()%></td>
						<td class="td-table <%=a.getClaseEstado()%>"><%=a.getEstado()%></td>
						<td class="td-table">
							<button class="button-action">🔍</button>
						<% if (PermisosUtil.tienePermiso(permisos, "inicio", "eliminar")) { %>
						    <button class="button-action delete">🗑️</button>
						<% } %>
						</td>
					</tr>
					<% }
					} else {
					%> <tr class="tr-table">
						<td class="td-table" colspan="10">No hay alertas</td>
					</tr> <% }
					%>
				</table>
			</div>
		</div>
	</div>
	<div class="grid-content">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Resumen de Actividad</a>
			</div>
			<div class="content-about-item">
				<a class="content-text">Total Usuarios: <%=request.getAttribute("totalUsuarios")%></a><br>
				<a class="content-text">Total Departamentos: <%=request.getAttribute("totalDepartamentos")%></a><br>
				<a class="content-text">Total Pedidos: <%=request.getAttribute("totalPedidos")%></a><br> 
				<a class="content-text">Total Presupuesto: <%=request.getAttribute("totalPresupuestos")%></a><br>
				<a class="content-text">Total Facturado: <%=request.getAttribute("totalFacturado")%> €</a><br>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Resumen de Usuarios</a>
			</div>
			<div class="content-about-item">
				<a class="content-text">Usuarios Activos: <%=request.getAttribute("usuariosActivos")%></a><br> 
				<a class="content-text">Usuarios Suspendidos: <%=request.getAttribute("usuariosSuspendidos")%></a><br>
				<a class="content-text">Jefes de Departamento: <%=request.getAttribute("jefes") %></a><br>
				<a class="content-text">Administradores: <%=request.getAttribute("admins") %></a><br>
				<a class="content-text">Contables: <%=request.getAttribute("contables") %></a>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Resumen de Proveedores</a>
			</div>
			<div class="content-about-item">
				<a class="content-text">Total Proveedores: <%=request.getAttribute("totalProveedores")%></a><br>
				<a class="content-text">Proveedores Activos: <%=request.getAttribute("proveedoresActivos")%></a><br>
				<a class="content-text">Proveedores Inactivos: <%=request.getAttribute("proveedoresInactivos")%></a><br>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Resumen de Pedidos</a>
			</div>
			<div class="content-about-item">
				<a class="content-text">Pedidos Completados: <%=request.getAttribute("pedidosCompletados")%></a><br>
				<a class="content-text">Pedidos Pendientes: <%=request.getAttribute("pedidosPendientes")%></a><br>
				<a class="content-text">Pedidos Cancelados: <%=request.getAttribute("pedidosCancelados")%></a><br>
				<a class="content-text">Pedidos Sin Factura: <%=request.getAttribute("pedidosSinFactura")%></a><br>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Resumen de Facturas</a>
			</div>
			<div class="content-about-item">
				<a class="content-text">Total Facturas: <%=request.getAttribute("totalFacturas")%></a><br> 
				<a class="content-text">Facturas Pagadas: <%=request.getAttribute("facturasPagadas")%></a><br> 
				<a class="content-text">Facturas Pendientes: <%=request.getAttribute("facturasPendientes")%></a><br> 
				<a class="content-text">Facturas Vencidas [Pagadas]: <%=request.getAttribute("vencidasPagadas")%></a><br>
				<a class="content-text">Facturas Vencidas [Pendientes]: <%=request.getAttribute("vencidasPendientes")%></a><br>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Resumen de Presupuestos</a>
			</div>
			<div class="content-about-item">
				<a class="content-text">Departamentos con Presupuesto: <%=request.getAttribute("presupuestoActivo")%></a><br>
				<a class="content-text">Departamentos sin Presupuesto: <%=request.getAttribute("sinPresupuesto")%></a><br>
				<a class="content-text">Departamentos con Presupuesto Bajo: <%=request.getAttribute("presupuestoBajo")%></a><br> 
				<a class="content-text">Departamentos con Presupuesto Negativo: <%=request.getAttribute("presupuestoNegativo")%></a><br>
			</div>
		</div>
	</div>
</div>
</body>
</html>