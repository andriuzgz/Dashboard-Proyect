<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <link rel="icon" href="<%=request.getContextPath()%>/icon.ico">
    <title>Iniciar Sesion</title>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <a class="login-text">Iniciar Sesion</a>
        </div>
        <div class="login-form">
            <form action="<%= request.getContextPath() %>/login" method="post">
                <label class="login-label" for="username">Usuario:</label><br>
                <input class="login-input" type="text" id="username" name="username" required><br>
                <label class="login-label" for="password">Contraseña:</label><br>
                <input class="login-input" type="password" id="password" name="password" required><br><br>
			    <% 
			    String error = request.getParameter("error");
			    if (error != null) {
			    %>
			        <a class="login-error">Usuario o contraseña incorrectos</a><br><br>
			    <%
			    }
			    %>
                <button class="login-button" type="submit">Iniciar Sesion</button>
            </form>
        </div>
    </div>
</body>
</html>