package model;

import java.util.Date;
import methods.Estados;

public class Departamento {

	// Atributos
	private int id;
	private String nombre;
	private String codigo;
	private Date anio_fecha;
	private String responsable;
	private double presupuesto;
	private double usado;
	private double restante;
	private int contar_prov;
	private String proveedores;

	private String estado;
	private Estados es = new Estados();
	
	// Atributos SQL
	private int responsableId;
	
	public double getPorcentajeRestante() {

	    if (presupuesto <= 0) {
	        return 0;
	    }

	    return (restante * 100) / presupuesto;
	}	
	
	// GETTERS
	public int getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	public String getCodigo() {
		return codigo;
	}
	
	public String getResponsable() {
		return responsable;
	}
	
	public double getPresupuesto() {
		return presupuesto;
	}
	
	public int getContarProv() {
		return contar_prov;
	}
	
	public String getProveedores() {
		return proveedores;
	}
	
	public Date getAnioFecha() {
		return anio_fecha;
	}
	
	public double getRestante() {
		return restante;
	}
	
	public double getUsado() {
		return usado;
	}
	
	public String getEstado() {
	    return estado;
	}

	public String getClaseEstado() {
	    return es.getEstadoPrep(this.estado);
	}
	
	// Getter SQL
	public int getResponsableId() {
	    return responsableId;
	}

	// SETTERS
	public void setId(int id) {
		this.id = id;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}
	
	public void setPresupuesto(double presupuesto) {
		this.presupuesto = presupuesto;
	}
	
	public void setContarProv(int contar_prov) {
		this.contar_prov = contar_prov;
	}
	
	public void setProveedores(String proveedores) {
		this.proveedores = proveedores;
	}

	public void setAnioFecha(Date anio_fecha) {
		this.anio_fecha = anio_fecha;
	}
	
	public void setRestante(double restante) {
		this.restante = restante;
	}
	
	public void setUsado(double usado) {
		this.usado = usado;
	}
	
	public void setEstado(String estado) {
	    this.estado = estado;
	}
	
	// Setter SQL
	public void setResponsableId(int responsableId) {
	    this.responsableId = responsableId;
	}
	
}
