/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.SERVLET;

import SIGEV.BE.TPersona;
import SIGEV.BE.TPersonal;
import SIGEV.BL.PersonalBL;
import SIGEV.LIST.PersonalList;
import SIGEV.UTIL.Fecha;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author davis
 */
@WebServlet(name = "GestionPersonalServlet", urlPatterns = {"/GestionPersonalServlet"})
public class GestionPersonalServlet extends HttpServlet {

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
//            out.println("<title>Servlet GestionPersonalServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet GestionPersonalServlet at " + request.getContextPath() + "</h1>");
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

            //HttpSession session = request.getSession(true);
            //int idUsuario = (int) session.getAttribute("usuarioId");
            if (accion.equals("registrarPersonal")) {
                String tPersonal = request.getParameter("oTPersonal");
                String tPersona = request.getParameter("oTPersona");

                JSONObject jsonPersonal = new JSONObject(tPersonal);
                JSONObject jsonPersona = new JSONObject(tPersona);
                
                
                
                String fechaIngreso = request.getParameter("fechaingreso");
                String horaentrada = request.getParameter("horaentrada");
                String horasalida = request.getParameter("horasalida");

                // System.out.println("horaa"+dato.getTime());
                Gson gson = new Gson();
                TPersonal oTPersonal = gson.fromJson(String.valueOf(jsonPersonal), TPersonal.class);
                TPersona oTPersona = gson.fromJson(String.valueOf(jsonPersona), TPersona.class);
               // oTPersona.setNombres(oTPersona.getNombres().toUpperCase().trim());

                SimpleDateFormat ff = new SimpleDateFormat("HH:mm:ss");
                if (!"".equals(horaentrada)) {
                    java.util.Date horaE = ff.parse(horaentrada);
                    oTPersonal.setHoraentrada(horaE);
                }

                if (!"".equals(horasalida)) {
                    java.util.Date horaS = ff.parse(horasalida);
                    oTPersonal.setHorasalida(horaS);
                }
                
                if (!"".equals(fechaIngreso)) {
                    Date fecIngreso=new Fecha().convertStringToDate(fechaIngreso);
                     oTPersonal.setFechaingreso(fecIngreso);
                }
                
                
                
               
                oTPersona.setEstado("1");
                oTPersona.setFechacreac(new Fecha().obtenerFechaActual());
                //oTPersona.setIdusuariocreac(idUsuario);
                oTPersonal.setEstado("1");
                oTPersonal.setFechacreac(new Fecha().obtenerFechaActual());
                //oTPersonal.setIdusuariocreac(idUsuario);

                boolean rpta = new PersonalBL().registrarPersonal(oTPersonal, oTPersona);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(rpta));

            }

            if (accion.equals("ListarPersonal")) {

                ArrayList<PersonalList> lstPersonal = new PersonalBL().ListarPersonal();

                String jsonList = new Gson().toJson(lstPersonal);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(jsonList);
            }

            if (accion.equals("actualizarPersonal")) {
                String tPersonal = request.getParameter("oTPersonal");
                String tPersona = request.getParameter("oTPersona");

                JSONObject jsonPersonal = new JSONObject(tPersonal);
                JSONObject jsonPersona = new JSONObject(tPersona);

                String horaentrada = request.getParameter("horaentrada");
                String horasalida = request.getParameter("horasalida");

                // System.out.println("horaa"+dato.getTime());
                Gson gson = new Gson();
                TPersonal oTPersonal = gson.fromJson(String.valueOf(jsonPersonal), TPersonal.class);
                TPersona oTPersona = gson.fromJson(String.valueOf(jsonPersona), TPersona.class);

                SimpleDateFormat ff = new SimpleDateFormat("HH:mm:ss");
                if (!"".equals(horaentrada)) {
                    java.util.Date horaE = ff.parse(horaentrada);
                    oTPersonal.setHoraentrada(horaE);
                }

                if (!"".equals(horasalida)) {
                    java.util.Date horaS = ff.parse(horasalida);
                    oTPersonal.setHorasalida(horaS);
                }

                oTPersona.setEstado("1");
                oTPersona.setFechamodif(new Fecha().obtenerFechaActual());
                //oTPersona.setIdusuariocreac(idUsuario);
                oTPersonal.setEstado("1");
                oTPersonal.setFechamodif(new Fecha().obtenerFechaActual());
                //oTPersonal.setIdusuariocreac(idUsuario);
                oTPersonal.setTPersona(oTPersona);

                boolean rpta = new PersonalBL().actualizarPersonal(oTPersonal, oTPersona);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(rpta));

            }
            
            if (accion.equals("eliminarPersonal")) {
                String tPersonal = request.getParameter("oTPersonal");
                String tPersona = request.getParameter("oTPersona");

                JSONObject jsonPersonal = new JSONObject(tPersonal);
                JSONObject jsonPersona = new JSONObject(tPersona);
                
                 Gson gson = new Gson();
                TPersonal oTPersonal = gson.fromJson(String.valueOf(jsonPersonal), TPersonal.class);
                TPersona oTPersona = gson.fromJson(String.valueOf(jsonPersona), TPersona.class);
                
                oTPersonal.setEstado("0");
                oTPersona.setEstado("0");
                
                boolean rpta = new PersonalBL().eliminarPersonal(oTPersonal, oTPersona);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(rpta));
            }
            
             if (accion.equals("buscarPersonal")) {
                 String tPersona = request.getParameter("oTPersona");
                 JSONObject jsonPersona = new JSONObject(tPersona);
                 Gson gson = new Gson();
                 TPersona oTPersona = gson.fromJson(String.valueOf(jsonPersona), TPersona.class);
                 
                 ArrayList<PersonalList> lstPersonal = new PersonalBL().buscarPersonal(oTPersona);

                String jsonList = new Gson().toJson(lstPersonal);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(jsonList);
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
