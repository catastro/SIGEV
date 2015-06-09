
package SIGEV.DAO;

import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ProductoDAO {
    
    private Session session;
    private Transaction tx;

    public ProductoDAO() {
        HibernateFactory.buildIfNeeded();
    }
    
    /*char producto por codigo*/
    public ArrayList<Object> buscarProductoXCodigo(String codigo) throws DataAccessLayerException{
              ArrayList<Object> listProducto=new ArrayList<>();
        try {
            startOperation();
            Query query = session.createQuery("select TP.idproducto,TP.codigo,TP.nombreproducto,TP.stock,TP.observacion "
                                            + "from TProducto TP where TP.estado ='1' and TP.codigo = '" + codigo + "'");
            listProducto = (ArrayList<Object>) query.list(); 
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listProducto;
    }
    
    
    /*char producto por denominacion */
    public ArrayList<Object> buscarProductoXDenominacion(String denominacion) throws DataAccessLayerException{
              ArrayList<Object> listProducto=new ArrayList<>();
        try {
            startOperation();
            Query query = session.createQuery("select TP.idproducto,TP.codigo,TP.nombreproducto,TP.stock,TP.observacion "
                                            + "from TProducto TP where TP.estado ='1' and TP.nombreproducto like '%" + denominacion + "%'");
            listProducto = (ArrayList<Object>) query.list(); 
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listProducto;
    }
    
    
     
    public static void main(String[] args) {
        ProductoDAO oProductoDAO = new ProductoDAO();
        //System.out.println(oProductoDAO.buscarProducto("123"));
       
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
