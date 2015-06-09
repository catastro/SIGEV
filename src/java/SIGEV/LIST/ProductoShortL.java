/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.LIST;

/**
 *
 * @author JHON
 */
public class ProductoShortL {
    
    private int idProducto;
    private String codigo;    
    private String denominacion;
    private int stock;
    private String observacion;

    public ProductoShortL(int idProducto, String codigo, String denominacion, int stock, String observacion) {
        this.idProducto = idProducto;
        this.codigo = codigo;
        this.denominacion = denominacion;
        this.stock = stock;
        this.observacion = observacion;
    }
    
    

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDenominacion() {
        return denominacion;
    }

    public void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }
    
    
    
}
