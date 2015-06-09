/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.SERVLET;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import SIGEV.BL.*;
import SIGEV.BE.*;
import java.util.ArrayList;
import com.google.gson.Gson;
//import java.util.logging.Level;
//import java.util.logging.Logger;
/**
 *
 * @author davis
 */
@WebServlet(name = "GestionContenedorServlet", urlPatterns = {"/GestionContenedorServlet", "/ListarColegios"})
public class GestionContenedorServlet extends HttpServlet {
    
    ContenedorBL oContenedorBL;

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
        
//        String path = request.getServletPath();
//        
//      if (path.equals("/ListarColegios")) {
//            /*ListarColegios();*/
//        }
    }
    /*
    protected void ListarColegios(){
        
        try {
            oContenedorBL= new ContenedorBL();
            ArrayList<TContenedor> lstModalidadPago;
            lstModalidadPago=oContenedorBL.listarColegios();
            
            String jsonList = new Gson().toJson(lstModalidadPago);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(jsonList);
            
        } catch (IOException e) {
            Logger.getLogger(GestionSalonServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }*/

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

            oContenedorBL= new ContenedorBL();
            ArrayList<TContenedor> lstCombos;
            String idTabla = request.getParameter("idTabla");
            //int id=Integer.parseInt(idTabla);
            lstCombos=oContenedorBL.listarCombos(idTabla);
            
            String jsonList = new Gson().toJson(lstCombos);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(jsonList); 
        } catch (NumberFormatException | IOException e) {
             System.out.println(e.toString());
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
