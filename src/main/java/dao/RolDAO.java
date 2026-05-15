package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import methods.Conexion;
import model.Rol;

public class RolDAO {

	public List<Rol> obtenerTodos() {

		List<Rol> lista = new ArrayList<>();

		String sql = """
				SELECT *
				FROM roles
				""";

		try (
			Connection con = Conexion.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery()
		) {

			while(rs.next()) {

				Rol r = new Rol();

				r.setId(rs.getInt("id_rol"));
				r.setNombre(rs.getString("nombre_rol"));

				lista.add(r);
			}

		} catch(Exception e) {
			e.printStackTrace();
		}

		return lista;
	}
}
