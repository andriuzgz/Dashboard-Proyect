package cud;

import auth.Login;
import dao.UsuarioDAO;
import model.Permiso;
import model.Usuario;
import utils.PermisosUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/cud/usuarios")
public class UsuarioCUD extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private Date parseFecha(String fecha) throws Exception {
		return new SimpleDateFormat("yyyy-MM-dd").parse(fecha);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		@SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

		String action = request.getParameter("action");

		UsuarioDAO dao = new UsuarioDAO();

		try {

			// =========================
			// CREAR
			// =========================
			if ("crear".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "usuarios", "crear")) {
					response.sendError(403);
					return;

				}

				Usuario u = new Usuario();

				u.setNombre(request.getParameter("nombre"));
				u.setApellidos(request.getParameter("apellidos"));
				u.setPassword(Login.md5(request.getParameter("password")));
				u.setFechaNacimiento(parseFecha(request.getParameter("fechaNacimiento")));
				u.setRol(Integer.parseInt(request.getParameter("rol")));
				u.setDepartamento(Integer.parseInt(request.getParameter("departamento")));
				u.setEstadoInt(Integer.parseInt(request.getParameter("estado")));
				dao.insertar(u);

			}

			// =========================
			// EDITAR
			// =========================
			else if ("editar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "usuarios", "editar")) {
					response.sendError(403);
					return;

				}

				Usuario u = new Usuario();

				u.setId(Integer.parseInt(request.getParameter("id")));
				u.setNombre(request.getParameter("nombre"));
				u.setApellidos(request.getParameter("apellidos"));
				u.setFechaNacimiento(parseFecha(request.getParameter("fechaNacimiento")));
				u.setRol(Integer.parseInt(request.getParameter("rol")));
				u.setDepartamento(Integer.parseInt(request.getParameter("departamento")));
				u.setEstadoInt(Integer.parseInt(request.getParameter("estado")));

				dao.actualizar(u);

			}

			// =========================
			// ELIMINAR
			// =========================
			else if ("eliminar".equals(action)) {

				if (!PermisosUtil.tienePermiso(permisos, "usuarios", "eliminar")) {
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

				if (!PermisosUtil.tienePermiso(permisos, "usuarios", "editar")) {

					response.sendError(403);
					return;
				}

				int id = Integer.parseInt(request.getParameter("id"));

				dao.toggleEstado(id);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/usuarios");
	}
}