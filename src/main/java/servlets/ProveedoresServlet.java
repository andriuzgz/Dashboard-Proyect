package servlets;

import dao.DepartamentoDAO;
import dao.ProveedorDAO;
import model.Departamento;
import model.Permiso;
import model.Proveedor;
import utils.PermisosUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/proveedores")
public class ProveedoresServlet extends HttpServlet {

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

		if (!PermisosUtil.tienePermiso(permisos, "proveedores", "leer")) {

			request.setAttribute("error", "No tienes permisos para acceder a este módulo");
			request.setAttribute("contenido", "/jsp/error/denied.jsp");
			request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);

			return;
		}

		ProveedorDAO pdao = new ProveedorDAO();

		// ADMIN Y CONTABLE
		if (rol == 1 || rol == 2) {

			List<Proveedor> proveedores = pdao.obtenerTodos();

			request.setAttribute("proveedores", proveedores);
			request.setAttribute("contenido", "/jsp/pages/proveedores.jsp");
		}

		// JEFE DEPARTAMENTO
		else if (rol == 3) {

			DepartamentoDAO ddao = new DepartamentoDAO();

			Departamento d = ddao.obtenerPorResponsable(id);

			List<Proveedor> proveedores = pdao.obtenerPorDepartamento(d.getId());

			request.setAttribute("proveedores", proveedores);
			request.setAttribute("contenido", "/jsp/pages/proveedores.jsp");
		}

		// ERROR
		else {

			request.setAttribute("contenido", "/jsp/error/denied.jsp");
		}

		request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);
	}
}