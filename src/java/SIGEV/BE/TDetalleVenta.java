package SIGEV.BE;
// Generated 30/05/2015 06:26:47 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * TDetalleVenta generated by hbm2java
 */
public class TDetalleVenta  implements java.io.Serializable {


     private int iddetalleventa;
     private TProducto TProducto;
     private TVenta TVenta;
     private Integer cantidadventa;
     private String estado;
     private String observacion;
     private Integer idusuariocreac;
     private Integer idusuariomodif;
     private Date fechacreac;
     private Date fechamodif;
     private Double precioventaunid;
     private Double descuento;
     private Double subtotal;

    public TDetalleVenta() {
    }

	
    public TDetalleVenta(int iddetalleventa) {
        this.iddetalleventa = iddetalleventa;
    }
    public TDetalleVenta(int iddetalleventa, TProducto TProducto, TVenta TVenta, Integer cantidadventa, String estado, String observacion, Integer idusuariocreac, Integer idusuariomodif, Date fechacreac, Date fechamodif, Double precioventaunid, Double descuento, Double subtotal) {
       this.iddetalleventa = iddetalleventa;
       this.TProducto = TProducto;
       this.TVenta = TVenta;
       this.cantidadventa = cantidadventa;
       this.estado = estado;
       this.observacion = observacion;
       this.idusuariocreac = idusuariocreac;
       this.idusuariomodif = idusuariomodif;
       this.fechacreac = fechacreac;
       this.fechamodif = fechamodif;
       this.precioventaunid = precioventaunid;
       this.descuento = descuento;
       this.subtotal = subtotal;
    }
   
    public int getIddetalleventa() {
        return this.iddetalleventa;
    }
    
    public void setIddetalleventa(int iddetalleventa) {
        this.iddetalleventa = iddetalleventa;
    }
    public TProducto getTProducto() {
        return this.TProducto;
    }
    
    public void setTProducto(TProducto TProducto) {
        this.TProducto = TProducto;
    }
    public TVenta getTVenta() {
        return this.TVenta;
    }
    
    public void setTVenta(TVenta TVenta) {
        this.TVenta = TVenta;
    }
    public Integer getCantidadventa() {
        return this.cantidadventa;
    }
    
    public void setCantidadventa(Integer cantidadventa) {
        this.cantidadventa = cantidadventa;
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
    public Double getPrecioventaunid() {
        return this.precioventaunid;
    }
    
    public void setPrecioventaunid(Double precioventaunid) {
        this.precioventaunid = precioventaunid;
    }
    public Double getDescuento() {
        return this.descuento;
    }
    
    public void setDescuento(Double descuento) {
        this.descuento = descuento;
    }
    public Double getSubtotal() {
        return this.subtotal;
    }
    
    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }




}


