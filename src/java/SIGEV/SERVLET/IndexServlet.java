/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.SERVLET;

import SIGEV.BE.TUsuario;
import SIGEV.BL.UsuarioBL;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JHON
 */
@WebServlet(name = "IndexServlet", urlPatterns = {"/IndexServlet"})
public class IndexServlet extends HttpServlet {

UsuarioBL oUsuarioBL = new UsuarioBL();
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
        response.setContentType("text/html;charset=UTF-8");

        try {
            
            TUsuario oTUsuario = oUsuarioBL.login(request.getParameter("usuario"), request.getParameter("pass"));
            
            if (oTUsuario != null) {

                if (request.isRequestedSessionIdValid()) {
                    HttpSession tempSession = request.getSession(false);
                    tempSession.invalidate();
                    System.out.println("la sesión estaba activa");
                }
                HttpSession session = request.getSession(true);
                session.setAttribute("usuarioId", oTUsuario.getIdusuario());
                session.setAttribute("usuarioNombre", oTUsuario.getNombreusuario());
                session.setAttribute("usuarioRol", oTUsuario.getTRol().getIdrol());
                //int idciclo = oCicloBL.RetornaUltimoCiclo().getIdciclo();
                //String id = String.valueOf(idciclo);
                //session.setAttribute("idCiclo", id);
                //session.setAttribute("denominacionCiclo", oCicloBL.RetornaUltimoCiclo().getDenominacion());
               
                response.sendRedirect("Principal.html");
            } else {
                response.sendRedirect("index.jsp?msj='Usuario y/o Password invalidos'");
                        
            }

        } catch (Exception e) {
            response.sendRedirect("Error.html");
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
