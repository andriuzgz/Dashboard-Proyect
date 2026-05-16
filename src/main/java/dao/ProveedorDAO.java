package dao;

import model.Proveedor;
import methods.Conexion;

import java.sql.*;
import java.util.*;

public class ProveedorDAO {

	public List<Proveedor> obtenerTodos() {
		List<Proveedor> lista = new ArrayList<>();

		String sql = """

					SELECT
					    p.*,
					    ep.nombre_estado,

					    COUNT(dp.id_departamento)
					        AS contar_dept,

					    GROUP_CONCAT(
					        d.nombre_departamento
					        SEPARATOR ', '
					    ) AS departamentos

					FROM proveedores p

					JOIN estado_proveedor ep
					    ON p.estado = ep.id_estado

					LEFT JOIN departamento_proveedor dp
					    ON p.id_proveedor =
					        dp.id_proveedor

					LEFT JOIN departamento d
					    ON dp.id_departamento =
					        d.id_departamento

					GROUP BY p.id_proveedor

				""";

		try (Connection con = Conexion.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Proveedor p = new Proveedor();

				p.setId(rs.getInt("id_proveedor"));
				p.setNombre(rs.getString("nombre_proveedor"));
				p.setCif(rs.getString("cif"));
				p.setTelefono(rs.getString("telefono"));
				p.setEmail(rs.getString("email"));
				p.setFechaAlta(rs.getDate("fecha_alta"));
				p.setFechaBaja(rs.getDate("fecha_baja"));
				p.setEstado(rs.getString("nombre_estado"));
				p.setContarProv(rs.getInt("contar_dept"));
				p.setProveedores(rs.getString("departamentos"));
				p.setEstadoInt(rs.getInt("estado"));

				lista.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return lista;
	}

	public List<Proveedor> obtenerPorDepartamento(int idDepartamento) {

		List<Proveedor> lista = new ArrayList<>();

		String sql = """
				    SELECT
				        p.*,
				        ep.nombre_estado

				    FROM proveedores p

				    JOIN estado_proveedor ep
				        ON p.estado = ep.id_estado

				    JOIN departamento_proveedor dp
				        ON p.id_proveedor = dp.id_proveedor

				    WHERE dp.id_departamento = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, idDepartamento);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Proveedor p = new Proveedor();

				p.setId(rs.getInt("id_proveedor"));
				p.setNombre(rs.getString("nombre_proveedor"));
				p.setCif(rs.getString("cif"));
				p.setTelefono(rs.getString("telefono"));
				p.setEmail(rs.getString("email"));
				p.setFechaAlta(rs.getDate("fecha_alta"));
				p.setFechaBaja(rs.getDate("fecha_baja"));
				p.setEstado(rs.getString("nombre_estado"));

				lista.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return lista;
	}

	public List<String[]> obtenerRelacionDepartamento() {

		List<String[]> lista = new ArrayList<>();

		String sql = """

					SELECT
						dp.id_departamento,
						p.id_proveedor,
						p.nombre_proveedor

					FROM departamento_proveedor dp

					JOIN proveedores p
						ON dp.id_proveedor =
							p.id_proveedor

				""";

		try (

				Connection con = Conexion.getConnection();

				PreparedStatement ps = con.prepareStatement(sql);

				ResultSet rs = ps.executeQuery()

		) {

			while (rs.next()) {

				String[] data = new String[3];

				data[0] = rs.getString("id_departamento");

				data[1] = rs.getString("id_proveedor");

				data[2] = rs.getString("nombre_proveedor");

				lista.add(data);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return lista;
	}

	// Metodos SQL

	// INSERT
	public void insertar(Proveedor p) {

		String sql = """
				INSERT INTO proveedores
				(
					nombre_proveedor,
					cif,
					telefono,
					email,
					fecha_alta
				)

				VALUES (?, ?, ?, ?, CURDATE())
								""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, p.getNombre());
			ps.setString(2, p.getCif());
			ps.setString(3, p.getTelefono());
			ps.setString(4, p.getEmail());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// UPDATE
	public void actualizar(Proveedor p) {

		String sql = """
				    UPDATE proveedores

				    SET
				        nombre_proveedor = ?,
				        cif = ?,
				        telefono = ?,
				        email = ?

				    WHERE id_proveedor = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, p.getNombre());
			ps.setString(2, p.getCif());
			ps.setString(3, p.getTelefono());
			ps.setString(4, p.getEmail());
			ps.setInt(5, p.getId());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// DELETE
	public void eliminar(int id) {

		String sql = """
				    DELETE FROM proveedores
				    WHERE id_proveedor = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// TOGGLE
	public void toggleEstado(int id) {

		String obtener = "SELECT estado FROM proveedores WHERE id_proveedor = ?";

		try (Connection con = Conexion.getConnection();

				PreparedStatement ps1 = con.prepareStatement(obtener)) {

			ps1.setInt(1, id);

			ResultSet rs = ps1.executeQuery();

			if (rs.next()) {

				int estado = rs.getInt("estado");

				String sql;

				if (estado == 1) {

					sql = """
							    UPDATE proveedores

							    SET
							        estado = 2,
							        fecha_baja = CURDATE()

							    WHERE id_proveedor = ?
							""";

				} else {

					sql = """
							    UPDATE proveedores

							    SET
							        estado = 1,
							        fecha_baja = NULL

							    WHERE id_proveedor = ?
							""";
				}

				PreparedStatement ps2 = con.prepareStatement(sql);

				ps2.setInt(1, id);

				ps2.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}