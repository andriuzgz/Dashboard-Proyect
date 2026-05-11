package servlets;

import dao.PedidoDAO;
import model.Pedido;
import model.Permiso;
import utils.PermisosUtil;
import dao.DepartamentoDAO;
import model.Departamento;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/pedidos")
public class PedidosServlet extends HttpServlet {

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

		if (!PermisosUtil.tienePermiso(permisos, "pedidos", "leer")) {

			request.setAttribute("error", "No tienes permisos para acceder a este módulo");
			request.setAttribute("contenido", "/jsp/error/denied.jsp");
			request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);

			return;
		}

		PedidoDAO pdao = new PedidoDAO();

		// ADMIN Y CONTABLE
		if (rol == 1 || rol == 2) {

			List<Pedido> pedidos = pdao.obtenerTodos();

			request.setAttribute("pedidos", pedidos);
			request.setAttribute("contenido", "/jsp/pages/pedidos_uno.jsp");
		}

		// JEFE DEPARTAMENTO
		else if (rol == 3) {

			DepartamentoDAO ddao = new DepartamentoDAO();

			Departamento d = ddao.obtenerPorResponsable(id);

			List<Pedido> pedidos = pdao.obtenerPorDepartamento(d.getId());

			request.setAttribute("pedidos", pedidos);
			request.setAttribute("contenido", "/jsp/pages/pedidos_dos.jsp");
		}

		// ERROR
		else {

			request.setAttribute("contenido", "/jsp/error/denied.jsp");
		}

		request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);
	}
}