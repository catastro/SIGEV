/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import java.util.ArrayList;
import SIGEV.DAO.PrecioDAO;
import SIGEV.LIST.PrecioShortL;
import java.util.Iterator;

/**
 *
 * @author JHON
 */
public class PrecioBL {
    
    PrecioDAO oPrecioDAO = new PrecioDAO();
    
    public ArrayList<PrecioShortL> listarPrecios(int idProducto){
        ArrayList<PrecioShortL> listPrecioShortLs = new ArrayList<>();
        
        ArrayList<Object> list = oPrecioDAO.listarPrecios(idProducto);
        Iterator iter = list.iterator();        
        while (iter.hasNext())
        {            
            Object[] obj = (Object[]) iter.next();            
            PrecioShortL oPrecioShortL =new PrecioShortL((double)obj[0],(String)obj[1]);
            listPrecioShortLs.add(oPrecioShortL);
        }
        return listPrecioShortLs;
    }
    
}
