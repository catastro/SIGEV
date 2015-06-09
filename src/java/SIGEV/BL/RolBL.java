/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;


import SIGEV.BE.TRol;
import SIGEV.DAO.RolDAO;
import SIGEV.LIST.RolL;
import java.util.ArrayList;

/**
 *
 * @author WINDOWS 8
 */
public class RolBL {

    RolDAO oRolDAO = new RolDAO();

    public ArrayList<RolL> mostrarRol() {
        ArrayList<TRol> listTRol = oRolDAO.mostrarRol();
        ArrayList<RolL> listRolL = new ArrayList<>();
        for (TRol oTRol : listTRol) {
            RolL oRolL = new RolL();
            oRolL.setIdrol(oTRol.getIdrol());
            oRolL.setNombrerol(oTRol.getNombrerol());

            listRolL.add(oRolL);
        }
        return listRolL;
    }

     public static void main(String[] args) {
        RolBL oRolBL=new RolBL();
        System.out.println(oRolBL.mostrarRol());
        
                
    }
}
