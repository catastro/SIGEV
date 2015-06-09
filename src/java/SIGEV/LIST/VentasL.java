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
public class VentasL {
    
    private String  numcomprobante ;
    private String cliente;
    private String fecha;
    private double monto;
    private int idcVenta;
    private String observacion;

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String getObservacion() {
        return observacion;
    }

    public int getIdcVenta() {
        return idcVenta;
    }

    public void setIdcVenta(int idcVenta) {
        this.idcVenta = idcVenta;
    }
    
    

    public String getNumcomprobante() {
        return numcomprobante;
    }

    public void setNumcomprobante(String numcomprobante) {
        this.numcomprobante = numcomprobante;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }
    
    
    
}
