/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.LIST;

import java.util.Date;

/**
 *
 * @author WINDOWS 8
 */
public class BovedaL {
     private int idboveda;
     private String denominacion;
     private Double monto;
     private Date fechacreac;
     private String observacion;
     private String estado;
    /**
     * @return the idboveda
     */
    public int getIdboveda() {
        return idboveda;
    }

    /**
     * @param idboveda the idboveda to set
     */
    public void setIdboveda(int idboveda) {
        this.idboveda = idboveda;
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
     * @return the monto
     */
    public Double getMonto() {
        return monto;
    }

    /**
     * @param monto the monto to set
     */
    public void setMonto(Double monto) {
        this.monto = monto;
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
     * @return the observacion
     */
    public String getObservacion() {
        return observacion;
    }

    /**
     * @param observacion the observacion to set
     */
    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }
}
