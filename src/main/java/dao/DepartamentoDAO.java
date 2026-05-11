package dao;

import model.Departamento;
import methods.Conexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartamentoDAO {

	public List<Departamento> obtenerTodos() {
		List<Departamento> lista = new ArrayList<>();

		String sql = """
				    SELECT
				        d.id_departamento,
				        d.nombre_departamento,
				        d.codigo_departamento,
				        d.anio_departamento,
				        CONCAT(u.nombre, ' ', u.apellidos) AS responsable,
				        p.importe_asignado,
				        COUNT(dp.id_proveedor) AS contar_prov
				    FROM departamento d
				    LEFT JOIN usuario u ON d.responsable = u.id_usuario
				    LEFT JOIN presupuesto p ON d.id_departamento = p.departamento
				    LEFT JOIN departamento_proveedor dp ON d.id_departamento = dp.id_departamento
				    GROUP BY d.id_departamento
				""";

		try (Connection con = Conexion.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Departamento d = new Departamento();

				d.setId(rs.getInt("id_departamento"));
				d.setNombre(rs.getString("nombre_departamento"));
				d.setCodigo(rs.getString("codigo_departamento"));
				d.setResponsable(rs.getString("responsable"));
				d.setPresupuesto(rs.getDouble("importe_asignado"));
				d.setContarProv(rs.getInt("contar_prov"));
				d.setAnioFecha(rs.getDate("anio_departamento"));

				lista.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return lista;
	}

	public Departamento obtenerPorResponsable(int idUsuario) {

		Departamento d = null;

		String sql = """
				    SELECT
				        d.id_departamento,
				        d.nombre_departamento,
				        d.codigo_departamento,
				        d.anio_departamento,

				        CONCAT(u.nombre, ' ', u.apellidos) AS responsable,

				        vrp.presupuesto_total,
				        vrp.gastado,
				        vrp.restante,
				        vrp.estado_presupuesto

				    FROM departamento d

				    LEFT JOIN usuario u
				        ON d.responsable = u.id_usuario

				    LEFT JOIN vista_resumen_presupuestos vrp
				        ON vrp.nombre_departamento = d.nombre_departamento

				    WHERE d.responsable = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, idUsuario);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				d = new Departamento();

				d.setId(rs.getInt("id_departamento"));
				d.setNombre(rs.getString("nombre_departamento"));
				d.setCodigo(rs.getString("codigo_departamento"));
				d.setResponsable(rs.getString("responsable"));
				d.setPresupuesto(rs.getDouble("presupuesto_total"));
				d.setUsado(rs.getDouble("gastado"));
				d.setRestante(rs.getDouble("restante"));
				d.setEstado(rs.getString("estado_presupuesto"));
				d.setAnioFecha(rs.getDate("anio_departamento"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}

	public void insertar(Departamento d) {

		String sql = """
				    INSERT INTO departamento
				    (
				        nombre_departamento,
				        codigo_departamento,
				        anio_departamento,
				        responsable
				    )

				    VALUES (?, ?, ?, ?)
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, d.getNombre());
			ps.setString(2, d.getCodigo());
			ps.setDate(3, new java.sql.Date(d.getAnioFecha().getTime()));
			ps.setInt(4, d.getResponsableId());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void actualizar(Departamento d) {

		String sql = """
				    UPDATE departamento

				    SET
				        nombre_departamento = ?,
				        codigo_departamento = ?,
				        anio_departamento = ?,
				        responsable = ?

				    WHERE id_departamento = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, d.getNombre());
			ps.setString(2, d.getCodigo());
			ps.setDate(3, new java.sql.Date(d.getAnioFecha().getTime()));
			ps.setInt(4, d.getResponsableId());
			ps.setInt(5, d.getId());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void eliminar(int id) {

		String sql = """
				    DELETE FROM departamento
				    WHERE id_departamento = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}