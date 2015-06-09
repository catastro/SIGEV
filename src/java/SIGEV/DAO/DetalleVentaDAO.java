/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.DAO;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import SIGEV.BE.*;
import java.util.ArrayList;
import java.util.Date;
import org.hibernate.Query;

/**
 *
 * @author JHON
 */
public class DetalleVentaDAO {
    
    private Session session;
    private Transaction tx;

    public DetalleVentaDAO() {
        HibernateFactory.buildIfNeeded();
    }
    
     public int insertOrUpdateDetalleVenta(TVenta oTVenta, ArrayList<TDetalleVenta> listTDetalleVentas)throws DataAccessLayerException{
        int idRetorno = 0;
        try {
            startOperation();
            oTVenta.setEstado("1");
            oTVenta.setFechacreac(new Date());
            session.saveOrUpdate(oTVenta);
            TFrecuencia oTFrecuencia = new TFrecuencia();
            oTFrecuencia.setEstado("1");
            oTFrecuencia.setTVenta(oTVenta);
            oTFrecuencia.setFechapedido(new Date());
            session.saveOrUpdate(oTFrecuencia);
            
            for (TDetalleVenta oTDetalleVenta : listTDetalleVentas) {                
                oTDetalleVenta.setTVenta(oTVenta);
                oTDetalleVenta.setEstado("1");
                oTDetalleVenta.setFechacreac(new Date());
                session.saveOrUpdate(oTDetalleVenta);
                
                Query query = session.createQuery( "select TP.stock from TProducto TP where TP.idproducto="  + oTDetalleVenta.getTProducto().getIdproducto());                
                query.setMaxResults(1);
                int oldStock= (int) query.uniqueResult();
                
                String hqlUpdateProductoStock = "update  TProducto TP  set TP.stock = :newStock "                                            
                                            + " where TP.idproducto= :idProducto ";
                                            
                session.createQuery(hqlUpdateProductoStock)
                    .setInteger("newStock",(oldStock - oTDetalleVenta.getCantidadventa()))
                    .setInteger("idProducto",oTDetalleVenta.getTProducto().getIdproducto())
                    .executeUpdate();                
            }
            tx.commit();
            idRetorno = oTVenta.getIdventa();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return idRetorno;
    }
    
     
    public static void main(String[] args) {
        DetalleVentaDAO oDetalleVentaDAO = new DetalleVentaDAO();
        TDetalleVenta oTDetalleVenta = new TDetalleVenta();
        TProducto oTProducto = new TProducto();
        TVenta oTVenta = new TVenta();
        
        oTVenta.setMonto(23.00);
        
        oTDetalleVenta.setTVenta(oTVenta);
        oTProducto.setIdproducto(1);
        oTDetalleVenta.setTProducto(oTProducto);
        
        //System.out.println(oDetalleVentaDAO.insertOrUpdateDetalleVenta(oTDetalleVenta));
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
