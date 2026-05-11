package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import methods.Conexion;
import model.Alerta;

public class AlertaDAO {

	public List<Alerta> obtenerTodas() {

		List<Alerta> lista = new ArrayList<>();

		String sql = """
					SELECT
				    a.id_alerta,
				    a.descripcion,
				    a.fecha,
					m.nombre AS modulo_nombre,
				    u.nombre AS usuario_nombre,
				    r.nombre_rol AS rol_nombre,
				    d.nombre_departamento AS departamento_nombre,
				    g.nombre AS gravedad_nombre,
				    ea.nombre AS estado_nombre

				FROM alertas a
				
				JOIN usuario u ON a.usuario = u.id_usuario
				JOIN roles r ON u.rol = r.id_rol
				JOIN departamento d ON a.departamento = d.id_departamento
				JOIN gravedad_alerta g ON a.gravedad = g.id_gravedad
				JOIN estado_alerta ea ON a.estado = ea.id_estado
				JOIN modulos m ON a.modulo_id = m.id_modulo
				""";

		try (Connection con = Conexion.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Alerta a = new Alerta();

				a.setId(rs.getInt("id_alerta"));
				a.setDescripcion(rs.getString("descripcion"));
				a.setModulo(rs.getString("modulo_nombre"));
				a.setUsuario(rs.getString("usuario_nombre"));
				a.setRol(rs.getString("rol_nombre"));
				a.setDepartamento(rs.getString("departamento_nombre"));
				a.setGravedad(rs.getString("gravedad_nombre"));
				a.setEstado(rs.getString("estado_nombre"));
				a.setFecha(rs.getTimestamp("fecha"));

				lista.add(a);

			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return lista;
	}
}
