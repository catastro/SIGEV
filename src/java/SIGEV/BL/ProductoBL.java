/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.DAO.ProductoDAO;
import java.util.ArrayList;
import SIGEV.LIST.ProductoShortL;
import java.util.Iterator;

/**
 *
 * @author JHON
 */
public class ProductoBL {
    
    ProductoDAO oProductoDAO = new ProductoDAO();
    
    
    /*char*/
    public ArrayList<ProductoShortL> buscarProductoXCodigo(String codigo){
        ArrayList<ProductoShortL> listProductoShortLs = new ArrayList<>();
        ArrayList<Object> list = oProductoDAO.buscarProductoXCodigo(codigo.trim());
        Iterator iter = list.iterator();        
        while (iter.hasNext())
        {            
            Object[] obj = (Object[]) iter.next();            
            ProductoShortL oProductoShortL = new ProductoShortL((int)obj[0],(String) obj[1] ,(String)obj[2],(int)obj[3],(String)obj[4]);
            listProductoShortLs.add(oProductoShortL);            
        }
        return listProductoShortLs;
    }
    
    
    /*char*/
    public ArrayList<ProductoShortL> buscarProductoXDenominacion(String demoninacion){
        ArrayList<ProductoShortL> listProductoShortLs = new ArrayList<>();
        ArrayList<Object> list = oProductoDAO.buscarProductoXDenominacion(demoninacion.trim());
        Iterator iter = list.iterator();        
        while (iter.hasNext())
        {            
            Object[] obj = (Object[]) iter.next();            
            ProductoShortL oProductoShortL = new ProductoShortL((int)obj[0],(String) obj[1] ,(String)obj[2],(int)obj[3],(String)obj[4]);
            listProductoShortLs.add(oProductoShortL);            
        }
        return listProductoShortLs;
    }
    
}
