package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import methods.Conexion;

public class ContarDAO {

	// ==========================================================
	// Actividad
	// ==========================================================
	public int contarUsuarios() {
		return contar("usuario");
	}

	public int contarPedidos() {
		return contar("orden_compra");
	}

	public int contarDepartamentos() {
		return contar("departamento");
	}

	public int contarProveedores() {
		return contar("proveedores");
	}

	public int contarPresupuestos() {
		return contar("presupuesto");
	}

	// ==========================================================
	// Contador Base
	// ==========================================================
	private int contar(String tabla) {
		int total = 0;

		String sql = "SELECT COUNT(*) FROM " + tabla;

		try (Connection con = Conexion.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;
	}

	// ==========================================================
	// Usuarios
	// ==========================================================
	public int contarUsuariosActivos() {
		return contarConCondicion("usuario", "estado", 1);
	}

	public int contarUsuariosSuspendidos() {
		return contarNull("usuario", "rol");
	}

	public int contarAdministradores() {
		return contarConCondicion("usuario", "rol", 1);
	}

	public int contarContables() {
		return contarConCondicion("usuario", "rol", 2);
	}

	public int contarJefes() {
		return contarConCondicion("usuario", "rol", 3);
	}

	// ==========================================================
	// Proveedores
	// ==========================================================
	public int contarProveedoresActivos() {
		return contarConCondicion("proveedores", "estado", 1);
	}

	public int contarProveedoresInactivos() {
		return contarConCondicion("proveedores", "estado", 2);
	}

	// ==========================================================
	// Orden Compra
	// ==========================================================
	public int contarPedidosCompletados() {
		return contarConCondicion("orden_compra", "estado", 1);
	}

	public int contarPedidosPendientes() {
		return contarConCondicion("orden_compra", "estado", 2);
	}

	public int contarPedidosCancelados() {
		return contarConCondicion("orden_compra", "estado", 3);
	}

	public int contarPedidosSinFactura() {
		return contarNull("orden_compra", "factura");
	}

	// ==========================================================
	// Facturas
	// ==========================================================
	public int contarFacturas() {
		return contar("facturas");
	}
	
	public int contarFacturasPagadas() {
		return contarConCondicion("facturas", "estado", 1);
	}

	public int contarFacturasPendientes() {
		return contarConCondicion("facturas", "estado", 2);
	}

	public int contarVencidasPagadas() {
		return contarVencidasPorEstado(1);
	}

	public int contarVencidasPendientes() {
		return contarVencidasPorEstado(2);
	}

	// ==========================================================
	// Presupuestos
	// ==========================================================
	public int contarPresupuestoActivo() {
		return contarConCondicion("presupuesto", "estado", 1);
	}

	public int contarPresupuestoBajo() {
		return contarConCondicion("presupuesto", "estado", 2);
	}

	public int contarSinPresupuesto() {
		return contarConCondicion("presupuesto", "estado", 4);
	}

	public int contarPresupuestoNegativo() {
		return contarConCondicion("presupuesto", "estado", 3);
	}

	// ==========================================================
	// Metodo Para Contar Con Condicion
	// ==========================================================
	private int contarConCondicion(String tabla, String condicion, int valor) {
		int total = 0;

		String sql = "SELECT COUNT(*) FROM " + tabla + " WHERE " + condicion + " = ?";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setObject(1, valor);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;
	}

	// ==========================================================
	// Metodo Para Contar Celdas en Valor NULL
	// ==========================================================
	private int contarNull(String tabla, String columna) {
		int total = 0;

		String sql = "SELECT COUNT(*) FROM " + tabla + " WHERE " + columna + " IS NULL";

		try (Connection con = Conexion.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;
	}

	// ==========================================================
	// Metodo Para Contar Facturas Vencidas [Pagadas y Pendientes]
	// ==========================================================
	private int contarVencidasPorEstado(int estado) {
		int total = 0;

		String sql = "SELECT COUNT(*) FROM facturas " + "WHERE fecha_vencimiento IS NOT NULL "
				+ "AND fecha_vencimiento < CURRENT_DATE " + "AND estado = ?";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, estado);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;
	}

	// ==========================================================
	// Suma de Facturas Importe Total
	// ==========================================================
	public double sumarFacturado() {
		double total = 0;

		String sql = "SELECT COALESCE(SUM(importe_factura), 0) FROM facturas";

		try (Connection con = Conexion.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			if (rs.next()) {
				total = rs.getDouble(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;
	}
}