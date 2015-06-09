package SIGEV.DAO;

import SIGEV.BE.*;
import SIGEV.LIST.PersonalList;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;

public class PersonalDAO {

    private Session session;
    private Transaction tx;

    public PersonalDAO() {
        HibernateFactory.buildIfNeeded();
    }

    /*
    CHAR
    11/05/15
    listar persona combo
    */
    public ArrayList<Object> listarPersonal() throws DataAccessLayerException {
        
        ArrayList<Object> listPersonals = new ArrayList<>();
        try {
            startOperation();
            Query query = session.createQuery("select TPl.idpersonal,concat(TP.apppat,' ',TP.appmat,' ',TP.nombres) from TPersonal TPl left join TPl.TPersona TP"
            //Query query = session.createQuery("from TPersonal TPl left join fetch TPl.TPersona TP"
                                               + " where TPl.estado = '1'" );          
            listPersonals = (ArrayList<Object>) query.list();            
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            //HibernateFactory.close(session);
        }
        return listPersonals;
    }
    
    //de davisss
    public boolean registrarPersonal(TPersonal oTPersonal) throws DataAccessLayerException {
        boolean rpta = false;
        try {
            startOperation();
            session.save(oTPersonal);
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return rpta;
    }
    
     public ArrayList<PersonalList> ListarPersonal() {
        ArrayList<Object> lstPersonal;
        ArrayList<PersonalList> listaFinal = new ArrayList<>();

        try {
            startOperation();
            Query query = session.createQuery("select pe.idpersona,per.idpersonal, per.idcrutaasignada,"
                    + " per.idctipopersonal, per.idcmodalidadpago, per.idcestadopersonal,"
                    + " pe.codigo, pe.dni, pe.nombres, pe.apppat, pe.appmat, pe.telefono,"
                    + " pe.email, pe.direccion, per.horaentrada, per.horasalida,"
                    + " per.fechaingreso, per.montopago"
                    + " from TPersonal per "
                    + " inner join per.TPersona as pe"
                    + " where "
                    + " pe.estado = '1' "
                    + " and per.estado = '1' "
            );

            lstPersonal = (ArrayList<Object>) query.list();

            Iterator itrListPersonal = lstPersonal.iterator();

            while (itrListPersonal.hasNext()) {
                Object[] objPersonal = (Object[]) itrListPersonal.next();
                PersonalList oPersonalList = new PersonalList();
                oPersonalList.setIdpersona(objPersonal[0] != null ? Integer.parseInt(objPersonal[0].toString()) : 0);
                oPersonalList.setIdpersonal(objPersonal[1] != null ? Integer.parseInt(objPersonal[1].toString()) : 0);
                oPersonalList.setIdcrutaasignada(objPersonal[2] != null ? Integer.parseInt(objPersonal[2].toString()) : 0);
                oPersonalList.setIdctipopersonal(objPersonal[3] != null ? Integer.parseInt(objPersonal[3].toString()) : 0);
                oPersonalList.setIdcmodalidadpago(objPersonal[4] != null ? Integer.parseInt(objPersonal[4].toString()) : 0);
                oPersonalList.setIdcestadopersonal(objPersonal[5] != null ? Integer.parseInt(objPersonal[5].toString()) : 0);
                oPersonalList.setCodigo(objPersonal[6] != null ? objPersonal[6].toString() : "");
                oPersonalList.setDni(objPersonal[7] != null ? objPersonal[7].toString() : "");
                oPersonalList.setNombres(objPersonal[8] != null ? objPersonal[8].toString() : "");
                oPersonalList.setApppat(objPersonal[9] != null ? objPersonal[9].toString() : "");
                oPersonalList.setAppmat(objPersonal[10] != null ? objPersonal[10].toString() : "");
                oPersonalList.setTelefono(objPersonal[11] != null ? objPersonal[11].toString() : "");
                oPersonalList.setEmail(objPersonal[12] != null ? objPersonal[12].toString() : "");
                oPersonalList.setDireccion(objPersonal[13] != null ? objPersonal[13].toString() : "");
                oPersonalList.setHoraentrada(objPersonal[14] != null ? objPersonal[13].toString() : "");
                oPersonalList.setHorasalida(objPersonal[15] != null ? objPersonal[13].toString() : "");
                oPersonalList.setFechaIngreso(objPersonal[16] != null ? objPersonal[13].toString() : "");
                oPersonalList.setMontoPago(objPersonal[17] != null ? Double.parseDouble(objPersonal[13].toString()) : 0);
                

//                if (objPersonal[14] != null) {
//                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
//
//                    // SimpleDateFormat ff = new SimpleDateFormat("hh:mm:ss");
//                    try {
//                        Date horaEntrada = sdf.parse(objPersonal[14].toString());
//
//                        //    Date horaEntrada=new Fecha().convertStringToDate(objPersonal[14].toString());
//                        oPersonalList.setHoraentrada(horaEntrada.getHours() + ":" + horaEntrada.getMinutes() + ":" + horaEntrada.getSeconds());
//
//                        //java.util.Date horaEntrada = ff.parse(objPersonal[14].toString());
//                    } catch (ParseException ex) {
//                        Logger.getLogger(PersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
//                    }
//
//                }
//
//                if (objPersonal[15] != null) {
//                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
//
//                    // SimpleDateFormat ff = new SimpleDateFormat("hh:mm:ss");
//                    try {
//                        Date horaSalida = sdf.parse(objPersonal[15].toString());
//
//                        //    Date horaEntrada=new Fecha().convertStringToDate(objPersonal[14].toString());
//                        oPersonalList.setHorasalida(horaSalida.getHours() + ":" + horaSalida.getMinutes() + ":" + horaSalida.getSeconds());
//
//                        //java.util.Date horaEntrada = ff.parse(objPersonal[14].toString());
//                    } catch (ParseException ex) {
//                        Logger.getLogger(PersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
//                    }
//
//                }

//                if (objPersonal[15] != null) {
//                    Date horaSalida = new Fecha().convertStringToDate(objPersonal[15].toString());
//                    oPersonalList.setHoraentrada(horaSalida.getHours() + ":" + horaSalida.getMinutes() + ":" + horaSalida.getSeconds());
//                }

                //oPersonalList.setHoraentrada(objPersonal[14]!=null ? horaEntrada.getHours()+":"+horaEntrada.getMinutes()+":"+horaEntrada.getSeconds():"");
                //oPersonalList.setHoraentrada(objPersonal[15]!=null ? horaSalida.getHours()+":"+horaSalida.getMinutes()+":"+horaSalida.getSeconds():"");
                //oPersonalList.setHorasalida(objPersonal[15]!=null ? objPersonal[15].toString():"");
                TContenedor oTTablaMaestra = (TContenedor) session.load(TContenedor.class, oPersonalList.getIdcrutaasignada());
                oPersonalList.setRuta(oTTablaMaestra.getDenominacion());

                TContenedor oTTablaMaestra1 = (TContenedor) session.load(TContenedor.class, oPersonalList.getIdctipopersonal());
                oPersonalList.setTipoPersonal(oTTablaMaestra1.getDenominacion());

                listaFinal.add(oPersonalList);

            }

        } catch (HibernateException e) {
            System.out.println("error en dao " + e.getMessage());
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }

        return listaFinal;

    }
     
      public boolean actualizarPersonal(TPersonal oTPersonal, TPersona oTPersona) {
        boolean rpta = false;
        try {
            startOperation();

            boolean res = new PersonalDAO().actualizarPersonal(oTPersonal, session, tx);

            if (res) {
                
                rpta = new PersonaDAO().actualizarPersona(oTPersona, session, tx);
            }
            
            tx.commit();

        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }

        return rpta;

    }

    public boolean actualizarPersonal(TPersonal oTPersonal, Session session, Transaction tx) {
        boolean rpta = false;

        try {
            session.update(oTPersonal);

            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        }
        return rpta;
    }
    
     public boolean eliminarPersonal(TPersonal oTPersonal, TPersona oTPersona) {
        boolean rpta = false;
        try {
            startOperation();
            String hqlUpdateEstadoPersonal = "update  TPersonal p  set "
                    + " p.estado = '0' "
                    + " where p.idpersonal =  '" + oTPersonal.getIdpersonal()+"'";
           session.createQuery(hqlUpdateEstadoPersonal).executeUpdate();
            
            String hqlUpdateEstadoPersona = "update  TPersona p  set "
                    + " p.estado = '0' "
                    + " where p.idpersona =  '" + oTPersona.getIdpersona()+"'";
           session.createQuery(hqlUpdateEstadoPersona).executeUpdate();
            
           
            tx.commit();
            rpta = true;
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }

        return rpta;

    }
     
     public ArrayList<PersonalList> buscarPersonal(TPersona oTPersona) {
        ArrayList<Object> lstPersonal = null;
        ArrayList<PersonalList> listaFinal = new ArrayList<>();

        try {
            startOperation();
            Query query = session.createQuery(" select pe.idpersona,per.idpersonal, per.idcrutaasignada,"
                    + " per.idctipopersonal, per.idcmodalidadpago, per.idcestadopersonal,"
                    + " pe.codigo, pe.dni, pe.nombres, pe.apppat, pe.appmat, pe.telefono,"
                    + " pe.email, pe.direccion, per.horaentrada, per.horasalida"
                    + " from TPersonal per "
                    + " inner join per.TPersona as pe"
                    + " where "
                    + " pe.estado = '1' "
                    + " and per.estado = '1' " 
                    + " and pe.nombres like '%" + ((oTPersona.getNombres()!=null) ? oTPersona.getNombres().trim().toUpperCase() : "") + "%' "
                    + " and pe.apppat like '%" + ((oTPersona.getApppat()!=null) ? oTPersona.getApppat().trim().toUpperCase() : "") + "%' "
                    + " and pe.appmat like '%" + ((oTPersona.getAppmat()!=null) ? oTPersona.getAppmat().trim().toUpperCase() : "") + "%' "
 
            );

            lstPersonal = (ArrayList<Object>) query.list();

            Iterator itrListPersonal = lstPersonal.iterator();

            while (itrListPersonal.hasNext()) {
                Object[] objPersonal = (Object[]) itrListPersonal.next();
                PersonalList oPersonalList = new PersonalList();
                oPersonalList.setIdpersona(objPersonal[0] != null ? Integer.parseInt(objPersonal[0].toString()) : 0);
                oPersonalList.setIdpersonal(objPersonal[1] != null ? Integer.parseInt(objPersonal[1].toString()) : 0);
                oPersonalList.setIdcrutaasignada(objPersonal[2] != null ? Integer.parseInt(objPersonal[2].toString()) : 0);
                oPersonalList.setIdctipopersonal(objPersonal[3] != null ? Integer.parseInt(objPersonal[3].toString()) : 0);
                oPersonalList.setIdcmodalidadpago(objPersonal[4] != null ? Integer.parseInt(objPersonal[4].toString()) : 0);
                oPersonalList.setIdcestadopersonal(objPersonal[5] != null ? Integer.parseInt(objPersonal[5].toString()) : 0);
                oPersonalList.setCodigo(objPersonal[6] != null ? objPersonal[6].toString() : "");
                oPersonalList.setDni(objPersonal[7] != null ? objPersonal[7].toString() : "");
                oPersonalList.setNombres(objPersonal[8] != null ? objPersonal[8].toString() : "");
                oPersonalList.setApppat(objPersonal[9] != null ? objPersonal[9].toString() : "");
                oPersonalList.setAppmat(objPersonal[10] != null ? objPersonal[10].toString() : "");
                oPersonalList.setTelefono(objPersonal[11] != null ? objPersonal[11].toString() : "");
                oPersonalList.setEmail(objPersonal[12] != null ? objPersonal[12].toString() : "");
                oPersonalList.setDireccion(objPersonal[13] != null ? objPersonal[13].toString() : "");

                if (objPersonal[14] != null) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    // SimpleDateFormat ff = new SimpleDateFormat("hh:mm:ss");
                    try {
                        Date horaEntrada = sdf.parse(objPersonal[14].toString());

                        //    Date horaEntrada=new Fecha().convertStringToDate(objPersonal[14].toString());
                        oPersonalList.setHoraentrada(horaEntrada.getHours() + ":" + horaEntrada.getMinutes() + ":" + horaEntrada.getSeconds());

                        //java.util.Date horaEntrada = ff.parse(objPersonal[14].toString());
                    } catch (ParseException ex) {
                        Logger.getLogger(PersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
                    }

                }

                if (objPersonal[15] != null) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    // SimpleDateFormat ff = new SimpleDateFormat("hh:mm:ss");
                    try {
                        Date horaSalida = sdf.parse(objPersonal[15].toString());

                        //    Date horaEntrada=new Fecha().convertStringToDate(objPersonal[14].toString());
                        oPersonalList.setHorasalida(horaSalida.getHours() + ":" + horaSalida.getMinutes() + ":" + horaSalida.getSeconds());

                        //java.util.Date horaEntrada = ff.parse(objPersonal[14].toString());
                    } catch (ParseException ex) {
                        Logger.getLogger(PersonalDAO.class.getName()).log(Level.SEVERE, null, ex);
                    }

                }

//                if (objPersonal[15] != null) {
//                    Date horaSalida = new Fecha().convertStringToDate(objPersonal[15].toString());
//                    oPersonalList.setHoraentrada(horaSalida.getHours() + ":" + horaSalida.getMinutes() + ":" + horaSalida.getSeconds());
//                }

                //oPersonalList.setHoraentrada(objPersonal[14]!=null ? horaEntrada.getHours()+":"+horaEntrada.getMinutes()+":"+horaEntrada.getSeconds():"");
                //oPersonalList.setHoraentrada(objPersonal[15]!=null ? horaSalida.getHours()+":"+horaSalida.getMinutes()+":"+horaSalida.getSeconds():"");
                //oPersonalList.setHorasalida(objPersonal[15]!=null ? objPersonal[15].toString():"");
                TContenedor oTTablaMaestra = (TContenedor) session.load(TContenedor.class, oPersonalList.getIdcrutaasignada());
                oPersonalList.setRuta(oTTablaMaestra.getDenominacion());

                TContenedor oTTablaMaestra1 = (TContenedor) session.load(TContenedor.class, oPersonalList.getIdctipopersonal());
                oPersonalList.setTipoPersonal(oTTablaMaestra1.getDenominacion());

                listaFinal.add(oPersonalList);

            }

        } catch (HibernateException e) {
            System.out.println("error en dao " + e.getMessage());
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }

        return listaFinal;

    }

    //
    public static void main(String[] args) {
        PersonalDAO oPersonalDAO = new PersonalDAO();
        System.out.println(oPersonalDAO.listarPersonal());
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
