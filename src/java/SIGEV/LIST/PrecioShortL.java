/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.LIST;

public class PrecioShortL {
    
    private double precio;
    private String denomimacion;

    public PrecioShortL(double precio, String denomimacion) {
        this.precio = precio;
        this.denomimacion = denomimacion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDenomimacion() {
        return denomimacion;
    }

    public void setDenomimacion(String denomimacion) {
        this.denomimacion = denomimacion;
    }
    
    
}
