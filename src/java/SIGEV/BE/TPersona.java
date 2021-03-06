package SIGEV.BE;
// Generated 30/05/2015 06:26:47 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TPersona generated by hbm2java
 */
public class TPersona  implements java.io.Serializable {


     private int idpersona;
     private String dni;
     private String nombres;
     private String apppat;
     private String appmat;
     private String telefono;
     private String direccion;
     private String email;
     private String estado;
     private String observacion;
     private Integer idusuariocreac;
     private Integer idusuariomodif;
     private Date fechacreac;
     private Date fechamodif;
     private String codigo;
     private String ruc;
     private String razonsocial;
     private Set TUsuarios = new HashSet(0);
     private Set TProveedors = new HashSet(0);
     private Set TClientes = new HashSet(0);
     private Set TPersonals = new HashSet(0);

    public TPersona() {
    }

	
    public TPersona(int idpersona) {
        this.idpersona = idpersona;
    }
    public TPersona(int idpersona, String dni, String nombres, String apppat, String appmat, String telefono, String direccion, String email, String estado, String observacion, Integer idusuariocreac, Integer idusuariomodif, Date fechacreac, Date fechamodif, String codigo, String ruc, String razonsocial, Set TUsuarios, Set TProveedors, Set TClientes, Set TPersonals) {
       this.idpersona = idpersona;
       this.dni = dni;
       this.nombres = nombres;
       this.apppat = apppat;
       this.appmat = appmat;
       this.telefono = telefono;
       this.direccion = direccion;
       this.email = email;
       this.estado = estado;
       this.observacion = observacion;
       this.idusuariocreac = idusuariocreac;
       this.idusuariomodif = idusuariomodif;
       this.fechacreac = fechacreac;
       this.fechamodif = fechamodif;
       this.codigo = codigo;
       this.ruc = ruc;
       this.razonsocial = razonsocial;
       this.TUsuarios = TUsuarios;
       this.TProveedors = TProveedors;
       this.TClientes = TClientes;
       this.TPersonals = TPersonals;
    }
   
    public int getIdpersona() {
        return this.idpersona;
    }
    
    public void setIdpersona(int idpersona) {
        this.idpersona = idpersona;
    }
    public String getDni() {
        return this.dni;
    }
    
    public void setDni(String dni) {
        this.dni = dni;
    }
    public String getNombres() {
        return this.nombres;
    }
    
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    public String getApppat() {
        return this.apppat;
    }
    
    public void setApppat(String apppat) {
        this.apppat = apppat;
    }
    public String getAppmat() {
        return this.appmat;
    }
    
    public void setAppmat(String appmat) {
        this.appmat = appmat;
    }
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
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
    public String getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    public String getRuc() {
        return this.ruc;
    }
    
    public void setRuc(String ruc) {
        this.ruc = ruc;
    }
    public String getRazonsocial() {
        return this.razonsocial;
    }
    
    public void setRazonsocial(String razonsocial) {
        this.razonsocial = razonsocial;
    }
    public Set getTUsuarios() {
        return this.TUsuarios;
    }
    
    public void setTUsuarios(Set TUsuarios) {
        this.TUsuarios = TUsuarios;
    }
    public Set getTProveedors() {
        return this.TProveedors;
    }
    
    public void setTProveedors(Set TProveedors) {
        this.TProveedors = TProveedors;
    }
    public Set getTClientes() {
        return this.TClientes;
    }
    
    public void setTClientes(Set TClientes) {
        this.TClientes = TClientes;
    }
    public Set getTPersonals() {
        return this.TPersonals;
    }
    
    public void setTPersonals(Set TPersonals) {
        this.TPersonals = TPersonals;
    }




}


