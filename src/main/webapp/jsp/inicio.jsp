<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%
String nombre = (String) session.getAttribute("nombre");
String rol = (String) session.getAttribute("rol");

if (nombre == null || rol == null) {
    response.sendRedirect("../login.html");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/inicio.css">

</head>
<body>
    <div class="interface">
        <div class="nav">
            <a class="logo"><img src="logo.png" alt="Logo"></a>
			<a class="username">Hola <%= nombre %></a>
				<button class="button" type="button" data-target="inicio">Inicio</button>
				<button class="button" type="button" data-target="mi-perfil">Mi Perfil</button>
				<button class="button" type="button" data-target="usuarios">Usuarios</button>
				<button class="button" type="button" data-target="departamentos">Departamentos</button>
				<button class="button" type="button" data-target="proveedores">Proveedores</button>
				<button class="button" type="button" data-target="pedidos">Pedidos</button>
				<button class="button" type="button" data-target="facturas">Facturas</button>
				<button class="button" type="button" data-target="presupuestos">Presupuestos</button>
			<form action="<%= request.getContextPath() %>/logout" method="post">
    			<button class="button salir">Cerrar Sesion</button>
			</form>
        </div>
        <div class="div-container inicio">
            <div class="title">
                <a>Inicio</a>
            </div>
            <p class="text">Bienvenido <%= nombre %> a la aplicación de gestión de pedidos y presupuestos. Aquí podrás administrar usuarios, departamentos, pedidos, presupuestos y proveedores de manera eficiente.</p>
            <div class="grid-content">
                <div class="content">
                    <div class="content-item">
                        <a class="content-text">Resumen de Actividad</a>
                    </div>
                    <div class="content-about-item">
                        <a class="content-text">X</a>
                    </div>
                </div>
                <div class="content">
                    <div class="content-item">
                        <a class="content-text">Resumen de Usuarios</a>
                    </div>
                    <div class="content-about-item">
                        <a class="content-text">X</a>
                    </div>
                </div>
                <div class="content">
                    <div class="content-item">
                        <a class="content-text">Resumen de Proveedores</a>
                    </div>
                    <div class="content-about-item">
                        <a class="content-text">X</a>
                    </div>
                </div>
                <div class="content">
                    <div class="content-item">
                        <a class="content-text">Resumen de Pedidos</a>
                    </div>
                    <div class="content-about-item">
                        <a class="content-text">X</a>
                    </div>
                </div>
                <div class="content">
                    <div class="content-item">
                        <a class="content-text">Resumen de Facturas</a>
                    </div>
                    <div class="content-about-item">
                        <a class="content-text">X</a>
                    </div>
                </div>
                <div class="content">
                    <div class="content-item">
                        <a class="content-text">Pedidos Sin Factura</a>
                    </div>
                    <div class="content-about-item">
                        <a class="content-text">X</a>
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
                        <a class="content-text">Informacion Personal</a>
                    </div>
                    <div class="content-about-item">
                       	<p class="content-text">Nombre: <%= nombre %></p>
                       	<p class="content-text">Apellidos: </p>
                       	<p class="content-text">Fecha Nacimiento: </p>
                    </div>
                    <div class="content-perfil">
                        <a class="content-text">Detalles de la Cuenta</a>
                    </div>
                    <div class="content-about-item">
                        <p class="content-text">Rol: </p>
                        <p class="content-text">Departamento: </p>
                        <p class="content-text">Fecha Alta:  </p>
                        <p class="content-text">Estado: </p>
                    </div>                  
                </div>
                <div class="content">
				    <div class="content-item">
					    <a class="content-text">Informacion del Panel</a>
					</div>
					<div class="content-about-item">
					    <p class="content-text">Año de Desarrollo: 04/2026 </p>
					    <p class="content-text">Desarrollador: Andriu Joshua Rodriguez Correa | Alias ZekyyCZ</p>
					    <p class="content-text">Version: Indev</p>
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
	                    	<th class="th-table" colspan="3">Filtrar Usuario</th>
						</tr>
                    	<tr class="tr-table">
                    		<td class="td-table">Crea una nueva cuenta para el usuario</td>
                    		<td class="td-table">
                    			<button title="Crear Usuario" class="button-action add">📄</button>
                    		</td>
                    		<td class="td-table">Filtra los usuarios para buscar</td>
                    		<td class="td-table">
                    			<input type=search>
                    		</td>
                    		<td class="td-table">
                    			<button title="Filtrar Usuario" class="button-action search">🔎</button>
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
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">
                    			<button title="Editar Usuario" class="button-action edit">✏️</button>
                    			<button title="Activar / Desactivar" class="button-action toggle">💡</button>
                    			<button title="Reiniciar Contraseña" class="button-action restart">🔑</button>
                    			<button title="Eliminar Usuario" class="button-action delete">🗑️</button>
                    		</td>
                    	</tr>
                    	<tr class="tr-table">
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">
                    			<button class="button-action edit">✏️</button>
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
                        <a class="content-text">Lista de departamentos</a>
                    </div>
					<div class="content-about-table">
					<table class="table">
						<tr>
	                    	<th class="th-table">ID Departamento</th>
	                    	<th class="th-table">Nombre</th>
	                    	<th class="th-table">Responsable</th>
	                    	<th class="th-table">Usuarios</th>
	                    	<th class="th-table">Presupuesto</th>
	                    	<th class="th-table">Estado</th>
	                    	<th class="th-table">Accion</th>
						</tr>
                    	<tr class="tr-table">
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">
                    			<button title="Editar Usuario" class="button-action edit">✏️</button>
                    			<button title="Eliminar Usuario" class="button-action delete">🗑️</button>
                    		</td>
                    	</tr>
                    	<tr class="tr-table">
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
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
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">
                    			<button title="Editar Usuario" class="button-action edit">✏️</button>
                    			<button title="Eliminar Usuario" class="button-action delete">🗑️</button>
                    		</td>
                    	</tr>
                    	<tr class="tr-table">
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
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
                        <a class="content-text">Lista de facturas</a>
                    </div>
					<div class="content-about-table">
					<table class="table">
						<tr>
	                    	<th class="th-table">ID Factura</th>
	                    	<th class="th-table">Pedido Asociado</th>
	                    	<th class="th-table">Proveedor</th>
	                    	<th class="th-table">Fecha Factura</th>
	                    	<th class="th-table">Numero Factura</th>
	                    	<th class="th-table">Importe</th>
	                    	<th class="th-table">Estado</th>
	                    	<th class="th-table">Accion</th>
						</tr>
                    	<tr class="tr-table">
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">
                    			<button title="Editar Usuario" class="button-action edit">✏️</button>
                    			<button title="Eliminar Usuario" class="button-action delete">🗑️</button>
                    		</td>
                    	</tr>
                    	<tr class="tr-table">
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
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
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">
                    			<button title="Editar Usuario" class="button-action edit">✏️</button>
                    			<button title="Eliminar Usuario" class="button-action delete">🗑️</button>
                    		</td>
                    	</tr>
                    	<tr class="tr-table">
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
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
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">
                    			<button title="Editar Usuario" class="button-action edit">✏️</button>
                    			<button title="Activar / Desactivar" class="button-action toggle">💡</button>
                    			<button title="Eliminar Usuario" class="button-action delete">🗑️</button>
                    		</td>
                    	</tr>
                    	<tr class="tr-table">
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">N/A</td>
                    		<td class="td-table">
                    			<button class="button-action edit">✏️</button>
                    			<button title="Activar / Desactivar" class="button-action toggle">💡</button>
                    			<button class="button-action delete">🗑️</button>
                    		</td>
                    	</tr>
                    </table>
                    </div> 
                </div>             
            </div>
        </div>
    </div>
</body>
<script src="<%= request.getContextPath() %>/js/inicio.js"></script>
</html>