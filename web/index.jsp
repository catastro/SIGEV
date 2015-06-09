<%@page import="com.google.common.base.Strings"%>
<!DOCTYPE html>
<%       
    
    String mensaje = !Strings.isNullOrEmpty(request.getParameter("msj")) ? request.getParameter("msj") : "";
    
    
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Sistema de Control de Asistencia</title>
        <link rel="stylesheet" type="text/css" href="Content/Bootstrap/bootstrap.css">
        <script type="text/javascript" src="Content/Angular/angular.min.js"></script>
        <script type="text/javascript" src="Content/Angular/angular-route.min.js"></script>

        <style>
            body {
                background-color: #96afbe;
            }
            .header {
                height: 50px;
                background-color: write;
            }

            .section {
                background-color: #cbbcaf;
                background-image: url("Content/Image/2.png");
                height: 400px;
                color: black;				
            }

            .marco {
                /*border: 2px solid #333;*/
            }

            .login {
                background-color: #fefefe;
                border-radius: 5px;
                margin-top: 50px;
                color: black;
            }
            
            .front-bg {
                position: fixed;
                width: 200%;
                height: 200%;
                background: #000;
                left: -50%;
            }

        </style>
    </head>
    <body>

        <div class="container-fluid">
            <div class="header">

            </div>

            <div class="nav">

            </div>

            <div class="section">	

                <div class="row container">
                    <div class="col-md-5 col-md-offset-3 marco">
                        <h1><strong>Sistema de Gestion de Ventas SIGEV</strong></h1>

                        <h2>
                            						
                        </h2>

                        <p><strong>Contactenos: 988400355 :)</strong></p>

                    </div>
                    <div class="col-md-3 marco login">
                        <form method="POST" action="IndexServlet">
                        <br>
                        <div class="form-group">
                            <strong>Usuario</strong>
                            <input type="text" class="form-control" name="usuario" id="usuario" placeholder="Ingrese usuario">
                        </div>
                        <div class="form-group">
                            <strong>Password</strong>
                            <input type="password" class="form-control"  name="pass"  id="pass" placeholder="Ingrese password">
                        </div>
                        <input type="submit" value="Ingresar" class="btn btn-primary"/>
                        <p><%=mensaje%></p>
                        <br>	
                        <br>					
                        </form>
                    </div>
                </div>
            </div>

            <div class="footer">

            </div>
        </div>


        <script src="Content/Bootstrap/bootstrap.min.js"></script>

    </body>
</html>