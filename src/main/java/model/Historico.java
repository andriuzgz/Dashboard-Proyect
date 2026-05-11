package model;

import java.util.Date;
import methods.Estados;

public class Historico {

	private int id;
	private String usuario;
	private String accion;
	private String tabla;
	private int idRegistro;

	private String campo;
	private String valorAnterior;
	private String valorNuevo;

	private Date fecha;

	private static final Estados es = new Estados();
	
	public String getClaseHistorico() {
	    return es.getTipoHist(this.accion);
	}

	// getters
	public int getId() {
		return id;
	}

	public String getUsuario() {
		return usuario;
	}

	public String getAccion() {
		return accion;
	}

	public String getTabla() {
		return tabla;
	}

	public int getIdRegistro() {
		return idRegistro;
	}

	public String getCampo() {
		return campo;
	}

	public String getValorAnterior() {
		return valorAnterior;
	}

	public String getValorNuevo() {
		return valorNuevo;
	}

	public Date getFecha() {
		return fecha;
	}
	

	// setters
	public void setId(int id) {
		this.id = id;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public void setAccion(String accion) {
		this.accion = accion;
	}

	public void setTabla(String tabla) {
		this.tabla = tabla;
	}

	public void setIdRegistro(int idRegistro) {
		this.idRegistro = idRegistro;
	}

	public void setCampo(String campo) {
		this.campo = campo;
	}

	public void setValorAnterior(String valorAnterior) {
		this.valorAnterior = valorAnterior;
	}

	public void setValorNuevo(String valorNuevo) {
		this.valorNuevo = valorNuevo;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
}