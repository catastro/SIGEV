/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.LIST;

import SIGEV.BE.TPersonal;

/**
 *
 * @author davis
 */
public class PagoList {
        private int idpago;
     private TPersonal TPersonal;
     private String fechapagofin;
     private String fechapagoinicio;
     private Double monto;
     private Integer minutostardanza;
     private Integer horasextra;
     private Double descuento;
     private Double aumento;
     private Double montototal;
     private String fechacreacion;
     private String fechamodificacion;
     private Integer usuariocreacion;
     private Integer usuariomodificacion;
     private String estado;
     private String observacion;

    public int getIdpago() {
        return idpago;
    }

    public void setIdpago(int idpago) {
        this.idpago = idpago;
    }

    public TPersonal getTPersonal() {
        return TPersonal;
    }

    public void setTPersonal(TPersonal TPersonal) {
        this.TPersonal = TPersonal;
    }

    public String getFechapagofin() {
        return fechapagofin;
    }

    public void setFechapagofin(String fechapagofin) {
        this.fechapagofin = fechapagofin;
    }

    public String getFechapagoinicio() {
        return fechapagoinicio;
    }

    public void setFechapagoinicio(String fechapagoinicio) {
        this.fechapagoinicio = fechapagoinicio;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public Integer getMinutostardanza() {
        return minutostardanza;
    }

    public void setMinutostardanza(Integer minutostardanza) {
        this.minutostardanza = minutostardanza;
    }

    public Integer getHorasextra() {
        return horasextra;
    }

    public void setHorasextra(Integer horasextra) {
        this.horasextra = horasextra;
    }

    public Double getDescuento() {
        return descuento;
    }

    public void setDescuento(Double descuento) {
        this.descuento = descuento;
    }

    public Double getAumento() {
        return aumento;
    }

    public void setAumento(Double aumento) {
        this.aumento = aumento;
    }

    public Double getMontototal() {
        return montototal;
    }

    public void setMontototal(Double montototal) {
        this.montototal = montototal;
    }

    public String getFechacreacion() {
        return fechacreacion;
    }

    public void setFechacreacion(String fechacreacion) {
        this.fechacreacion = fechacreacion;
    }

    public String getFechamodificacion() {
        return fechamodificacion;
    }

    public void setFechamodificacion(String fechamodificacion) {
        this.fechamodificacion = fechamodificacion;
    }

    public Integer getUsuariocreacion() {
        return usuariocreacion;
    }

    public void setUsuariocreacion(Integer usuariocreacion) {
        this.usuariocreacion = usuariocreacion;
    }

    public Integer getUsuariomodificacion() {
        return usuariomodificacion;
    }

    public void setUsuariomodificacion(Integer usuariomodificacion) {
        this.usuariomodificacion = usuariomodificacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }
}
