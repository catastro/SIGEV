package SIGEV.BE;
// Generated 30/05/2015 06:26:47 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TProducto generated by hbm2java
 */
public class TProducto  implements java.io.Serializable {


     private int idproducto;
     private String codigo;
     private Integer idcmarca;
     private Date fecha;
     private String nombreproducto;
     private String estado;
     private String observacion;
     private Integer idusuariocreac;
     private Integer idusuariomodif;
     private Date fechacreac;
     private Date fechamodif;
     private Double preciocompra;
     private Integer cantunidadesxcaja;
     private Integer idproveedor;
     private Integer stock;
     private Set TDetalleVentas = new HashSet(0);
     private Set TDevolucionProductos = new HashSet(0);
     private Set TPrecios = new HashSet(0);
     private Set TDetalleCompras = new HashSet(0);

    public TProducto() {
    }

	
    public TProducto(int idproducto) {
        this.idproducto = idproducto;
    }
    public TProducto(int idproducto, String codigo, Integer idcmarca, Date fecha, String nombreproducto, String estado, String observacion, Integer idusuariocreac, Integer idusuariomodif, Date fechacreac, Date fechamodif, Double preciocompra, Integer cantunidadesxcaja, Integer idproveedor, Integer stock, Set TDetalleVentas, Set TDevolucionProductos, Set TPrecios, Set TDetalleCompras) {
       this.idproducto = idproducto;
       this.codigo = codigo;
       this.idcmarca = idcmarca;
       this.fecha = fecha;
       this.nombreproducto = nombreproducto;
       this.estado = estado;
       this.observacion = observacion;
       this.idusuariocreac = idusuariocreac;
       this.idusuariomodif = idusuariomodif;
       this.fechacreac = fechacreac;
       this.fechamodif = fechamodif;
       this.preciocompra = preciocompra;
       this.cantunidadesxcaja = cantunidadesxcaja;
       this.idproveedor = idproveedor;
       this.stock = stock;
       this.TDetalleVentas = TDetalleVentas;
       this.TDevolucionProductos = TDevolucionProductos;
       this.TPrecios = TPrecios;
       this.TDetalleCompras = TDetalleCompras;
    }
   
    public int getIdproducto() {
        return this.idproducto;
    }
    
    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }
    public String getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    public Integer getIdcmarca() {
        return this.idcmarca;
    }
    
    public void setIdcmarca(Integer idcmarca) {
        this.idcmarca = idcmarca;
    }
    public Date getFecha() {
        return this.fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public String getNombreproducto() {
        return this.nombreproducto;
    }
    
    public void setNombreproducto(String nombreproducto) {
        this.nombreproducto = nombreproducto;
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
    public Double getPreciocompra() {
        return this.preciocompra;
    }
    
    public void setPreciocompra(Double preciocompra) {
        this.preciocompra = preciocompra;
    }
    public Integer getCantunidadesxcaja() {
        return this.cantunidadesxcaja;
    }
    
    public void setCantunidadesxcaja(Integer cantunidadesxcaja) {
        this.cantunidadesxcaja = cantunidadesxcaja;
    }
    public Integer getIdproveedor() {
        return this.idproveedor;
    }
    
    public void setIdproveedor(Integer idproveedor) {
        this.idproveedor = idproveedor;
    }
    public Integer getStock() {
        return this.stock;
    }
    
    public void setStock(Integer stock) {
        this.stock = stock;
    }
    public Set getTDetalleVentas() {
        return this.TDetalleVentas;
    }
    
    public void setTDetalleVentas(Set TDetalleVentas) {
        this.TDetalleVentas = TDetalleVentas;
    }
    public Set getTDevolucionProductos() {
        return this.TDevolucionProductos;
    }
    
    public void setTDevolucionProductos(Set TDevolucionProductos) {
        this.TDevolucionProductos = TDevolucionProductos;
    }
    public Set getTPrecios() {
        return this.TPrecios;
    }
    
    public void setTPrecios(Set TPrecios) {
        this.TPrecios = TPrecios;
    }
    public Set getTDetalleCompras() {
        return this.TDetalleCompras;
    }
    
    public void setTDetalleCompras(Set TDetalleCompras) {
        this.TDetalleCompras = TDetalleCompras;
    }




}


