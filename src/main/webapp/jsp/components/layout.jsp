<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>

<%
Integer id = (Integer) session.getAttribute("id");

if (id == null) {
	response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="<%=request.getContextPath()%>/icon.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/inicio.css">
</head>
<body data-userid="<%=session.getAttribute("id")%>">
	<div id="modalLogout" class="modal">
		<div class="modal-box">
			<div class="modal-bar">
				<a>¿Cerrar Sesion?</a>
			</div>
			<div class="modal-actions">
				<p>¿Quiere cerrar la sesion?</p>
				<br>
				<button type="button" class="button" onclick="cerrarModal()">Cancelar</button>
				<button type="button" class="button confirm"
					onclick="confirmarLogout()">Sí, salir</button>
			</div>
		</div>
	</div>
	<form action="<%=request.getContextPath()%>/logout" method="post"
		id="formLogout"></form>
		
	<!--  Interfaz Principal  -->
	<div class="interface">
	
		<!-- Navbar Include  -->
		<jsp:include page="/jsp/components/navbar.jsp" />

		<!-- Page Include  -->
		<jsp:include page='<%=(String) request.getAttribute("contenido")%>' />
		
	</div>
</body>
<script src="<%=request.getContextPath()%>/js/buscador.js"></script>
<script src="<%=request.getContextPath()%>/js/permisos.js"></script>
<script src="<%=request.getContextPath()%>/js/logout.js"></script>
</html>