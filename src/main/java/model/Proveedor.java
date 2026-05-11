package model;

import java.util.Date;
import methods.Estados;

public class Proveedor {

	private int id;
	private String nombre;
	private String cif;
	private String telefono;
	private String email;
	private Date fechaAlta;
	private Date fechaBaja;
	private String estado;
	private int contar_dept;
	private String departamentos;

	// Atributos CRUD
	private int estadoInt;
	
	private static final Estados es = new Estados();

	public String getClaseEstado() {
		if (estado == null)
			return "gris";
		return es.getEstadoProv(estado);
	}

	// getters
	public int getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	public String getCif() {
		return cif;
	}

	public String getTelefono() {
		return telefono;
	}

	public String getEmail() {
		return email;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public Date getFechaBaja() {
		return fechaBaja;
	}

	public String getEstado() {
		return estado;
	}
	
	public int getContarDept() {
		return contar_dept;
	}
	
	public String getProveedores() {
		return departamentos;
	}

	// Getter SQL
	public int getEstadoInt() {
	    return estadoInt;
	}
	
	// setters
	public void setId(int id) {
		this.id = id;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setCif(String cif) {
		this.cif = cif;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public void setFechaBaja(Date fechaBaja) {
		this.fechaBaja = fechaBaja;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public void setContarProv(int contar_dept) {
		this.contar_dept = contar_dept;
	}
	
	public void setProveedores(String departamentos) {
		this.departamentos = departamentos;
	}
	
	public void setEstadoInt(int estadoInt) {
	    this.estadoInt = estadoInt;
	}
}