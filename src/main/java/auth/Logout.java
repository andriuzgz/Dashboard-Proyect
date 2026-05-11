package auth;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import methods.FechaLog;


@WebServlet("/logout")
public class Logout extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        
	    FechaLog fl = new FechaLog();
	    String logdate = fl.fechaLog();

        if (session != null) {
            String user = (String) session.getAttribute("nombre");

            System.out.println("[" + logdate + "] [INFO] Logout: Usuario '" 
                    + user + "' ha cerrado sesión");

            session.invalidate();
        }

        response.sendRedirect("auth/login.jsp");
    }
}