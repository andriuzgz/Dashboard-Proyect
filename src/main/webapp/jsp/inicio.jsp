<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" type="text/css" href="css/inicio.css">
</head>
<body>
    <div class="interface">
        <div class="nav">
            <a class="logo"><img src="logo.png" alt="Logo"></a>
            <a class="username">Hola Andriu</a>
            <button class="button">Inicio</button>
            <button class="button">Mi Perfil</button>
            <button class="button">Usuarios</button>
            <button class="button">Departamentos</button>
            <button class="button">Pedidos</button>
            <button class="button">Facturas</button>
            <button class="button">Presupuestos</button>
            <button class="button">Proveedores</button>
            <button class="button salir" action="salir">Cerrar Sesion</button>
        </div>
        <div class="div-container inicio">
            <div class="title">
                <a>Inicio</a>
            </div>
            <p class="text">Bienvenido a la aplicación de gestión de pedidos y presupuestos. Aquí podrás administrar usuarios, departamentos, pedidos, presupuestos y proveedores de manera eficiente.</p>
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
                        <a class="content-text">X</a>
                    </div>
                </div>
                <div class="content">
                    <div class="content-item">
                        <a class="content-text">Detalles de la Cuenta</a>
                    </div>
                    <div class="content-about-item">
                        <a class="content-text">X</a>
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
                        <a class="content-text">Lista de usuarios</a>
                    </div>
                    <div class="content-about-item">
                        <a class="content-text">X</a>
                    </div>
                </div>
                <div class="content">
                    <div class="content-item">
                        <a class="content-text">Estadisticas de Usuarios</a>
                    </div>
                    <div class="content-about-item">
                        <a class="content-text">X</a>
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
                    <div class="content-about-item">
                        <a class="content-text">X</a>
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
                    <div class="content-about-item">
                        <a class="content-text">X</a>
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
                    <div class="content-about-item">
                        <a class="content-text">X</a>
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
                    <div class="content-about-item">
                        <a class="content-text">X</a>
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
                    <div class="content-about-item">
                        <a class="content-text">X</a>
                    </div>
                </div>             
            </div>
        </div>
    </div>
</body>
</html>