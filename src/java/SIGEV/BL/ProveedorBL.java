/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.BE.TPersona;
import SIGEV.BE.TProveedor;
import SIGEV.DAO.ProveedorDAO;
import SIGEV.LIST.ProveedorL;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author QUIQUE
 */
public class ProveedorBL {

    ProveedorDAO oProveedorDAO = new ProveedorDAO();

    //----------------------- Insertar Proveedor QUIQUE 01-05-2015 ----------------------------------
    public String insertarProveedorPersona(TPersona oTPersona, TProveedor oTProveedor) {
        String codigo = "";
        try {
            codigo = oProveedorDAO.insertProveedorPersona(oTPersona, oTProveedor);
        } catch (Exception e) {
        }
        return codigo;
    }

    //----------------------- Actualizar Proveedor QUIQUE 01-05-2015 ----------------------------------
    public boolean actualizarProveedor(TPersona oTPersona, TProveedor oTProveedor) {
        boolean rpta = oProveedorDAO.updateProveedor(oTPersona, oTProveedor);
        return rpta;
    }

    //----------------------- eliminar Proveedor QUIQUE 01-05-2015 ----------------------------------
    public boolean deleteProveedor(int idProveedor, int idPersona) {
        boolean rpta = oProveedorDAO.deleteProveedor(idProveedor, idPersona);
        return rpta;
    }

    //----------------------- cambiar estado Proveedor QUIQUE 01-05-2015 ----------------------------------
    public boolean cambiarEstadoProveedor(int idProveedor, int idPersona, String estado) {
        boolean rpta = oProveedorDAO.cambiarEstadoProveedor(idProveedor, idPersona, estado);
        return rpta;
    }

    //----------------------- Buscar Proveedor QUIQUE 01-05-2015 ----------------------------------
    public ArrayList<ProveedorL> buscarProveedor(String codigo, String nombres, String apppat, String appmat, String razonsocial) {
        ArrayList<ProveedorL> listProveedor = null;
        try {
            oProveedorDAO = new ProveedorDAO();
            listProveedor = new ArrayList<ProveedorL>();
            listProveedor = oProveedorDAO.buscarProveedor(codigo, nombres, apppat, appmat, razonsocial);
        } catch (Exception e) {
            throw e;
        }
        return listProveedor;
    }

    //----------------------- Buscar Proveedor en Compras Quique 06-05-2015 -----------------------
    public boolean buscarProveedorEnCompra(int idProveedor) {
        boolean rpta = oProveedorDAO.buscarProveedorEnCompra(idProveedor);
        return rpta;
    }

    public static void main(String[] args) {
        ProveedorBL oProveedorBL = new ProveedorBL();
        /*TPersona oTPersona = new TPersona();
         TProveedor oTProveedor = new TProveedor();
         oTPersona.setApppat("987654321");
         oTProveedor.setIdusuariocreac(1);
         System.out.println(oProveedorBL.insertarProveedorPersona(oTPersona, oTProveedor));*/
        //System.out.println(oProveedorBL.buscarProveedor(null, null, null, null, null));
        System.out.println(oProveedorBL.buscarProveedorEnCompra(1));
    }

}
