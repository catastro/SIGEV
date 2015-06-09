/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.DAO;

import SIGEV.BE.TCaja;
import SIGEV.BE.TCajaDetalle;
import java.text.ParseException;
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
public class CajaDetalleDAO {

    private Session session;
    private Transaction tx;

    public CajaDetalleDAO() {
        HibernateFactory.buildIfNeeded();
    }

    public boolean CrearCajaDetalle(ArrayList<TCajaDetalle> listCajaDetalle, Date fechaArqueo, double sumatotal) throws DataAccessLayerException {
        boolean rpta = false;
        try {
            startOperation();
            TCaja oTcaja = new TCaja();
            oTcaja.setFechaarqueo(fechaArqueo);
            oTcaja.setMonto(sumatotal);
            oTcaja.setEstado("1");
            session.save(oTcaja);
            for (TCajaDetalle oTCajaDetalle : listCajaDetalle) {
                oTCajaDetalle.setEstado("1");
                oTCajaDetalle.setTCaja(oTcaja);
                session.save(oTCajaDetalle);
            }
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }

        return rpta;
    }

    // Monica: listar arqueos de caja para Actualizar  01/05/2015
    public ArrayList<TCajaDetalle> ListarParaActualizarCaja(int idCaja) throws DataAccessLayerException, ParseException {

        ArrayList<TCajaDetalle> listTCajaDetalle = new ArrayList<>();
        try {
            startOperation();
            Query query = session.createQuery("from TCajaDetalle TCD left join fetch TCD.TCaja TC "
                    + "where TCD.estado='1' and TC.idcaja = " + idCaja);
            listTCajaDetalle = (ArrayList<TCajaDetalle>) query.list();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }

        return listTCajaDetalle;
    }
    
    // Monica: Actualizar CajaDetalle  04/05/2015
    public boolean ActualizarCajaDetalle(ArrayList<TCajaDetalle> listCajaDetalle, double sumatotal, int idCaja) throws DataAccessLayerException {
        boolean rpta = false;
        try {
            startOperation();
            TCaja oTcaja ;
            oTcaja= (TCaja)session.load(TCaja.class, idCaja);
            oTcaja.setMonto(sumatotal);
            session.update(oTcaja);
            
            /*
            String hqlUpdateCaja = "update  TCaja TC set TC.monto = :newMonto "
                    + " where TC.idcaja = :cajaId ";

            int update = session.createQuery(hqlUpdateCaja)
                    .setDouble("newMonto", sumatotal)
                    .setInteger("cajaId", oTcaja.getIdcaja())
                    .executeUpdate();*/

            for (TCajaDetalle oTCajaDetalle : listCajaDetalle) {
                
                oTCajaDetalle.setTCaja(oTcaja);
                oTCajaDetalle.setEstado("1");
                session.saveOrUpdate(oTCajaDetalle);
            }
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }

        return rpta;
    }

      //Monica: cambiar d estado cajaDetalle 05/05/2015
     public boolean EliminarCajaDetalle(int idcajadetalle) throws DataAccessLayerException {
        TCajaDetalle oCajaDetalle;
        boolean rpta = false;
        try {
            startOperation();
            oCajaDetalle=(TCajaDetalle)session.load(TCajaDetalle.class, idcajadetalle);
            oCajaDetalle.setEstado("0");
            session.update(oCajaDetalle);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
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

    public static void main(String[] args) throws DataAccessLayerException, ParseException {
        CajaDetalleDAO oCajaDetalleDAO = new CajaDetalleDAO();

        System.out.println(oCajaDetalleDAO.ListarParaActualizarCaja(5).get(1).getDenominacion());
        System.out.println(oCajaDetalleDAO.EliminarCajaDetalle(20));
    }
}
