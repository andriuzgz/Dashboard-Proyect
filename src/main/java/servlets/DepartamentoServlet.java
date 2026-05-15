package servlets;

import dao.DepartamentoDAO;
import model.Departamento;
import model.Permiso;
import utils.PermisosUtil;
import dao.ProveedorDAO;
import dao.UsuarioDAO;
import model.Proveedor;
import model.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/departamentos")
public class DepartamentoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer id = (Integer) request.getSession().getAttribute("id");
		Integer rol = (Integer) request.getSession().getAttribute("rol");

		if (id == null) {
			response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
			return;
		}

		@SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

		if (!PermisosUtil.tienePermiso(permisos, "departamentos", "leer")) {

			request.setAttribute("error", "No tienes permisos para acceder a este módulo");
			request.setAttribute("contenido", "/jsp/error/denied.jsp");

			request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);

			return;
		}

		DepartamentoDAO ddao = new DepartamentoDAO();
		ProveedorDAO pdao = new ProveedorDAO();
		UsuarioDAO udao = new UsuarioDAO();
		
		// ADMIN Y CONTABLE
		if (rol == 1 || rol == 2) {

			List<Usuario> usuario = udao.obtenerTodos();
			List<Departamento> lista = ddao.obtenerTodos();

			request.setAttribute("usuario", usuario);
			request.setAttribute("departamentos", lista);
			request.setAttribute("contenido", "/jsp/pages/departamentos_uno.jsp");
		}

		// JEFE DEPARTAMENTO
		else if (rol == 3) {

			Departamento d = ddao.obtenerPorResponsable(id);

			List<Proveedor> proveedores = pdao.obtenerPorDepartamento(d.getId());

			request.setAttribute("departamento", d);
			request.setAttribute("proveedores", proveedores);
			request.setAttribute("contenido", "/jsp/pages/departamentos_dos.jsp");
		}

		// ERROR
		else {
			request.setAttribute("contenido", "/jsp/error/denied.jsp");
		}

		request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);
	}
}