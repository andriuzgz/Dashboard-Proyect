package model;

import java.util.Date;
import methods.Estados;

public class Pedido {

	// Atributos
	private int id;
	private String usuario;
	private String departamento;
	private String proveedor;
	private String estado;
	private String factura;
	private int numero;
	private int anio;
	private Date fecha;

	private double inversion;
	private int cantidad;

	// Atributos SQL
	private int usuarioId;
	private int departamentoId;
	private int proveedorId;
	private int estadoInt;
	private int facturaId;
	
	private static final Estados es = new Estados();

	public String getClaseEstado() {
		if (estado == null)
			return "gris";
		return es.getEstadoOrden(estado);
	}

	// getters
	public int getId() {
		return id;
	}

	public String getUsuario() {
		return usuario;
	}

	public String getDepartamento() {
		return departamento;
	}

	public String getProveedor() {
		return proveedor;
	}

	public String getEstado() {
		return estado;
	}

	public int getNumero() {
		return numero;
	}

	public int getAnio() {
		return anio;
	}

	public Date getFecha() {
		return fecha;
	}

	public double getInversion() {
		return inversion;
	}

	public int getCantidad() {
		return cantidad;
	}
	
	public String getFactura() {
		return factura;
	}
	
	// Getter SQL
	public int getUsuarioId() {
	    return usuarioId;
	}

	public int getDepartamentoId() {
	    return departamentoId;
	}

	public int getProveedorId() {
	    return proveedorId;
	}

	public int getEstadoInt() {
	    return estadoInt;
	}

	public int getFacturaId() {
	    return facturaId;
	}

	// setters
	public void setId(int id) {
		this.id = id;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public void setProveedor(String proveedor) {
		this.proveedor = proveedor;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public void setAnio(int anio) {
		this.anio = anio;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public void setInversion(double inversion) {
		this.inversion = inversion;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
	public void setFactura(String factura) {
		this.factura = factura;
	}
	
	// Setters SQL
	public void setUsuarioId(int usuarioId) {
	    this.usuarioId = usuarioId;
	}

	public void setDepartamentoId(int departamentoId) {
	    this.departamentoId = departamentoId;
	}

	public void setProveedorId(int proveedorId) {
	    this.proveedorId = proveedorId;
	}

	public void setEstadoInt(int estadoInt) {
	    this.estadoInt = estadoInt;
	}

	public void setFacturaId(int facturaId) {
	    this.facturaId = facturaId;
	}
	
}