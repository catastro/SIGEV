/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.SERVLET;

import SIGEV.BE.TCajaDetalle;
import SIGEV.BL.CajaBL;
import SIGEV.BL.CajaDetalleBL;
import SIGEV.LIST.CajaDetalleL;
import SIGEV.LIST.CajaL;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;


/**
 *
 * @author WINDOWS 8
 */
@WebServlet(name = "GestionCajaServlet", urlPatterns = {"/GestionCajaServlet"})
public class GestionCajaServlet extends HttpServlet {

    CajaDetalleBL oCajaDetalleBL = new CajaDetalleBL();
    CajaBL oCajaBL = new CajaBL();

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
        // processRequest(request, response);

        if (request.getParameter("action").equals("1")) {
            try {
                String cajaDetalle = request.getParameter("listCajaDetalle");
                JSONArray listJSONArray = new JSONArray(cajaDetalle);

                String fecha = request.getParameter("fecha");
                SimpleDateFormat fechaSDF = new SimpleDateFormat("dd/MM/yyyy");;
                Date fechaArqueo = fechaSDF.parse(fecha);

                String sumtotal = request.getParameter("sumaTotal");
                double sumatotal = Double.parseDouble(sumtotal);

                ArrayList<TCajaDetalle> listCajaDetallito = new ArrayList<>();

                for (int i = 0; i < listJSONArray.length(); i++) {
                    Gson gson = new Gson();
                    TCajaDetalle TCD = gson.fromJson(String.valueOf(listJSONArray.getJSONObject(i)), TCajaDetalle.class);

                    listCajaDetallito.add(TCD);
                }
                boolean rpta = oCajaDetalleBL.CrearCajaDetalle(listCajaDetallito, fechaArqueo, sumatotal);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(rpta));
            } catch (JsonSyntaxException | JSONException | ParseException e) {
                System.out.println(e.toString());
            }
        }

        if (request.getParameter("action").equals("2")) {

            try {
                String fecha = request.getParameter("fecha");
                
                System.out.println(fecha);
                ArrayList<CajaL> oCajaL = oCajaBL.buscarCaja(fecha);
                String jsonL = new Gson().toJson(oCajaL);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException | ParseException e) {
                System.out.println(e.toString());
            }
        }
        
         if (request.getParameter("action").equals("3")) {

            try {
                int idCaja = Integer.parseInt(request.getParameter("idCaja"));
                ArrayList<CajaDetalleL> oCajaDetalleL = oCajaDetalleBL.ListarParaActualizarCaja(idCaja);
                String jsonL = new Gson().toJson(oCajaDetalleL);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException | ParseException e) {
                System.out.println(e.toString());
            }
        }
       if (request.getParameter("action").equals("4")) {
            try {
                String cajaDetalle = request.getParameter("listCajaDetalle");
                JSONArray listJSONArray = new JSONArray(cajaDetalle);

                
                String sumtotal = request.getParameter("sumaTotal");
                double sumatotal = Double.parseDouble(sumtotal);
                
                int idCaja = Integer.parseInt(request.getParameter("idCaja"));

                ArrayList<TCajaDetalle> listCajaDetallito = new ArrayList<>();

                for (int i = 0; i < listJSONArray.length(); i++) {
                    Gson gson = new Gson();
                    TCajaDetalle TCD = gson.fromJson(String.valueOf(listJSONArray.getJSONObject(i)), TCajaDetalle.class);

                    listCajaDetallito.add(TCD);
                }
                boolean rpta = oCajaDetalleBL.ActualizarCajaDetalle(listCajaDetallito, sumatotal, idCaja);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(rpta));
            } catch (JsonSyntaxException | JSONException e) {
                System.out.println(e.toString());
            }
        }
       
        if (request.getParameter("action").equals("5")) {
            try {
                int idcajadetalle = Integer.parseInt(request.getParameter("idcajadetalle"));
                boolean rpta = oCajaDetalleBL.EliminarCajaDetalle(idcajadetalle);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("");
                response.getWriter().write(String.valueOf(rpta));
            } catch (JsonSyntaxException | IOException e) {
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
