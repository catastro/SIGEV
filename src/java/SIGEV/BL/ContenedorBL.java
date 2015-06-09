/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.BE.*;
import SIGEV.DAO.*;
import java.util.ArrayList;

/**
 *
 * @author davis
 */
public class ContenedorBL {
    
    ContenedorDAO oContenedorDAO = new ContenedorDAO(); ;
    
    /*tegus*/
    public ArrayList<TContenedor> listarCombos(String idTabla){        
        ArrayList<TContenedor> lstCombos= oContenedorDAO.listarCombos(idTabla);
        ArrayList<TContenedor> lstCombosCopia= new ArrayList<>();
        
        for (TContenedor oTContenedor : lstCombos) {
            TContenedor TContenedor1= new TContenedor();
            TContenedor1.setIdcontenedor(oTContenedor.getIdcontenedor());
            TContenedor1.setDenominacion(oTContenedor.getDenominacion());
            lstCombosCopia.add(TContenedor1);
        }
        return lstCombosCopia;
    }
    
    /*char*/
    public ArrayList<TContenedor> listarContenedorTablas(String denominacion){
        ArrayList<TContenedor> listContenedors= oContenedorDAO.listarContenedorTablas(denominacion);
        ArrayList<TContenedor> lstCombosRetorno= new ArrayList<>();
        
        for (TContenedor oTContenedor : listContenedors) {
            TContenedor oTContenedorL= new TContenedor();
            oTContenedorL.setIdcontenedor(oTContenedor.getIdcontenedor());
            oTContenedorL.setIdtabla(oTContenedor.getIdtabla());
            oTContenedorL.setIditem(oTContenedor.getIditem());
            oTContenedorL.setIdsuperior(oTContenedor.getIdsuperior());
            oTContenedorL.setOrden(oTContenedor.getOrden());
            oTContenedorL.setAbreviatura(oTContenedor.getAbreviatura());
            oTContenedorL.setDenominacion(oTContenedor.getDenominacion().toUpperCase());
            oTContenedorL.setEstado(oTContenedor.getEstado());
            oTContenedorL.setObservacion(oTContenedor.getObservacion());
            lstCombosRetorno.add(oTContenedorL);
            
        }
        return lstCombosRetorno; 
     
     }
     /*char*/
    public ArrayList<TContenedor> listarContenedorSubTablas(int idTabla){
     ArrayList<TContenedor> listContenedors= oContenedorDAO.listarContenedorSubTablas(idTabla);
        ArrayList<TContenedor> lstCombosRetorno= new ArrayList<>();
        
        for (TContenedor oTContenedor : listContenedors) {
            TContenedor oTContenedorL= new TContenedor();
            oTContenedorL.setIdcontenedor(oTContenedor.getIdcontenedor());
            oTContenedorL.setIdtabla(oTContenedor.getIdtabla());
            oTContenedorL.setIditem(oTContenedor.getIditem());
            oTContenedorL.setIdsuperior(oTContenedor.getIdsuperior());
            oTContenedorL.setOrden(oTContenedor.getOrden());
            oTContenedorL.setAbreviatura(oTContenedor.getAbreviatura());
            oTContenedorL.setDenominacion(oTContenedor.getDenominacion());
            oTContenedorL.setEstado(oTContenedor.getEstado());
            oTContenedorL.setObservacion(oTContenedor.getObservacion());
            lstCombosRetorno.add(oTContenedorL);
            
        }
        return lstCombosRetorno; 
     }
    
    public boolean insertOrUpdateContenedor(TContenedor oTContenedor){        
        oTContenedor.setDenominacion(oTContenedor.getDenominacion().trim());
        boolean rpta = oContenedorDAO.insertOrUpdateContenedor(oTContenedor);
        return  rpta;
    }
    
    public static void main(String[] args) {
        ContenedorBL oContenedorBL = new ContenedorBL();
        System.out.println(oContenedorBL.listarContenedorTablas("") );
    }
}
