package cud;

import dao.FacturaDAO;
import model.Factura;
import model.Permiso;
import utils.PermisosUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/cud/facturas")
public class FacturasCUD extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private Date parseFecha(String fecha) throws Exception {

		return new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
	}

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

				f.setNumero(request.getParameter("numero"));
				f.setFechaFactura(parseFecha(request.getParameter("fechaFactura")));
				f.setFechaVencimiento(parseFecha(request.getParameter("fechaVencimiento")));
				f.setImporte(Double.parseDouble(request.getParameter("importe")));
				f.setEstadoInt(Integer.parseInt(request.getParameter("estado")));

				dao.insertar(f);
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
				f.setNumero(request.getParameter("numero"));
				f.setFechaFactura(parseFecha(request.getParameter("fechaFactura")));
				f.setFechaVencimiento(parseFecha(request.getParameter("fechaVencimiento")));
				f.setImporte(Double.parseDouble(request.getParameter("importe")));
				f.setEstadoInt(Integer.parseInt(request.getParameter("estado")));

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