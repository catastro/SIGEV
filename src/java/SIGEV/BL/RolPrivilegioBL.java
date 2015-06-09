
package SIGEV.BL;

import SIGEV.LIST.RolPrivilegioL;
import SIGEV.DAO.RolPrivilegioDAO;
import java.util.ArrayList;
import java.util.Iterator;


public class RolPrivilegioBL {
    
    RolPrivilegioDAO oRolPrivilegioDAO = new RolPrivilegioDAO();
    
    
    /*char*/
    public ArrayList<RolPrivilegioL> ListarRolPrivilegio( int idMenu, int idRol){
        
        ArrayList<RolPrivilegioL> listRolPrivilegioLs = new ArrayList<>();        
        ArrayList<Object> listObjects = oRolPrivilegioDAO.listPrivilegios(idMenu, idRol);        
        Iterator iter = listObjects.iterator();
        //System.out.println(listObjects.size());
        while (iter.hasNext())
        {            
            Object[] obj = (Object[]) iter.next();            
            RolPrivilegioL oRolPrivilegioL = new RolPrivilegioL((String) obj[0],(String) obj[1] ,(String) obj[2]);
            listRolPrivilegioLs.add(oRolPrivilegioL);            
        }
        return listRolPrivilegioLs;
    }
    public static void main(String[] args) {
        RolPrivilegioBL oRolPrivilegioBL = new RolPrivilegioBL();
        ArrayList<RolPrivilegioL> oRolPrivilegioL = oRolPrivilegioBL.ListarRolPrivilegio(19, 1);
        System.out.println(oRolPrivilegioL.get(0).getDenominacion());
        System.out.println(oRolPrivilegioL.get(1).getDenominacion());

    }
}
