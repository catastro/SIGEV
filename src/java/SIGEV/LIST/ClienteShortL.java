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
public class ClienteShortL {
    
    private int idCliente;
    private String codigoCliente;
    private String cliente;
    private String direccion;

    public ClienteShortL(int idCliente, String codigoCliente, String cliente, String direccion) {
        this.idCliente = idCliente;
        this.codigoCliente = codigoCliente;
        this.cliente = cliente;
        this.direccion = direccion;
    }

    
    
    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getCodigoCliente() {
        return codigoCliente;
    }

    public void setCodigoCliente(String codigoCliente) {
        this.codigoCliente = codigoCliente;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    
    
    
}
