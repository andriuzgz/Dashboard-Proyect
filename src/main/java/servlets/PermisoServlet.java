package servlets;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

import dao.PermisoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Permiso;
import utils.PermisosUtil;

@WebServlet("/permisos")
public class PermisoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public static class RequestData {
	    public String rol;
	    public List<Permiso> permisos;
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws IOException, ServletException {

        @SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

        if (!PermisosUtil.tienePermiso(permisos, "permisos", "leer")) {

            request.setAttribute("error", "No tienes permisos para acceder a este módulo");
            request.setAttribute("contenido", "/jsp/error/denied.jsp");

            request.getRequestDispatcher("/jsp/components/layout.jsp")
                   .forward(request, response);

            return;
        }
		
	    String rolParam = request.getParameter("rol");

	    // 🔹 1. SI NO HAY ROL → ES LA VISTA
	    if (rolParam == null) {

	        request.setAttribute("contenido", "/jsp/pages/permisos.jsp");

	        request.getRequestDispatcher("/jsp/components/layout.jsp")
	               .forward(request, response);

	        return;
	    }

	    // 🔹 2. SI HAY ROL → ES AJAX (lo que ya tienes)
	    int rolId = switch (rolParam) {
	        case "administrador" -> 1;
	        case "contable" -> 2;
	        case "jefe_departamento" -> 3;
	        default -> 0;
	    };

	    PermisoDAO dao = new PermisoDAO();
	    List<Permiso> lista = dao.obtenerPorRol(rolId);

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    Gson gson = new Gson();
	    response.getWriter().write(gson.toJson(lista));
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws IOException {

	    StringBuilder sb = new StringBuilder();
	    String line;

	    while ((line = request.getReader().readLine()) != null) {
	        sb.append(line);
	    }

	    String json = sb.toString();

	    Gson gson = new Gson();

	    RequestData data = gson.fromJson(json, RequestData.class);

	    int rolId = switch (data.rol) {
	        case "administrador" -> 1;
	        case "contable" -> 2;
	        case "jefe_departamento" -> 3;
	        default -> 0;
	    };

	    PermisoDAO dao = new PermisoDAO();

	    for (Permiso p : data.permisos) {
	        dao.actualizarPermiso(rolId, p);
	    }

	    response.getWriter().write("OK");
	}
}

