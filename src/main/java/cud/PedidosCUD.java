package cud;

import dao.PedidoDAO;
import model.Pedido;
import model.Permiso;
import utils.PermisosUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/cud/pedidos")
public class PedidosCUD extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private Date parseFecha(String fecha) throws Exception {

		return new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		@SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

		String action = request.getParameter("action");

		PedidoDAO dao = new PedidoDAO();

		try {

			// =========================
			// CREAR
			// =========================
			if ("crear".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "pedidos", "crear")) {
					response.sendError(403);
					return;
					
				}

				Pedido p = new Pedido();

				p.setUsuarioId(Integer.parseInt(request.getParameter("usuario")));
				p.setDepartamentoId(Integer.parseInt(request.getParameter("departamento")));
				p.setProveedorId(Integer.parseInt(request.getParameter("proveedor")));
				p.setEstadoInt(Integer.parseInt(request.getParameter("estado")));
				p.setFacturaId(Integer.parseInt(request.getParameter("factura")));
				p.setNumero(Integer.parseInt(request.getParameter("numero")));
				p.setAnio(Integer.parseInt(request.getParameter("anio")));
				p.setFecha(parseFecha(request.getParameter("fecha")));
				p.setInversion(Double.parseDouble(request.getParameter("inversion")));
				p.setCantidad(Integer.parseInt(request.getParameter("cantidad")));

				dao.insertar(p);
			}

			// =========================
			// EDITAR
			// =========================
			else if ("editar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "pedidos", "editar")) {
					response.sendError(403);
					return;
					
				}

				Pedido p = new Pedido();

				p.setId(Integer.parseInt(request.getParameter("id")));
				p.setUsuarioId(Integer.parseInt(request.getParameter("usuario")));
				p.setDepartamentoId(Integer.parseInt(request.getParameter("departamento")));
				p.setProveedorId(Integer.parseInt(request.getParameter("proveedor")));
				p.setEstadoInt(Integer.parseInt(request.getParameter("estado")));
				p.setFacturaId(Integer.parseInt(request.getParameter("factura")));
				p.setNumero(Integer.parseInt(request.getParameter("numero")));
				p.setAnio(Integer.parseInt(request.getParameter("anio")));
				p.setFecha(parseFecha(request.getParameter("fecha")));
				p.setInversion(Double.parseDouble(request.getParameter("inversion")));
				p.setCantidad(Integer.parseInt(request.getParameter("cantidad")));

				dao.actualizar(p);
			}

			// =========================
			// ELIMINAR
			// =========================
			else if ("eliminar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "pedidos", "eliminar")) {
					response.sendError(403);
					return;
					
				}

				int id = Integer.parseInt(request.getParameter("id"));

				dao.eliminar(id);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/pedidos");
	}
}