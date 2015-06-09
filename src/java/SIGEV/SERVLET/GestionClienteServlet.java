/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.SERVLET;

import SIGEV.BE.TCliente;
import SIGEV.BE.TPersona;
import SIGEV.BL.ClienteBL;
import SIGEV.LIST.ClienteL;
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
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author QUIQUE
 */
@WebServlet(name = "GestionClienteServlet", urlPatterns = {"/GestionClienteServlet"})
public class GestionClienteServlet extends HttpServlet {

    ClienteBL oClienteBL = new ClienteBL();

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

                String tCliente = request.getParameter("cliente");
                JSONObject jsonCliente = new JSONObject(tCliente);

                Gson gsonPer = new Gson();
                TPersona oTPersona = gsonPer.fromJson(String.valueOf(jsonPersona), TPersona.class);
                oTPersona.setEstado("1");
                oTPersona.setFechacreac(new Date());
                oTPersona.setIdusuariocreac(1);

                Gson gsonCliente = new Gson();
                TCliente oTCliente = gsonCliente.fromJson(String.valueOf(jsonCliente), TCliente.class);
                oTCliente.setEstado("1");
                oTCliente.setFechacreac(new Date());
                oTCliente.setIdusuariocreac(1);

                String b = oClienteBL.insertarClientePersona(oTPersona, oTCliente);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("");
                response.getWriter().write(String.valueOf(b));
            } catch (JsonSyntaxException | IOException | JSONException e) {
                System.out.println(e.toString());
            } catch (Exception ex) {
                Logger.getLogger(GestionClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("action").equals("2")) {
            try {
                String tPersona = request.getParameter("persona");
                JSONObject jsonPersona = new JSONObject(tPersona);

                String tCliente = request.getParameter("cliente");
                JSONObject jsonCliente = new JSONObject(tCliente);

                Gson gsonPer = new Gson();
                TPersona oTPersona = gsonPer.fromJson(String.valueOf(jsonPersona), TPersona.class);
                oTPersona.setFechamodif(new Date());
                oTPersona.setIdusuariomodif(2);

                Gson gsonCliente = new Gson();
                TCliente oTCliente = gsonCliente.fromJson(String.valueOf(jsonCliente), TCliente.class);
                oTCliente.setFechamodif(new Date());
                oTCliente.setIdusuariomodif(2);

                boolean b = oClienteBL.updateCliente(oTPersona, oTCliente);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("");
                response.getWriter().write(String.valueOf(b));
            } catch (JsonSyntaxException | IOException | JSONException e) {
                System.out.println(e.toString());
            } catch (Exception ex) {
                Logger.getLogger(GestionClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("action").equals("3")) {
            try {
                int idPersona = Integer.parseInt(request.getParameter("idpersona"));
                int idCliente = Integer.parseInt(request.getParameter("idcliente"));
                String estado = request.getParameter("estado");

                boolean b = oClienteBL.cambiarEstadoCliente(idCliente, idPersona, estado);

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("");
                response.getWriter().write(String.valueOf(b));
            } catch (JsonSyntaxException | IOException e) {
                System.out.println(e.toString());
            } catch (Exception ex) {
                Logger.getLogger(GestionClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("action").equals("4")) {
            try {
                int idCliente = Integer.parseInt(request.getParameter("idcliente"));
                boolean b = oClienteBL.buscarClientesEnVentas(idCliente);
                
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("");
                response.getWriter().write(String.valueOf(b));
            } catch (JsonSyntaxException | IOException e) {
                System.out.println(e.toString());
            } catch (Exception ex) {
                Logger.getLogger(GestionClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("action").equals("5")) {
            try {
                String tcodigo = request.getParameter("codigo");
                String tnombres = request.getParameter("nombres");
                String tapPaterno = request.getParameter("apppat");
                String tapMaterno = request.getParameter("appmat");
                String trazonsocial = request.getParameter("razonsocial");

                ArrayList<ClienteL> oProveedorL = new ArrayList<ClienteL>();
                oProveedorL = oClienteBL.buscarCliente(tcodigo, tnombres, tapPaterno, tapMaterno, trazonsocial);
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
