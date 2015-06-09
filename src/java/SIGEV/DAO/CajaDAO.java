/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.DAO;

import SIGEV.BE.TCaja;
import SIGEV.BE.TCajaDetalle;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author WINDOWS 8
 */
public class CajaDAO {

    private Session session;
    private Transaction tx;

    public CajaDAO() {
        HibernateFactory.buildIfNeeded();
    }

    public ArrayList<TCaja> buscarCaja(String fechaB) throws DataAccessLayerException, ParseException {

        ArrayList<TCaja> listTCaja = new ArrayList<>();
        try {
            startOperation();
            //System.out.println("fechaB "+fechaB);
            Query query = session.createQuery("from TCaja TC "
                    + "where TC.estado='1' and TC.fechaarqueo = '" + fechaB + "'");
            listTCaja = (ArrayList<TCaja>) query.list();
            // System.out.println("fechaARqueo"+listTCaja.get(0).getFechaarqueo());
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        //where TC.fechaarqueo = '"+fechaB+"'
        return listTCaja;
    }

      //Monica: sumar cajas 12/05/2015
   public double SumarCaja() throws DataAccessLayerException, ParseException {

        ArrayList<TCaja> listTCaja;
        double SumaCaja=0;
        try {
            startOperation();
            
            Query query = session.createQuery("from TCaja TC "
                    + "where TC.estado='1' ");
            listTCaja = (ArrayList<TCaja>) query.list();
            // System.out.println("fechaARqueo"+listTCaja.get(0).getFechaarqueo());
            for (int i = 0; i < listTCaja.size(); i++) {
                SumaCaja=SumaCaja+listTCaja.get(i).getMonto();
            }
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        
        return SumaCaja;
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

        CajaDAO oCajaDAO = new CajaDAO();

//        Date d = new java.sql.Date(2015, 04, 8);
//        System.out.println(oCajaDAO.buscarCaja("2015/04/08").get(2).getMonto());
        System.out.println(oCajaDAO.SumarCaja());

    }
}
