package servlets;

import dao.DepartamentoDAO;
import dao.PresupuestoDAO;
import model.Departamento;
import model.Permiso;
import model.Presupuesto;
import utils.PermisosUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/presupuestos")
public class PresupuestoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        @SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

        if (!PermisosUtil.tienePermiso(permisos, "presupuestos", "leer")) {

            request.setAttribute("error", "No tienes permisos para acceder a este módulo");
            request.setAttribute("contenido", "/jsp/error/denied.jsp");

            request.getRequestDispatcher("/jsp/components/layout.jsp")
                   .forward(request, response);

            return;
        }
		
        PresupuestoDAO pdao = new PresupuestoDAO();
        List<Presupuesto> presupuestos = pdao.obtenerTodos();

        DepartamentoDAO ddao = new DepartamentoDAO();
        List<Departamento> departamentos = ddao.obtenerTodos();
        
        request.setAttribute("departamentos", departamentos);
        request.setAttribute("presupuestos", presupuestos);
        request.setAttribute("contenido", "/jsp/pages/presupuestos.jsp");

        request.getRequestDispatcher("/jsp/components/layout.jsp")
               .forward(request, response);
    }
}