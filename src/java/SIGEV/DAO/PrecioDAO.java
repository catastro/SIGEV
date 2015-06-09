package SIGEV.DAO;

import SIGEV.BE.*;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;

public class PrecioDAO {

    private Session session;
    private Transaction tx;

    public PrecioDAO() {
        HibernateFactory.buildIfNeeded();
    }

    /*
    CHAR
    11/05/15
    listar persona combo
    */
    public ArrayList<Object> listarPrecios(int idProducto) throws DataAccessLayerException {
        
        ArrayList<Object> listPrecios = new ArrayList<>();
        try {
            startOperation();
            Query query = session.createQuery("select TP.precio,concat(TP.precio,' - ',TP.observacion) "
                                                + "from TPrecio TP left join TP.TProducto TPr where TPr.idproducto = " + idProducto
                                                + " and TP.estado ='1'");          
            listPrecios = (ArrayList<Object>) query.list();            
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listPrecios;
    }

    
    public static void main(String[] args) {        
        PrecioDAO oPrecioDAO = new PrecioDAO();
        System.out.println(oPrecioDAO.listarPrecios(1));
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
