package servlets;

import java.io.IOException;
import java.util.List;

import dao.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Permiso;
import model.Usuario;
import utils.PermisosUtil;

@WebServlet("/perfil")
public class PerfilServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        @SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

        if (!PermisosUtil.tienePermiso(permisos, "perfil", "leer")) {

            request.setAttribute("error", "No tienes permisos para acceder a este módulo");
            request.setAttribute("contenido", "/jsp/error/denied.jsp");

            request.getRequestDispatcher("/jsp/components/layout.jsp")
                   .forward(request, response);

            return;
        }
		
		HttpSession session = request.getSession();
		Integer id = (Integer) session.getAttribute("id");

		if (id == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		UsuarioDAO dao = new UsuarioDAO();
		Usuario usuario = dao.obtenerPorId(id);

		request.setAttribute("usuario", usuario);

		request.setAttribute("contenido", "/jsp/pages/perfil.jsp");
		request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);
	}
}