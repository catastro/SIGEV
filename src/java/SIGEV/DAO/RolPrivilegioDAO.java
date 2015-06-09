/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.DAO;

import SIGEV.BE.TRolPrivilegio;
import SIGEV.LIST.RolPrivilegioL;
import java.util.ArrayList;
import java.util.Iterator;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 *
 * @author JHON
 */
public class RolPrivilegioDAO {
    
    private Session session;
    private Transaction tx;

    public RolPrivilegioDAO() {
        HibernateFactory.buildIfNeeded();
    }
    
    /*
    public ArrayList<Object> listPrivilegios(int idMenu, int idRol) throws DataAccessLayerException {
        ArrayList<Object> listRolPrivilegio = new ArrayList<>();
        try{
            startOperation();
            Query query = session.createQuery("select TP.idprivilegio from TPrivilegio TP where TP.idmenu = "
                                                + idMenu + " and TP.estado= '1'");
            ArrayList<Object> listPrivilegio = (ArrayList<Object>) query.list();
            
            for (Object oPrivilegio : listPrivilegio) {
                   int idprivilegio = (int)oPrivilegio;
                    Query query1 = session.createQuery(
                  " select new RolPrivilegioL(TRP.TPrivilegio.denominacion as denominacion, TRP.TPrivilegio.imagen as imagen,TRP.TPrivilegio.idprivilegioboton as idprivilegioboton) "+                          
                  " from TRolPrivilegio TRP "+ 
                  " where TRP.TPrivilegio.idprivilegio = " + idprivilegio+
                  " and TRP.TRol.idrol = " + idRol + 
                  " and TRP.estado = '1' ");
                    query1.setMaxResults(1);
                    RolPrivilegioL oRolPrivilegioL = (RolPrivilegioL)query1.uniqueResult();
                    System.out.println(oRolPrivilegioL);
                    //Object ob = (Object)query1.uniqueResult();                    
                    //listRolPrivilegio.add(ob);
            }
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listRolPrivilegio;
    }
    */
    
/*char*/    
    public ArrayList<Object> listPrivilegios(int idMenu, int idRol) throws DataAccessLayerException {
        ArrayList<Object> listRolPrivilegio = new ArrayList<>();
        try{
            startOperation();
            Query query = session.createQuery("select TP.idprivilegio from TPrivilegio TP where TP.idmenu = "
                                                + idMenu + " and TP.estado= '1'");
            ArrayList<Object> listPrivilegio = (ArrayList<Object>) query.list();
            
            for (Object oPrivilegio : listPrivilegio) {
                   int idprivilegio = (int)oPrivilegio;
                    Query query1 = session.createQuery(
                  " select TRP.TPrivilegio.denominacion, TRP.TPrivilegio.imagen, TRP.TPrivilegio.idprivilegioboton "+ 
                  " from TRolPrivilegio TRP "+ 
                  " where TRP.TPrivilegio.idprivilegio = " + idprivilegio+
                  " and TRP.TRol.idrol = " + idRol + 
                  " and TRP.estado = '1' ");
                    query1.setMaxResults(1);
                    Object ob = (Object)query1.uniqueResult();                    
                    listRolPrivilegio.add(ob);
            }
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listRolPrivilegio;
    }    
   
    public static void main(String[] args) {
        RolPrivilegioDAO oRolPrivilegioDAO = new RolPrivilegioDAO();
        System.out.println(oRolPrivilegioDAO.listPrivilegios(19, 1));

    }

    private void handleException(HibernateException e) throws DataAccessLayerException {
        HibernateFactory.rollback(tx);
        throw new DataAccessLayerException(e);
    }

    private void startOperation() throws HibernateException {
        session = HibernateFactory.openSession();
        tx = session.beginTransaction();
    }

   
    
}
