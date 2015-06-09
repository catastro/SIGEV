/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.SERVLET;


import SIGEV.BE.TPersona;
import SIGEV.BE.TUsuario;
import SIGEV.BL.PersonaBL;
import SIGEV.BL.RolBL;
import SIGEV.BL.UsuarioBL;
import SIGEV.LIST.RolL;
import SIGEV.LIST.UsuarioL;
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
 * @author WINDOWS 8
 */
@WebServlet(name = "GestionUsuarioServlet", urlPatterns = {"/GestionUsuarioServlet"})
public class GestionUsuarioServlet extends HttpServlet {
    
    RolBL oRolBL=new RolBL();
    UsuarioBL oUsuarioBL=new UsuarioBL();
    PersonaBL oPersonaBL=new PersonaBL();
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
        }
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
        
        
        
        if (request.getParameter("action").equals("1")) {
                //processRequest(request, response);                
                String jsonL = new Gson().toJson(oRolBL.mostrarRol());
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write(String.valueOf(jsonL));
            
        }
        if (request.getParameter("action").equals("2")) {
             ArrayList<UsuarioL> listUsuarioL = new ArrayList<UsuarioL>();
            listUsuarioL = oUsuarioBL.ListarUsuario();
            String jsonL = new Gson().toJson(listUsuarioL);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(String.valueOf(jsonL));
        }
        
        if (request.getParameter("action").equals("3")) {
            TPersona oTPersona=new TPersona();
            String dni=request.getParameter("dni");
            oTPersona = oPersonaBL.buscarPersonaxDni(dni);
            String jsonL = new Gson().toJson(oTPersona);
            
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(String.valueOf(jsonL));
        
        }
         if (request.getParameter("action").equals("4")) {
              try {
            
            String tPersona = request.getParameter("persona");
            JSONObject  jsonPersona = new JSONObject(tPersona);
            
            String tUsuario = request.getParameter("usuario");
            JSONObject  jsonUsuario = new JSONObject(tUsuario);
            //JSONObject jsonObjbb = new JSONObject(jsonObj.get(tSocio));
            
            Gson gson = new Gson();
            TPersona oTPersona = gson.fromJson(String.valueOf(jsonPersona), TPersona.class);
            
            Gson gson_ = new Gson();
            TUsuario oTUsuario = gson_.fromJson(String.valueOf(jsonUsuario), TUsuario.class);
            
             
            boolean b  =  oUsuarioBL.crearUsuario(oTUsuario, oTPersona);
             System.out.println(b);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write("");
            response.getWriter().write(String.valueOf(b));
         } catch (JsonSyntaxException | IOException | JSONException e) {
            System.out.println(e.toString());
        }
        }
         
        if (request.getParameter("action").equals("5")) {

            try {
                String tPersona = request.getParameter("persona");
                JSONObject jsonPersona = new JSONObject(tPersona);

                String tUsuario = request.getParameter("usuario");
                JSONObject jsonUsuario = new JSONObject(tUsuario);

                Gson gsonPer = new Gson();
                TPersona oTPersona = gsonPer.fromJson(String.valueOf(jsonPersona), TPersona.class);

                Gson gsonUsu = new Gson();
                TUsuario oTUsuario = gsonPer.fromJson(String.valueOf(jsonUsuario), TUsuario.class);

                boolean b = oUsuarioBL.updateUsuario(oTUsuario, oTPersona);

                System.out.println(b);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                response.getWriter().write("");
                response.getWriter().write(String.valueOf(b));

            } catch (JsonSyntaxException | IOException | JSONException e) {
                System.out.println(e.toString());
            }
        }
        
        if (request.getParameter("action").equals("6")) {
            try {
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                boolean rpta = oUsuarioBL.findUpdateUsuario(idUsuario);

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
