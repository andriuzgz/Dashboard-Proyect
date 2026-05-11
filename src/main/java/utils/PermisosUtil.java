package utils;

import java.util.List;

import model.Permiso;

public class PermisosUtil {
    public static boolean tienePermiso(List<Permiso> permisos, String modulo, String accion) {

        if (permisos == null) return false;

        for (Permiso p : permisos) {
            if (p.getModulo().equalsIgnoreCase(modulo)) {

                switch (accion.toLowerCase()) {
                    case "visible": return p.isVisible();
                    case "crear": return p.isCrear();
                    case "leer": return p.isLeer();
                    case "editar": return p.isEditar();
                    case "eliminar": return p.isEliminar();
                }
            }
        }

        return false;
	}
}
