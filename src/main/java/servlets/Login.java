package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        try {
            Connection con = Conexion.getConnection();

            String sql = "SELECT * FROM usuario WHERE nombre=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

            	HttpSession session = request.getSession();
            	session.setAttribute("nombre", rs.getString("nombre"));
            	//session.setAttribute("rol", rs.getString("rol"));

            	response.sendRedirect("jsp/Inicio.jsp");
                
                // Debug
                System.out.println("User: " + user);
                //System.out.println("Pass: " + pass);

            } else {
            	response.sendRedirect(request.getContextPath() + "/jsp/inicio.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}