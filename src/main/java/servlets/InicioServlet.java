package servlets;

import java.io.IOException;
import java.util.List;

import dao.AlertaDAO;
import dao.ContarDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Alerta;
import model.Permiso;
import utils.PermisosUtil;

@WebServlet("/inicio")
public class InicioServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        @SuppressWarnings("unchecked")
		List<Permiso> permisos = (List<Permiso>) request.getSession().getAttribute("permisos");

        if (!PermisosUtil.tienePermiso(permisos, "inicio", "leer")) {

            request.setAttribute("error", "No tienes permisos para acceder a este módulo");
            request.setAttribute("contenido", "/jsp/error/denied.jsp");

            request.getRequestDispatcher("/jsp/components/layout.jsp")
                   .forward(request, response);

            return;
        }
		
		AlertaDAO adao = new AlertaDAO();
		List<Alerta> alertas = adao.obtenerTodas();
		request.setAttribute("alertas", alertas);

		ContarDAO cdao = new ContarDAO();

		// ==========================================================
		// Variables Actividad
		// ==========================================================
		int totalUsuarios = cdao.contarUsuarios();
		int totalDepartamentos = cdao.contarDepartamentos();
		int totalPedidos = cdao.contarPedidos();
		int totalPresupuestos = cdao.contarPresupuestos();
		int totalProveedores = cdao.contarProveedores();
		int totalFacturas = cdao.contarFacturas();

		// ==========================================================
		// Variables Usuarios
		// ==========================================================
		int usuariosActivos = cdao.contarUsuariosActivos();
		int usuariosSuspendidos = cdao.contarUsuariosSuspendidos();
		int usuariosAdmin = cdao.contarAdministradores();
		int usuariosCont = cdao.contarContables();
		int usuariosJefe = cdao.contarJefes();
		
		// ==========================================================
		// Variables Proveedores
		// ==========================================================
		int proveedoresActivos = cdao.contarProveedoresActivos();
		int proveedoresInactivos = cdao.contarProveedoresInactivos();

		// ==========================================================
		// Variables Orden Compra (Pedidos)
		// ==========================================================
		int pedidosCompletados = cdao.contarPedidosCompletados();
		int pedidosPendientes = cdao.contarPedidosPendientes();
		int pedidosCancelados = cdao.contarPedidosCancelados();
		int pedidosSinFactura = cdao.contarPedidosSinFactura();
		
		// ==========================================================
		// Variables Facturas
		// ==========================================================
		double totalFacturado = cdao.sumarFacturado();
		
		int facturasPagadas = cdao.contarFacturasPagadas();
		int facturasPendientes = cdao.contarFacturasPendientes();
		int vencidasPagadas = cdao.contarVencidasPagadas();
		int vencidasPendientes = cdao.contarVencidasPendientes();
		
		// ==========================================================
		// Variables Presupuestos
		// ==========================================================
		int presupuestoActivo = cdao.contarPresupuestoActivo();
		int presupuestoBajo = cdao.contarPresupuestoBajo();
		int sinPresupuesto = cdao.contarSinPresupuesto();
		int presupuestoNegativo = cdao.contarPresupuestoNegativo();
		
		// ==========================================================
		// Resumen Actividad
		// ==========================================================
		request.setAttribute("totalUsuarios", totalUsuarios);
		request.setAttribute("totalDepartamentos", totalDepartamentos);
		request.setAttribute("totalPedidos", totalPedidos);
		request.setAttribute("totalProveedores", totalProveedores);
		request.setAttribute("totalFacturas", totalFacturas);
		request.setAttribute("totalPresupuestos", totalPresupuestos);

		// ==========================================================
		// Resumen Usuarios
		// ==========================================================
		request.setAttribute("usuariosActivos", usuariosActivos);
		request.setAttribute("usuariosSuspendidos", usuariosSuspendidos);
		request.setAttribute("admins", usuariosAdmin);
		request.setAttribute("contables", usuariosCont);
		request.setAttribute("jefes", usuariosJefe);
		
		// ==========================================================
		// Resumen Proveedores
		// ==========================================================
		request.setAttribute("proveedoresActivos", proveedoresActivos);
		request.setAttribute("proveedoresInactivos", proveedoresInactivos);

		// ==========================================================
		// Resumen Orden Compra (Pedidos)
		// ==========================================================
		request.setAttribute("pedidosCompletados", pedidosCompletados);
		request.setAttribute("pedidosPendientes", pedidosPendientes);
		request.setAttribute("pedidosCancelados", pedidosCancelados);
		request.setAttribute("pedidosSinFactura", pedidosSinFactura);

		// ==========================================================
		// Resumen Facturas
		// ==========================================================
		request.setAttribute("facturasPagadas", facturasPagadas);
		request.setAttribute("facturasPendientes", facturasPendientes);
		request.setAttribute("vencidasPagadas", vencidasPagadas);
		request.setAttribute("vencidasPendientes", vencidasPendientes);
		request.setAttribute("totalFacturado", totalFacturado);
		// ==========================================================
		// Resumen Presupuestos
		// ==========================================================
		request.setAttribute("presupuestoActivo", presupuestoActivo);
		request.setAttribute("presupuestoBajo", presupuestoBajo);
		request.setAttribute("sinPresupuesto", sinPresupuesto);
		request.setAttribute("presupuestoNegativo", presupuestoNegativo);
		
		// ==========================================================
		// Redirect a Inicio
		// ==========================================================
		request.setAttribute("contenido", "/jsp/pages/inicio.jsp");
		request.getRequestDispatcher("/jsp/components/layout.jsp").forward(request, response);
	}
}
