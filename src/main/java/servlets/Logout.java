package servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/logout")
public class Logout extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null) {
            String user = (String) session.getAttribute("nombre");

            System.out.println("[INFO] Logout: Usuario '" + user + "' ha cerrado sesión");

            session.invalidate();
        }

        response.sendRedirect("login.jsp");
    }
}