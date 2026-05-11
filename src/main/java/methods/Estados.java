package methods;

public class Estados {

	// Gravedad Alerta
	public String getTipoGravedad(String gravedad) {
		if (gravedad == null)
			return "gris";

		switch (gravedad.toUpperCase()) {
		case "GRAVE":
			return "rojo";
		case "MODERADO":
			return "naranja";
		case "LEVE":
			return "verde";
		default:
			return "gris";
		}
	}

	// Estado Alerta
	public String getEstadoAlerta(String estado) {
		if (estado == null)
			return "gris";

		switch (estado.toUpperCase()) {
		case "ACTIVO":
			return "verde";
		default:
			return "gris";
		}
	}

	// Estado Usuario
	public String getEstadoUser(String estado) {
		if (estado == null)
			return "gris";

		switch (estado.toUpperCase()) {
		case "ACTIVO":
			return "verde";
		case "SUSPENDIDO":
			return "naranja";
		case "INACTIVO":
			return "rojo";
		default:
			return "gris";
		}
	}

	// Estado Orden
	public String getEstadoOrden(String estado) {
		if (estado == null)
			return "gris";

		switch (estado.toUpperCase()) {
		case "COMPLETADO":
			return "verde";
		case "PENDIENTE":
			return "naranja";
		case "CANCELADO":
			return "rojo";
		default:
			return "gris";
		}
	}

	// Estado Factura
	public String getEstadoFactura(String estado) {
		if (estado == null)
			return "gris";

		switch (estado.toUpperCase()) {
		case "PAGADA":
			return "verde";
		case "PENDIENTE":
			return "naranja";
		case "CANCELADA":
			return "rojo";
		default:
			return "gris";
		}
	}

	// Estado Presupuesto
	public String getEstadoPrep(String estado) {
		if (estado == null)
			return "gris";

		switch (estado.toUpperCase()) {
		case "ACTIVO":
			return "verde";
		case "BAJO":
			return "rojo";
		case "NEGATIVO":
			return "rojizo";
		default:
			return "gris";
		}
	}

	// Estado Proveedor
	public String getEstadoProv(String estado) {
		if (estado == null)
			return "gris";

		switch (estado.toUpperCase()) {
		case "ACTIVO":
			return "verde";
		case "INACTIVO":
			return "rojo";
		default:
			return "gris";
		}
	}

	// Estado Historico
	public String getTipoHist(String estado) {
		if (estado == null)
			return "gris";

		switch (estado.toUpperCase()) {
		case "INSERT":
			return "verde";
		case "UPDATE":
			return "naranja";
		case "DELETE":
			return "rojo";
		default:
			return "gris";
		}
	}

}
