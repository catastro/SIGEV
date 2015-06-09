/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.SERVLET;

import SIGEV.BE.TBoveda;
import SIGEV.BL.BovedaBL;
import SIGEV.DAO.DataAccessLayerException;
import SIGEV.LIST.BovedaL;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author WINDOWS 8
 */
@WebServlet(name = "GestionBovedaServlet", urlPatterns = {"/GestionBovedaServlet"})
public class GestionBovedaServlet extends HttpServlet {
    
    BovedaBL oBovedaBL=new BovedaBL();

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
                String fechaA = request.getParameter("fechaA");
                String fechaB = request.getParameter("fechaB");
                
                
                ArrayList<BovedaL> oBovedaL = oBovedaBL.buscarBoveda(fechaA, fechaB);
                String jsonL = new Gson().toJson(oBovedaL);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException | ParseException e) {
                System.out.println(e.toString());
            } 
        }
         if (request.getParameter("action").equals("2")) {
            try {
                String tBoveda = request.getParameter("boveda");
                
                JSONObject jsonBov = new JSONObject(tBoveda);
                Gson gson = new Gson();
                TBoveda oTBoveda = gson.fromJson(String.valueOf(jsonBov), TBoveda.class);
                boolean rpta = oBovedaBL.CrearOactualizarBoveda(oTBoveda);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(rpta));
            } catch (JsonSyntaxException | IOException | JSONException e) {
                System.out.println(e.toString());
            }
        }
         
        
         if (request.getParameter("action").equals("3")) {
            try {
                int idboveda = Integer.parseInt(request.getParameter("idboveda"));
                boolean rpta = oBovedaBL.EliminarBoveda(idboveda);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("");
                response.getWriter().write(String.valueOf(rpta));
            } catch (JsonSyntaxException | IOException e) {
                System.out.println(e.toString());
                
            }

        }
         
        if (request.getParameter("action").equals("4")) {
             double efectivo=0;
            try {
                efectivo = oBovedaBL.Efectivo();
            } catch (DataAccessLayerException | ParseException ex) {
                Logger.getLogger(GestionBovedaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            String jsonL = new Gson().toJson(efectivo);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(String.valueOf(jsonL));
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
