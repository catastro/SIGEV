<%-- 
    Document   : ReporteSalon
    Created on : 28/03/2015, 07:43:51 AM
    Author     : davis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 

<%
    /*Parametros para realizar la conexión*/
    Connection conexion;
    //Class.forName("org.postgresql.Driver").newInstance();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    //conexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/AquilesDB2", "postgres", "123456");
    //conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/aquilesdb?zeroDateTimeBehavior=convertToNull", "root", "");
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/calipsodb", "root", "");
    /*Establecemos la ruta del reporte*/
    File reportFile = new File(application.getRealPath("//Reportes//BoletaVenta.jasper"));

    String aux = request.getParameter("idVenta");
    Map parameters = new HashMap();
    parameters.put("idVenta", Integer.parseInt(aux));
    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters,
            conexion);

    /*Indicamos que la respuesta va a ser en formato PDF*/
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    //response.setHeader("Content-Disposition","attachment; filename=\"reporte.pdf\";");
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes, 0, bytes.length);

    /*Limpiamos y cerramos flujos de salida*/
    ouputStream.flush();
    ouputStream.close();
%>

<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
        <title>JSP Page</title>
    </head>
   <body>
        <h1>Hello World!</h1>
    
        <a href="javascript:alert('<%=request.getParameter("idVenta")%>')" target="_blank"></a>
    </body>
</html>
