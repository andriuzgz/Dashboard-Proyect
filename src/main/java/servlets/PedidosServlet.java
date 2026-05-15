package servlets;

import dao.PedidoDAO;
import dao.ProveedorDAO;
import model.Pedido;
import model.Permiso;
import model.Proveedor;
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

		// DAO
		PedidoDAO pdao = new PedidoDAO();
		ProveedorDAO provdao = new ProveedorDAO();
		DepartamentoDAO ddao = new DepartamentoDAO();
		
		Departamento d = ddao.obtenerPorResponsable(id);

		// ADMIN Y CONTABLE
		if (rol == 1 || rol == 2) {

			List<Pedido> pedidos = pdao.obtenerTodos();
			List<Proveedor> proveedores = provdao.obtenerTodos();

			request.setAttribute("proveedores", proveedores);
			request.setAttribute("pedidos", pedidos);
			request.setAttribute("contenido", "/jsp/pages/pedidos_uno.jsp");
		}

		// JEFE DEPARTAMENTO
		else if (rol == 3) {
			
			List<Pedido> pedidos = pdao.obtenerPorDepartamento(d.getId());
			List<Proveedor> proveedores = provdao.obtenerPorDepartamento(d.getId());

			request.setAttribute("proveedores", proveedores);
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