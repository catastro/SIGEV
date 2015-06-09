/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.BE.TDetalleVenta;
import SIGEV.BE.TVenta;
import SIGEV.DAO.DetalleVentaDAO;
import java.util.ArrayList;

/**
 *
 * @author JHON
 */
public class DetalleVentaBL {
    
    DetalleVentaDAO oDetalleVentaDAO = new DetalleVentaDAO();
    
    public int insertOrUpdateDetalleVenta(TVenta oTVenta, ArrayList<TDetalleVenta> listTDetalleVentas){
        
        int rpta = oDetalleVentaDAO.insertOrUpdateDetalleVenta(oTVenta, listTDetalleVentas);
        
        return rpta;
    }
    
}
