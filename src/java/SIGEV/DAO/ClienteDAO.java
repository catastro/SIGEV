/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.DAO;

import SIGEV.BE.*;
import SIGEV.LIST.ClienteL;
import com.google.common.base.Strings;
import java.util.ArrayList;
import java.util.Iterator;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class ClienteDAO {
     private Session session;
    private Transaction tx;
    
    public  ClienteDAO(){
         HibernateFactory.buildIfNeeded();
    }
    
    public ArrayList<Object> listarClienteModal(String codigo,String cliente) throws DataAccessLayerException {
        
        
        
        /*char*/
        ArrayList<Object> listClientes = new ArrayList<>();
        try {
            startOperation();
            Query query = session.createQuery("select TC.idcliente,TP.codigo,concat(TP.apppat,' ',TP.appmat,' ',TP.nombres),TP.direccion "
                                            + "from TCliente TC left join TC.TPersona TP where "
                                            + "concat(TP.apppat, TP.appmat, TP.nombres) like '%" +cliente + "%'"
                                            //+ " or TP.codigo = " + codigo   
                                            + " and TC.estado = '1'" );          
            listClientes = (ArrayList<Object>) query.list();            
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listClientes;
    }
    
        //------------------------- Registrar Cliente  QUIQUE 01-05-2015 ------------------------------
    public String insertClientePersona(TPersona oTPersona, TCliente oTCliente) throws DataAccessLayerException {
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
            oTCliente.setTPersona(oTPersona);
            session.save(oTCliente);
            tx.commit();
            rpta = String.valueOf(oTPersona.getCodigo());
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }

    //----------------------- Actualizar Clientes QUIQUE 01-05-2015 ----------------------------------
    public boolean updateCliente(TPersona oTPersona, TCliente oTCliente) throws DataAccessLayerException {
        boolean rpta = false;
        TPersona oTPerson = new TPersona();
        TCliente oTClient = new TCliente();
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

            oTClient = (TCliente) session.load(TCliente.class, oTCliente.getIdcliente());
            oTClient.setTPersona(oTPerson);
            oTClient.setIdctipocliente(oTCliente.getIdctipocliente());
            oTClient.setIdctiponegocio(oTCliente.getIdctiponegocio());
            oTClient.setIdcfecuenciavisita(oTCliente.getIdcfecuenciavisita());
            oTClient.setIdcruta(oTCliente.getIdcruta());
            oTClient.setObservacion(oTCliente.getObservacion());
            oTClient.setFechamodif(oTCliente.getFechamodif());
            oTClient.setIdusuariomodif(oTCliente.getIdusuariomodif());
            session.update(oTClient);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            System.out.println("erorrrrrrr actualizar Cliente -------> " + e.toString());
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }

    //------------------------ Eliminar Cliente QUIQUE 01-05-2015 ---------------------------------
    public boolean deleteCliente(int idCliente, int idPersona) {
        boolean rpta = false;
        TCliente oTCliente = new TCliente();
        TPersona oTPersona = new TPersona();
        try {
            startOperation();
            oTCliente = (TCliente) session.load(TCliente.class, idCliente);
            session.delete(oTCliente);
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

    //------------------------ Cambiar Estados Cliente QUIQUE 01-05-2015 ---------------------------------
    public boolean cambiarEstadoCliente(int idCliente, int idPersona, String estado) {
        boolean rpta = false;
        TCliente oTCliente = new TCliente();
        TPersona oTPersona = new TPersona();
        try {
            startOperation();
            oTCliente = (TCliente) session.load(TCliente.class, idCliente);
            oTCliente.setEstado(estado);
            session.update(oTCliente);
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

    //-------------------------- Busqueda de Cliente en Ventas Quique 06-05-2015 --------------------------
    public boolean buscarClientesEnVentas(int idCliente) {
        boolean rpta = false;
        TVenta oTVenta = new TVenta();
        try {
            startOperation();
            Query query = session.createQuery("from TVenta where IDCLIENTE=" + idCliente);
            ArrayList<TVenta> listVenta = (ArrayList<TVenta>) query.list();
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

    //---------------------------- Listar CLientes QUIQUE 01-05-2015 --------------------------------
    public ArrayList<ClienteL> buscarCliente(String codigo, String nombres, String apppat, String appmat, String razonsocial) {
        ArrayList<Object> listCliente = null;
        ArrayList<ClienteL> listClienteFinal = null;
        try {
            startOperation();
            listCliente = new ArrayList<Object>();
            listClienteFinal = new ArrayList<ClienteL>();

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
                    + "per.codigo, "
                    + "client.idcliente, "
                    + "client.idctipocliente, "
                    + "client.idcruta, "
                    + "client.idcfecuenciavisita, "
                    + "client.idctiponegocio, "
                    + "case "
                    + "when client.idctipocliente=1 "
                    + "then per.dni "
                    + "else per.ruc "
                    + "end as documento, "
                    + "case "
                    + "when client.idctipocliente=1 "
                    + "then CONCAT(per.apppat,' ',per.appmat,' ',per.nombres) "
                    + "else per.razonsocial "
                    + "end as nombrRazon "
                    + "from TPersona per "
                    + "inner join per.TClientes as client "
                    + "where "
                    + "per.codigo like '" + (!Strings.isNullOrEmpty(codigo.trim()) ? codigo.trim() : "") + "%' "
                    + "and per.apppat like '%" + (!Strings.isNullOrEmpty(apppat.trim()) ? apppat.trim() : "") + "%' "
                    + "and per.appmat like '%" + (!Strings.isNullOrEmpty(appmat.trim()) ? appmat.trim() : "") + "%' "
                    + "and per.nombres like '%" + (!Strings.isNullOrEmpty(nombres.trim()) ? nombres.trim() : "") + "%' "
                    + "and per.razonsocial like '%" + (!Strings.isNullOrEmpty(razonsocial.trim()) ? razonsocial.trim() : "") + "%' "
                    + "and per.estado = '1' "
                    + "and client.estado = '1'");

            listCliente = (ArrayList<Object>) query.list();

            Iterator itrListCliente = listCliente.iterator();
            while (itrListCliente.hasNext()) {
                Object[] objCliente = (Object[]) itrListCliente.next();
                ClienteL oCliente = new ClienteL();
                oCliente.setIdpersona((int) objCliente[0]);
                oCliente.setDni((String) ReemplazarNulo(objCliente[1]));
                oCliente.setNombres((String) ReemplazarNulo(objCliente[2]));
                oCliente.setApppat((String) ReemplazarNulo(objCliente[3]));
                oCliente.setAppmat((String) ReemplazarNulo(objCliente[4]));
                oCliente.setTelefono((String) ReemplazarNulo(objCliente[5]));
                oCliente.setDireccion((String) ReemplazarNulo(objCliente[6]));
                oCliente.setEmail((String) ReemplazarNulo(objCliente[7]));
                oCliente.setEstado((String) ReemplazarNulo(objCliente[8]));
                //oCliente.setObservacion(objCliente[9].toString());
                oCliente.setRuc((String) ReemplazarNulo(objCliente[9]));
                oCliente.setRazonsocial((String) ReemplazarNulo(objCliente[10]));
                oCliente.setCodigo((String) ReemplazarNulo(objCliente[11]));
                oCliente.setIdcliente((int) objCliente[12]);
                oCliente.setIdctipocliente((int) objCliente[13]);
                oCliente.setIdcruta((int) objCliente[14]);
                oCliente.setIdcfecuenciavisita((int) objCliente[15]);
                oCliente.setIdctiponegocio((int) objCliente[16]);
                oCliente.setDocumento((String) ReemplazarNulo(objCliente[17]));
                oCliente.setNombrRazon((String) ReemplazarNulo(objCliente[18]));

                //Tipo de Cliente
                TContenedor oTTablaMaestra = new TContenedor();
                oTTablaMaestra = (TContenedor) session.load(TContenedor.class, (int) objCliente[13]);
                oCliente.setTipocliente(oTTablaMaestra.getDenominacion());

                //ruta
                oTTablaMaestra = (TContenedor) session.load(TContenedor.class, (int) objCliente[14]);
                oCliente.setRuta(oTTablaMaestra.getDenominacion());

                //Frecuencia Visita
                oTTablaMaestra = (TContenedor) session.load(TContenedor.class, (int) objCliente[15]);
                oCliente.setFecuenciavisita(oTTablaMaestra.getDenominacion());

                //Tipo de Negocio
                oTTablaMaestra = (TContenedor) session.load(TContenedor.class, (int) objCliente[16]);
                oCliente.setTiponegocio(oTTablaMaestra.getDenominacion());

                listClienteFinal.add(oCliente);
            }
        } catch (HibernateException e) {
            handleException(e);
        }
        return listClienteFinal;
    }

    //---------------------------- Clasesssssss QUIQUE 01-05-2015------------------------------------
   

    private Object ReemplazarNulo(Object oObject) {
        String letrita = null;
        if (oObject != null) {
            letrita = (String) oObject;
        } else {
            letrita = " ";
        }
        return letrita;
    }



    
    public static void main(String[] args) {
        ClienteDAO oClienteDAO = new ClienteDAO();
        System.out.println(oClienteDAO.listarClienteModal("123", "men"));
        
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

