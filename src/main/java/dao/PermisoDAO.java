package dao;

import java.sql.*;
import java.util.*;

import methods.Conexion;
import model.Permiso;

public class PermisoDAO {

    public List<Permiso> obtenerPorRol(int rolId) {

        List<Permiso> lista = new ArrayList<>();

        String sql = """
            SELECT m.clave AS modulo,
                   p.visible,
                   p.puede_crear,
                   p.puede_leer,
                   p.puede_editar,
                   p.puede_eliminar,
                   p.nivel_permiso
            FROM permisos p
            JOIN modulos m ON p.modulo_id = m.id_modulo
            WHERE p.rol_id = ?
        """;

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, rolId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Permiso p = new Permiso();

                p.setModulo(rs.getString("modulo"));
                p.setVisible(rs.getBoolean("visible"));
                p.setCrear(rs.getBoolean("puede_crear"));
                p.setLeer(rs.getBoolean("puede_leer"));
                p.setEditar(rs.getBoolean("puede_editar"));
                p.setEliminar(rs.getBoolean("puede_eliminar"));
                p.setNivel(rs.getInt("nivel_permiso"));

                lista.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
    
    public void actualizarPermiso(int rolId, Permiso p) {

        String sql = """
            UPDATE permisos
            SET visible=?,
                puede_crear=?,
                puede_leer=?,
                puede_editar=?,
                puede_eliminar=?,
                nivel_permiso=?
            WHERE rol_id=? 
            AND modulo_id = (SELECT id_modulo FROM modulos WHERE clave=?)
        """;

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            int nivel =
                    (p.isCrear() ? 8 : 0) +
                    (p.isLeer() ? 4 : 0) +
                    (p.isEditar() ? 2 : 0) +
                    (p.isEliminar() ? 1 : 0);

            ps.setBoolean(1, p.isVisible());
            ps.setBoolean(2, p.isCrear());
            ps.setBoolean(3, p.isLeer());
            ps.setBoolean(4, p.isEditar());
            ps.setBoolean(5, p.isEliminar());
            ps.setInt(6, nivel);
            ps.setInt(7, rolId);
            ps.setString(8, p.getModulo());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
