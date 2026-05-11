package cud;

import dao.PresupuestoDAO;
import model.Permiso;
import model.Presupuesto;
import utils.PermisosUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/cud/presupuestos")
public class PresupuestosCUD extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		@SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

		String action = request.getParameter("action");

		PresupuestoDAO dao = new PresupuestoDAO();

		try {

			// =========================
			// CREAR
			// =========================
			if ("crear".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "presupuestos", "crear")) {
					response.sendError(403);
					return;
					
				}

				Presupuesto p = new Presupuesto();

				p.setDepartamentoId(Integer.parseInt(request.getParameter("departamento")));
				p.setAnio(Integer.parseInt(request.getParameter("anio")));
				p.setImporte(Double.parseDouble(request.getParameter("importe")));
				p.setEstadoInt(Integer.parseInt(request.getParameter("estado")));

				dao.insertar(p);
			}

			// =========================
			// EDITAR
			// =========================
			else if ("editar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "presupuestos", "editar")) {
					response.sendError(403);
					return;
					
				}

				Presupuesto p = new Presupuesto();

				p.setId(Integer.parseInt(request.getParameter("id")));
				p.setDepartamentoId(Integer.parseInt(request.getParameter("departamento")));
				p.setAnio(Integer.parseInt(request.getParameter("anio")));
				p.setImporte(Double.parseDouble(request.getParameter("importe")));
				p.setEstadoInt(Integer.parseInt(request.getParameter("estado")));

				dao.actualizar(p);
			}

			// =========================
			// ELIMINAR
			// =========================
			else if ("eliminar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "presupuestos", "eliminar")) {
					response.sendError(403);
					return;
					
				}

				int id = Integer.parseInt(request.getParameter("id"));

				dao.eliminar(id);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/presupuestos");
	}
}