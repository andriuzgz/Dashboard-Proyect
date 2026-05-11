package dao;

import model.Historico;
import methods.Conexion;

import java.sql.*;
import java.util.*;

public class HistoricoDAO {

    public List<Historico> obtenerTodos() {
        List<Historico> lista = new ArrayList<>();

        String sql = """
            SELECT 
                h.id_historico,
                u.nombre AS usuario_nombre,
                h.accion,
                h.tabla_afectada,
                h.id_registro,
                h.campo_afectado,
                h.valor_anterior,
                h.valor_nuevo,
                h.fecha
            FROM historico h
            JOIN usuario u ON h.id_usuario = u.id_usuario
            ORDER BY h.fecha DESC
        """;

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Historico h = new Historico();

                h.setId(rs.getInt("id_historico"));
                h.setUsuario(rs.getString("usuario_nombre"));
                h.setAccion(rs.getString("accion"));
                h.setTabla(rs.getString("tabla_afectada"));
                h.setIdRegistro(rs.getInt("id_registro"));
                h.setCampo(rs.getString("campo_afectado"));
                h.setValorAnterior(rs.getString("valor_anterior"));
                h.setValorNuevo(rs.getString("valor_nuevo"));
                h.setFecha(rs.getTimestamp("fecha"));

                lista.add(h);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
}