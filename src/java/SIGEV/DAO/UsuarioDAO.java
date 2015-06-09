package SIGEV.DAO;

import SIGEV.BE.*;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;

public class UsuarioDAO {

    private Session session;
    private Transaction tx;

    public UsuarioDAO() {
        HibernateFactory.buildIfNeeded();
    }

    /*
    CHAR
    22/04/15
    login Usuario     
    */
   
    public TUsuario loginUsuario(String pass, String nomb) throws DataAccessLayerException {
        
        List<TUsuario> listTUsuario;
        TUsuario oTUsuario = null;
        try {
            startOperation();
            Query query = session.createQuery("from TUsuario U where U.password ='" + pass + "' "
                    + "and U.nombreusuario = '" + nomb + "' ");          
            listTUsuario = query.list();
            if (listTUsuario.size() == 1) {
                oTUsuario = listTUsuario.get(0);
            }
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return oTUsuario;
    }
    
    
     public void create(TUsuario oTusuario, TPersona oTPersona) throws DataAccessLayerException {
        try {
            startOperation();
            session.save(oTPersona);
            oTusuario.setTPersona(oTPersona);
            session.save(oTusuario);
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
    }
     
     
        public boolean verificarUsuario(String nombreUsuario){
        boolean rpta = false;
           ArrayList<TUsuario> listTUsuario = null;
        try {
            startOperation(); 
            Query query = session.createQuery("from TUsuario TU where TU.nombreusuario='"+nombreUsuario+"'");
            listTUsuario = (ArrayList<TUsuario>) query.list();
            tx.commit();
            if(listTUsuario.size()>0){
                rpta=true;
            }
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }
        
     public boolean updateUsuario(TUsuario oTusuario, TPersona oTPersona) throws DataAccessLayerException {
        boolean rpta = false;
        try {
            startOperation();
            session.update(oTPersona);
            oTusuario.setTPersona(oTPersona);
            session.update(oTusuario);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }
    
     
        public boolean verificarActualizarUsuario(String nombreUsuario, int idUsuario){
        boolean rpta = false;
           ArrayList<TUsuario> listTUsuario = null;
        try {
            startOperation(); 
            Query query = session.createQuery("from TUsuario TU where TU.nombreusuario='"+nombreUsuario+"'");
            listTUsuario = (ArrayList<TUsuario>) query.list();
            tx.commit();
            if(listTUsuario.size()>0){
                rpta=true;
                for (TUsuario oTUsuario1 : listTUsuario) {
                    
                    if (oTUsuario1.getIdusuario()==idUsuario) {
                        rpta=false;
                    }
                }
                
            
            }
            
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }
     public ArrayList<TUsuario> ListarUsuario() throws DataAccessLayerException {
        ArrayList<TUsuario> listTUsuario = null;
        try {
            startOperation();
            Query query = session.createQuery("from TUsuario TU left join fetch TU.TRol left join fetch TU.TPersona where TU.estado='1'");
            listTUsuario = (ArrayList<TUsuario>) query.list();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return listTUsuario;

    }
     
    //24/04/2015 monica: cambiar d estado a usuario(btn eliminar)
     public boolean findUpdateUsuario(int id) throws DataAccessLayerException {
       TUsuario oTUsuario= new TUsuario();
        boolean rpta = false;
        try {
            startOperation();
            oTUsuario=(TUsuario)session.load(TUsuario.class, id);
            oTUsuario.setEstado("0");
            session.update(oTUsuario);
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
