/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.LIST;

/**
 *
 * @author JHON
 */
public class PersonalCMBL {
    int idPersonal;
    String personal;

    public int getIdPersonal() {
        return idPersonal;
    }

    public String getPersonal() {
        return personal;
    }

    public void setIdPersonal(int idPersonal) {
        this.idPersonal = idPersonal;
    }

    public void setPersonal(String personal) {
        this.personal = personal;
    }

    public PersonalCMBL(int idPersonal, String personal) {
        this.idPersonal = idPersonal;
        this.personal = personal;
    }
    
    
}
