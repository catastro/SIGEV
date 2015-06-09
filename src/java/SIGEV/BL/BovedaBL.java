/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.BE.TBoveda;
import SIGEV.BE.TCaja;
import SIGEV.DAO.BovedaDAO;
import SIGEV.DAO.CajaDAO;
import SIGEV.DAO.DataAccessLayerException;
import SIGEV.LIST.BovedaL;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author WINDOWS 8
 */
public class BovedaBL {
    BovedaDAO oBovedaDAO= new BovedaDAO();
    
     // Mónica (10/05/2015):  método para crear o actualizar TBoveda
     public boolean CrearOactualizarBoveda(TBoveda oTBoveda){
        if(oTBoveda.getIdboveda()!=0){                
                int id=oTBoveda.getIdboveda();                                
                //TBoveda oTBovedaRescate=(TBoveda)session.load(TBoveda.class,id );                
                oTBoveda.setFechacreac(oBovedaDAO.Recuperarid(id));
                oTBoveda.setFechamodif(new Date());
            }else{
                oTBoveda.setFechacreac(new Date());              
       }         
         
        boolean rpta = oBovedaDAO.CrearOactualizarBoveda(oTBoveda);
        return  rpta;
     }
    
    
    // Mónica: Buscar registros de bóveda(salidas) filtrado por rando d fechas
    public ArrayList<BovedaL> buscarBoveda(String fechaA,String fechaB) throws DataAccessLayerException, ParseException {
        ArrayList<TBoveda> listTBoveda = oBovedaDAO.buscarBoveda(fechaA, fechaB);
        ArrayList<BovedaL> listaRetorno = new ArrayList<>();
        for (TBoveda oTBoveda : listTBoveda) {
                BovedaL oBovedaL=new BovedaL();
                oBovedaL.setIdboveda(oTBoveda.getIdboveda());
                oBovedaL.setDenominacion(oTBoveda.getDenominacion());
                oBovedaL.setMonto(oTBoveda.getMonto());
                oBovedaL.setFechacreac(oTBoveda.getFechacreac());
                oBovedaL.setObservacion(oTBoveda.getObservacion());
                oBovedaL.setEstado(oTBoveda.getEstado());
                listaRetorno.add(oBovedaL);
        }
        return listaRetorno;
    }
    
    //Monica: cambiar d estado boveda 11/05/2015
     public boolean EliminarBoveda(int idboveda){
         boolean rpta=oBovedaDAO.EliminarBoveda(idboveda);
         return rpta;
     }
     
      //Monica: Efectivo en bóveda 12/05/2015
     public double Efectivo() throws DataAccessLayerException, ParseException{
         double sumaCaja=0;
         double sumaSalida=0;
         double efectivo;
         CajaDAO oCajaDAO=new CajaDAO();
         sumaCaja= oCajaDAO.SumarCaja();
         sumaSalida=oBovedaDAO.SumarSalida();
        
         efectivo=sumaCaja-sumaSalida;
         return efectivo;
     }
    public static void main(String[] args) throws DataAccessLayerException, ParseException {
        BovedaBL oBovedaBL=new BovedaBL();
        System.out.println(oBovedaBL.Efectivo());
    }
}
