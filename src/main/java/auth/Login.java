package auth;

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
import methods.Conexion;
import methods.FechaLog;
import model.Permiso;

import java.security.MessageDigest;
import java.math.BigInteger;
import java.util.List;

import dao.PermisoDAO;

@WebServlet("/login")
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Encriptar Contraseña | MD5 
    public static String md5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);

            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }

            return hashtext;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    // Sistema de Inicio de Sesion
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String sql = "SELECT id_usuario, nombre, rol \r\n"
        		+ "FROM usuario \r\n"
        		+ "WHERE nombre COLLATE utf8mb4_general_ci = ? \r\n"
        		+ "AND password = ? \r\n"
        		+ "AND estado = 1;";
        
        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            String passHash = md5(pass);

            ps.setString(1, user);
            ps.setString(2, passHash);

            try (ResultSet rs = ps.executeQuery()) {

            	if (rs.next()) {

            	    HttpSession session = request.getSession();
            	    session.setAttribute("id", rs.getInt("id_usuario"));
            	    session.setAttribute("nombre", rs.getString("nombre"));
            	    session.setAttribute("rol", rs.getInt("rol"));

            	    PermisoDAO pdao = new PermisoDAO();
            	    List<Permiso> permisos = pdao.obtenerPorRol(rs.getInt("rol"));
            	    session.setAttribute("permisos", permisos);

            	    // LOG
            	    FechaLog fl = new FechaLog();
            	    String logdate = fl.fechaLog();
            	    
            	    System.out.println("[" + logdate + "] [INFO] Login: Usuario '" 
            	            + user + "' ha iniciado sesión correctamente");

            	    // REDIRECT
            	    response.sendRedirect(request.getContextPath() + "/inicio");
            	    
            	} else {
            		
            	    FechaLog fl = new FechaLog();
            	    String logdate = fl.fechaLog();

                	System.out.println("[" + logdate + "] [WARN] Login FAILED: Usuario '" 
                	        + user + "' ha fallado el login");

                    response.sendRedirect(request.getContextPath() + "/auth/login.jsp?error=1");
                }
                
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp?error=sql");
        }
    }
    
}