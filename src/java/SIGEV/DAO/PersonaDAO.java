/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.DAO;

import SIGEV.BE.TCliente;
import SIGEV.BE.TPersona;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author QUIQUE
 */
public class PersonaDAO {

    private Session session;
    private Transaction tx;

    public PersonaDAO() {
        HibernateFactory.buildIfNeeded();
    }
    
        

    
// 22/04/2015 MÃ³nica: busca una persona por su dni    
    public TPersona buscarPersonaxDni(String dni){
           List<TPersona> listTPersona;
           TPersona oTPersona=null;
        try {
            startOperation(); 
            Query query = session.createQuery("from TPersona TP where TP.dni='"+dni+"'");
//            listTPersona = query.list();
//            if (listTPersona.size() == 1) {
//                oTPersona=listTPersona.get(0);
//            }
            query.setMaxResults(1);
            oTPersona= (TPersona) query.uniqueResult();
            tx.commit();
            
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return oTPersona;
    }
    


    public boolean insertPersona(TPersona oTPersona) {
        boolean rpta = false;
        try {
            startOperation();
            session.save(oTPersona);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }
    
    
        
 
     
     public boolean  actualizarPersona(TPersona oTPersona,Session session,Transaction tx) {
       boolean rpta = false;
         try {
             session.update(oTPersona);
             
             rpta = true;
         } catch (HibernateException e) {
            handleException(e);
        } 
         return rpta;
    
    }

    private void handleException(HibernateException e) throws DataAccessLayerException {
        HibernateFactory.rollback(tx);
        throw new DataAccessLayerException(e);
    }

    private void startOperation() throws HibernateException {
        session = HibernateFactory.openSession();
        tx = session.beginTransaction();
    }

    public static void main(String[] args) {
        PersonaDAO oPersonaDAO = new PersonaDAO();
        TPersona oTPersona = new TPersona();
        oTPersona.setDni("132456");
        oTPersona.setNombres("huasfdsafmm");
        oTPersona.setApppat("mm");
        oTPersona.setAppmat("mmm");
        oTPersona.setTelefono(null);
        oTPersona.setDireccion(null);
        oTPersona.setEmail(null);
        oTPersona.setEstado("1");
        oTPersona.setObservacion("dsfusbflblfbsdlbfl");
        oTPersona.setIdusuariocreac(1);
        oTPersona.setIdusuariomodif(1);
        oTPersona.setFechacreac(null);
        oTPersona.setFechamodif(null);
        oTPersona.setCodigo(null);

        boolean b = oPersonaDAO.insertPersona(oTPersona);
        System.out.println(b);
    }
}
