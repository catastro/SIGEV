/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.BE.TPago;
import SIGEV.DAO.PagoDAO;
import SIGEV.LIST.PagoList;
import SIGEV.UTIL.Fecha;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author davis
 */
public class PagoBL {

    public boolean registrarPago(TPago oTPago) {
        boolean flag = false;
        try {
            flag = new PagoDAO().registrarPago(oTPago);

        } catch (Exception e) {
            System.out.println("error " + e.getMessage());
            throw e;
        }
        return flag;

    }

    public ArrayList<PagoList> buscarPago(int idPersonal) {
       // ArrayList<PagoList> lstPagosFinal=new ArrayList<>();
         ArrayList<PagoList> lstPagos= new ArrayList<>();
        try {

            lstPagos = new PagoDAO().buscarPago(idPersonal);

//            DateFormat date = new SimpleDateFormat("dd/MM/yyyy");
//
//            for (Iterator<TPago> it = lstPagos.iterator(); it.hasNext();) {
//                TPago lstPago = it.next();
//                PagoList oTPago = new PagoList();
//                System.out.println("pagoo "+lstPago.getIdpago());
//                oTPago.setIdpago(lstPago.getIdpago());
//                oTPago.setFechapagofin((date.format(lstPago.getFechafin())));
//                oTPago.setFechapagoinicio((date.format(lstPago.getFechainicio())));
//                oTPago.setMonto(lstPago.getMonto());
//                oTPago.setMinutostardanza(lstPago.getMinutostardanza());
//                oTPago.setHorasextra(lstPago.getHorasextra());
//                oTPago.setDescuento(lstPago.getDescuento());
//                oTPago.setAumento(lstPago.getAumento());
//                oTPago.setMontototal(lstPago.getMontototal());
//                oTPago.setFechacreacion((date.format(lstPago.getFechacreac())));
//                oTPago.setEstado(lstPago.getEstado());
//                lstPagosFinal.add(oTPago);
//            }
            
           
        } catch (Exception e) {
            System.out.println("error en bl" +e.getMessage());
        }
         return lstPagos;
    }
    
    public boolean actualizarPago(TPago oTPago) {
        boolean flag = false;
        try {
            flag = new PagoDAO().actualizarPago(oTPago);

        } catch (Exception e) {
            System.out.println("error " + e.getMessage());
            throw e;
        }
        return flag;

    }
    
     public boolean eliminarPago(int idPago) {
        boolean flag = false;
        try {
            flag = new PagoDAO().eliminarPago(idPago);

        } catch (Exception e) {
            System.out.println("error " + e.getMessage());
            throw e;
        }
        return flag;

    }

}
