package SIGEV.BE;
// Generated 30/05/2015 06:26:47 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TMenu generated by hbm2java
 */
public class TMenu  implements java.io.Serializable {


     private int idmenu;
     private String denominacion;
     private Integer idsuperior;
     private Integer orden;
     private Integer idusuariocreac;
     private Integer idusuariomodif;
     private String estado;
     private String observacion;
     private Date fechacreac;
     private Date fechamodif;
     private Set TMenuRols = new HashSet(0);

    public TMenu() {
    }

	
    public TMenu(int idmenu) {
        this.idmenu = idmenu;
    }
    public TMenu(int idmenu, String denominacion, Integer idsuperior, Integer orden, Integer idusuariocreac, Integer idusuariomodif, String estado, String observacion, Date fechacreac, Date fechamodif, Set TMenuRols) {
       this.idmenu = idmenu;
       this.denominacion = denominacion;
       this.idsuperior = idsuperior;
       this.orden = orden;
       this.idusuariocreac = idusuariocreac;
       this.idusuariomodif = idusuariomodif;
       this.estado = estado;
       this.observacion = observacion;
       this.fechacreac = fechacreac;
       this.fechamodif = fechamodif;
       this.TMenuRols = TMenuRols;
    }
   
    public int getIdmenu() {
        return this.idmenu;
    }
    
    public void setIdmenu(int idmenu) {
        this.idmenu = idmenu;
    }
    public String getDenominacion() {
        return this.denominacion;
    }
    
    public void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }
    public Integer getIdsuperior() {
        return this.idsuperior;
    }
    
    public void setIdsuperior(Integer idsuperior) {
        this.idsuperior = idsuperior;
    }
    public Integer getOrden() {
        return this.orden;
    }
    
    public void setOrden(Integer orden) {
        this.orden = orden;
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
    public Set getTMenuRols() {
        return this.TMenuRols;
    }
    
    public void setTMenuRols(Set TMenuRols) {
        this.TMenuRols = TMenuRols;
    }




}

