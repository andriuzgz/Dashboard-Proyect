package dao;

import model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import methods.Conexion;

public class UsuarioDAO {

	public Usuario obtenerPorId(int id) {

		Usuario u = null;

		String sql = """

					SELECT
						u.*,

						r.nombre_rol,

						d.id_departamento AS departamento,

						d.nombre_departamento,

						d.codigo_departamento,

						eu.nombre AS estado_nombre

					FROM usuario u

					JOIN roles r
						ON u.rol = r.id_rol

					JOIN departamento d
						ON u.departamento = d.id_departamento

					JOIN estado_usuario eu
						ON u.estado = eu.id_estado

					WHERE u.id_usuario = ?

				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				u = new Usuario();

				u.setId(rs.getInt("id_usuario"));
				u.setNombre(rs.getString("nombre"));
				u.setApellidos(rs.getString("apellidos"));
				u.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
				u.setFechaAlta(rs.getDate("fecha_alta"));
				u.setFechaBaja(rs.getDate("fecha_baja"));
				u.setRolNombre(rs.getString("nombre_rol"));
				u.setDepartamentoId(rs.getInt("departamento"));
				u.setDepartamentoNombre(rs.getString("nombre_departamento"));
				u.setDepartamentoCodigo(rs.getString("codigo_departamento"));
				u.setEstado(rs.getString("estado_nombre"));
				u.setFoto(rs.getString("foto"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

	public int contarUsuarios() {
		int total = 0;

		try (Connection con = Conexion.getConnection()) {
			String sql = "SELECT COUNT(*) FROM usuario";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;
	}

	public List<Usuario> obtenerTodos() {
		List<Usuario> lista = new ArrayList<>();

		String sql = "SELECT u.*, r.nombre_rol, d.nombre_departamento, d.codigo_departamento, "
				+ "eu.nombre AS estado_nombre " + "FROM usuario u " + "JOIN roles r ON u.rol = r.id_rol "
				+ "JOIN departamento d ON u.departamento = d.id_departamento "
				+ "JOIN estado_usuario eu ON u.estado = eu.id_estado";

		try (Connection con = Conexion.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Usuario u = new Usuario();

				u.setId(rs.getInt("id_usuario"));
				u.setNombre(rs.getString("nombre"));
				u.setApellidos(rs.getString("apellidos"));
				u.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
				u.setFechaAlta(rs.getDate("fecha_alta"));
				u.setFechaBaja(rs.getDate("fecha_baja"));
				u.setRolNombre(rs.getString("nombre_rol"));
				u.setDepartamentoNombre(rs.getString("nombre_departamento"));
				u.setDepartamentoCodigo(rs.getString("codigo_departamento"));
				u.setEstado(rs.getString("estado_nombre"));
				u.setRol(rs.getInt("rol"));
				u.setDepartamentoId(rs.getInt("departamento"));
				u.setDepartamento(rs.getInt("departamento"));
				u.setEstadoInt(rs.getInt("estado"));

				lista.add(u);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return lista;
	}

	public List<Usuario> obtenerResponsables() {

		List<Usuario> lista = new ArrayList<>();

		String sql = """

					SELECT
						u.*,
						d.nombre_departamento,
						d.codigo_departamento

					FROM usuario u

					JOIN departamento d
						ON u.id_usuario =
							d.responsable

				""";

		try (

				Connection con = Conexion.getConnection();

				PreparedStatement ps = con.prepareStatement(sql);

				ResultSet rs = ps.executeQuery()

		) {

			while (rs.next()) {

				Usuario u = new Usuario();

				u.setId(rs.getInt("id_usuario"));

				u.setNombre(rs.getString("nombre"));

				u.setApellidos(rs.getString("apellidos"));

				u.setDepartamentoId(rs.getInt("departamento"));

				u.setDepartamentoNombre(rs.getString("nombre_departamento"));

				u.setDepartamentoCodigo(rs.getString("codigo_departamento"));

				lista.add(u);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return lista;
	}

	// Metodos SQL CUD

	// CREATE
	public void insertar(Usuario u) {

		String sql = """
				    INSERT INTO usuario
				    (
				        nombre,
				        apellidos,
				        password,
				        fecha_nacimiento,
				        rol,
				        departamento,
				        estado
				    )

				    VALUES (?, ?, ?, ?, ?, ?, ?)
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, u.getNombre());
			ps.setString(2, u.getApellidos());
			ps.setString(3, u.getPassword());

			ps.setDate(4, new java.sql.Date(u.getFechaNacimiento().getTime()));

			ps.setInt(5, u.getRol());
			ps.setInt(6, u.getDepartamento());
			ps.setInt(7, u.getEstadoInt());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// UPDATE
	public void actualizar(Usuario u) {

		String sql = """
				    UPDATE usuario

				    SET
				        nombre = ?,
				        apellidos = ?,
				        fecha_nacimiento = ?,
				        rol = ?,
				        departamento = ?,
				        estado = ?

				    WHERE id_usuario = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, u.getNombre());
			ps.setString(2, u.getApellidos());

			ps.setDate(3, new java.sql.Date(u.getFechaNacimiento().getTime()));

			ps.setInt(4, u.getRol());
			ps.setInt(5, u.getDepartamento());
			ps.setInt(6, u.getEstadoInt());

			ps.setInt(7, u.getId());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// DELETE
	public void eliminar(int id) {

		String sql = """
				    DELETE FROM usuario
				    WHERE id_usuario = ?
				""";

		try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Metodos SQL - Toggle
	public void toggleEstado(int id) {

		String obtener = "SELECT estado FROM usuario WHERE id_usuario = ?";

		try (Connection con = Conexion.getConnection();

				PreparedStatement ps1 = con.prepareStatement(obtener)) {

			ps1.setInt(1, id);

			ResultSet rs = ps1.executeQuery();

			if (rs.next()) {

				int estado = rs.getInt("estado");

				String sql;

				if (estado == 1) {

					sql = """
							    UPDATE usuario

							    SET
							        estado = 2,
							        fecha_baja = CURDATE()

							    WHERE id_usuario = ?
							""";

				} else {

					sql = """
							    UPDATE usuario

							    SET
							        estado = 1,
							        fecha_baja = NULL

							    WHERE id_usuario = ?
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