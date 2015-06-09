/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.BE.*;
import SIGEV.DAO.*;
import SIGEV.UTIL.MD5TEST;
import SIGEV.LIST.UsuarioL;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JHON
 */
public class UsuarioBL {

    UsuarioDAO oUsuarioDAO = new UsuarioDAO();

    /*char*/
    public TUsuario login(String nombreUsuario, String password) {
        TUsuario oTUsuario = null;
        try {
            oTUsuario = oUsuarioDAO.loginUsuario(MD5TEST.md5(password), nombreUsuario);

        } catch (Exception ex) {
            Logger.getLogger(UsuarioBL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return oTUsuario;
    }

    public boolean crearUsuario(TUsuario oUsuario, TPersona oTPersona) {
        boolean rpta = false;

        if (oUsuarioDAO.verificarUsuario(oUsuario.getNombreusuario().trim())) {
            rpta = false;
        } else {
            oTPersona.setNombres(oTPersona.getNombres().trim());
            oTPersona.setApppat(oTPersona.getApppat().trim());
            oTPersona.setAppmat(oTPersona.getAppmat().trim());
            oTPersona.setDni(oTPersona.getDni().trim());
            oUsuario.setNombreusuario(oUsuario.getNombreusuario().trim());
            oUsuario.setPassword(oUsuario.getPassword().trim());
            oTPersona.setEstado("1");
            oUsuario.setEstado("1");
            try {
                //String pass =  MD5TEST.md5(oUsuario.getPassword());
                oUsuario.setPassword(MD5TEST.md5(oUsuario.getPassword()));
                oUsuarioDAO.create(oUsuario, oTPersona);
                rpta = true;
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }

        return rpta;
    }

    public boolean updateUsuario(TUsuario oUsuario, TPersona oTPersona) {
        boolean rpta = false;
        String nombreusuario = oUsuario.getNombreusuario().trim();
        int idUsuario = oUsuario.getIdusuario();
        if (oUsuarioDAO.verificarActualizarUsuario(nombreusuario, idUsuario)) {
            rpta = false;
        } else {
            oTPersona.setNombres(oTPersona.getNombres().trim());
            oTPersona.setApppat(oTPersona.getApppat().trim());
            oTPersona.setAppmat(oTPersona.getAppmat().trim());
            oTPersona.setDni(oTPersona.getDni().trim());
            oUsuario.setNombreusuario(oUsuario.getNombreusuario().trim());
            oUsuario.setPassword(oUsuario.getPassword().trim());

            oTPersona.setEstado("1");
            oUsuario.setEstado("1");
            try {
                //String pass =  MD5TEST.md5(oUsuario.getPassword());
                oUsuario.setPassword(MD5TEST.md5(oUsuario.getPassword()));
                rpta = oUsuarioDAO.updateUsuario(oUsuario, oTPersona);

            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }
        return rpta;
    }

    public ArrayList<UsuarioL> ListarUsuario() {
        ArrayList<TUsuario> listTUsuario = oUsuarioDAO.ListarUsuario();
        ArrayList<UsuarioL> listaRetornoUsuarioL = new ArrayList<>();
        for (TUsuario oTUsuario : listTUsuario) {
            UsuarioL oUsuarioL = new UsuarioL();
            oUsuarioL.setIdusuario(oTUsuario.getIdusuario());
            oUsuarioL.setIdrol(oTUsuario.getTRol().getIdrol());
            oUsuarioL.setIdpersona(oTUsuario.getTPersona().getIdpersona());
            oUsuarioL.setNombreusuario(oTUsuario.getNombreusuario());
            oUsuarioL.setPassword(oTUsuario.getPassword());
            oUsuarioL.setNombrerol(oTUsuario.getTRol().getNombrerol());
            oUsuarioL.setNombres(oTUsuario.getTPersona().getNombres());
            oUsuarioL.setApppat(oTUsuario.getTPersona().getApppat());
            oUsuarioL.setAppmat(oTUsuario.getTPersona().getAppmat());
            oUsuarioL.setDni(oTUsuario.getTPersona().getDni());
            oUsuarioL.setTelefono(oTUsuario.getTPersona().getTelefono());
            oUsuarioL.setEmail(oTUsuario.getTPersona().getEmail());
            oUsuarioL.setDireccion(oTUsuario.getTPersona().getDireccion());

            listaRetornoUsuarioL.add(oUsuarioL);
        }
        return listaRetornoUsuarioL;
    }

    public boolean findUpdateUsuario(int idUsuario) {
        boolean rpta = oUsuarioDAO.findUpdateUsuario(idUsuario);
        return rpta;
    }

    public static void main(String[] args) {
        UsuarioBL oUsuarioBL = new UsuarioBL();
        TUsuario oTUsuario = oUsuarioBL.login("admin", "admin");
        System.out.println(oTUsuario.getPassword());
    }

}
