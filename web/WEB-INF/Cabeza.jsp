<!DOCTYPE html>
<%
    String nombreUsuario = (String) session.getAttribute("usuarioNombre");
    
%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link href="img/LogoFalcons.ico" rel="icon" type="image/x-icon">-->
        <title>SIGEV</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap -->
        
        <link rel="stylesheet" type="text/css" href="Content/Bootstrap/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="Content/Bootstrap/style.css">
        <link type="text/css" rel="stylesheet" href="css/jquery-ui.css"/>

        <!-- Para Formato de fecha -->
        <script type="text/javascript" src="js/jquery-1.9.1.js"></script>                
        <script type="text/javascript" src="Content/Bootstrap/bootstrap.min.js"></script>        
        <script type="text/javascript" src="js/jquery-ui.js"></script>    
        
         <!-- Para Formato de hora  aa -->
       <script src="js/jquery.timepicker.js" type="text/javascript"></script>
        <link href="css/jquery.timepicker.css" rel="stylesheet" type="text/css"/>
        
        <script type="text/javascript" src="Content/Easyui/jquery.easyui.min.js"></script>       
        <script src="Content/Easyui/datagrid-detailview.js" type="text/javascript"></script>
        
        <link rel="stylesheet" type="text/css" href="Content/Easyui/themes/default/easyui.css">        
        <link rel="stylesheet" type="text/css" href="Content/Easyui/themes/color.css">
        <link rel="stylesheet" type="text/css" href="Content/Easyui/themes/icon.css">      
        
        <style type="text/css" media="print">
            @media print {
                .menuDerecho {display:none;}
                .elementos{display:none;}
                #divBuscarExamen{width: 100%;}
                //#parte2 {display:none;}
            }
        </style>

        <script>
            var menuGestionarUsuario = 19;
        </script>

        <script>

            $(document).ready(function () {
                var bandera = 0;
                $('.mostrarOcultar').on('click', function () {
                    if (bandera == 0) {
                        $('.mostrarOcultar span').removeClass("glyphicon glyphicon-hand-right");
                        $('.mostrarOcultar span').addClass("glyphicon glyphicon-hand-left");
                        bandera = 1;
                        $('.menuDerecho').addClass("menuDerechoPequeño");
                        $('.menuDerecho').removeClass("menuDerecho");
                    }
                    else {
                        $('.mostrarOcultar span').removeClass("glyphicon glyphicon-hand-left");
                        $('.mostrarOcultar span').addClass("glyphicon glyphicon-hand-right");
                        bandera = 0;
                        $('.menuDerechoPequeño').addClass("menuDerecho");
                        $('.menuDerechoPequeño').removeClass("menuDerechoPequeño");
                    }
                    /*     .menuDerecho{
                     position:  fixed;
                     top: 250px;
                     right: 0;
                     z-index: 1030
                     }*/
                });
            });



            function listarCombos(idTabla, cbLista) {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "GestionContenedorServlet",
                    data: {idTabla: idTabla},
                    success: function (response) {
                        //alert(response);
                        for (var i = 0; i < response.length; i++)
                        {
                            $("#" + cbLista).append("<option value=" + response[i].idcontenedor + ">" + response[i].denominacion + "</option>");
                        }
                    },
                    error: function (error) {
                        alert(error.toString());
                    }
                });
            }

           
            /*
             $.ajax({
             type: 'post',
             url: 'PrincipalServlet',
             dataType: "json",
             data: {
             action: '1'
             },
             success: function (data) {
             var html = "";
             jQuery.each(data, function (i, val) {
             
             if (i === 0) {
             html = html +
             "<li class='dropdown'><a class='dropdown-toggle btn' data-toggle='dropdown'>" +
             val.TMenu.denominacion + "<b class='caret'></b></a><ul class='dropdown-menu'>";
             } else {
             
             if (val.TMenu.idsuperior !== 0)
             html = html + "<li><a href='" + val.TMenu.observacion + "'>" + val.TMenu.denominacion + "</a></li>";
             else {
             html = html +
             "</ul></li><li class='dropdown'><a class='dropdown-toggle btn' data-toggle='dropdown'>" +
             val.TMenu.denominacion + "<b class='caret'></b></a><ul class='dropdown-menu'>";
             }
             }
             });
             html = html + "</ul></li>";
             $('#nav-bar-nav').html(html);
             },
             error: function (e) {
             }
             });
             */
            $.datepicker.regional['es'] = {
                closeText: 'Cerrar',
                prevText: '<Ant',
                nextText: 'Sig>',
                currentText: 'Hoy',
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                weekHeader: 'Sm',
                dateFormat: 'dd/mm/yy',
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: ''
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);

            function mostrar() {
                divC = document.getElementById("div1");
                divC.style.display = "block";
            }



        </script>
        <!--<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>-->

        <script>
            //Lista de Id de la Tabla Contenedor
            var idcEstadoVenta = 1;
            var idCTipoPersonal = 1;
            var idCEstadoPersonal = 2;
            var idCModalidadPago = 3;
            var idRutaAsignada = 4;
      
        </script>
        <script>
            var menuGestionUsuario = 19;
        </script>

        <style>
            html {           
                background-image:  url("Content/Image/fondo.png");            
            }
            body {
                background-image: url("Content/Image/fondo.png");
                /*background-color: #7ab6cf;*/
            }
            .header {
                background-color: #896054; /*#2f7d9c;/*#9ec2fe*/
                height: 100px;
                border-bottom: 2px solid #ffffff;
            }

            .section {
                height: auto;
                margin-top: -10px;
                background-color: #ffffff;
                padding: 20px;
                margin-bottom: 15px;
                border-radius: 8px;
            }

            .footer {
                background-color: #896054; /*#2f7d9c;/*70ae3f*#2f7d9c;/*#273138;#464646;#4396b8*/
                height: 100px;
                border-top: 2px solid #ffffff;
                /*background-image: url("Image/imgFooter.png");*/
            }

            .logo {
                margin: 0 auto;
                margin-left: 85px;
            }

            .navegador {
                /*background-color: #f8f8f8;ffffff*/
                height: auto;
                margin: 0 auto;
                padding: 0px;

            }

            .claseObligatorio{
                color:#df030d;
            }

            .menuDerecho{
                position:  fixed;
                top: 250px;
                right: 0;
                z-index: 100
            }

            .menuDerechoPequeño{
                position:  fixed;
                top: 250px;
                right: -100%;
                z-index: 100
            }

            .btnMenuDerecho{
                margin:  5px;
                text-align: left;
            }
            .mostrarOcultar{
                position:  fixed;
                top: 225px;
                right: 0;
                z-index: 100;
                background: none;
                border: 0px;
            }

        </style>
    </head>
    <body> 

        <br>
        <br>


        <!--Navegador-->
        <div class="container" style="max-width: 1170px;padding: 0px">
            <nav class="navbar navbar-fixed-top" style="
                 color: #3f3f3f;                 
                 background: -webkit-linear-gradient(top, #2b598b 0%, #5089c9 100%);
                 background: linear-gradient(top, #2b598b 0%, #5089c9 100%);
                 background: -moz-linear-gradient(top, #2b598b 0%, #5089c9 100%);" >

                <div class="container-fluid" >
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a href="#"  class="navbar-brand" style="color:#fff">KARINTO</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav" id="nav-bar-nav">
                            <li class="dropdown">
                                <a class="dropdown-toggle btn" data-toggle="dropdown">Almacen<b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="GestionProducto.jsp">Gestion producto</a></li>                                       
                                    <li><a href="GestionCompra.jsp">Gestion Compra</a></li>
                                    <li><a href="ValorizacionAlmacen.jsp">Valorizacion de Almacen</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle btn" data-toggle="dropdown">Caja<b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="GestionCaja.jsp">Gestion Caja</a></li>                                       
                                    <li><a href="GestionBoveda.jsp">Gestion Boveda</a></li>

                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle btn" data-toggle="dropdown">Ventas<b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="GestionVentas.jsp">Gestion Ventas</a></li>                                       

                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle btn" data-toggle="dropdown">Admnistracion<b class="caret"></b></a>
                                <ul class="dropdown-menu">


                                    <li><a href="GestionCliente.jsp">Gestion Cliente</a></li>
                                    <li><a href="GestionProveedor.jsp">Gestion Proveedor</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle btn" data-toggle="dropdown">Potencial Humano<b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="GestionPersonal.jsp">Gestion Personal</a></li>                                       
                                    <li><a href="GestionPagos.html">Gestion Pagos</a></li>
                                    <li><a href="GestionAsistencia.jsp">Gestion Asistencia</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle btn" data-toggle="dropdown">Seguridad<b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="GestionUsuario.jsp">Gestion Usuarios</a></li>                                       
                                    <li><a href="GestionTablas.jsp">Gestion Tablas</a></li>
                                    <li><a href="LogOut.jsp">Log Out</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle btn" data-toggle="dropdown">Graficos y estadisticas<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Ganancias y Perdidas</a></li>                                       
                                    <li><a href="#">Record de cliente</a></li>                                    
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><span><%=nombreUsuario%></span></a></li>
                            <li><a href="#"><span> </span></a></li>

                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>

        <!--Contenido-->
        <div class="section container">
            <!--<div data-ng-view></div>--> 

            <!--<div class="row">
                <div class="form-group col-offset-md-8  col-md-2 col-sm-4">
                    <label class="control-label">Ciclo Academico</label>
                    <select class="form-control" id="cmbCicloAcademicoActual" >
                    </select>
                </div>
            </div>

            <div style="display: block;">
                <input type="text" id="txtCicloAcademicoActual">
            </div>-->




