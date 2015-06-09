<%-- 
    Document   : Principal
    Created on : 25/02/2015, 12:47:20 PM
    Author     : QUIQUE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd"> 

<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 

<%
    /*Parametros para realizar la conexión*/
    Connection conexion;
    Class.forName("org.postgresql.Driver").newInstance();
    conexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/AcademiaBD", "postgres", "123456");

    /*Establecemos la ruta del reporte*/
    File reportFile = new File(application.getRealPath("Reportes//ReporteAsistencia.jasper"));

    /* No enviamos parámetros porque nuestro reporte no los necesita asi que escriba cualquier 
     cadena de texto ya que solo seguiremos el formato del método runReportToPdf*/
    Map parameters = new HashMap();
    parameters.put("Nombre_parametro", "Valor_Parametro");

    /*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/
    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters,
            conexion);

    /*Indicamos que la respuesta va a ser en formato PDF*/
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes, 0, bytes.length);

    /*Limpiamos y cerramos flujos de salida*/
    ouputStream.flush();
    ouputStream.close();
%>
<!DOCTYPE html>
<%--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
--%>