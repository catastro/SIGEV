/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.SERVLET;
import SIGEV.BE.TVenta;
import SIGEV.BL.ClienteBL;
import SIGEV.BE.TDetalleVenta;
import SIGEV.BL.DetalleVentaBL;
import SIGEV.BL.PersonalBL;
import SIGEV.BL.PrecioBL;
import SIGEV.BL.ProductoBL;
import SIGEV.BL.VentaBL;
import SIGEV.LIST.PersonalCMBL;
import SIGEV.LIST.VentasL;
import SIGEV.LIST.PrecioShortL;
import SIGEV.LIST.ClienteShortL;
import SIGEV.LIST.ProductoShortL;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author JHON
 */
@WebServlet(name = "GestionVentasServlet", urlPatterns = {"/GestionVentasServlet"})
public class GestionVentasServlet extends HttpServlet {
    
    VentaBL oVentaBL = new VentaBL();
    PersonalBL oPersonalBL = new PersonalBL();
    ClienteBL oClienteBL = new ClienteBL();
    ProductoBL oProductoBL = new ProductoBL();
    PrecioBL oPrecioBL = new PrecioBL();
    DetalleVentaBL oDetalleVentaBL = new DetalleVentaBL();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        if (request.getParameter("action").equals("1")) {
            try {                
                String fecha = request.getParameter("fecha");
                String estado = request.getParameter("estado");
                
                ArrayList<VentasL> listVentas = oVentaBL.listarVentarXfecha(fecha, estado);
                                           
                String jsonL = new Gson().toJson(listVentas);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            } 
        }
        
        if (request.getParameter("action").equals("2")) {
            try {           
                String comprobante = request.getParameter("comprobante");                
                ArrayList<VentasL> listVentas = oVentaBL.listarVentarXComprobante(comprobante);                                           
                String jsonL = new Gson().toJson(listVentas);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            } 
        }
        
        if (request.getParameter("action").equals("3")) {
            try {                
                String fechaDe = request.getParameter("fechaDe");
                String fechaHasta = request.getParameter("fechaHasta");
                String personal = request.getParameter("personal");                
                ArrayList<VentasL> listVentas = oVentaBL.listarVentarXPersonal(fechaDe, fechaHasta, personal);                                           
                String jsonL = new Gson().toJson(listVentas);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            } 
        }
        
        if (request.getParameter("action").equals("4")) {
            try {                
                String fechaDe = request.getParameter("fechaDe");
                String fechaHasta = request.getParameter("fechaHasta");
                String cliente = request.getParameter("cliente");
                
                
                ArrayList<VentasL> listVentas = oVentaBL.listarVentarXCliente(fechaDe, fechaHasta, cliente);
                                           
                String jsonL = new Gson().toJson(listVentas);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            } 
        }
        if (request.getParameter("action").equals("5")) {
            try {                                
                ArrayList<PersonalCMBL> listPersonal = oPersonalBL.listarPersonal();                                           
                String jsonL = new Gson().toJson(listPersonal);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            } 
        }
        if (request.getParameter("action").equals("6")) {
            try {                
                
                String codigo = request.getParameter("codigo");
                String cliente = request.getParameter("cliente");                
                ArrayList<ClienteShortL> listClientes = oClienteBL.listarClienteModal(codigo, cliente);                                           
                String jsonL = new Gson().toJson(listClientes);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            } 
        }
        if (request.getParameter("action").equals("7")) {
            try {                
                
                String codigo = request.getParameter("codigo");
                ArrayList<ProductoShortL> listProductoShortLs = oProductoBL.buscarProductoXCodigo(codigo);
                String jsonL = new Gson().toJson(listProductoShortLs);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            }         
        }
        if (request.getParameter("action").equals("8")) {
            try {                
                
                String denominacion = request.getParameter("denominacion");
                ArrayList<ProductoShortL> listProductoShortLs = oProductoBL.buscarProductoXDenominacion(denominacion);
                String jsonL = new Gson().toJson(listProductoShortLs);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            }         
        }
        
        if (request.getParameter("action").equals("9")) {
            try {                
                
                String idProducto = request.getParameter("idProducto");
                ArrayList<PrecioShortL> listPrecioShortLs = oPrecioBL.listarPrecios(Integer.valueOf(idProducto));
                String jsonL = new Gson().toJson(listPrecioShortLs);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            }         
        }
        if (request.getParameter("action").equals("10")) {
              try {
                String tVenta = request.getParameter("oVenta");
                JSONObject jsonCont = new JSONObject(tVenta);                
                Gson gson = new Gson();
                TVenta oTventa = gson.fromJson(String.valueOf(jsonCont), TVenta.class);
                
                
                String listDetalleVenta = request.getParameter("listDetalleVenta");
                JSONArray listJSONArray = new JSONArray(listDetalleVenta);
                
                ArrayList<TDetalleVenta> listDetalleV = new ArrayList<>();

                for (int i = 0; i < listJSONArray.length(); i++) {
                    Gson gson_ = new Gson();
                    TDetalleVenta oDetalleVenta = gson_.fromJson(String.valueOf(listJSONArray.getJSONObject(i)), TDetalleVenta.class);
                    listDetalleV.add(oDetalleVenta);
                }
                
                int rpta = oDetalleVentaBL.insertOrUpdateDetalleVenta(oTventa, listDetalleV);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(rpta));
            } catch (JsonSyntaxException | IOException | JSONException e) {
                System.out.println(e.toString());
            }      
        }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
