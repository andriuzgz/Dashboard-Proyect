package model;

import java.util.Date;
import methods.Estados;

public class Usuario {

	// Atributos a Mostrar
	private int id;
	private String nombre;
	private String apellidos;
	private String rolNombre;
	private String departamentoNombre;
	private String departamentoCodigo;
	private String estado;
	private Date fechaNacimiento;
	private Date fechaAlta;
	private Date fechaBaja;
	private String foto;
	private static final Estados es = new Estados();
	private int departamentoId;

	// Atributos Creacion
	private int rol;
	private int departamento;
	private int estadoInt;
	private String password;

	// Getter
	public int getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public String getRolNombre() {
		return rolNombre;
	}

	public String getDepartamentoNombre() {
		return departamentoNombre;
	}

	public String getDepartamentoCodigo() {
		return departamentoCodigo;
	}

	public String getEstado() {
		return estado;
	}

	public String getClaseEstado() {
		if (estado == null)
			return "gris";
		return es.getEstadoUser(this.estado);
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public Date getFechaBaja() {
		return fechaBaja;
	}

	public String getFoto() {
		return foto;
	}

	// Getter SQL
	public int getRol() {
		return rol;
	}

	public int getDepartamento() {
		return departamento;
	}

	public int getEstadoInt() {
		return estadoInt;
	}

	public String getPassword() {
		return password;
	}

	public int getDepartamentoId() {
		return departamentoId;
	}

	// Setter
	public void setDepartamentoId(int departamentoId) {
		this.departamentoId = departamentoId;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public void setRolNombre(String rolNombre) {
		this.rolNombre = rolNombre;
	}

	public void setDepartamentoNombre(String departamentoNombre) {
		this.departamentoNombre = departamentoNombre;
	}

	public void setDepartamentoCodigo(String departamentoCodigo) {
		this.departamentoCodigo = departamentoCodigo;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public void setFechaBaja(Date fechaBaja) {
		this.fechaBaja = fechaBaja;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	// Setter SQL
	public void setRol(int rol) {
		this.rol = rol;
	}

	public void setDepartamento(int departamento) {
		this.departamento = departamento;
	}

	public void setEstadoInt(int estadoInt) {
		this.estadoInt = estadoInt;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}