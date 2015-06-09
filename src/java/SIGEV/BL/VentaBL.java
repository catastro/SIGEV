/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;
import SIGEV.LIST.VentasL;
import SIGEV.BE.TVenta;
import SIGEV.DAO.VentaDAO;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import org.apache.jasper.tagplugins.jstl.ForEach;

/**
 *
 * @author JHON
 */
public class VentaBL {
    
    VentaDAO oVentaDAO = new VentaDAO();
    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
    
    
    /*char*/
    public ArrayList<VentasL> listarVentarXfecha(String fecha, String estado ) {
        
        ArrayList<TVenta> listTVentas = oVentaDAO.listarVentarXfecha(fecha, estado);
        ArrayList<VentasL> listVentasLs = new ArrayList<>();
        for (TVenta oTVenta : listTVentas) {
            VentasL oVentasL = new VentasL();            
            String nomAPP = oTVenta.getTCliente().getTPersona().getApppat() +" "+
                            oTVenta.getTCliente().getTPersona().getAppmat() + " "+
                            oTVenta.getTCliente().getTPersona().getNombres();            
            oVentasL.setCliente(nomAPP);
            oVentasL.setFecha(formato.format(oTVenta.getFechacreac()));
            oVentasL.setMonto(oTVenta.getMonto());
            oVentasL.setIdcVenta(oTVenta.getIdcventa());
            oVentasL.setNumcomprobante(oTVenta.getNumcomprovante());
            oVentasL.setObservacion(oTVenta.getObservacion());
            listVentasLs.add(oVentasL);
        }
        
        return listVentasLs;
    }
    
    /*char*/
    public ArrayList<VentasL> listarVentarXPersonal(String fechaDe, String fechaHasta, String personal)  {
        
        ArrayList<TVenta> listTVentas = oVentaDAO.listarVentarXPersonal(fechaDe, fechaHasta, personal);
        ArrayList<VentasL> listVentasLs = new ArrayList<>();
        for (TVenta oTVenta : listTVentas) {
            VentasL oVentasL = new VentasL();            
            String nomAPP = oTVenta.getTCliente().getTPersona().getApppat() +" "+
                            oTVenta.getTCliente().getTPersona().getAppmat() + " "+
                            oTVenta.getTCliente().getTPersona().getNombres();            
            oVentasL.setCliente(nomAPP);
            oVentasL.setFecha(formato.format(oTVenta.getFechacreac()));
            oVentasL.setMonto(oTVenta.getMonto());
            oVentasL.setIdcVenta(oTVenta.getIdcventa());
            oVentasL.setNumcomprobante(oTVenta.getNumcomprovante());
            oVentasL.setObservacion(oTVenta.getObservacion());
            listVentasLs.add(oVentasL);
        }
        
        return listVentasLs;
    }
    
    /*char*/
    public ArrayList<VentasL> listarVentarXCliente(String fechaDe, String fechaHasta, String cliente)  {
        
        
        ArrayList<TVenta> listTVentas = oVentaDAO.listarVentarXCliente(fechaDe, fechaHasta, cliente.replaceAll(" ","").toUpperCase());
        ArrayList<VentasL> listVentasLs = new ArrayList<>();
        for (TVenta oTVenta : listTVentas) {
            VentasL oVentasL = new VentasL();            
            String nomAPP = oTVenta.getTCliente().getTPersona().getApppat() +" "+
                            oTVenta.getTCliente().getTPersona().getAppmat() + " "+
                            oTVenta.getTCliente().getTPersona().getNombres();            
            oVentasL.setCliente(nomAPP);
            oVentasL.setFecha(formato.format(oTVenta.getFechacreac()));
            oVentasL.setMonto(oTVenta.getMonto());
            oVentasL.setIdcVenta(oTVenta.getIdcventa());
            oVentasL.setNumcomprobante(oTVenta.getNumcomprovante());
            oVentasL.setObservacion(oTVenta.getObservacion());
            listVentasLs.add(oVentasL);
        }
        
        return listVentasLs;
    }
    
    /*char*/
    public ArrayList<VentasL> listarVentarXComprobante(String numComprobante )  {
        
        
        ArrayList<TVenta> listTVentas = oVentaDAO.listarVentarXComprobante(numComprobante.trim());
        ArrayList<VentasL> listVentasLs = new ArrayList<>();
        for (TVenta oTVenta : listTVentas) {
            VentasL oVentasL = new VentasL();            
            String nomAPP = oTVenta.getTCliente().getTPersona().getApppat() +" "+
                            oTVenta.getTCliente().getTPersona().getAppmat() + " "+
                            oTVenta.getTCliente().getTPersona().getNombres();            
            oVentasL.setCliente(nomAPP);
            oVentasL.setFecha(formato.format(oTVenta.getFechacreac()));
            oVentasL.setMonto(oTVenta.getMonto());
            oVentasL.setIdcVenta(oTVenta.getIdcventa());
            oVentasL.setNumcomprobante(oTVenta.getNumcomprovante());
            oVentasL.setObservacion(oTVenta.getObservacion());
            listVentasLs.add(oVentasL);
        }
        
        return listVentasLs;
    }
    
    
    
    public static void main(String[] args) {
        VentaBL oVentaBL = new VentaBL();
        System.out.println(oVentaBL.listarVentarXfecha("2015/05/06","1"));
    }
    
}
