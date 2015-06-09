/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIGEV.UTIL;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author davis
 */
public class Fecha {
    
     Calendar fecha = new GregorianCalendar();
        int año = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        int hora = fecha.get(Calendar.HOUR_OF_DAY);
        int minuto = fecha.get(Calendar.MINUTE);
        int segundo = fecha.get(Calendar.SECOND);
        
          //este metodo resta dos fechas y calcula en dias
        public int diferenciaFechas(Date fechaHasta, Date fechaCaducidad){
            final long MILLSECS_PER_DAY = 24 * 60 * 60 * 1000; //Milisegundos al dÃ­a 
            long diferencia = -1*( fechaHasta.getTime() - fechaCaducidad.getTime() )/MILLSECS_PER_DAY;
            System.out.println(diferencia); 
            return  (int)diferencia;
        }
        
        public java.sql.Date  obtenerFechaActual (){
            String fechaSt= dia + "/" + (mes + 1) + "/" + año;
            java.util.Date fechaActualizacion = convertStringToDate(fechaSt);
            java.sql.Date sqlDateActualizacion = new java.sql.Date(fechaActualizacion.getTime());
            return sqlDateActualizacion;
        }
        
        
         public java.util.Date convertStringToDate(String fecha) {
        java.util.Date dato = null;
        try {
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
            dato = formato.parse(fecha);

        } catch (ParseException e) {
            System.out.println(" error en fechas " + e);
        }
        return dato;
    }
         
     public int restarFechas(Date fechaHasta, Date fechaCaducidad){
           
           int dias=0;
           try {
               
               int diasIntermendios=0;
               
               if (fechaHasta.getMonth()>fechaCaducidad.getMonth()) {
                   
                   for (int i = (fechaCaducidad.getMonth() +2); i < (fechaHasta.getMonth()+1); i++) {
                    diasIntermendios+= obtenerDias(i);
                    
                       System.out.println("intermedios "+diasIntermendios);
               }
                   System.out.println("intermedios "+diasIntermendios);
                   System.out.println("");
                   
                     dias=(-1)* (obtenerDias(fechaCaducidad.getMonth()+1) - fechaCaducidad.getDate() + diasIntermendios + fechaHasta.getDate() );
                
               
               }
               if ( fechaHasta.getMonth()==fechaCaducidad.getMonth()) {
                   
//                   if (fechaHasta.getDate() > fechaCaducidad.getDate()) {
//                       dias= fechaHasta.getDate() - fechaCaducidad.getDate();
//                   }
//                   else{
                       dias= fechaCaducidad.getDate()-fechaHasta.getDate();
//                   }
               }
               if (fechaCaducidad.getMonth()>fechaHasta.getMonth()) {
                   
                   for (int i = (fechaHasta.getMonth() +2); i < (fechaCaducidad.getMonth()+1); i++) {
                    diasIntermendios+= obtenerDias(i);
                    
                       System.out.println("intermedios "+diasIntermendios);
               }
                   System.out.println("intermedios "+diasIntermendios);
                   
                     dias= obtenerDias(fechaHasta.getMonth()+1) - fechaHasta.getDate() + diasIntermendios + fechaCaducidad.getDate() ;
                
               
               }
               
               
           } catch (Exception e) {
               System.out.println(e.toString());
           }
           
           return dias;
       }
       
       public int obtenerDias(int  mesFecha){
       // int mes= fecha.getMonth();
               
        int result;
        switch (mesFecha) {
            case 1: {
                result = 31;
                break;
            }
            case 2: {
                if ( new Fecha().obtenerFechaActual().getYear()==2016 ||
                    new Fecha().obtenerFechaActual().getYear()==2020 || 
                    new Fecha().obtenerFechaActual().getYear()==2024)
                    {
                         result = 29;   
                    }
                else{
                    result = 28;
                }
                break;
            }
            case 3: {
                result = 31;
                break;
            }
            case 4: {
                result = 30;
                break;
            }
            case 5: {
                result = 31;
                break;
            }
            case 6: {
                result = 30;
                break;
            }
            case 7: {
                result = 31;
                break;
            }
            case 8: {
                result = 31;
                break;
            }
            case 9: {
                result = 30;
                break;
            }
            case 10: {
                result = 31;
                break;
            }
            case 11: {
                result = 30;
                break;
            }
            case 12: {
                result = 31;
                break;
            }
            default: {
                result = 0;
                break;
            }
        }
        return result;
             
       }     
       
    /*   public static void main(String[] args) {
           String fecha1= "10/05/2015";
           String fecha2= "8/05/2015";
           
           Date f1= new Fecha().convertStringToDate(fecha1);
           Date f2= new Fecha().convertStringToDate(fecha2);
           System.out.println("deifernecia: "+new Fecha().diferenciaFechas(f1, f2));
    }   */
    
}
