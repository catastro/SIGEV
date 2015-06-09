package SIGEV.BE;
// Generated 30/05/2015 06:26:47 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TVenta generated by hbm2java
 */
public class TVenta  implements java.io.Serializable {


     private int idventa;
     private TCliente TCliente;
     private Double monto;
     private String estado;
     private String observacion;
     private Integer idusuariocreac;
     private Integer idusuariomodif;
     private Date fechacreac;
     private Date fechamodif;
     private Double total;
     private Integer idctipocomprovante;
     private String numcomprovante;
     private Integer idrazonsocial;
     private Integer idcventa;
     private Integer idpersonal;
     private Set TDetalleVentas = new HashSet(0);
     private Set TFrecuencias = new HashSet(0);

    public TVenta() {
    }

	
    public TVenta(int idventa) {
        this.idventa = idventa;
    }
    public TVenta(int idventa, TCliente TCliente, Double monto, String estado, String observacion, Integer idusuariocreac, Integer idusuariomodif, Date fechacreac, Date fechamodif, Double total, Integer idctipocomprovante, String numcomprovante, Integer idrazonsocial, Integer idcventa, Integer idpersonal, Set TDetalleVentas, Set TFrecuencias) {
       this.idventa = idventa;
       this.TCliente = TCliente;
       this.monto = monto;
       this.estado = estado;
       this.observacion = observacion;
       this.idusuariocreac = idusuariocreac;
       this.idusuariomodif = idusuariomodif;
       this.fechacreac = fechacreac;
       this.fechamodif = fechamodif;
       this.total = total;
       this.idctipocomprovante = idctipocomprovante;
       this.numcomprovante = numcomprovante;
       this.idrazonsocial = idrazonsocial;
       this.idcventa = idcventa;
       this.idpersonal = idpersonal;
       this.TDetalleVentas = TDetalleVentas;
       this.TFrecuencias = TFrecuencias;
    }
   
    public int getIdventa() {
        return this.idventa;
    }
    
    public void setIdventa(int idventa) {
        this.idventa = idventa;
    }
    public TCliente getTCliente() {
        return this.TCliente;
    }
    
    public void setTCliente(TCliente TCliente) {
        this.TCliente = TCliente;
    }
    public Double getMonto() {
        return this.monto;
    }
    
    public void setMonto(Double monto) {
        this.monto = monto;
    }
    public String getEstado() {
        return this.estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public String getObservacion() {
        return this.observacion;
    }
    
    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }
    public Integer getIdusuariocreac() {
        return this.idusuariocreac;
    }
    
    public void setIdusuariocreac(Integer idusuariocreac) {
        this.idusuariocreac = idusuariocreac;
    }
    public Integer getIdusuariomodif() {
        return this.idusuariomodif;
    }
    
    public void setIdusuariomodif(Integer idusuariomodif) {
        this.idusuariomodif = idusuariomodif;
    }
    public Date getFechacreac() {
        return this.fechacreac;
    }
    
    public void setFechacreac(Date fechacreac) {
        this.fechacreac = fechacreac;
    }
    public Date getFechamodif() {
        return this.fechamodif;
    }
    
    public void setFechamodif(Date fechamodif) {
        this.fechamodif = fechamodif;
    }
    public Double getTotal() {
        return this.total;
    }
    
    public void setTotal(Double total) {
        this.total = total;
    }
    public Integer getIdctipocomprovante() {
        return this.idctipocomprovante;
    }
    
    public void setIdctipocomprovante(Integer idctipocomprovante) {
        this.idctipocomprovante = idctipocomprovante;
    }
    public String getNumcomprovante() {
        return this.numcomprovante;
    }
    
    public void setNumcomprovante(String numcomprovante) {
        this.numcomprovante = numcomprovante;
    }
    public Integer getIdrazonsocial() {
        return this.idrazonsocial;
    }
    
    public void setIdrazonsocial(Integer idrazonsocial) {
        this.idrazonsocial = idrazonsocial;
    }
    public Integer getIdcventa() {
        return this.idcventa;
    }
    
    public void setIdcventa(Integer idcventa) {
        this.idcventa = idcventa;
    }
    public Integer getIdpersonal() {
        return this.idpersonal;
    }
    
    public void setIdpersonal(Integer idpersonal) {
        this.idpersonal = idpersonal;
    }
    public Set getTDetalleVentas() {
        return this.TDetalleVentas;
    }
    
    public void setTDetalleVentas(Set TDetalleVentas) {
        this.TDetalleVentas = TDetalleVentas;
    }
    public Set getTFrecuencias() {
        return this.TFrecuencias;
    }
    
    public void setTFrecuencias(Set TFrecuencias) {
        this.TFrecuencias = TFrecuencias;
    }




}

