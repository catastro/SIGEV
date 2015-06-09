/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.DAO;

import SIGEV.BE.TCompra;
import SIGEV.BE.TPersona;
import SIGEV.BE.TProveedor;
import SIGEV.BE.TContenedor;
import SIGEV.LIST.ProveedorL;
import com.google.common.base.Strings;
import java.util.ArrayList;
import java.util.Iterator;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author QUIQUE
 */
public class ProveedorDAO {

    private Session session;
    private Transaction tx;

    public ProveedorDAO() {
        HibernateFactory.buildIfNeeded();
    }

    //------------------ Registrar Proveedor QUIQUE 01-05-2015 -----------------------------------
    public String insertProveedorPersona(TPersona oTPersona, TProveedor oTProveedor) {
        String rpta = "";
        try {
            startOperation();
            int iniciadorCodigo = 27150000;
            Query query = session.createQuery("from TPersona m order by m.idpersona desc ");
            ArrayList<TPersona> listPersona = (ArrayList<TPersona>) query.list();
            if (listPersona.size() > 0) {
                oTPersona.setCodigo(String.valueOf(27150000 + listPersona.get(0).getIdpersona()));
            } else {
                oTPersona.setCodigo(String.valueOf(iniciadorCodigo));
            }
            session.save(oTPersona);
            oTProveedor.setTPersona(oTPersona);
            session.save(oTProveedor);
            tx.commit();
            rpta = String.valueOf(oTPersona.getCodigo());
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }

    //----------------------- Actualizar Proveedor QUIQUE 01-05-2015 ----------------------------------
    public boolean updateProveedor(TPersona oTPersona, TProveedor oTProveedor) throws DataAccessLayerException {
        boolean rpta = false;
        TPersona oTPerson = new TPersona();
        TProveedor oTProveed = new TProveedor();
        try {
            startOperation();
            oTPerson = (TPersona) session.load(TPersona.class, oTPersona.getIdpersona());
            oTPerson.setDni(oTPersona.getDni());
            oTPerson.setNombres(oTPersona.getNombres());
            oTPerson.setApppat(oTPersona.getApppat());
            oTPerson.setAppmat(oTPersona.getAppmat());
            oTPerson.setTelefono(oTPersona.getTelefono());
            oTPerson.setDireccion(oTPersona.getDireccion());
            oTPerson.setEmail(oTPersona.getEmail());
            oTPerson.setRuc(oTPersona.getRuc());
            oTPerson.setRazonsocial(oTPersona.getRazonsocial());
            oTPerson.setFechamodif(oTPersona.getFechamodif());
            oTPerson.setIdusuariomodif(oTPersona.getIdusuariomodif());
            session.update(oTPerson);

            oTProveed = (TProveedor) session.load(TProveedor.class, oTProveedor.getIdproveedor());
            oTProveed.setTPersona(oTPerson);
            oTProveed.setObservacion(oTProveedor.getObservacion());
            oTProveed.setFechamodif(oTProveedor.getFechamodif());
            oTProveed.setIdusuariomodif(oTProveedor.getIdusuariomodif());
            session.update(oTProveed);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            System.out.println("erorrrrrrr actualizar proveedor -------> " + e.toString());
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }

    //------------------------ Eliminar Proveedor QUIQUE 01-05-2015 ---------------------------------
    public boolean deleteProveedor(int idProveedor, int idPersona) {
        boolean rpta = false;
        TProveedor oTProveedor = new TProveedor();
        TPersona oTPersona = new TPersona();
        try {
            startOperation();
            oTProveedor = (TProveedor) session.load(TProveedor.class, idProveedor);
            session.delete(oTProveedor);
            oTPersona = (TPersona) session.load(TPersona.class, idPersona);
            session.delete(oTPersona);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }

    //------------------------ Cambiar Estados Proveedor QUIQUE 01-05-2015 ---------------------------------
    public boolean cambiarEstadoProveedor(int idProveedor, int idPersona, String estado) {
        boolean rpta = false;
        TProveedor oTProveedor = new TProveedor();
        TPersona oTPersona = new TPersona();
        try {
            startOperation();
            oTProveedor = (TProveedor) session.load(TProveedor.class, idProveedor);
            oTProveedor.setEstado(estado);
            session.update(oTProveedor);
            oTPersona = (TPersona) session.load(TPersona.class, idPersona);
            oTPersona.setEstado(estado);
            session.update(oTPersona);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }

    //-------------------------- Busqueda de Proveeedor en Compras Quique 06-05-2015 --------------------------
    public boolean buscarProveedorEnCompra(int idProveedor) {
        boolean rpta = false;
        TCompra oTCompra = new TCompra();
        try {
            startOperation();
            Query query = session.createQuery("from TCompra where IDPROVEEDOR=" + idProveedor);
            ArrayList<TCompra> listVenta = (ArrayList<TCompra>) query.list();
            if (listVenta.size() > 0) {
                rpta = true;
            } else {
                rpta = false;
            }
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }

    //---------------------------- Buscar Proveedor QUIQUE 01-05-2015 --------------------------------
    public ArrayList<ProveedorL> buscarProveedor(String codigo, String nombres, String apppat, String appmat, String razonsocial) {
        ArrayList<Object> listProveedor = null;
        ArrayList<ProveedorL> listProveedorFinal = null;
        try {
            startOperation();
            listProveedor = new ArrayList<Object>();
            listProveedorFinal = new ArrayList<ProveedorL>();

            Query query = session.createQuery(" "
                    + "select "
                    + "per.idpersona, "
                    + "per.dni, "
                    + "per.nombres, "
                    + "per.apppat, "
                    + "per.appmat, "
                    + "per.telefono, "
                    + "per.direccion, "
                    + "per.email, "
                    + "per.estado, "
                    + "per.ruc, "
                    + "per.razonsocial, "
                    //+ "per.observacion, "
                    + "per.codigo, "
                    + "provee.idproveedor, "
                    + "provee.idctipoproveedor, "
                    + "provee.observacion, "
                    + "case "
                    + "when provee.idctipoproveedor=1 "
                    + "then per.dni "
                    + "else per.ruc "
                    + "end as documento, "
                    + "case "
                    + "when provee.idctipoproveedor=1 "
                    + "then CONCAT(per.apppat,' ',per.appmat,' ',per.nombres) "
                    + "else per.razonsocial "
                    + "end as nombrRazon "
                    + "from TPersona per "
                    + "inner join per.TProveedors as provee "
                    + "where "
                    + "per.codigo like '" + (!Strings.isNullOrEmpty(codigo.trim()) ? codigo.trim() : "") + "%' "
                    + "and per.apppat like '%" + (!Strings.isNullOrEmpty(apppat.trim()) ? apppat.trim() : "") + "%' "
                    + "and per.appmat like '%" + (!Strings.isNullOrEmpty(appmat.trim()) ? appmat.trim() : "") + "%' "
                    + "and per.nombres like '%" + (!Strings.isNullOrEmpty(nombres.trim()) ? nombres.trim() : "") + "%' "
                    + "and per.razonsocial like '%" + (!Strings.isNullOrEmpty(razonsocial.trim()) ? razonsocial.trim() : "") + "%' "
                    + "and per.estado = '1' "
                    + "and provee.estado = '1'");

            listProveedor = (ArrayList<Object>) query.list();

            Iterator itrListProveedor = listProveedor.iterator();
            while (itrListProveedor.hasNext()) {
                Object[] objProveedor = (Object[]) itrListProveedor.next();
                ProveedorL oProveedorL = new ProveedorL();
                oProveedorL.setIdpersona((int) objProveedor[0]);
                oProveedorL.setDni((String) ReemplazarNulo(objProveedor[1]));
                oProveedorL.setNombres((String) ReemplazarNulo(objProveedor[2]));
                oProveedorL.setApppat((String) ReemplazarNulo(objProveedor[3]));
                oProveedorL.setAppmat((String) ReemplazarNulo(objProveedor[4]));
                oProveedorL.setTelefono((String) ReemplazarNulo(objProveedor[5]));
                oProveedorL.setDireccion((String) ReemplazarNulo(objProveedor[6]));
                oProveedorL.setEmail((String) ReemplazarNulo(objProveedor[7]));
                oProveedorL.setEstado((String) ReemplazarNulo(objProveedor[8]));
                oProveedorL.setRuc((String) ReemplazarNulo(objProveedor[9]));
                oProveedorL.setRazonsocial((String) ReemplazarNulo(objProveedor[10]));
                //oProveedorL.setObservacion(objProveedor[9].toString());
                oProveedorL.setCodigo((String) ReemplazarNulo(objProveedor[11]));
                oProveedorL.setIdproveedor((int) objProveedor[12]);
                oProveedorL.setIdctipoproveedor((int) objProveedor[13]);
                oProveedorL.setObservacionpro((String) ReemplazarNulo(objProveedor[14]));
                oProveedorL.setDocumento((String) ReemplazarNulo(objProveedor[15]));
                oProveedorL.setNombrRazon((String) ReemplazarNulo(objProveedor[16]));

                //Tipo de Proveedor
                TContenedor oTTablaMaestra = new TContenedor();
                oTTablaMaestra = (TContenedor) session.load(TContenedor.class, (int) objProveedor[13]);
                oProveedorL.setTipoproveedor(oTTablaMaestra.getDenominacion());

                listProveedorFinal.add(oProveedorL);
            }
        } catch (HibernateException e) {
            handleException(e);
        }
        return listProveedorFinal;
    }

    private Object ReemplazarNulo(Object oObject) {
        String letrita = null;
        if (oObject != null) {
            letrita = (String) oObject;
        } else {
            letrita = " ";
        }
        return letrita;
    }

    //------------------- Clasessssssssssssss QUIQUE 01-05-2015 ----------------------------------
    private void handleException(HibernateException e) throws DataAccessLayerException {
        HibernateFactory.rollback(tx);
        throw new DataAccessLayerException(e);
    }

    private void startOperation() throws HibernateException {
        session = HibernateFactory.openSession();
        tx = session.beginTransaction();
    }

    public static void main(String[] args) {
        ProveedorDAO oProveedorDAO = new ProveedorDAO();
        /*TPersona oTPersona = new TPersona();
         TProveedor oTProveedor = new TProveedor();
         oTPersona.setDni("132456");
         oTPersona.setNombres("humm");
         oTPersona.setApppat("mm");
         oTPersona.setAppmat("mmm");
         oTPersona.setTelefono(null);
         oTPersona.setDireccion(null);
         oTPersona.setEmail(null);
         oTPersona.setEstado("1");
         oTPersona.setObservacion("dsfusbflblfbsdlbfl");
         oTPersona.setIdusuariocreac(1);
         oTPersona.setIdusuariomodif(1);
         oTPersona.setFechacreac(null);
         oTPersona.setFechamodif(null);
         oTPersona.setCodigo(null);

         oTProveedor.setFechacreac(null);

         boolean b = oProveedorDAO.insertProveedorPersona(oTPersona, oTProveedor);*/

        //ArrayList<ProveedorL> b = oProveedorDAO.buscarProveedor("12", "12", "5", "5", "l");
//        boolean b = oProveedorDAO.cambiarEstadoProveedor(1, 1, "0");
        System.out.println(oProveedorDAO.buscarProveedorEnCompra(2));
    }
}
