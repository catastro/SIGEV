/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.BL;

import SIGEV.BE.TCaja;
import SIGEV.DAO.CajaDAO;
import SIGEV.DAO.DataAccessLayerException;
import SIGEV.LIST.CajaL;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;


/**
 *
 * @author WINDOWS 8
 */
public class CajaBL {

    CajaDAO oCajaDAO = new CajaDAO();

    public ArrayList<CajaL> buscarCaja(String fechaB) throws DataAccessLayerException, ParseException {
        ArrayList<TCaja> listTCaja = oCajaDAO.buscarCaja(fechaB);
        ArrayList<CajaL> listaRetorno = new ArrayList<>();
        for (TCaja oTCaja : listTCaja) {
                CajaL oCajaL=new CajaL();
                oCajaL.setIdcaja(oTCaja.getIdcaja());
                oCajaL.setFechaarqueo(oTCaja.getFechaarqueo());
                oCajaL.setMonto(oTCaja.getMonto());
                listaRetorno.add(oCajaL);
        }
        return listaRetorno;
    }

}
