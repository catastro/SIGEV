package SIGEV.BE;
// Generated 30/05/2015 06:26:47 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TBoveda generated by hbm2java
 */
public class TBoveda  implements java.io.Serializable {


     private int idboveda;
     private Double monto;
     private String estado;
     private String observacion;
     private Integer idusuariocreac;
     private Integer idusuariomodif;
     private Date fechacreac;
     private Date fechamodif;
     private String denominacion;
     private Integer idctipodetalle;
     private Integer idrazonsocial;
     private Set TCajas = new HashSet(0);

    public TBoveda() {
    }

	
    public TBoveda(int idboveda) {
        this.idboveda = idboveda;
    }
    public TBoveda(int idboveda, Double monto, String estado, String observacion, Integer idusuariocreac, Integer idusuariomodif, Date fechacreac, Date fechamodif, String denominacion, Integer idctipodetalle, Integer idrazonsocial, Set TCajas) {
       this.idboveda = idboveda;
       this.monto = monto;
       this.estado = estado;
       this.observacion = observacion;
       this.idusuariocreac = idusuariocreac;
       this.idusuariomodif = idusuariomodif;
       this.fechacreac = fechacreac;
       this.fechamodif = fechamodif;
       this.denominacion = denominacion;
       this.idctipodetalle = idctipodetalle;
       this.idrazonsocial = idrazonsocial;
       this.TCajas = TCajas;
    }
   
    public int getIdboveda() {
        return this.idboveda;
    }
    
    public void setIdboveda(int idboveda) {
        this.idboveda = idboveda;
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
    public String getDenominacion() {
        return this.denominacion;
    }
    
    public void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }
    public Integer getIdctipodetalle() {
        return this.idctipodetalle;
    }
    
    public void setIdctipodetalle(Integer idctipodetalle) {
        this.idctipodetalle = idctipodetalle;
    }
    public Integer getIdrazonsocial() {
        return this.idrazonsocial;
    }
    
    public void setIdrazonsocial(Integer idrazonsocial) {
        this.idrazonsocial = idrazonsocial;
    }
    public Set getTCajas() {
        return this.TCajas;
    }
    
    public void setTCajas(Set TCajas) {
        this.TCajas = TCajas;
    }




}

