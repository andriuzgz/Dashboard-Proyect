package cud;

import dao.DepartamentoDAO;
import model.Departamento;
import model.Permiso;
import utils.PermisosUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
/*import java.text.SimpleDateFormat;
import java.util.Date;*/
import java.util.List;

@WebServlet("/cud/departamentos")
public class DepartamentoCUD extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/*private Date parseFecha(String fecha) throws Exception {
		return new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
		
	}*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		@SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

		String action = request.getParameter("action");

		DepartamentoDAO dao = new DepartamentoDAO();

		try {

			// =========================
			// CREAR
			// =========================
			if ("crear".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "departamentos", "crear")) {
					response.sendError(403);
					return;
					
				}

				Departamento d = new Departamento();

				d.setNombre(request.getParameter("nombre"));
				d.setCodigo(request.getParameter("codigo"));
				d.setResponsableId(Integer.parseInt(request.getParameter("responsable")));

				dao.insertar(d);
			}

			// =========================
			// EDITAR
			// =========================
			else if ("editar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "departamentos", "editar")) {
					response.sendError(403);
					return;
					
				}

				Departamento d = new Departamento();

				d.setId(Integer.parseInt(request.getParameter("id")));
				d.setNombre(request.getParameter("nombre"));
				d.setCodigo(request.getParameter("codigo"));
				d.setResponsableId(Integer.parseInt(request.getParameter("responsable")));

				dao.actualizar(d);
			}

			// =========================
			// ELIMINAR
			// =========================
			else if ("eliminar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "departamentos", "eliminar")) {
					response.sendError(403);
					return;
					
				}

				int id = Integer.parseInt(request.getParameter("id"));

				dao.eliminar(id);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/departamentos");
	}
}