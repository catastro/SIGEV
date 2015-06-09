/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.SERVLET;

import SIGEV.BE.TPersona;
import SIGEV.BE.TProveedor;
import SIGEV.BL.ProveedorBL;
import SIGEV.LIST.ProveedorL;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author QUIQUE
 */
@WebServlet(name = "GestionProveedorServlet", urlPatterns = {"/GestionProveedorServlet"})
public class GestionProveedorServlet extends HttpServlet {

    ProveedorBL oProveedorBL = new ProveedorBL();

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
                String tPersona = request.getParameter("persona");
                JSONObject jsonPersona = new JSONObject(tPersona);

                String tProveedor = request.getParameter("proveedor");
                JSONObject jsonProveedor = new JSONObject(tProveedor);

                Gson gsonPer = new Gson();
                TPersona oTPersona = gsonPer.fromJson(String.valueOf(jsonPersona), TPersona.class);
                oTPersona.setEstado("1");
                oTPersona.setFechacreac(new Date());
                oTPersona.setIdusuariocreac(1);

                Gson gsonProvee = new Gson();
                TProveedor oTProveedor = gsonProvee.fromJson(String.valueOf(jsonProveedor), TProveedor.class);
                oTProveedor.setEstado("1");
                oTProveedor.setFechacreac(new Date());
                oTProveedor.setIdusuariocreac(1);

                String b = oProveedorBL.insertarProveedorPersona(oTPersona, oTProveedor);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("");
                response.getWriter().write(String.valueOf(b));
            } catch (JsonSyntaxException | IOException | JSONException e) {
                System.out.println(e.toString());
            } catch (Exception ex) {
                Logger.getLogger(GestionProveedorServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("action").equals("2")) {
            try {
                String tPersona = request.getParameter("persona");
                JSONObject jsonPersona = new JSONObject(tPersona);

                String tProveedor = request.getParameter("proveedor");
                JSONObject jsonProveedor = new JSONObject(tProveedor);

                Gson gsonPer = new Gson();
                TPersona oTPersona = gsonPer.fromJson(String.valueOf(jsonPersona), TPersona.class);
                oTPersona.setFechamodif(new Date());
                oTPersona.setIdusuariomodif(2);

                Gson gsonProvee = new Gson();
                TProveedor oTProveedor = gsonProvee.fromJson(String.valueOf(jsonProveedor), TProveedor.class);
                oTProveedor.setFechamodif(new Date());
                oTProveedor.setIdusuariomodif(2);

                boolean b = oProveedorBL.actualizarProveedor(oTPersona, oTProveedor);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("");
                response.getWriter().write(String.valueOf(b));
            } catch (JsonSyntaxException | IOException | JSONException e) {
                System.out.println(e.toString());
            } catch (Exception ex) {
                Logger.getLogger(GestionProveedorServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("action").equals("3")) {
            try {
                int idPersona = Integer.parseInt(request.getParameter("idpersona"));
                int idProveedor = Integer.parseInt(request.getParameter("idproveedor"));
                String estado = request.getParameter("estado");

                boolean b = oProveedorBL.cambiarEstadoProveedor(idProveedor, idPersona, estado);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("");
                response.getWriter().write(String.valueOf(b));
            } catch (JsonSyntaxException | IOException e) {
                System.out.println(e.toString());
            } catch (Exception ex) {
                Logger.getLogger(GestionProveedorServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("action").equals("4")) {
            try {
                int idProveedor = Integer.parseInt(request.getParameter("idproveedor"));
                boolean b = oProveedorBL.buscarProveedorEnCompra(idProveedor);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("");
                response.getWriter().write(String.valueOf(b));
            } catch (JsonSyntaxException | IOException e) {
                System.out.println(e.toString());
            } catch (Exception ex) {
                Logger.getLogger(GestionProveedorServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("action").equals("5")) {
            try {
                String tcodigo = request.getParameter("codigo");
                String tnombres = request.getParameter("nombres");
                String tapPaterno = request.getParameter("apppat");
                String tapMaterno = request.getParameter("appmat");
                String trazonsocial = request.getParameter("razonsocial");

                ArrayList<ProveedorL> oProveedorL = new ArrayList<ProveedorL>();
                oProveedorL = oProveedorBL.buscarProveedor(tcodigo, tnombres, tapPaterno, tapMaterno, trazonsocial);
                String jsonL = new Gson().toJson(oProveedorL);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            } catch (JsonSyntaxException e) {
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
