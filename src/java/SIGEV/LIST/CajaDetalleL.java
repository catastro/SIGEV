/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.LIST;

import java.util.Date;

/**
 *
 * @author Monica 03/05/2015
 */
public class CajaDetalleL {
    private int idcajadetalle;
    private String denominacion;
    private Double ingreso;
    private Double egreso;
    private Date fechacreac;
    private Double subtotal;
    
    public CajaDetalleL() {
    }

    public int getIdcajadetalle() {
        return idcajadetalle;
    }

    /**
     * @param idcajadetalle the idcajadetalle to set
     */
    public void setIdcajadetalle(int idcajadetalle) {
        this.idcajadetalle = idcajadetalle;
    }

    /**
     * @return the denominacion
     */
    public String getDenominacion() {
        return denominacion;
    }

    /**
     * @param denominacion the denominacion to set
     */
    public void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }

    /**
     * @return the ingreso
     */
    public Double getIngreso() {
        return ingreso;
    }

    /**
     * @param ingreso the ingreso to set
     */
    public void setIngreso(Double ingreso) {
        this.ingreso = ingreso;
    }

    /**
     * @return the egreso
     */
    public Double getEgreso() {
        return egreso;
    }

    /**
     * @param egreso the egreso to set
     */
    public void setEgreso(Double egreso) {
        this.egreso = egreso;
    }

    /**
     * @return the fechacreac
     */
    public Date getFechacreac() {
        return fechacreac;
    }

    /**
     * @param fechacreac the fechacreac to set
     */
    public void setFechacreac(Date fechacreac) {
        this.fechacreac = fechacreac;
    }

    /**
     * @return the subtotal
     */
    public Double getSubtotal() {
        return subtotal;
    }

    /**
     * @param subtotal the subtotal to set
     */
    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }
    
}
