/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.BE.TPersona;
import SIGEV.DAO.PersonaDAO;

/**
 *
 * @author QUIQUE
 */
public class PersonaBL {

    PersonaDAO oPersonaDAO = new PersonaDAO();

    public boolean insertarPersona(TPersona oTPersona) {

        boolean rpta = oPersonaDAO.insertPersona(oTPersona);

        return rpta;

    }
    // 22/04/2015 MÃ³nica: busca una persona por su dni    
    

    public TPersona buscarPersonaxDni(String dni){
        TPersona oTPersona;
        TPersona oTPersonaRetorno = new TPersona();
        oTPersona = oPersonaDAO.buscarPersonaxDni(dni);
        oTPersonaRetorno.setNombres(oTPersona.getNombres());
        oTPersonaRetorno.setApppat(oTPersona.getApppat());
        oTPersonaRetorno.setAppmat(oTPersona.getAppmat());
        
        return oTPersonaRetorno;
    }

    public static void main(String[] args) {
        PersonaBL oPersonaBL = new PersonaBL();
        TPersona oTPersona = new TPersona();
        oTPersona.setApppat("ch");
        System.out.println(oPersonaBL.insertarPersona(oTPersona));
    }
}
