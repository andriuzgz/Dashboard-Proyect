package servlets;

import dao.FacturaDAO;
import model.Factura;
import model.Permiso;
import utils.PermisosUtil;
import dao.DepartamentoDAO;
import model.Departamento;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/facturas")
public class FacturasServlet extends HttpServlet {

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

		if (!PermisosUtil.tienePermiso(permisos, "facturas", "leer")) {

			request.setAttribute("error", "No tienes permisos para acceder a este módulo");
			request.setAttribute("contenido", "/jsp/error/denied.jsp");
			request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);

			return;
		}

		FacturaDAO fdao = new FacturaDAO();

		// ADMIN Y CONTABLE
		if (rol == 1 || rol == 2) {

			List<Factura> facturas = fdao.obtenerTodas();

			request.setAttribute("facturas", facturas);

			request.setAttribute("contenido", "/jsp/pages/facturas_uno.jsp");
		}

		// JEFE DEPARTAMENTO
		else if (rol == 3) {

			DepartamentoDAO ddao = new DepartamentoDAO();

			Departamento d = ddao.obtenerPorResponsable(id);

			List<Factura> facturas = fdao.obtenerPorDepartamento(d.getId());

			request.setAttribute("facturas", facturas);
			request.setAttribute("contenido", "/jsp/pages/factura_dos.jsp");
		}

		// ERROR
		else {

			request.setAttribute("contenido", "/jsp/error/denied.jsp");
		}

		request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);
	}
}