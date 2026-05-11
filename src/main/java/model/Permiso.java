package model;

public class Permiso {
	
	// Atributos
	private String modulo;
	private boolean visible;
	private boolean crear;
	private boolean leer;
	private boolean editar;
	private boolean eliminar;
	private int nivel;

	// Getters
	public String getModulo() {
		return modulo;
	}

	public boolean isVisible() {
		return visible;
	}

	public boolean isCrear() {
		return crear;
	}

	public boolean isLeer() {
		return leer;
	}

	public boolean isEditar() {
		return editar;
	}

	public boolean isEliminar() {
		return eliminar;
	}

	public int getNivel() {
		return nivel;
	}

	// Setters
	public void setModulo(String modulo) {
		this.modulo = modulo;
	}

	public void setVisible(boolean visible) {
		this.visible = visible;
	}

	public void setCrear(boolean crear) {
		this.crear = crear;
	}

	public void setLeer(boolean leer) {
		this.leer = leer;
	}

	public void setEditar(boolean editar) {
		this.editar = editar;
	}

	public void setEliminar(boolean eliminar) {
		this.eliminar = eliminar;
	}

	public void setNivel(int nivel) {
		this.nivel = nivel;
	}
}