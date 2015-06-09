/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.BE.TPersona;
import SIGEV.BE.TPersonal;
import SIGEV.DAO.PersonaDAO;
import SIGEV.DAO.PersonalDAO;
import SIGEV.LIST.PersonalCMBL;
import SIGEV.LIST.PersonalList;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author JHON
 */
public class PersonalBL {

    PersonalDAO oPersonalDAO = new PersonalDAO();

    /*char*/
    public ArrayList<PersonalCMBL> listarPersonal() {
        ArrayList<PersonalCMBL> listPersonalCMBLs = new ArrayList<>();
        ArrayList<Object> listObjects = oPersonalDAO.listarPersonal();
        Iterator iter = listObjects.iterator();
        //System.out.println(listObjects.size());
        while (iter.hasNext()) {
            Object[] obj = (Object[]) iter.next();
            PersonalCMBL oPersonalCMBL = new PersonalCMBL((int) obj[0], (String) obj[1]);
            listPersonalCMBLs.add(oPersonalCMBL);
        }
        return listPersonalCMBLs;

    }

    //davis
    public boolean registrarPersonal(TPersonal oTPersonal, TPersona oTPersona) {
        boolean flag = false;
        try {
            new PersonaDAO().insertPersona(oTPersona);

            oTPersonal.setTPersona(oTPersona);
            flag = new PersonalDAO().registrarPersonal(oTPersonal);

        } catch (Exception e) {
            System.out.println("error" + e.getMessage());
        }
        return flag;

    }

    public ArrayList<PersonalList> ListarPersonal() {
        ArrayList<PersonalList> lstPersonal = new ArrayList<>();
        try {
            lstPersonal = new PersonalDAO().ListarPersonal();

        } catch (Exception e) {
            System.out.println("erro en bl " + e.getMessage());
        }
        return lstPersonal;

    }

    public boolean actualizarPersonal(TPersonal oTPersonal, TPersona oTPersona) {
        boolean flag = false;
        try {

            flag = new PersonalDAO().actualizarPersonal(oTPersonal, oTPersona);

        } catch (Exception e) {
            System.out.println("error" + e.getMessage());
        }
        return flag;

    }

    public boolean eliminarPersonal(TPersonal oTPersonal, TPersona oTPersona) {
        boolean flag = false;
        try {

            flag = new PersonalDAO().eliminarPersonal(oTPersonal, oTPersona);

        } catch (Exception e) {
            System.out.println("error" + e.getMessage());
        }
        return flag;

    }

    public ArrayList<PersonalList> buscarPersonal(TPersona oTPersona) {
        ArrayList<PersonalList> lstPersonal = new ArrayList<>();
        try {
            lstPersonal = new PersonalDAO().buscarPersonal(oTPersona);

        } catch (Exception e) {
            System.out.println("error en bl " + e.getMessage());
        }
        return lstPersonal;

    }

    public static void main(String[] args) {
        PersonalBL oPersonalBL = new PersonalBL();
        System.out.println(oPersonalBL.listarPersonal().get(0).getPersonal());
    }

}
