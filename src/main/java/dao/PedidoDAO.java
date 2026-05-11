package dao;

import model.Pedido;
import methods.Conexion;

import java.sql.*;
import java.util.*;

public class PedidoDAO {

	public List<Pedido> obtenerTodos() {
		List<Pedido> lista = new ArrayList<>();

		String sql = """
				    SELECT
				        oc.id_orden,
				        oc.numero,
				        oc.anio,
				        oc.fecha,
				        oc.inversion,
				        oc.cantidad,

				        u.nombre AS usuario_nombre,
				        d.nombre_departamento,
				        p.nombre_proveedor,
				        eo.nombre AS estado_nombre,

				        f.numero_factura

				    FROM orden_compra oc

				    JOIN usuario u ON oc.usuario = u.id_usuario
				    JOIN departamento d ON oc.departamento = d.id_departamento
				    JOIN proveedores p ON oc.proveedor = p.id_proveedor
				    JOIN estado_orden eo ON oc.estado = eo.id_estado

				    LEFT JOIN facturas f ON oc.factura = f.id_factura
				""";

		try (Connection con = Conexion.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Pedido ped = new Pedido();

				ped.setId(rs.getInt("id_orden"));
				ped.setNumero(rs.getInt("numero"));
				ped.setAnio(rs.getInt("anio"));
				ped.setFecha(rs.getDate("fecha"));
				ped.setInversion(rs.getDouble("inversion"));
				ped.setCantidad(rs.getInt("cantidad"));
				ped.setUsuario(rs.getString("usuario_nombre"));
				ped.setDepartamento(rs.getString("nombre_departamento"));
				ped.setProveedor(rs.getString("nombre_proveedor"));
				ped.setEstado(rs.getString("estado_nombre"));
				ped.setFactura(rs.getString("numero_factura"));

				lista.add(ped);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return lista;
	}

	public List<Pedido> obtenerPorDepartamento(int idDepartamento) {

		List<Pedido> lista = new ArrayList<>();

		String sql = """
				    SELECT
				        oc.id_orden,
				        oc.numero,
				        oc.anio,
				        oc.fecha,
				        oc.inversion,
				        oc.cantidad,

				        u.nombre AS usuario_nombre,
				        d.nombre_departamento,
				        p.nombre_proveedor,
				        eo.nombre AS estado_nombre,

				        f.numero_factura

				    FROM orden_compra oc

				    JOIN usuario u
				        ON oc.usuario = u.id_usuario

				    JOIN departamento d
				        ON oc.departamento = d.id_departamento

				    JOIN proveedores p
				        ON oc.proveedor = p.id_proveedor

				    JOIN estado_orden eo
				        ON oc.estado = eo.id_estado

				    LEFT JOIN facturas f
				        ON oc.factura = f.id_factura

				    WHERE oc.departamento = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, idDepartamento);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Pedido ped = new Pedido();

				ped.setId(rs.getInt("id_orden"));
				ped.setNumero(rs.getInt("numero"));
				ped.setAnio(rs.getInt("anio"));
				ped.setFecha(rs.getDate("fecha"));
				ped.setInversion(rs.getDouble("inversion"));
				ped.setCantidad(rs.getInt("cantidad"));
				ped.setUsuario(rs.getString("usuario_nombre"));
				ped.setDepartamento(rs.getString("nombre_departamento"));
				ped.setProveedor(rs.getString("nombre_proveedor"));
				ped.setEstado(rs.getString("estado_nombre"));
				ped.setFactura(rs.getString("numero_factura"));

				lista.add(ped);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return lista;
	}

	public void insertar(Pedido p) {

		String sql = """
				    INSERT INTO orden_compra
				    (
				        usuario,
				        departamento,
				        proveedor,
				        estado,
				        factura,

				        numero,
				        anio,
				        fecha,

				        inversion,
				        cantidad
				    )

				    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, p.getUsuarioId());
			ps.setInt(2, p.getDepartamentoId());
			ps.setInt(3, p.getProveedorId());
			ps.setInt(4, p.getEstadoInt());
			ps.setInt(5, p.getFacturaId());
			ps.setInt(6, p.getNumero());
			ps.setInt(7, p.getAnio());

			ps.setDate(8, new java.sql.Date(p.getFecha().getTime()));

			ps.setDouble(9, p.getInversion());
			ps.setInt(10, p.getCantidad());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void actualizar(Pedido p) {

		String sql = """
				    UPDATE orden_compra

				    SET
				        usuario = ?,
				        departamento = ?,
				        proveedor = ?,
				        estado = ?,
				        factura = ?,

				        numero = ?,
				        anio = ?,
				        fecha = ?,

				        inversion = ?,
				        cantidad = ?

				    WHERE id_orden = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, p.getUsuarioId());
			ps.setInt(2, p.getDepartamentoId());
			ps.setInt(3, p.getProveedorId());
			ps.setInt(4, p.getEstadoInt());
			ps.setInt(5, p.getFacturaId());
			ps.setInt(6, p.getNumero());
			ps.setInt(7, p.getAnio());

			ps.setDate(8, new java.sql.Date(p.getFecha().getTime()));

			ps.setDouble(9, p.getInversion());
			ps.setInt(10, p.getCantidad());
			ps.setInt(11, p.getId());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void eliminar(int id) {

		String sql = """
				    DELETE FROM orden_compra
				    WHERE id_orden = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}