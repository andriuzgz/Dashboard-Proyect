package servlets;

import dao.HistoricoDAO;
import model.Historico;
import model.Permiso;
import utils.PermisosUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/historico")
public class HistoricoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        @SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

        if (!PermisosUtil.tienePermiso(permisos, "historico", "leer")) {

            request.setAttribute("error", "No tienes permisos para acceder a este módulo");
            request.setAttribute("contenido", "/jsp/error/denied.jsp");

            request.getRequestDispatcher("/jsp/components/layout.jsp")
                   .forward(request, response);

            return;
        }
		
        HistoricoDAO hdao = new HistoricoDAO();
        List<Historico> historico = hdao.obtenerTodos();

        request.setAttribute("historico", historico);
        request.setAttribute("contenido", "/jsp/pages/historico.jsp");

        request.getRequestDispatcher("/jsp/components/layout.jsp")
               .forward(request, response);
    }
}