package cud;

import dao.ProveedorDAO;
import model.Permiso;
import model.Proveedor;
import utils.PermisosUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/cud/proveedores")
public class ProveedoresCUD extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		@SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

		String action = request.getParameter("action");

		ProveedorDAO dao = new ProveedorDAO();

		try {

			// =========================
			// CREAR
			// =========================
			if ("crear".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "proveedores", "crear")) {
					response.sendError(403);
					return;
					
				}

				Proveedor p = new Proveedor();

				p.setNombre(request.getParameter("nombre"));
				p.setCif(request.getParameter("cif"));
				p.setTelefono(request.getParameter("telefono"));
				p.setEmail(request.getParameter("email"));
				
				dao.insertar(p);
				
			}

			// =========================
			// EDITAR
			// =========================
			else if ("editar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "proveedores", "editar")) {
					response.sendError(403);
					return;
					
				}

				Proveedor p = new Proveedor();

				p.setId(Integer.parseInt(request.getParameter("id")));
				p.setNombre(request.getParameter("nombre"));
				p.setCif(request.getParameter("cif"));
				p.setTelefono(request.getParameter("telefono"));
				p.setEmail(request.getParameter("email"));

				dao.actualizar(p);
				
			}

			// =========================
			// ELIMINAR
			// =========================
			else if ("eliminar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "proveedores", "eliminar")) {
					response.sendError(403);
					return;
					
				}

				int id = Integer.parseInt(request.getParameter("id"));

				dao.eliminar(id);
			}
			
			// =========================
			// TOGGLEAR
			// =========================
			else if ("toggle".equals(action)) {

			    if (!PermisosUtil.tienePermiso(
			            permisos,
			            "proveedores",
			            "editar")) {

			        response.sendError(403);
			        return;
			    }

			    int id =
			        Integer.parseInt(
			            request.getParameter("id")
			        );

			    dao.toggleEstado(id);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/proveedores");
	}
}