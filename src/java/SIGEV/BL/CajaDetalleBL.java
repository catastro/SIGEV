/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.BE.TCaja;
import SIGEV.BE.TCajaDetalle;
import SIGEV.DAO.CajaDetalleDAO;
import SIGEV.DAO.DataAccessLayerException;
import SIGEV.LIST.CajaDetalleL;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author WINDOWS 8
 */
public class CajaDetalleBL {
    CajaDetalleDAO oCajaDetalleDAO=new CajaDetalleDAO();
    public boolean CrearCajaDetalle(ArrayList<TCajaDetalle> listCajaDetalle, Date fechaArqueo, double sumatotal){
        boolean rpta = oCajaDetalleDAO.CrearCajaDetalle(listCajaDetalle,fechaArqueo,sumatotal);
        
        return rpta;
    }
    
     // Monica: listar arqueos de caja para Actualizar  01/05/2015
    
     public ArrayList<CajaDetalleL> ListarParaActualizarCaja(int idCaja) throws DataAccessLayerException, ParseException{
        ArrayList<TCajaDetalle> listTCajaDetalle = oCajaDetalleDAO.ListarParaActualizarCaja(idCaja);
        ArrayList<CajaDetalleL> listaRetorno = new ArrayList<>();
         for (TCajaDetalle oTCajaDetalle : listTCajaDetalle) {
                CajaDetalleL oCajaDetalleL= new CajaDetalleL();
                oCajaDetalleL.setIdcajadetalle(oTCajaDetalle.getIdcajadetalle());
                oCajaDetalleL.setDenominacion(oTCajaDetalle.getDenominacion());
                oCajaDetalleL.setIngreso(oTCajaDetalle.getIngreso());
                oCajaDetalleL.setEgreso(oTCajaDetalle.getEgreso());
                oCajaDetalleL.setSubtotal(oTCajaDetalle.getSubtotal());
                oCajaDetalleL.setFechacreac(oTCajaDetalle.getFechacreac());
                
                listaRetorno.add(oCajaDetalleL);
         }
         return listaRetorno;
     }
     
     public boolean ActualizarCajaDetalle(ArrayList<TCajaDetalle> listCajaDetalle, double sumatotal, int idCaja) {
         boolean rpta=oCajaDetalleDAO.ActualizarCajaDetalle(listCajaDetalle, sumatotal, idCaja);
         return rpta;
     }    
     
     //Monica: cambiar d estado cajaDetalle 05/05/2015
     public boolean EliminarCajaDetalle(int idcajadetalle) {
         boolean rpta=oCajaDetalleDAO.EliminarCajaDetalle(idcajadetalle);
         return rpta;
     } 

}
