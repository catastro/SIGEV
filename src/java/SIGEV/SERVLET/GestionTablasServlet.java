/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.SERVLET;

import SIGEV.BE.TContenedor;
import SIGEV.BL.ContenedorBL;
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
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author JHON
 */
@WebServlet(name = "GestionTablasServlet", urlPatterns = {"/GestionTablasServlet"})
public class GestionTablasServlet extends HttpServlet {
    
    ContenedorBL oContenedorBL = new ContenedorBL();

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
                ArrayList<TContenedor> listTContenedors = new ArrayList<>();
                listTContenedors = oContenedorBL.listarContenedorTablas(request.getParameter("denominacion"));
                String jsonL = new Gson().toJson(listTContenedors);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            } 
        }
        if (request.getParameter("action").equals("2")) {
            try {                
                ArrayList<TContenedor> listTContenedors = new ArrayList<>();
                listTContenedors = oContenedorBL.listarContenedorSubTablas(Integer.parseInt(request.getParameter("idTabla")));
                String jsonL = new Gson().toJson(listTContenedors);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            } 
        }
        
        if (request.getParameter("action").equals("3")) {
            try {
                String tContenedor = request.getParameter("contenedor");
                
                JSONObject jsonCont = new JSONObject(tContenedor);
                Gson gsonExam = new Gson();
                TContenedor oTContenedor = gsonExam.fromJson(String.valueOf(jsonCont), TContenedor.class);
                boolean rpta = oContenedorBL.insertOrUpdateContenedor(oTContenedor);

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
