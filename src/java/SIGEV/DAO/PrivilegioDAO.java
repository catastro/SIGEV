
package SIGEV.DAO;

import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class PrivilegioDAO {
    
    private Session session;
    private Transaction tx;

    public PrivilegioDAO() {
        HibernateFactory.buildIfNeeded();
    }
    
    /*char*/
    public ArrayList<Object> listPrivilegios(int idMenu) throws DataAccessLayerException {
        ArrayList<Object> listPrivilegio = new ArrayList<>();
        try{
            startOperation();
            Query query = session.createQuery("select TP.idprivilegio from TPrivilegio TP where TP.idmenu = "
                                                + idMenu + "and TP.estado= '1'");
            listPrivilegio = (ArrayList<Object>) query.list();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listPrivilegio;
    }
     
    public static void main(String[] args) {
        PrivilegioDAO oPrivilegioDAO = new PrivilegioDAO();
        System.out.println(oPrivilegioDAO.listPrivilegios(19));
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
