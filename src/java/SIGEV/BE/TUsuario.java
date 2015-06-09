package SIGEV.BE;
// Generated 30/05/2015 06:26:47 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TUsuario generated by hbm2java
 */
public class TUsuario  implements java.io.Serializable {


     private int idusuario;
     private TPersona TPersona;
     private TRol TRol;
     private String nombreusuario;
     private String password;
     private String ipacceso;
     private Integer idusuariocreac;
     private Integer idusuariomodif;
     private String estado;
     private String observacion;
     private Date fechacreac;
     private Date fechamodif;
     private Set TRazonSocials = new HashSet(0);
     private Set TCajas = new HashSet(0);

    public TUsuario() {
    }

	
    public TUsuario(int idusuario) {
        this.idusuario = idusuario;
    }
    public TUsuario(int idusuario, TPersona TPersona, TRol TRol, String nombreusuario, String password, String ipacceso, Integer idusuariocreac, Integer idusuariomodif, String estado, String observacion, Date fechacreac, Date fechamodif, Set TRazonSocials, Set TCajas) {
       this.idusuario = idusuario;
       this.TPersona = TPersona;
       this.TRol = TRol;
       this.nombreusuario = nombreusuario;
       this.password = password;
       this.ipacceso = ipacceso;
       this.idusuariocreac = idusuariocreac;
       this.idusuariomodif = idusuariomodif;
       this.estado = estado;
       this.observacion = observacion;
       this.fechacreac = fechacreac;
       this.fechamodif = fechamodif;
       this.TRazonSocials = TRazonSocials;
       this.TCajas = TCajas;
    }
   
    public int getIdusuario() {
        return this.idusuario;
    }
    
    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }
    public TPersona getTPersona() {
        return this.TPersona;
    }
    
    public void setTPersona(TPersona TPersona) {
        this.TPersona = TPersona;
    }
    public TRol getTRol() {
        return this.TRol;
    }
    
    public void setTRol(TRol TRol) {
        this.TRol = TRol;
    }
    public String getNombreusuario() {
        return this.nombreusuario;
    }
    
    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getIpacceso() {
        return this.ipacceso;
    }
    
    public void setIpacceso(String ipacceso) {
        this.ipacceso = ipacceso;
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
    public Set getTRazonSocials() {
        return this.TRazonSocials;
    }
    
    public void setTRazonSocials(Set TRazonSocials) {
        this.TRazonSocials = TRazonSocials;
    }
    public Set getTCajas() {
        return this.TCajas;
    }
    
    public void setTCajas(Set TCajas) {
        this.TCajas = TCajas;
    }




}


