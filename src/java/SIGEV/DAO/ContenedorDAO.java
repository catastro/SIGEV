/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.DAO;

import SIGEV.BE.*;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author davis
 */
public class ContenedorDAO {
     private Session session;
    private Transaction tx;
    
    public  ContenedorDAO(){
         HibernateFactory.buildIfNeeded();
    }
    /*tegus*/
    public ArrayList<TContenedor> listarCombos(String idTabla) throws DataAccessLayerException{
        ArrayList<TContenedor> lstCombos= new ArrayList<>() ;
        
        try {
            startOperation();
            Query query = session.createQuery("from TContenedor c "
             + "where c.idtabla=" + idTabla
//            +Opciones.contenedor.colegio.getOP()
            //+idTabla
            +"and c.iditem <>"+0
            +"and c.estado='1'"
            );
            lstCombos =  (ArrayList<TContenedor>)query.list();
            //tx.commit();
            
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return lstCombos;
    }
    public TContenedor BuscarContenedor(int id) throws DataAccessLayerException {
        TContenedor oTContenedor = null;
        try {
            startOperation();
            oTContenedor = (TContenedor) session.load(TContenedor.class, id);
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return oTContenedor;
    }
    
    /*char*/
    public ArrayList<TContenedor> listarContenedorTablas(String denominacion) throws DataAccessLayerException{
        ArrayList<TContenedor> lstCombos= new ArrayList<>() ;
        
        try {
             
            startOperation();
            Query query = session.createQuery("from TContenedor TC "
             + "where upper(TC.denomi"
                    + "nacion) like '%" + denominacion.toUpperCase() + "%'"
            +" and TC.iditem ="+0
            +" and TC.estado='1'"
            );
            lstCombos =  (ArrayList<TContenedor>)query.list();
            tx.commit();
            
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return lstCombos;
    }
    /*char*/
    public ArrayList<TContenedor> listarContenedorSubTablas(int idTabla) throws DataAccessLayerException{
        ArrayList<TContenedor> lstCombos= new ArrayList<>() ;
        
        try {
            startOperation();
            Query query = session.createQuery("from TContenedor TC "
             + "where TC.idtabla =" + idTabla 
            +" and TC.iditem <>"+0 + " order by TC.orden ASC"
            //+" and TC.estado='1'"
            );
            lstCombos =  (ArrayList<TContenedor>)query.list();
            tx.commit();
            
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return lstCombos;
    }
    /*char*/
    public boolean insertOrUpdateContenedor(TContenedor oTContenedor)throws DataAccessLayerException{
        boolean rpta = false;
        try {
            startOperation();
            session.saveOrUpdate(oTContenedor);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }
    
    
 public static void main(String[] args) {
        ArrayList<TContenedor> lstCombos= new ArrayList<>() ;
        lstCombos=new ContenedorDAO().listarCombos("1");
        
        for (TContenedor lstCombo : lstCombos) {
            System.out.println("nomre: "+lstCombo.getDenominacion());
        }
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
