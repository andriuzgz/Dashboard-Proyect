package dao;

import model.Factura;
import methods.Conexion;

import java.sql.*;
import java.util.*;

public class FacturaDAO {

	public List<Factura> obtenerTodas() {
		List<Factura> lista = new ArrayList<>();

		String sql = """
				    SELECT
				        f.id_factura,
				        f.numero_factura,
				        f.fecha_factura,
				        f.fecha_vencimiento,
				        f.importe_factura,
				        ef.nombre AS estado_nombre,

				        COUNT(oc.id_orden) AS total_pedidos,
				        GROUP_CONCAT(CONCAT(oc.numero, '/', oc.anio) SEPARATOR ', ') AS pedidos

				    FROM facturas f
				    JOIN estado_factura ef ON f.estado = ef.id_estado
				    LEFT JOIN orden_compra oc ON f.id_factura = oc.factura

				    GROUP BY f.id_factura
				""";

		try (Connection con = Conexion.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Factura f = new Factura();

				f.setId(rs.getInt("id_factura"));
				f.setNumero(rs.getString("numero_factura"));
				f.setFechaFactura(rs.getDate("fecha_factura"));
				f.setFechaVencimiento(rs.getDate("fecha_vencimiento"));
				f.setImporte(rs.getDouble("importe_factura"));
				f.setEstado(rs.getString("estado_nombre"));
				f.setTotalPedidos(rs.getInt("total_pedidos"));
				f.setPedidos(rs.getString("pedidos"));

				lista.add(f);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return lista;
	}

	public List<Factura> obtenerPorDepartamento(int idDepartamento) {

		List<Factura> lista = new ArrayList<>();

		String sql = """
				    SELECT
				        f.id_factura,
				        f.numero_factura,
				        f.fecha_factura,
				        f.fecha_vencimiento,
				        f.importe_factura,
				        ef.nombre AS estado_nombre,

				        COUNT(oc.id_orden) AS total_pedidos,

				        GROUP_CONCAT(
				            CONCAT(oc.numero, '/', oc.anio)
				            SEPARATOR ', '
				        ) AS pedidos

				    FROM facturas f

				    JOIN estado_factura ef
				        ON f.estado = ef.id_estado

				    JOIN orden_compra oc
				        ON f.id_factura = oc.factura

				    WHERE oc.departamento = ?

				    GROUP BY f.id_factura
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, idDepartamento);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Factura f = new Factura();

				f.setId(rs.getInt("id_factura"));
				f.setNumero(rs.getString("numero_factura"));
				f.setFechaFactura(rs.getDate("fecha_factura"));
				f.setFechaVencimiento(rs.getDate("fecha_vencimiento"));
				f.setImporte(rs.getDouble("importe_factura"));
				f.setEstado(rs.getString("estado_nombre"));
				f.setTotalPedidos(rs.getInt("total_pedidos"));
				f.setPedidos(rs.getString("pedidos"));

				lista.add(f);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return lista;
	}

	public void insertar(Factura f) {

		String sql = """
				    INSERT INTO facturas
				    (
				        numero_factura,
				        fecha_factura,
				        fecha_vencimiento,
				        importe_factura,
				        estado
				    )

				    VALUES (?, ?, ?, ?, ?)
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, f.getNumero());
			ps.setDate(2, new java.sql.Date(f.getFechaFactura().getTime()));
			ps.setDate(3, new java.sql.Date(f.getFechaVencimiento().getTime()));
			ps.setDouble(4, f.getImporte());
			ps.setInt(5, f.getEstadoInt());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void actualizar(Factura f) {

		String sql = """
				    UPDATE facturas

				    SET
				        numero_factura = ?,
				        fecha_factura = ?,
				        fecha_vencimiento = ?,
				        importe_factura = ?,
				        estado = ?

				    WHERE id_factura = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, f.getNumero());
			ps.setDate(2, new java.sql.Date(f.getFechaFactura().getTime()));
			ps.setDate(3, new java.sql.Date(f.getFechaVencimiento().getTime()));
			ps.setDouble(4, f.getImporte());
			ps.setInt(5, f.getEstadoInt());
			ps.setInt(6, f.getId());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void eliminar(int id) {

		String sql = """
				    DELETE FROM facturas
				    WHERE id_factura = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}