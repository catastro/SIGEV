/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.DAO;

import SIGEV.BE.TPago;
import SIGEV.LIST.PagoList;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author davis
 */
public class PagoDAO {

    private Session session;
    private Transaction tx;

    public PagoDAO() {
        HibernateFactory.buildIfNeeded();
    }

    private void handleException(HibernateException e) throws DataAccessLayerException {
        HibernateFactory.rollback(tx);
        throw new DataAccessLayerException(e);
    }

    private void startOperation() throws HibernateException {
        session = HibernateFactory.openSession();
        tx = session.beginTransaction();
    }

    public boolean registrarPago(TPago oTPago) throws DataAccessLayerException {
        boolean rpta = false;
        try {
            startOperation();
            session.save(oTPago);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
            throw e;
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }

    public ArrayList<PagoList> buscarPago(int idPersonal) throws DataAccessLayerException {
        ArrayList<Object> lstPago = null;
        ArrayList<PagoList> lstPagosFinal=new ArrayList<>();
        
        try {
            startOperation();
            Query query = null;
            query = session.createQuery("select p.idpago, p.fechafin, p.fechainicio,"
                    + " p.monto, p.horasextra, p.descuento, p.aumento,"
                    + " p.minutostardanza, p.montototal"
                    + " from TPago p  inner join  p.TPersonal per"
                    + " where "
                    + " per.idpersonal = " + idPersonal
                    + " and p.estado = '1' "
                    + " order by   p.idpago desc"
            );

            lstPago = (ArrayList<Object>) query.setMaxResults(4).list();
            
            Iterator itrListPersonal = lstPago.iterator();
            
            while (itrListPersonal.hasNext()) {
                Object[] objPersonal = (Object[]) itrListPersonal.next();
                PagoList oPagoList= new PagoList();
                
                DateFormat date = new SimpleDateFormat("dd/MM/yyyy");
                
		oPagoList.setIdpago(objPersonal[0] != null ? Integer.parseInt(objPersonal[0].toString()) : 0);
                oPagoList.setFechapagofin((date.format(objPersonal[1] != null ? objPersonal[1].toString() : "")));
                oPagoList.setFechapagoinicio((date.format(objPersonal[2] != null ? objPersonal[2].toString() : "")));
                oPagoList.setMonto(objPersonal[3] != null ? Double.parseDouble(objPersonal[3].toString()) : 0);
                oPagoList.setMinutostardanza(objPersonal[4] != null ? Integer.parseInt(objPersonal[4].toString()) : 0);
                oPagoList.setHorasextra(objPersonal[5] != null ? Integer.parseInt(objPersonal[5].toString()) : 0);
                oPagoList.setDescuento(objPersonal[6] != null ? Double.parseDouble(objPersonal[6].toString()) : 0);
                oPagoList.setAumento(objPersonal[7] != null ? Double.parseDouble(objPersonal[7].toString()) : 0);
                oPagoList.setMontototal(objPersonal[8] != null ? Double.parseDouble(objPersonal[8].toString()) : 0);
                oPagoList.setFechacreacion((date.format(objPersonal[9] != null ? objPersonal[9].toString() : "")));
                oPagoList.setEstado(objPersonal[10] != null ? objPersonal[10].toString() : "");
                
                lstPagosFinal.add(oPagoList);
            }
            
        } catch (HibernateException e) {
            handleException(e);
            System.out.println("error en dao "+e.getMessage());
        } finally {
            HibernateFactory.close(session);
        }
        return lstPagosFinal;

    }

    public boolean actualizarPago(TPago oTPago) throws DataAccessLayerException {
        boolean rpta = false;
        try {
            startOperation();
            String hqlUpdatePago = "update  TPago p  set "
                    + " p.monto = '" + oTPago.getMonto() + "'"
                    + " ,p.minutostardanza = '" + oTPago.getMinutostardanza() + "'"
                    + " ,p.horasextra = '" + oTPago.getHorasextra() + "'"
                    + " ,p.descuento = '" + oTPago.getDescuento() + "'"
                    + " ,p.aumento = '" + oTPago.getAumento() + "'"
                    + " ,p.montototal = '" + oTPago.getMontototal() + "'"
                    + " ,p.fechapagoinicio = '" + oTPago.getFechainicio()+ "'"
                    + " ,p.fechapagofin = '" + oTPago.getFechafin()+ "'"
                    + " ,p.fechamodificacion = '" + oTPago.getFechamodif()+ "'"
                    + " where p.idpago =  '" + oTPago.getIdpago() + "'";

            session.createQuery(hqlUpdatePago).executeUpdate();
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
            throw e;
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }

    public boolean eliminarPago(int idPago) throws DataAccessLayerException {
        boolean rpta = false;
        try {
            startOperation();
            String hqlUpdatePago = "update  TPago p  set "
                    + " p.estado = '0'"
                    + " where p.idpago =  '" + idPago + "'";

            session.createQuery(hqlUpdatePago).executeUpdate();
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
            throw e;
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }
    public static void main(String[] args) {
        
    }

}
