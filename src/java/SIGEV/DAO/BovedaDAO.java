/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.DAO;

import SIGEV.BE.TBoveda;
import SIGEV.BE.TCaja;
import java.text.ParseException;
import java.util.*;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author WINDOWS 8
 */
public class BovedaDAO {
    private Session session;
    private Transaction tx;
    
    
    public BovedaDAO() {
        HibernateFactory.buildIfNeeded();
    }
    
    public  Date Recuperarid(int id)throws DataAccessLayerException{
        Date rpta = new Date();
        try {
            startOperation();
                
                TBoveda oTBovedaRescate=(TBoveda)session.load(TBoveda.class,id );
                
            tx.commit();
            rpta = oTBovedaRescate.getFechacreac();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }
    
    // Mónica (10/05/2015):  método para crear o actualizar TBoveda
     public boolean CrearOactualizarBoveda(TBoveda oTBoveda)throws DataAccessLayerException{
        boolean rpta = false;
        try {
            startOperation();                        
            session.saveOrUpdate(oTBoveda);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }
    
    // Mónica: Buscar registros de bóveda(salidas) filtrado por rando d fechas
    public ArrayList<TBoveda> buscarBoveda(String fechaA,String fechaB) throws DataAccessLayerException, ParseException{
              ArrayList<TBoveda> listTBoveda=new ArrayList<>();
        try {
            startOperation();
            Query query = session.createQuery("from TBoveda TB "
                    + "where TB.estado='1' and (TB.fechacreac between '"+fechaA+"' and '"+fechaB+"')");
            listTBoveda = (ArrayList<TBoveda>) query.list();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listTBoveda;
    }

     //Monica: cambiar d estado boveda 11/05/2015
     public boolean EliminarBoveda(int idboveda) throws DataAccessLayerException {
        TBoveda oTBoveda;
        boolean rpta = false;
        try {
            startOperation();
            oTBoveda=(TBoveda)session.load(TBoveda.class, idboveda);
            oTBoveda.setEstado("0");
            session.update(oTBoveda);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    } 
    
     //Monica: sumar salidas 12/05/2015
     public double SumarSalida() throws DataAccessLayerException, ParseException {

        ArrayList<TBoveda> listTBoveda;
        double SumaSalida=0;
        try {
            startOperation();
            
            Query query = session.createQuery("from TBoveda TB "
                    + "where TB.estado='1' ");
            listTBoveda = (ArrayList<TBoveda>) query.list();
            
            for (int i = 0; i < listTBoveda.size(); i++) {
                SumaSalida=SumaSalida+listTBoveda.get(i).getMonto();
            }
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        
        return SumaSalida;
     } 
     
    private void handleException(HibernateException e) throws DataAccessLayerException {
        HibernateFactory.rollback(tx);
        throw new DataAccessLayerException(e);
    }

    private void startOperation() throws HibernateException {
        session = HibernateFactory.openSession();
        tx = session.beginTransaction();
    }
    
    public static void main(String[] args) throws DataAccessLayerException, ParseException {
        BovedaDAO oBovedaDAO= new BovedaDAO();
        
//        ArrayList<TBoveda> listTBoveda=oBovedaDAO.buscarBoveda("2015/04/24", "2015/04/28");
//        for (int i = 0; i <listTBoveda.size() ; i++) {
//            System.out.println(listTBoveda.get(i).getFechacreac());
//        }
//        TBoveda oTBoveda=new TBoveda(0, 6000.00, null, null, Integer.MIN_VALUE, Integer.MIN_VALUE, null, null, null, Integer.MIN_VALUE, Integer.MIN_VALUE, null);
//        
//        System.out.println(oBovedaDAO.CrearOactualizarBoveda(oTBoveda));
        
        System.out.println(oBovedaDAO.SumarSalida());
    }
}
