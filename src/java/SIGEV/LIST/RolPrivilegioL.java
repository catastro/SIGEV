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
public class RolPrivilegioL {
    String denominacion;
    String imagen;
    String idprivilegioboton;

    public RolPrivilegioL(String denominacion, String imagen, String idprivilegioboton) {
        this.denominacion = denominacion;
        this.imagen = imagen;
        this.idprivilegioboton = idprivilegioboton;
    }

    public String getDenominacion() {
        return denominacion;
    }

    public String getIdprivilegioboton() {
        return idprivilegioboton;
    }

    public String getImagen() {
        return imagen;
    }

    public void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }

    public void setIdprivilegioboton(String idprivilegioboton) {
        this.idprivilegioboton = idprivilegioboton;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
    
}
