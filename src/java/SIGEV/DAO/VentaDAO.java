package SIGEV.DAO;

import SIGEV.BE.*;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;

public class VentaDAO {

    private Session session;
    private Transaction tx;

    public VentaDAO() {
        HibernateFactory.buildIfNeeded();
    }
    /*char*/
    public ArrayList<TVenta> listarVentarXfecha(String fecha, String estado ) throws DataAccessLayerException{
        ArrayList<TVenta> listVentas= new ArrayList<>() ;
        
        try {
             
            startOperation();
            Query query = session.createQuery("from TVenta TV left join fetch TV.TCliente TC left join fetch TC.TPersona TP where TV.fechacreac = '" + fecha + "'"  +
                                              " and TV.idcventa = " + estado + 
                                              " and TV.estado = '1'" );
            listVentas =  (ArrayList<TVenta>)query.list();
            tx.commit();
            
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listVentas;
    }

    /*char*/
    public ArrayList<TVenta> listarVentarXComprobante(String numComprobante ) throws DataAccessLayerException{
        ArrayList<TVenta> listVentas= new ArrayList<>() ;
        
        try {
             
            startOperation();
            Query query = session.createQuery("from TVenta TV left join fetch TV.TCliente TC left join fetch TC.TPersona TP where TV.numcomprovante = '" + numComprobante + "'"  +                                              
                                              " and TV.estado = '1'" );
            listVentas =  (ArrayList<TVenta>)query.list();
            tx.commit();
            
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listVentas;
    }

    /*char*/
    public ArrayList<TVenta> listarVentarXPersonal(String fechaDe, String fechaHasta, String personal) throws DataAccessLayerException{
        ArrayList<TVenta> listVentas= new ArrayList<>() ;
        
        try {
             
            startOperation();
            Query query = session.createQuery("from TVenta TV left join fetch TV.TCliente TC left join fetch TC.TPersona TP where TV.idpersonal =" + personal +
                                              " and TV.fechacreac between '" + fechaDe + "' and '" + fechaHasta + "'" +
                                              " and TV.estado = '1'" );
            listVentas =  (ArrayList<TVenta>)query.list();
            tx.commit();
            
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listVentas;
    }
    
    /*char*/
    public ArrayList<TVenta> listarVentarXCliente(String fechaDe, String fechaHasta, String cliente) throws DataAccessLayerException{
        ArrayList<TVenta> listVentas= new ArrayList<>() ;
        
        try {
             
            startOperation();
            Query query = session.createQuery("from TVenta TV left join fetch TV.TCliente TC left join fetch TC.TPersona TP where " +
                                              "concat(TP.apppat, TP.appmat, TP.nombres) like '%" +cliente + "%'"
                                              + " and TV.fechacreac between '" + fechaDe + "' and '" + fechaHasta + "'" +
                                              " and TV.estado = '1'" );
            listVentas =  (ArrayList<TVenta>)query.list();
            tx.commit();
            
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listVentas;
    }
    
    
    
   
    
    
    public static void main(String[] args) {
        VentaDAO oVentaDAO = new VentaDAO();
        //System.out.println(oVentaDAO.listarVentar("05/06/2015"));
        //System.out.println(oVentaDAO.listarVentarXfecha("2015/05/06","1"));
        //System.out.println(oVentaDAO.listarVentarXComprobante("123"));
        //System.out.println(oVentaDAO.listarVentarXPersonal("2015/05/06","2015/05/06","1"));
        //System.out.println(oVentaDAO.listarVentarXCliente("2015/05/06","2015/05/06","mendozaprado"));
        
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
