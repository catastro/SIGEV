/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.SERVLET;

import SIGEV.BE.TPago;
import SIGEV.BE.TPersona;
import SIGEV.BE.TPersonal;
import SIGEV.BL.PagoBL;
import SIGEV.LIST.PagoList;
import SIGEV.UTIL.Fecha;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author davis
 */
@WebServlet(name = "GestionPagoServlet", urlPatterns = {"/GestionPagoServlet"})
public class GestionPagoServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet GestionPagoServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet GestionPagoServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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

        try {
            String accion = request.getParameter("accion");
            if (accion.equals("registrarPago")) {
                String tPersonal = request.getParameter("oTPersonal");
                String tPago = request.getParameter("oTPago");

                JSONObject jsonPersonal = new JSONObject(tPersonal);
                JSONObject jsonPago = new JSONObject(tPago);

                String fechapagoinicio = request.getParameter("fechapagoinicio");
                String fechapagofin = request.getParameter("fechapagofin");

                Gson gson = new Gson();
                TPersonal oTPersonal = gson.fromJson(String.valueOf(jsonPersonal), TPersonal.class);
                TPago oTPago = gson.fromJson(String.valueOf(jsonPago), TPago.class);

                oTPago.setTPersonal(oTPersonal);
                oTPago.setEstado("1");
                oTPago.setFechacreac(new Fecha().obtenerFechaActual());

                Date fechaInicio = new Fecha().convertStringToDate(fechapagoinicio);
                Date fechaFin = new Fecha().convertStringToDate(fechapagofin);
                oTPago.setFechainicio(fechaInicio);
                oTPago.setFechafin(fechaFin);

                boolean rpta = new PagoBL().registrarPago(oTPago);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(rpta));

            }
        
            if (accion.equals("3")) {
                String idpersonal = request.getParameter("idpersonal");
                int idPersonal=Integer.parseInt(idpersonal);
                
                ArrayList<PagoList> lstPagos= new PagoBL().buscarPago(idPersonal);
                String jsonL = new Gson().toJson(lstPagos);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(String.valueOf(jsonL)));
            }
            
            if (accion.equals("actualizarPago")) {
                String tPago = request.getParameter("oTPago");

                JSONObject jsonPago = new JSONObject(tPago);

                String fechapagoinicio = request.getParameter("fechapagoinicio");
                String fechapagofin = request.getParameter("fechapagofin");

                Gson gson = new Gson();
                TPago oTPago = gson.fromJson(String.valueOf(jsonPago), TPago.class);

                oTPago.setFechamodif(new Fecha().obtenerFechaActual());
                
                DateFormat fecha = new SimpleDateFormat("dd/MM/yyyy");
                
                java.sql.Date sqlDateInicio = new java.sql.Date((fecha.parse(fechapagofin)).getTime());
                oTPago.setFechafin(sqlDateInicio);
                
                java.sql.Date sqlDateFin = new java.sql.Date((fecha.parse(fechapagoinicio)).getTime());
                oTPago.setFechainicio(sqlDateFin);
                
                //Date fechaInicio = new Fecha().convertStringToDate(fechapagoinicio);
                //Date fechaFin = new Fecha().convertStringToDate(fechapagofin);
               // oTPago.setFechapagoinicio(fechaInicio);
                //oTPago.setFechapagofin(fechaFin);

                boolean rpta = new PagoBL().actualizarPago(oTPago);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(rpta));

            }
            
            if (accion.equals("eliminarPago")) {
                String idpago = request.getParameter("idPago");
                int idPago= Integer.parseInt(idpago);
                
                boolean rpta = new PagoBL().eliminarPago(idPago);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(rpta));
                
            }

        } catch (Exception e) {
            System.out.println("error servlet" + e.toString());
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
