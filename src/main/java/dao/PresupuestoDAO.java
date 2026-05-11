package dao;

import model.Presupuesto;
import methods.Conexion;

import java.sql.*;
import java.util.*;

public class PresupuestoDAO {

	public List<Presupuesto> obtenerTodos() {
		List<Presupuesto> lista = new ArrayList<>();

		String sql = """
				    SELECT
				        p.id_presupuesto,
				        d.nombre_departamento,
				        p.anio,
				        p.importe_asignado,
				        ep.nombre AS estado_nombre,

				        COALESCE(SUM(oc.inversion), 0) AS gastado,
				        (p.importe_asignado - COALESCE(SUM(oc.inversion), 0)) AS restante

				    FROM presupuesto p
				    JOIN departamento d ON p.departamento = d.id_departamento
				    JOIN estado_presupuesto ep ON p.estado = ep.id_estado
				    LEFT JOIN orden_compra oc ON p.departamento = oc.departamento

				    GROUP BY p.id_presupuesto
				""";

		try (Connection con = Conexion.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Presupuesto p = new Presupuesto();

				p.setId(rs.getInt("id_presupuesto"));
				p.setDepartamento(rs.getString("nombre_departamento"));
				p.setAnio(rs.getInt("anio"));
				p.setImporte(rs.getDouble("importe_asignado"));
				p.setEstado(rs.getString("estado_nombre"));
				p.setGastado(rs.getDouble("gastado"));
				p.setRestante(rs.getDouble("restante"));

				lista.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return lista;
	}

	public void insertar(Presupuesto p) {

		String sql = """
				    INSERT INTO presupuesto
				    (
				        departamento,
				        anio,
				        importe_asignado,
				        estado
				    )

				    VALUES (?, ?, ?, ?)
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, p.getDepartamentoId());
			ps.setInt(2, p.getAnio());
			ps.setDouble(3, p.getImporte());
			ps.setInt(4, p.getEstadoInt());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void actualizar(Presupuesto p) {

		String sql = """
				    UPDATE presupuesto

				    SET
				        departamento = ?,
				        anio = ?,
				        importe_asignado = ?,
				        estado = ?

				    WHERE id_presupuesto = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, p.getDepartamentoId());
			ps.setInt(2, p.getAnio());
			ps.setDouble(3, p.getImporte());
			ps.setInt(4, p.getEstadoInt());

			ps.setInt(5, p.getId());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void eliminar(int id) {

		String sql = """
				    DELETE FROM presupuesto
				    WHERE id_presupuesto = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}