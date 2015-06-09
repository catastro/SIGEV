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
public class CajaL {
    
    private int idcaja;
    private Date fechaarqueo;
    private Double monto;
    private int idCajaDetalle;

    public CajaL() {
    }
    

    /**
     * @return the fechaarqueo
     */
    public Date getFechaarqueo() {
        return fechaarqueo;
    }

    /**
     * @param fechaarqueo the fechaarqueo to set
     */
    public void setFechaarqueo(Date fechaarqueo) {
        this.fechaarqueo = fechaarqueo;
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
     * @return the idcaja
     */
    public int getIdcaja() {
        return idcaja;
    }

    /**
     * @param idcaja the idcaja to set
     */
    public void setIdcaja(int idcaja) {
        this.idcaja = idcaja;
    }

    /**
     * @return the idCajaDetalle
     */
    public int getIdCajaDetalle() {
        return idCajaDetalle;
    }

    /**
     * @param idCajaDetalle the idCajaDetalle to set
     */
    public void setIdCajaDetalle(int idCajaDetalle) {
        this.idCajaDetalle = idCajaDetalle;
    }
    
    
}
