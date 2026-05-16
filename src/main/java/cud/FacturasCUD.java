package cud;

import dao.FacturaDAO;
import dao.PedidoDAO;
import model.Factura;
import model.Permiso;
import utils.PermisosUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/cud/facturas")
public class FacturasCUD extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		@SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

		String action = request.getParameter("action");

		FacturaDAO dao = new FacturaDAO();

		try {

			// =========================
			// CREAR
			// =========================
			if ("crear".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "facturas", "crear")) {
					response.sendError(403);
					return;
				}

				Factura f = new Factura();

				// =========================
				// GENERAR NUMERO FACTURA
				// =========================
				int siguiente = dao.obtenerUltimoId() + 1;

				String numero = "FAC-2026-" + String.format("%03d", siguiente);
				f.setNumero(numero);

				// =========================
				// SOLO IMPORTE
				// =========================
				f.setImporte(Double.parseDouble(request.getParameter("importe")));
				f.setNumero(numero);

				int idPedido = Integer.parseInt(request.getParameter("pedido"));
				int idFactura = dao.insertar(f);

				PedidoDAO pdao = new PedidoDAO();

				pdao.asignarFactura(idPedido, idFactura);
			}

			// =========================
			// EDITAR
			// =========================
			else if ("editar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "facturas", "editar")) {
					response.sendError(403);
					return;

				}

				Factura f = new Factura();

				f.setId(Integer.parseInt(request.getParameter("id")));
				f.setImporte(Double.parseDouble(request.getParameter("importe")));

				dao.actualizar(f);
			}

			// =========================
			// ELIMINAR
			// =========================
			else if ("eliminar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "facturas", "eliminar")) {
					response.sendError(403);
					return;

				}

				int id = Integer.parseInt(request.getParameter("id"));

				dao.eliminar(id);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/facturas");
	}
}