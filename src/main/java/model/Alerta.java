package model;

import java.util.Date;

import methods.Estados;

public class Alerta {

    private int id;
    private String descripcion;
    private String modulo;
    private String usuario;
    private String rol;
    private String departamento;
    private String gravedad;
    private String estado;
    private Date fecha;
    
    private Estados es = new Estados();

    public String getClaseGravedad() {
        return es.getTipoGravedad(this.gravedad);
    }

    public String getClaseEstado() {
        return es.getEstadoAlerta(this.estado);
    }
    
    // getters y setters
    
    public int getId() {
    	return id;
    }
    
    public String getDescripcion() {
    	return descripcion;
    }
    
    public String getModulo() {
    	return modulo;
    }
    
    public String getUsuario() {
    	return usuario;
    }
    
    public String getRol() {
    	return rol;
    }
    
    public String getDepartamento() {
    	return departamento;
    }
    
    public String getGravedad() {
    	return gravedad;
    }
    
    public String getEstado() {
    	return estado;
    }
    
    public Date getFecha() {
    	return fecha;
    }
    
    // Setters
    public void setId(int id) {
    	this.id = id;
    }
    
    public void setDescripcion(String descripcion) {
    	this.descripcion = descripcion;
    }
    
    public void setModulo(String modulo) {
    	this.modulo = modulo;
    }
    
    public void setUsuario(String usuario) {
    	this.usuario = usuario;
    }
    
    public void setRol(String rol) {
    	this.rol = rol;
    }
    
    public void setDepartamento(String departamento) {
    	this.departamento = departamento;
    }
    
    public void setGravedad(String gravedad) {
    	this.gravedad = gravedad;
    }
    
    public void setEstado(String estado) {
    	this.estado = estado;
    }
    
    public void setFecha(Date fecha) {
    	this.fecha = fecha;
    }
}
