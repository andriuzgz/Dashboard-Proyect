package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;

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

        String sql = "SELECT * FROM usuario WHERE nombre=? AND password=?";

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user);
            ps.setString(2, pass);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    // ✅ LOGIN OK
                    HttpSession session = request.getSession();
                    session.setAttribute("nombre", rs.getString("nombre"));
                    session.setAttribute("rol", rs.getString("rol"));

                    // 🔥 AUDITORÍA (SIN PASSWORD)
                    System.out.println("[" + LocalDateTime.now() + "] [INFO] Login: Usuario '" 
                            + user + "' ha iniciado sesión correctamente");

                    response.sendRedirect(request.getContextPath() + "/jsp/inicio.jsp");

                } else {

                    // ⚠️ LOGIN FAIL
                    System.out.println("[" + LocalDateTime.now() + "] [WARN] Login FAILED: Usuario '" 
                            + user + "' ha fallado el login");

                    response.sendRedirect(request.getContextPath() + "/login.jsp?error=1");
                }
            }

        } catch (Exception e) {

            // 💀 ERROR SQL
            System.out.println("[" + LocalDateTime.now() + "] [ERROR] Login SQL ERROR para usuario '" 
                    + user + "'");
            e.printStackTrace();

            response.sendRedirect(request.getContextPath() + "/login.jsp?error=sql");
        }
    }
}