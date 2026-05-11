package model;

import methods.Estados;

public class Presupuesto {

	Estados es = new Estados();
	
	// Atributos
	private int id;
	private String departamento;
	private int anio;
	private double importe;
	private String estado;
	private double gastado;
	private double restante;
	
	// Atributos SQL
	private int departamentoId;
	private int estadoInt;

	public String getClaseEstado() {

		if (importe > 0) {

			if (restante < 0)
				return "rojizo";
			if (restante == 0)
				return "rojo";

			double porcentaje = (restante / importe) * 100;

			if (porcentaje < 20)
				return "naranja";

			return "verde";
		}

		return es.getEstadoPrep(estado);
	}

	public String getEstadoDinamico() {

		if (importe == 0)
			return "SIN PRESUPUESTO";

		if (restante < 0)
			return "NEGATIVO";

		if (restante == 0)
			return "AGOTADO";

		double porcentaje = (restante / importe) * 100;

		if (porcentaje < 20)
			return "BAJO";

		return "ACTIVO";
	}

	// Getters
	public int getId() {
		return id;
	}

	public String getDepartamento() {
		return departamento;
	}

	public int getAnio() {
		return anio;
	}

	public double getImporte() {
		return importe;
	}

	public String getEstado() {
		return estado;
	}

	public double getGastado() {
		return gastado;
	}

	public double getRestante() {
		return restante;
	}
	
	// Getter SQL
	public int getDepartamentoId() {
	    return departamentoId;
	}

	public int getEstadoInt() {
	    return estadoInt;
	}

	// Setters
	public void setId(int id) {
		this.id = id;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public void setAnio(int anio) {
		this.anio = anio;
	}

	public void setImporte(double importe) {
		this.importe = importe;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public void setGastado(double gastado) {
		this.gastado = gastado;
	}

	public void setRestante(double restante) {
		this.restante = restante;
	}
	
	// Setters SQL
	public void setDepartamentoId(int departamentoId) {
	    this.departamentoId = departamentoId;
	}

	public void setEstadoInt(int estadoInt) {
	    this.estadoInt = estadoInt;
	}
	
}