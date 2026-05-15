package servlets;

import dao.DepartamentoDAO;
import dao.RolDAO;
import dao.UsuarioDAO;
import model.Permiso;
import model.Usuario;
import utils.PermisosUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/usuarios")
public class UsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		@SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

		if (!PermisosUtil.tienePermiso(permisos, "usuarios", "leer")) {

			request.setAttribute("error", "No tienes permisos para acceder a este módulo");
			request.setAttribute("contenido", "/jsp/error/denied.jsp");

			request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);

			return;
		}

		HttpSession session = request.getSession();
		Integer id = (Integer) session.getAttribute("id");

		if (id == null) {
			response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
			return;
		}

		UsuarioDAO udao = new UsuarioDAO();
		List<Usuario> usuarios = udao.obtenerTodos();
		request.setAttribute("usuarios", usuarios);

		RolDAO rdao = new RolDAO();
		request.setAttribute("roles", rdao.obtenerTodos());

		DepartamentoDAO ddao = new DepartamentoDAO();
		request.setAttribute("departamentos", ddao.obtenerTodos());

		request.setAttribute("contenido", "/jsp/pages/usuarios.jsp");
		request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);
	}
}