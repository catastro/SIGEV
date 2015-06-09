/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.BE.TCliente;
import SIGEV.BE.TPersona;
import SIGEV.DAO.ClienteDAO;
import SIGEV.LIST.ClienteL;
import SIGEV.LIST.ClienteShortL;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author JHON
 */
public class ClienteBL {
    
    ClienteDAO oClienteDAO = new ClienteDAO();
    
    /*char*/
    public ArrayList<ClienteShortL> listarClienteModal(String codigo,String cliente) {
        ArrayList<ClienteShortL> listClientes = new ArrayList<>();
        ArrayList<Object> listObjects = oClienteDAO.listarClienteModal(codigo, cliente.replaceAll(" ","").toUpperCase());
        Iterator iter = listObjects.iterator();        
        while (iter.hasNext())
        {            
            Object[] obj = (Object[]) iter.next();            
            System.out.println((String)obj[1]);
            ClienteShortL oClienteShortL = new ClienteShortL((int)obj[0],(String) obj[1],(String) obj[2],(String)obj[3]);
            listClientes.add(oClienteShortL);            
        }
        return listClientes;
    
    }
    
        //----------------------- Insertar Cliente QUIQUE 01-05-2015 ----------------------------------
    public String insertarClientePersona(TPersona oTPersona, TCliente oTCliente) {
        String codigo = "";
        try {
            codigo = oClienteDAO.insertClientePersona(oTPersona, oTCliente);
        } catch (Exception e) {
        }
        return codigo;
    }

    //----------------------- Actualizar Cliente QUIQUE 01-05-2015 ----------------------------------
    public boolean updateCliente(TPersona oTPersona, TCliente oTCliente) {
        boolean rpta = oClienteDAO.updateCliente(oTPersona, oTCliente);
        return rpta;
    }

    //----------------------- Eliminar Cliente QUIQUE 01-05-2015 ----------------------------------
    public boolean deleteCliente(int idPers, int Idcli) {
        boolean rpta = oClienteDAO.deleteCliente(idPers, Idcli);
        return rpta;
    }

    //----------------------- Cambiar Estado Cliente QUIQUE 01-05-2015 ----------------------------------
    public boolean cambiarEstadoCliente(int idCliente, int idPersona, String estado) {
        boolean rpta = oClienteDAO.cambiarEstadoCliente(idCliente, idPersona, estado);
        return rpta;
    }

    //----------------------- Buscar Cliente QUIQUE 01-05-2015 ----------------------------------
    public ArrayList<ClienteL> buscarCliente(String codigo, String nombres, String apppat, String appmat, String razonsocial) {
        ArrayList<ClienteL> listCliente = null;
        try {
            oClienteDAO = new ClienteDAO();
            listCliente = new ArrayList<ClienteL>();
            listCliente = oClienteDAO.buscarCliente(codigo, nombres, apppat, appmat, razonsocial);
        } catch (Exception e) {
            throw e;
        }
        return listCliente;
    }

    //----------------------- Buscar Clientes en Ventas Quique 06-05-2015 -----------------------
    public boolean buscarClientesEnVentas(int idCliente) {
        boolean rpta = oClienteDAO.buscarClientesEnVentas(idCliente);
        return rpta;
    }

    public static void main(String[] args) {
        ClienteBL oClienteBL = new ClienteBL();
        TPersona oTPersona = new TPersona();
        TCliente oTCliente = new TCliente();
        oTPersona.setApppat("ch");
        oTCliente.setIdusuariocreac(1);
        oTCliente.setIdcfecuenciavisita(2);
        oTCliente.setIdcruta(2);
        oTCliente.setIdctipocliente(2);
        oTCliente.setIdctiponegocio(2);
        System.out.println(oClienteBL.insertarClientePersona(oTPersona, oTCliente));
        //System.out.println(oClienteBL.buscarCliente(null, null, null, null, null));
    }

    
    /*public static void main(String[] args) {
        ClienteBL oClienteBL = new ClienteBL();
        System.out.println(oClienteBL.listarClienteModal("123", ""));
    }*/
    
}
