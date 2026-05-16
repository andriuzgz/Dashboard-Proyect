package model;

import java.util.Date;
import methods.Estados;

public class Factura {

	// Atributos
	private int id;
	private String numero;
	private Date fechaFactura;
	private Date fechaVencimiento;
	private double importe;
	private String estado;
	private int totalPedidos;
	private String pedidos;
	private int restante;

	// Atributos SQL
	private int estadoInt;
	
	private static final Estados es = new Estados();

	public String getClaseEstado() {
		if (estado == null)
			return "gris";
		return es.getEstadoFactura(estado);
	}

	// getters
	public int getId() {
		return id;
	}

	public String getNumero() {
		return numero;
	}

	public Date getFechaFactura() {
		return fechaFactura;
	}

	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}

	public double getImporte() {
		return importe;
	}

	public String getEstado() {
		return estado;
	}

	public int getTotalPedidos() {
		return totalPedidos;
	}
	
	public String getPedidos() {
		return pedidos;
	}
	
	// Getter SQL
	public int getEstadoInt() {
	    return estadoInt;
	}

	public int getRestante() {
		return restante;
	}
	
	// setters
	public void setId(int id) {
		this.id = id;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public void setFechaFactura(Date fechaFactura) {
		this.fechaFactura = fechaFactura;
	}

	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public void setImporte(double importe) {
		this.importe = importe;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public void setTotalPedidos(int totalPedidos) {
		this.totalPedidos = totalPedidos;
	}

	public void setPedidos(String pedidos) {
		this.pedidos = pedidos;
	}
	
	// Setter SQL
	public void setEstadoInt(int estadoInt) {
	    this.estadoInt = estadoInt;
	}
	
	public void setRestante(int restante) {
		this.restante = restante;
	}
}