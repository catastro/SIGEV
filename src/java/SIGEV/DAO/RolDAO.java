package SIGEV.DAO;


import SIGEV.BE.TRol;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author WINDOWS 8
 */
public class RolDAO {
    
    private Session session;
    private Transaction tx;
    
    public RolDAO(){
        HibernateFactory.buildIfNeeded();
    }
    
     public ArrayList<TRol> mostrarRol() throws DataAccessLayerException {
        ArrayList<TRol> listTRol=null;
        try {
            startOperation();
            Query query= session.createQuery("from TRol TR where TR.estado = " + "'1'");
            listTRol=(ArrayList<TRol>)query.list();
        } catch (HibernateException e) {
            handleException(e);
        }
        finally {
            //HibernateFactory.close(session);
        }
        
        return listTRol;
        
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
        RolDAO oRolDAO= new RolDAO();
        System.out.println(oRolDAO.mostrarRol());
         System.out.println(oRolDAO.mostrarRol().get(0).getNombrerol());
    }
    

}
