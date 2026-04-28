<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String nombre = (String) session.getAttribute("nombre");
String rol = (String) session.getAttribute("rol");

if (nombre == null || rol == null) {
	response.sendRedirect("../login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inicio</title>
<link rel="icon" href="<%=request.getContextPath()%>/icon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/inicio.css">

</head>
<body>
	<div class="interface">
		<div class="nav">
			<img class="logo" src="<%=request.getContextPath()%>/img/icon.png">
			<a class="username">Hola <%=nombre%></a>
			<button class="button" type="button" data-target="inicio">Inicio</button>
			<button class="button" type="button" data-target="mi-perfil">Mi
				Perfil</button>
			<button class="button" type="button" data-target="usuarios">Usuarios</button>
			<button class="button" type="button" data-target="departamentos">Departamentos</button>
			<button class="button" type="button" data-target="proveedores">Proveedores</button>
			<button class="button" type="button" data-target="pedidos">Pedidos</button>
			<button class="button" type="button" data-target="facturas">Facturas</button>
			<button class="button" type="button" data-target="presupuestos">Presupuestos</button>
			<form action="<%=request.getContextPath()%>/logout" method="post">
				<button class="button salir">Cerrar Sesion</button>
			</form>
		</div>
		<div class="div-container inicio">
			<div class="title">
				<a>Inicio</a>
			</div>
			<p class="text">
				Bienvenido
				<%=nombre%>
				a la aplicación de gestión de pedidos y presupuestos. Aquí podrás
				administrar usuarios, departamentos, pedidos, presupuestos y
				proveedores de manera eficiente.
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
								<td class="td-table">Filtra los pedidos para buscar</td>
								<td class="td-table">
									<input class="user-search" type=search>
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
							<tr class="tr-table">
								<td class="td-table">22</td>
								<td class="td-table rojo">GRAVE</td>
								<td class="td-table">Departamento con presupuesto en
									negativo</td>
								<td class="td-table">Departamentos</td>
								<td class="td-table">Carlos Martínez</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Mecánica</td>
								<td class="td-table">28/04/2026 12:29</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action toggle">🔎</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">23</td>
								<td class="td-table naranja">MODERADO</td>
								<td class="td-table">Pedido sin factura asociada</td>
								<td class="td-table">Pedidos</td>
								<td class="td-table">Sofía Navarro</td>
								<td class="td-table">Contable</td>
								<td class="td-table">N/A</td>
								<td class="td-table">27/04/2026 10:15</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action toggle">🔎</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">24</td>
								<td class="td-table verde">LEVE</td>
								<td class="td-table">Usuario con rol incorrecto</td>
								<td class="td-table">Usuarios</td>
								<td class="td-table">Miguel Ruiz</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Electricidad</td>
								<td class="td-table">26/04/2026 09:42</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action toggle">🔎</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">26</td>
								<td class="td-table naranja">MODERADO</td>
								<td class="td-table">Proveedor sin actividad reciente</td>
								<td class="td-table">Proveedores</td>
								<td class="td-table">Andriu Rodriguez</td>
								<td class="td-table">Administrador</td>
								<td class="td-table">Administración</td>
								<td class="td-table">24/04/2026 14:05</td>
								<td class="td-table gris">RESUELTO</td>
								<td class="td-table">
									<button class="button-action toggle" disabled>🔎</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">27</td>
								<td class="td-table verde">LEVE</td>
								<td class="td-table">Presupuesto próximo a agotarse</td>
								<td class="td-table">Presupuestos</td>
								<td class="td-table">Elena Serrano</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Robótica</td>
								<td class="td-table">23/04/2026 11:20</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action toggle">🔎</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
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
						<a class="content-text">ℹ️ | Total Usuarios: 19</a><br> <a
							class="content-text">ℹ️ | Total Departamentos: 16</a><br> <a
							class="content-text">ℹ️ | Total Pedidos: 132</a><br> <a
							class="content-text">ℹ️ | Total Presupuesto: 185000 €</a><br>
						<a class="content-text">ℹ️ | Total Facturado: 142300 €</a><br>
					</div>
				</div>
				<div class="content">
					<div class="content-item">
						<a class="content-text">Resumen de Usuarios</a>
					</div>
					<div class="content-about-item">
						<a class="content-text">ℹ️ | Usuarios Activos: 1</a><br> <a
							class="content-text">ℹ️ | Usuarios Desconectados: 18</a><br>
						<a class="content-text">⚠️ | Usuarios Sin Rol: 0</a><br> <a
							class="content-text">⚠️ | Usuarios Suspendidos: 0</a><br> <a
							class="content-text">⚠️ | Usuarios Eliminados: 0</a><br>
					</div>
				</div>
				<div class="content">
					<div class="content-item">
						<a class="content-text">Resumen de Proveedores</a>
					</div>
					<div class="content-about-item">
						<a class="content-text">ℹ️ | Proveedores Activos: 9</a><br> <a
							class="content-text">⚠️ | Proveedores Inactivos: 1</a><br> <a
							class="content-text">⚠️ | Proveedores Eliminados: 0</a><br>
					</div>
				</div>
				<div class="content">
					<div class="content-item">
						<a class="content-text">Resumen de Pedidos</a>
					</div>
					<div class="content-about-item">
						<a class="content-text">ℹ️ | Pedidos Completados: 12</a><br>
						<a class="content-text">⚠️ | Pedidos Pendientes: 4</a><br> <a
							class="content-text">⚠️ | Pedidos Cancelados: 1</a><br> <a
							class="content-text">⚠️ | Pedidos Sin Factura: 5</a><br>
					</div>
				</div>
				<div class="content">
					<div class="content-item">
						<a class="content-text">Resumen de Facturas</a>
					</div>
					<div class="content-about-item">
						<a class="content-text">ℹ️ | Total Facturas: 12</a><br> <a
							class="content-text">ℹ️ | Facturas Pagadas: 7</a><br> <a
							class="content-text">ℹ️ | Facturas Pendientes: 4</a><br> <a
							class="content-text">⚠️ | Facturas Sin Pagar: 0</a><br> <a
							class="content-text">⚠️ | Facturas Vencidas: 0</a><br>
					</div>
				</div>
				<div class="content">
					<div class="content-item">
						<a class="content-text">Resumen de Presupuestos</a>
					</div>
					<div class="content-about-item">
						<a class="content-text">ℹ️ | Presupuesto Usado: 142300 €</a><br>
						<a class="content-text">ℹ️ | Presupuesto Disponible: 42700 €</a><br>
						<a class="content-text">⚠️ | Departamento con Presupuesto
							Bajo: 2</a><br> <a class="content-text">⚠️ | Departamento
							sin Presupuesto: 1</a><br> <a class="content-text">⚠️ |
							Departamento con Presupuesto Negativo: 1</a><br>
					</div>
				</div>
			</div>
		</div>
		<div class="div-container mi-perfil" hidden>
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
							<a><img class="avatar-perfil"
								src="<%=request.getContextPath()%>/img/zeky.jpg"></a>
						</div>
						<div class="tab-perfil">
							<h2 class="usuario-perfil">Andriu Rodriguez</h2>
							<h4 class="rol-perfil">Administrador</h4>
						</div>
						<div class="tab-perfil button-perfil">
							<button title="Editar Perfil" class="btn-perfil red">✏️</button>
							<button title="Reestablecer Contraseña" class="btn-perfil yellow">🔑</button>
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
								<td class="td-perfil">Mes y Año Desarrollo:</td>
								<td class="td-perfil">Abril 2026</td>
							</tr>
							<tr class="tr-perfil">
								<td class="td-perfil">Desarrollador:</td>
								<td class="td-perfil">Andriu Joshua Rodriguez Correa</td>
							</tr>
							<tr class="tr-perfil">
								<td class="td-perfil">Dev Alias:</td>
								<td class="td-perfil">ZekyyCZ</td>
							</tr>
							<tr class="tr-perfil">
								<td class="td-perfil">Version:</td>
								<td class="td-perfil">Indev v0.2.2</td>
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
								<td class="td-perfil">1</td>
							</tr>
							<tr class="tr-perfil">
								<td class="td-perfil">Nombre:</td>
								<td class="td-perfil"><%=nombre%></td>
							</tr>
							<tr class="tr-perfil">
								<td class="td-perfil">Apellidos:</td>
								<td class="td-perfil">Rodriguez</td>
							</tr>
							<tr class="tr-perfil">
								<td class="td-perfil">Fecha Nacimiento:</td>
								<td class="td-perfil">05/05/2006</td>
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
								<td class="td-perfil">Administrador</td>
							</tr>
							<tr class="tr-perfil">
								<td class="td-perfil">Departamento:</td>
								<td class="td-perfil">Administracion [ADM]</td>
							</tr>
							<tr class="tr-perfil">
								<td class="td-perfil">Fecha Alta</td>
								<td class="td-perfil">20/04/2026</td>
							</tr>
							<tr class="tr-perfil">
								<td class="td-perfil">Estado:</td>
								<td class="td-perfil">Activo</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="div-container usuarios" hidden>
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
								<th class="th-table" colspan="2">Nuevo Usuario</th>
								<th class="th-table" colspan="2">Filtrar Usuario</th>
							</tr>
							<tr class="tr-table">
								<td class="td-table">Crea una nueva cuenta</td>
								<td class="td-table">
									<button title="Crear Usuario" class="button-action add">📄</button>
								</td>
								<td class="td-table">Filtra los usuarios para buscar</td>
								<td class="td-table">
									<input class="user-search" type=search>
								</td>
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
								<th class="th-table">Fecha Nacimiento</th>
								<th class="th-table">Rol</th>
								<th class="th-table">Departamento</th>
								<th class="th-table">Fecha Alta</th>
								<th class="th-table">Fecha Baja</th>
								<th class="th-table">Estado</th>
								<th class="th-table">Accion</th>
							</tr>
							<tr class="tr-table">
								<td class="td-table">1</td>
								<td class="td-table">Andriu</td>
								<td class="td-table">Rodriguez</td>
								<td class="td-table">05/05/2006</td>
								<td class="td-table">Administrador</td>
								<td class="td-table">Administración</td>
								<td class="td-table">20/04/2026</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">2</td>
								<td class="td-table">Lucía</td>
								<td class="td-table">Morales</td>
								<td class="td-table">14/02/1992</td>
								<td class="td-table">Administrador</td>
								<td class="td-table">Administración</td>
								<td class="td-table">10/01/2023</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">3</td>
								<td class="td-table">Sofía</td>
								<td class="td-table">Navarro</td>
								<td class="td-table">18/06/1988</td>
								<td class="td-table">Contable</td>
								<td class="td-table">N/A</td>
								<td class="td-table">20/09/2021</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">4</td>
								<td class="td-table">Daniel</td>
								<td class="td-table">Vega</td>
								<td class="td-table">10/03/1980</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Informática</td>
								<td class="td-table">01/01/2020</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">5</td>
								<td class="td-table">Carlos</td>
								<td class="td-table">Martínez</td>
								<td class="td-table">12/03/1985</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Mecánica</td>
								<td class="td-table">10/01/2022</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">6</td>
								<td class="td-table">Miguel</td>
								<td class="td-table">Ruiz</td>
								<td class="td-table">05/11/1995</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Electricidad</td>
								<td class="td-table">01/02/2024</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">7</td>
								<td class="td-table">Andrés</td>
								<td class="td-table">Torres</td>
								<td class="td-table">22/08/1982</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Automoción</td>
								<td class="td-table">12/06/2021</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">8</td>
								<td class="td-table">Laura</td>
								<td class="td-table">Gómez</td>
								<td class="td-table">22/07/1990</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Grado Básico</td>
								<td class="td-table">15/03/2023</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">9</td>
								<td class="td-table">Lucía</td>
								<td class="td-table">Morales</td>
								<td class="td-table">14/02/1992</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Telecomunicaciones</td>
								<td class="td-table">11/09/2022</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button></td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">10</td>
								<td class="td-table">Elena</td>
								<td class="td-table">Serrano</td>
								<td class="td-table">30/05/1987</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Robótica</td>
								<td class="td-table">03/03/2023</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">11</td>
								<td class="td-table">Javier</td>
								<td class="td-table">Ortega</td>
								<td class="td-table">19/01/1983</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Primaria</td>
								<td class="td-table">21/04/2020</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">12</td>
								<td class="td-table">Sara</td>
								<td class="td-table">López</td>
								<td class="td-table">02/12/1989</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Infantil</td>
								<td class="td-table">18/02/2021</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">13</td>
								<td class="td-table">Pedro</td>
								<td class="td-table">Santos</td>
								<td class="td-table">08/09/1984</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Secundaria</td>
								<td class="td-table">05/09/2022</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">14</td>
								<td class="td-table">María</td>
								<td class="td-table">Gil</td>
								<td class="td-table">25/06/1991</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Bachillerato</td>
								<td class="td-table">10/10/2023</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">15</td>
								<td class="td-table">Raúl</td>
								<td class="td-table">Navas</td>
								<td class="td-table">17/04/1986</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">SAT</td>
								<td class="td-table">12/06/2021</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">16</td>
								<td class="td-table">Luis</td>
								<td class="td-table">Herrera</td>
								<td class="td-table">11/01/1983</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Mantenimiento</td>
								<td class="td-table">21/04/2020</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">17</td>
								<td class="td-table">Eva</td>
								<td class="td-table">Ramos</td>
								<td class="td-table">03/03/1987</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Premio Don Bosco</td>
								<td class="td-table">03/03/2023</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">18</td>
								<td class="td-table">Álvaro</td>
								<td class="td-table">Cano</td>
								<td class="td-table">10/03/1980</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Formación</td>
								<td class="td-table">01/01/2020</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button></td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">19</td>
								<td class="td-table">Nuria</td>
								<td class="td-table">Pérez</td>
								<td class="td-table">14/02/1992</td>
								<td class="td-table">Jefe Departamento</td>
								<td class="td-table">Administración</td>
								<td class="td-table">11/09/2022</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table"><button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action restart">🔑</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="div-container departamentos" hidden>
			<div class="title">
				<a>Departamentos</a>
			</div>
			<p class="text">Lista de departamentos en el sistema</p>
			<div class="grid-content-departamento">
				<div class="content">
					<div class="content-item">
						<a class="content-text">Crear Usuario</a>
					</div>
					<div class="content-about-table">
						<table class="table-add">
							<tr>
								<th class="th-table" colspan="2">Nuevo Departamento</th>
								<th class="th-table" colspan="2">Filtrar Departamento</th>
							</tr>
							<tr class="tr-table">
								<td class="td-table">Crea un nuevo departamento</td>
								<td class="td-table">
									<button title="Crear Usuario" class="button-action add">📄</button>
								</td>
								<td class="td-table">Filtra los departamentos para buscar</td>
								<td class="td-table">
									<input class="user-search" type=search>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="content">
					<div class="content-item">
						<a class="content-text">Lista de departamentos</a>
					</div>
					<div class="content-about-table">
						<table class="table">
							<tr>
								<th class="th-table">ID Departamento</th>
								<th class="th-table">Nombre</th>
								<th class="th-table">Codigo</th>
								<th class="th-table">Responsable</th>
								<th class="th-table">Presupuesto</th>
								<th class="th-table">Accion</th>
							</tr>
							<tr class="tr-table">
								<td class="td-table">1</td>
								<td class="td-table">Informática</td>
								<td class="td-table">INFO</td>
								<td class="td-table">Daniel Vega</td>
								<td class="td-table">25000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">2</td>
								<td class="td-table">Mecánica</td>
								<td class="td-table">MECA</td>
								<td class="td-table">Carlos Martínez</td>
								<td class="td-table">30000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">3</td>
								<td class="td-table">Electricidad</td>
								<td class="td-table">ELTA</td>
								<td class="td-table">Miguel Ruiz</td>
								<td class="td-table">20000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">4</td>
								<td class="td-table">Automoción</td>
								<td class="td-table">AUTO</td>
								<td class="td-table">Andrés Torres</td>
								<td class="td-table">40000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">5</td>
								<td class="td-table">Grado Básico</td>
								<td class="td-table">FPGB</td>
								<td class="td-table">Laura Gómez</td>
								<td class="td-table">15000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">6</td>
								<td class="td-table">Telecomunicaciones</td>
								<td class="td-table">TELE</td>
								<td class="td-table">Lucía Morales</td>
								<td class="td-table">27000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">7</td>
								<td class="td-table">Robótica</td>
								<td class="td-table">ROBO</td>
								<td class="td-table">Elena Serrano</td>
								<td class="td-table">20000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">8</td>
								<td class="td-table">Primaria</td>
								<td class="td-table">PRI</td>
								<td class="td-table">Javier Ortega</td>
								<td class="td-table">12000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">9</td>
								<td class="td-table">Infantil</td>
								<td class="td-table">INF</td>
								<td class="td-table">Sara López</td>
								<td class="td-table">10000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">10</td>
								<td class="td-table">Secundaria</td>
								<td class="td-table">ESO</td>
								<td class="td-table">Pedro Santos</td>
								<td class="td-table">28000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">11</td>
								<td class="td-table">Bachillerato</td>
								<td class="td-table">BAC</td>
								<td class="td-table">María Gil</td>
								<td class="td-table">26000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">12</td>
								<td class="td-table">SAT</td>
								<td class="td-table">SAT</td>
								<td class="td-table">Raúl Navas</td>
								<td class="td-table">15000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">13</td>
								<td class="td-table">Mantenimiento</td>
								<td class="td-table">MANT</td>
								<td class="td-table">Luis Herrera</td>
								<td class="td-table">18000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">14</td>
								<td class="td-table">Premio Don Bosco</td>
								<td class="td-table">PDB</td>
								<td class="td-table">Eva Ramos</td>
								<td class="td-table">8000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">15</td>
								<td class="td-table">Formación</td>
								<td class="td-table">FOR</td>
								<td class="td-table">Álvaro Cano</td>
								<td class="td-table">12000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">16</td>
								<td class="td-table">Administración</td>
								<td class="td-table">ADM</td>
								<td class="td-table">Nuria Pérez</td>
								<td class="td-table">50000 €</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="div-container pedidos" hidden>
			<div class="title">
				<a>Pedidos</a>
			</div>
			<p class="text">Lista de pedidos en el sistema</p>
			<div class="grid-content-departamento">
				<div class="content">
					<div class="content-item">
						<a class="content-text">Crear Pedido</a>
					</div>
					<div class="content-about-table">
						<table class="table-add">
							<tr>
								<th class="th-table" colspan="2">Nuevo Pedido</th>
								<th class="th-table" colspan="2">Filtrar Pedidos</th>
							</tr>
							<tr class="tr-table">
								<td class="td-table">Crear un nuevo pedido</td>
								<td class="td-table">
									<button title="Crear Usuario" class="button-action add">📄</button>
								</td>
								<td class="td-table">Filtra los pedidos para buscar</td>
								<td class="td-table"><input class="user-search" type=search>
								</td>
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
								<th class="th-table">Usuario</th>
								<th class="th-table">Departamento</th>
								<th class="th-table">Fecha Pedido</th>
								<th class="th-table">Importe Total</th>
								<th class="th-table">Estado</th>
								<th class="th-table">Factura</th>
								<th class="th-table">Accion</th>
							</tr>
							<tr class="tr-table">
								<td class="td-table">1</td>
								<td class="td-table">MECA/0001/26/0</td>
								<td class="td-table">Carlos Martínez</td>
								<td class="td-table">Mecánica</td>
								<td class="td-table">01/04/2026</td>
								<td class="td-table">3200 €</td>
								<td class="td-table verde">COMPLETADO</td>
								<td class="td-table">FAC-2026-001</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">2</td>
								<td class="td-table">ADM/0001/26/0</td>
								<td class="td-table">Laura Gómez</td>
								<td class="td-table">Administración</td>
								<td class="td-table">02/04/2026</td>
								<td class="td-table">1500 €</td>
								<td class="td-table verde">COMPLETADO</td>
								<td class="td-table">FAC-2026-002</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">3</td>
								<td class="td-table">ADM/0002/26/0</td>
								<td class="td-table">Sofía Navarro</td>
								<td class="td-table">Administración</td>
								<td class="td-table">03/04/2026</td>
								<td class="td-table">890 €</td>
								<td class="td-table naranja">PENDIENTE</td>
								<td class="td-table">N/A</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">4</td>
								<td class="td-table">AUTO/0001/26/0</td>
								<td class="td-table">Andrés Torres</td>
								<td class="td-table">Automoción</td>
								<td class="td-table">04/04/2026</td>
								<td class="td-table">5400 €</td>
								<td class="td-table verde">COMPLETADO</td>
								<td class="td-table">FAC-2026-003</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">5</td>
								<td class="td-table">ROBO/0001/26/0</td>
								<td class="td-table">Elena Serrano</td>
								<td class="td-table">Robótica</td>
								<td class="td-table">05/04/2026</td>
								<td class="td-table">2750 €</td>
								<td class="td-table naranja">PENDIENTE</td>
								<td class="td-table">N/A</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">6</td>
								<td class="td-table">PRI/0001/26/0</td>
								<td class="td-table">Javier Ortega</td>
								<td class="td-table">Primaria</td>
								<td class="td-table">06/04/2026</td>
								<td class="td-table">980 €</td>
								<td class="td-table rojo">CANCELADO</td>
								<td class="td-table">N/A</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">7</td>
								<td class="td-table">TELE/0001/26/0</td>
								<td class="td-table">Lucía Morales</td>
								<td class="td-table">Telecomunicaciones</td>
								<td class="td-table">07/04/2026</td>
								<td class="td-table">4100 €</td>
								<td class="td-table verde">COMPLETADO</td>
								<td class="td-table">FAC-2026-004</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">8</td>
								<td class="td-table">INFO/0001/26/0</td>
								<td class="td-table">Daniel Vega</td>
								<td class="td-table">Informática</td>
								<td class="td-table">08/04/2026</td>
								<td class="td-table">6200 €</td>
								<td class="td-table verde">COMPLETADO</td>
								<td class="td-table">FAC-2026-005</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">9</td>
								<td class="td-table">ELTA/0001/26/0</td>
								<td class="td-table">Miguel Ruiz</td>
								<td class="td-table">Electricidad</td>
								<td class="td-table">09/04/2026</td>
								<td class="td-table">1350 €</td>
								<td class="td-table naranja">PENDIENTE</td>
								<td class="td-table">N/A</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">10</td>
								<td class="td-table">ESO/0001/26/0</td>
								<td class="td-table">Carlos Martínez</td>
								<td class="td-table">Secundaria</td>
								<td class="td-table">10/04/2026</td>
								<td class="td-table">2200 €</td>
								<td class="td-table verde">COMPLETADO</td>
								<td class="td-table">FAC-2026-006</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">11</td>
								<td class="td-table">BAC/0001/26/0</td>
								<td class="td-table">Laura Gómez</td>
								<td class="td-table">Bachillerato</td>
								<td class="td-table">11/04/2026</td>
								<td class="td-table">1750 €</td>
								<td class="td-table naranja">PENDIENTE</td>
								<td class="td-table">N/A</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">12</td>
								<td class="td-table">ADM/0003/26/0</td>
								<td class="td-table">Andriu</td>
								<td class="td-table">Administración</td>
								<td class="td-table">12/04/2026</td>
								<td class="td-table">8900 €</td>
								<td class="td-table verde">COMPLETADO</td>
								<td class="td-table">FAC-2026-007</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="div-container facturas" hidden>
			<div class="title">
				<a>Facturas</a>
			</div>
			<p class="text">Lista de facturas en el sistema</p>
			<div class="grid-content-departamento">
				<div class="content">
					<div class="content-item">
						<a class="content-text">Crear Factura</a>
					</div>
					<div class="content-about-table">
						<table class="table-add">
							<tr>
								<th class="th-table" colspan="2">Nueva Factura</th>
								<th class="th-table" colspan="3">Filtrar Facturas</th>
							</tr>
							<tr class="tr-table">
								<td class="td-table">Crear una nueva factura</td>
								<td class="td-table">
									<button title="Crear Usuario" class="button-action add">📄</button>
								</td>
								<td class="td-table">Filtra las facturas para buscar</td>
								<td class="td-table">
									<input class="user-search" type=search>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="content">
					<div class="content-item">
						<a class="content-text">Lista de facturas</a>
					</div>
					<div class="content-about-table">
						<table class="table">
							<tr>
								<th class="th-table">ID Factura</th>
								<th class="th-table">Pedido Asociado</th>
								<th class="th-table">Proveedor</th>
								<th class="th-table">Fecha Factura</th>
								<th class="th-table">Vencimiento</th>
								<th class="th-table">Numero Factura</th>
								<th class="th-table">Importe</th>
								<th class="th-table">Estado</th>
								<th class="th-table">Accion</th>
							</tr>
							<tr class="tr-table">
								<td class="td-table">1</td>
								<td class="td-table">MECA/0001/26/0</td>
								<td class="td-table">AutoRecambios S.L.</td>
								<td class="td-table">02/04/2026</td>
								<td class="td-table">02/05/2026</td>
								<td class="td-table">FAC-2026-001</td>
								<td class="td-table">3200 €</td>
								<td class="td-table verde">PAGADA</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">2</td>
								<td class="td-table">ADM/0001/26/0</td>
								<td class="td-table">OfiPlus S.A.</td>
								<td class="td-table">03/04/2026</td>
								<td class="td-table">03/05/2026</td>
								<td class="td-table">FAC-2026-002</td>
								<td class="td-table">1500 €</td>
								<td class="td-table verde">PAGADA</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">3</td>
								<td class="td-table">AUTO/0001/26/0</td>
								<td class="td-table">Logística Global S.L.</td>
								<td class="td-table">05/04/2026</td>
								<td class="td-table">05/05/2026</td>
								<td class="td-table">FAC-2026-003</td>
								<td class="td-table">5400 €</td>
								<td class="td-table verde">PAGADA</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">4</td>
								<td class="td-table">TELE/0001/26/0</td>
								<td class="td-table">Telecom España S.A.</td>
								<td class="td-table">08/04/2026</td>
								<td class="td-table">08/05/2026</td>
								<td class="td-table">FAC-2026-004</td>
								<td class="td-table">4100 €</td>
								<td class="td-table verde">PAGADA</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">5</td>
								<td class="td-table">INFO/0001/26/0</td>
								<td class="td-table">Tech Solutions S.L.</td>
								<td class="td-table">09/04/2026</td>
								<td class="td-table">09/05/2026</td>
								<td class="td-table">FAC-2026-005</td>
								<td class="td-table">6200 €</td>
								<td class="td-table verde">PAGADA</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">6</td>
								<td class="td-table">ESO/0001/26/0</td>
								<td class="td-table">EduMaterial S.L.</td>
								<td class="td-table">11/04/2026</td>
								<td class="td-table">11/05/2026</td>
								<td class="td-table">FAC-2026-006</td>
								<td class="td-table">2200 €</td>
								<td class="td-table verde">PAGADA</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">7</td>
								<td class="td-table">ADM/0003/26/0</td>
								<td class="td-table">Servicios Admin S.L.</td>
								<td class="td-table">13/04/2026</td>
								<td class="td-table">13/05/2026</td>
								<td class="td-table">FAC-2026-007</td>
								<td class="td-table">8900 €</td>
								<td class="td-table verde">PAGADA</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">8</td>
								<td class="td-table">ADM/0002/26/0</td>
								<td class="td-table">OfiPlus S.A.</td>
								<td class="td-table">04/04/2026</td>
								<td class="td-table">04/05/2026</td>
								<td class="td-table">FAC-2026-008</td>
								<td class="td-table">890 €</td>
								<td class="td-table naranja">PENDIENTE</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">9</td>
								<td class="td-table">ROBO/0001/26/0</td>
								<td class="td-table">Robotix S.L.</td>
								<td class="td-table">06/04/2026</td>
								<td class="td-table">06/05/2026</td>
								<td class="td-table">FAC-2026-009</td>
								<td class="td-table">2750 €</td>
								<td class="td-table naranja">PENDIENTE</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">10</td>
								<td class="td-table">ELTA/0001/26/0</td>
								<td class="td-table">ElectroParts S.L.</td>
								<td class="td-table">10/04/2026</td>
								<td class="td-table">10/05/2026</td>
								<td class="td-table">FAC-2026-010</td>
								<td class="td-table">1350 €</td>
								<td class="td-table naranja" >PENDIENTE</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">11</td>
								<td class="td-table">BAC/0001/26/0</td>
								<td class="td-table">EduMaterial S.L.</td>
								<td class="td-table">12/04/2026</td>
								<td class="td-table">12/05/2026</td>
								<td class="td-table">FAC-2026-011</td>
								<td class="td-table">1750 €</td>
								<td class="td-table naranja">PENDIENTE</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">12</td>
								<td class="td-table">PRI/0001/26/0</td>
								<td class="td-table">Material Escolar S.L.</td>
								<td class="td-table">07/04/2026</td>
								<td class="td-table">N/A</td>
								<td class="td-table">FAC-2026-012</td>
								<td class="td-table">980 €</td>
								<td class="td-table rojo">CANCELADA</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="div-container presupuestos" hidden>
			<div class="title">
				<a>Presupuestos</a>
			</div>
			<p class="text">Lista de presupuestos en el sistema</p>
			<div class="grid-content-departamento">
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
									<button title="Crear Usuario" class="button-action add">📄</button>
								</td>
								<td class="td-table">Filtra los prespuestos para buscar</td>
								<td class="td-table">
									<input class="user-search" type=search>
								</td>
							</tr>
						</table>
					</div>
				</div>
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
							<tr class="tr-table">
								<td class="td-table">1</td>
								<td class="td-table">Informática</td>
								<td class="td-table">2026</td>
								<td class="td-table">25000 €</td>
								<td class="td-table">18000 €</td>
								<td class="td-table">7000 €</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">2</td>
								<td class="td-table">Mecánica</td>
								<td class="td-table">2026</td>
								<td class="td-table">30000 €</td>
								<td class="td-table">31000 €</td>
								<td class="td-table nev">-1000 €</td>
								<td class="td-table rojizo">NEGATIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">3</td>
								<td class="td-table">Electricidad</td>
								<td class="td-table">2026</td>
								<td class="td-table">20000 €</td>
								<td class="td-table">18500 €</td>
								<td class="td-table">1500 €</td>
								<td class="td-table rojo">BAJO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">4</td>
								<td class="td-table">Automoción</td>
								<td class="td-table">2026</td>
								<td class="td-table">40000 €</td>
								<td class="td-table">25000 €</td>
								<td class="td-table">15000 €</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">5</td>
								<td class="td-table">Grado Básico</td>
								<td class="td-table">2026</td>
								<td class="td-table">15000 €</td>
								<td class="td-table">15000 €</td>
								<td class="td-table">0 €</td>
								<td class="td-table  gris">SIN PRESUPUESTO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">6</td>
								<td class="td-table">Telecomunicaciones</td>
								<td class="td-table">2026</td>
								<td class="td-table">27000 €</td>
								<td class="td-table">20000 €</td>
								<td class="td-table">7000 €</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">7</td>
								<td class="td-table">Robótica</td>
								<td class="td-table">2026</td>
								<td class="td-table">20000 €</td>
								<td class="td-table">19500 €</td>
								<td class="td-table">500 €</td>
								<td class="td-table rojo">BAJO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">8</td>
								<td class="td-table">Primaria</td>
								<td class="td-table">2026</td>
								<td class="td-table">12000 €</td>
								<td class="td-table">8000 €</td>
								<td class="td-table">4000 €</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">9</td>
								<td class="td-table">Infantil</td>
								<td class="td-table">2026</td>
								<td class="td-table">10000 €</td>
								<td class="td-table">9500 €</td>
								<td class="td-table">500 €</td>
								<td class="td-table rojo">BAJO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">10</td>
								<td class="td-table">Secundaria</td>
								<td class="td-table">2026</td>
								<td class="td-table">28000 €</td>
								<td class="td-table">20000 €</td>
								<td class="td-table">8000 €</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">11</td>
								<td class="td-table">Bachillerato</td>
								<td class="td-table">2026</td>
								<td class="td-table">26000 €</td>
								<td class="td-table">21000 €</td>
								<td class="td-table">5000 €</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">12</td>
								<td class="td-table">SAT</td>
								<td class="td-table">2026</td>
								<td class="td-table">15000 €</td>
								<td class="td-table">5000 €</td>
								<td class="td-table">10000 €</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">13</td>
								<td class="td-table">Mantenimiento</td>
								<td class="td-table">2026</td>
								<td class="td-table">18000 €</td>
								<td class="td-table">17000 €</td>
								<td class="td-table">1000 €</td>
								<td class="td-table rojo">BAJO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">14</td>
								<td class="td-table">Premio Don Bosco</td>
								<td class="td-table">2026</td>
								<td class="td-table">8000 €</td>
								<td class="td-table">3000 €</td>
								<td class="td-table">5000 €</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">15</td>
								<td class="td-table">Formación</td>
								<td class="td-table">2026</td>
								<td class="td-table">12000 €</td>
								<td class="td-table">11000 €</td>
								<td class="td-table">1000 €</td>
								<td class="td-table rojo">BAJO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">16</td>
								<td class="td-table">Administración</td>
								<td class="td-table">2026</td>
								<td class="td-table">50000 €</td>
								<td class="td-table">42000 €</td>
								<td class="td-table">8000 €</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="div-container proveedores" hidden>
			<div class="title">
				<a>Proveedores</a>
			</div>
			<p class="text">Lista de proveedores en el sistema</p>
			<div class="grid-content-departamento">
				<div class="content">
					<div class="content-item">
						<a class="content-text">Crear Proveedor</a>
					</div>
					<div class="content-about-table">
						<table class="table-add">
							<tr>
								<th class="th-table" colspan="2">Nuevo Proveedor</th>
								<th class="th-table" colspan="3">Filtrar Proveedores</th>
							</tr>
							<tr class="tr-table">
								<td class="td-table">Crear un nuevo proveedor</td>
								<td class="td-table">
									<button title="Crear Usuario" class="button-action add">📄</button>
								</td>
								<td class="td-table">Filtra los proveedores para buscar</td>
								<td class="td-table">
									<input class="user-search" type=search>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="content">
					<div class="content-item">
						<a class="content-text">Lista de proveedores</a>
					</div>
					<div class="content-about-table">
						<table class="table">
							<tr>
								<th class="th-table">ID Proveedor</th>
								<th class="th-table">Nombre Proveedor</th>
								<th class="th-table">CIF</th>
								<th class="th-table">Telefono</th>
								<th class="th-table">Email</th>
								<th class="th-table">Fecha Alta</th>
								<th class="th-table">Fecha Baja</th>
								<th class="th-table">Estado</th>
								<th class="th-table">Accion</th>
							</tr>

							<tr class="tr-table">
								<td class="td-table">1</td>
								<td class="td-table">TecnoSuministros SL</td>
								<td class="td-table">B12345678</td>
								<td class="td-table">976123456</td>
								<td class="td-table">contacto@tecnosum.es</td>
								<td class="td-table">12/01/2022</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">2</td>
								<td class="td-table">ElectroZaragoza SA</td>
								<td class="td-table">A87654321</td>
								<td class="td-table">976654321</td>
								<td class="td-table">info@electrozgz.com</td>
								<td class="td-table">03/05/2021</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">3</td>
								<td class="td-table">Mecánica Industrial Ruiz</td>
								<td class="td-table">B23456789</td>
								<td class="td-table">976112233</td>
								<td class="td-table">ruiz@mecindustrial.es</td>
								<td class="td-table">20/09/2020</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">4</td>
								<td class="td-table">AutoParts Aragón</td>
								<td class="td-table">B34567890</td>
								<td class="td-table">976445566</td>
								<td class="td-table">ventas@autopartsaragon.es</td>
								<td class="td-table">11/02/2023</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">5</td>
								<td class="td-table">Servicios Informáticos Vega</td>
								<td class="td-table">B45678901</td>
								<td class="td-table">976778899</td>
								<td class="td-table">soporte@vegaIT.es</td>
								<td class="td-table">18/06/2022</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">6</td>
								<td class="td-table">Logística Torres Group</td>
								<td class="td-table">B56789012</td>
								<td class="td-table">976998877</td>
								<td class="td-table">logistica@torresgroup.es</td>
								<td class="td-table">09/11/2021</td>
								<td class="td-table">15/03/2025</td>
								<td class="td-table rojo">INACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">7</td>
								<td class="td-table">EduMaterial Escolar SL</td>
								<td class="td-table">B67890123</td>
								<td class="td-table">976223344</td>
								<td class="td-table">info@edumaterial.es</td>
								<td class="td-table">01/09/2023</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">8</td>
								<td class="td-table">Telecom Aragón Solutions</td>
								<td class="td-table">B78901234</td>
								<td class="td-table">976556677</td>
								<td class="td-table">contacto@telecomaragon.es</td>
								<td class="td-table">14/04/2022</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>
							<tr class="tr-table">
								<td class="td-table">9</td>
								<td class="td-table">Seguridad Industrial Aragón</td>
								<td class="td-table">B89012345</td>
								<td class="td-table">976334455</td>
								<td class="td-table">contacto@seguridadaragon.es</td>
								<td class="td-table">07/03/2023</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action delete">🗑️</button>
								</td>
							</tr>

							<tr class="tr-table">
								<td class="td-table">10</td>
								<td class="td-table">Papelería Técnica Escolar</td>
								<td class="td-table">B90123456</td>
								<td class="td-table">976667788</td>
								<td class="td-table">ventas@papeleriatecnica.es</td>
								<td class="td-table">15/01/2024</td>
								<td class="td-table">N/A</td>
								<td class="td-table verde">ACTIVO</td>
								<td class="td-table">
									<button class="button-action edit">✏️</button>
									<button class="button-action toggle">💡</button>
									<button class="button-action delete">🗑️</button>
								</td>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<%=request.getContextPath()%>/js/inicio.js"></script>
<script src="<%=request.getContextPath()%>/js/buscador.js"></script>
</html>