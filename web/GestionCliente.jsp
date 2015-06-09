
<div>
    <div>
        <br>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h3 class="text-left">GESTION CLIENTE</h3>
                <hr/>
            </div>
        </div>

        <form id="formBuscarContenedor" style="display: block">
            <div class="row">
                <div class="form-group col-md-4 col-md-2 col-sm-4">
                    <label class="control-label">OPCION BUSQUEDA</label>
                    <select  class="form-control" id="opcionBusquedaCliente" onchange="MostrarDivBusqueda()">
                        <option value="1">Seleccionar...</option>
                        <option value="2">Codigo Cliente</option>                         
                        <option value="3">Datos Personales</option>                         
                        <option value="4">Razon Social</option>                         
                    </select>
                </div>

                <div class="form-group col-md-2 col-sm-4" id="divBusquedaCodigo" style="display: none">
                    <label class="control-label">CODIGO CLIENTE</label>
                    <input id="codigoB" type="text" class="form-control" placeholder="Codigo" >
                </div> 
                <div class="form-group col-md-2 col-sm-4" id="divBusquedaNombres" style="display: none">
                    <label class="control-label">NOMBRES</label>
                    <input id="nombresB" type="text" class="form-control" placeholder="Nombres" >
                </div> 
                <div class="form-group col-md-2 col-sm-4" id="divBusquedaApPaterno" style="display: none">
                    <label class="control-label">APELLIDO PATERNO</label>
                    <input id="apppatB" type="text" class="form-control" placeholder="Apellido Paterno" >
                </div> 
                <div class="form-group col-md-2 col-sm-4" id="divBusquedaApMaterno" style="display: none">
                    <label class="control-label">APELLIDO MATERNO</label>
                    <input id="appmatB" type="text" class="form-control" placeholder="Apellido Materno" >
                </div> 
                <div class="form-group col-md-2 col-sm-4" id="divBusquedaRazonSocial" style="display: none">
                    <label class="control-label">RAZON SOCIAL</label>
                    <input id="razonsocialB" type="text" class="form-control" placeholder="Razon Social" >
                </div> 
                <div class="form-group col-md-1 col-sm-2" id="btnBusquedaProveedor" style="display: none">
                    <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                    <input  type="submit" class="btn btn-primary" value="Buscar" >
                </div>
            </div>
        </form>

        <div class="menuDerecho">
            <div class="btn-group-vertical" role="group" aria-label="...">
                <button id="btnNuevoCliente" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-plus">&nbsp;</span><strong>Nuevo</strong></button>
                <button id="btnActualizarCliente" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-refresh">&nbsp;</span><strong>Actualizar</strong></button>
                <button id="btnEliminarCliente" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-remove">&nbsp;</span><strong>Eliminar</strong></button>
            </div>     
        </div>
        <!--Fin botones menu-->

        <br>


        <div id="BuscarCliente" style="display: block">
            <table id="resultadoBusquedaCliente"></table>
        </div> 
        <div id="NuevoCliente" style="display: none">
            <%@include file="_RegistrarCliente.html" %>
        </div>
        <div id="ActualizarCliente" style="display: none">
            <%@include file="_ActualizarCliente.html" %>
        </div>

    </div>

    <script>
        var idCliente = 0;
        var idPersona = 0;

        $(document).on('ready', function () {
            cargarDatagrid();
        });

        function MostrarDivBusqueda() {
            data = $('#opcionBusquedaCliente').val();
            if (data == '1') {
                $('#divBusquedaCodigo').css({'display': 'none'});
                $('#divBusquedaNombres').css({'display': 'none'});
                $('#divBusquedaApPaterno').css({'display': 'none'});
                $('#divBusquedaApMaterno').css({'display': 'none'});
                $('#divBusquedaRazonSocial').css({'display': 'none'});
                $('#btnBusquedaProveedor').css({'display': 'none'});
            }
            if (data == '2') {
                $('#divBusquedaCodigo').css({'display': 'block'});
                $('#divBusquedaNombres').css({'display': 'none'});
                $('#divBusquedaApPaterno').css({'display': 'none'});
                $('#divBusquedaApMaterno').css({'display': 'none'});
                $('#divBusquedaRazonSocial').css({'display': 'none'});
                $('#btnBusquedaProveedor').css({'display': 'block'});
            }
            if (data == '3') {
                $('#divBusquedaCodigo').css({'display': 'none'});
                $('#divBusquedaNombres').css({'display': 'block'});
                $('#divBusquedaApPaterno').css({'display': 'block'});
                $('#divBusquedaApMaterno').css({'display': 'block'});
                $('#divBusquedaRazonSocial').css({'display': 'none'});
                $('#btnBusquedaProveedor').css({'display': 'block'});
            }
            if (data == '4') {
                $('#divBusquedaCodigo').css({'display': 'none'});
                $('#divBusquedaNombres').css({'display': 'none'});
                $('#divBusquedaApPaterno').css({'display': 'none'});
                $('#divBusquedaApMaterno').css({'display': 'none'});
                $('#divBusquedaRazonSocial').css({'display': 'block'});
                $('#btnBusquedaProveedor').css({'display': 'block'});
            }
        }

        $('#btnNuevoCliente').on('click', function () {
            $('#formRegistroCliente').form("disableValidation");
            $('#NuevoCliente').css({'display': 'block'});
            $('#ActualizarCliente').css({'display': 'none'});
            $('#BuscarCliente').css({'display': 'none'});
            $('#formBuscarContenedor').css({'display': 'none'});
            idCliente = 0;
            idPersona = 0;
        });

        //formulario de actualizar
        $('#btnActualizarCliente').on('click', function () {
            if (idPersona !== 0 && idCliente !== 0) {
                $('#formActualizarClient').form("disableValidation");
                $('#NuevoCliente').css({'display': 'none'});
                $('#ActualizarCliente').css({'display': 'block'});
                $('#BuscarCliente').css({'display': 'none'});
                $('#formBuscarContenedor').css({'display': 'none'});
                MostrarDivActualizar();
            }
            else {
                $.messager.alert('Informacion', 'Por favor seleccione a un Cliente', "info");
            }
        });

        //boton eliminar
        $('#btnEliminarCliente').on('click', function () {
            if (idPersona !== 0 && idPersona !== 0) {
                $.messager.confirm('Confirmacion', '¿Esta Ud. seguro que deseas eliminar?', function (r) {
                    if (r) {
                        //CambiarEstadoCliente();
                        BuscarClienteEnVentas();
                    }
                });
            }
            else {
                $.messager.alert('Informacion', 'Por favor seleccione a un Proveedor', "info");
            }
        });

        $('#btnrstRegistroCliente,#btnrstActualizarCliente').on('click', function () {
            reiniciar();
        });

        function reiniciar() {
            $('#NuevoCliente').css({'display': 'none'});
            $('#ActualizarCliente').css({'display': 'none'});
            $('#BuscarCliente').css({'display': 'block'});
            $('#formBuscarContenedor').css({'display': 'block'});
            idCliente = 0;
            idPersona = 0;
        }

        //campos para la busqueda
        $("#formBuscarContenedor").submit(function () {
            BuscarCliente();
            return false;
        });

        //formulario registro
        $("#formRegistroCliente").submit(function () {
            RegistrarCliente();
            return false;
        });

        //formulario de Actualizar
        $("#formActualizarClient").submit(function () {
            ActualizarCliente();
            return false;
        });

        //Registrar Cliente
        function RegistrarCliente() {
            var persona = {
                codigo: $('#txtCodigo').val(),
                dni: $('#txtDni').val(),
                nombres: $('#txtNombre').val(),
                apppat: $('#txtApePaterno').val(),
                appmat: $('#txtApeMaterno').val(),
                telefono: $('#txttelefono').val(),
                direccion: $('#txtDireccion').val(),
                email: $('#txtemail').val(),
                ruc: $('#txtRuc').val(),
                razonsocial: $('#txtNombreEmpresa').val()
            };
            var cliente = {
                idctipocliente: $('#opcionTipoCliente').val(),
                idctiponegocio: $('#comboGiroNegocio').val(),
                idcfecuenciavisita: $('#comboFrecuenciaVisita').val(),
                idcruta: $('#comboRuta').val(),
                observacion: $('#txtObservacion').val()
            };
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "GestionClienteServlet",
                data: {
                    persona: JSON.stringify(persona),
                    cliente: JSON.stringify(cliente),
                    action: '1'
                },
                success: function (data) {
                    //alert("codigo alumno: " + data);
                    if (data !== "")
                        $.messager.alert('Confirmacion', "Se registro correctamente.\n\
                           El codigo del Cliente es " + data, "info");
                    else
                        $.messager.alert('Error', 'No se pudo registrar', "error");
                    limpiarFormularioRegistrar();
                },
                error: function (e) {
                    //alert('Error: ' + e.message);
                    $.messager.alert('Error', 'No se pudo registrar...', "error");
                }
            });
        }

        //Actualizar Cliente
        function ActualizarCliente() {
            var persona = {
                idpersona: idPersona,
                codigo: $('#txtCodigoActualizar').val(),
                dni: $('#txtDniActualizar').val(),
                nombres: $('#txtNombreActualizar').val(),
                apppat: $('#txtApePaternoActualizar').val(),
                appmat: $('#txtApeMaternoActualizar').val(),
                telefono: $('#txttelefonoActualizar').val(),
                direccion: $('#txtDireccionActualizar').val(),
                ruc: $('#txtRucActualizar').val(),
                razonsocial: $('#txtNombreEmpresaActualizar').val(),
                email: $('#txtemailActualizar').val()
            };
            var cliente = {
                idcliente: idCliente,
                idctipocliente: $('#opcionTipoClienteActualiza').val(),
                idctiponegocio: $('#comboGiroNegocioActualizar').val(),
                idcfecuenciavisita: $('#comboFrecuenciaVisitaActualizar').val(),
                idcruta: $('#comboRutaActualizar').val(),
                observacion: $('#txtObservacionActualizar').val()
            };

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "GestionClienteServlet",
                data: {
                    persona: JSON.stringify(persona),
                    cliente: JSON.stringify(cliente),
                    action: '2'
                },
                success: function (data) {
                    if (data !== "")
                        $.messager.alert('Confirmacion', "Se actualizo correctamente", "info");
                    else
                        $.messager.alert('Error', 'No se pudo actualizo', "error");
                    reiniciar();
                    BuscarCliente();
                    limpiarFormularioActualizar();
                },
                error: function (e) {
                    //alert('Error: ' + e.message);
                    $.messager.alert('Error', 'No se pudo actualizo...', "error");
                }

            });
        }

        //Cambiar estado Cliente    
        function CambiarEstadoCliente() {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "GestionClienteServlet",
                data: {
                    idpersona: idPersona,
                    idcliente: idCliente,
                    estado: "0",
                    action: '3'
                },
                success: function (data) {
                    if (data === true)
                        $.messager.alert('Confirmacion', 'Se Elimino correctamente', "info");
                    else
                        $.messager.alert('Error', 'No se pudo Elminiar', "error");
                    reiniciar();
                    BuscarCliente();
                },
                error: function (e) {
                    $.messager.alert('Error', 'No se pudo Elminiar..', "error");
                }
            });
        }

        //Buscar Cliente en Ventas
        function BuscarClienteEnVentas() {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "GestionClienteServlet",
                data: {
                    idcliente: idCliente,
                    action: '4'
                },
                success: function (data) {
                    if (data === true)
                        $.messager.alert('Confirmacion', 'El Cliente tiene Operaciones y No se pordra Eliminar', "info");
                    else
                        //$.messager.alert('Error', 'Normal elimina', "error");
                        CambiarEstadoCliente();
                    reiniciar();
                    BuscarCliente();
                },
                error: function (e) {
                    $.messager.alert('Error', 'Normal elimina ... ', "error");
                }
            });
        }

        function BuscarCliente() {
            idCliente = 0;
            idPersona = 0;
            var object = {
                codigo: $('#codigoB').val(),
                nombres: $('#nombresB').val(),
                apppat: $('#apppatB').val(),
                appmat: $('#appmatB').val(),
                razonsocial: $('#razonsocialB').val(),
                action: '5'
            };
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "GestionClienteServlet",
                data: object,
                success: function (data) {
                    //alert("ok");
                    //alert(JSON.stringify(data));
                    if (data.length === 0)
                        $.messager.alert('Informacion', 'No se encontro ningun cliente con los datos de busqueda', "warning");
                    $("#resultadoBusquedaCliente").datagrid({data: data});
                    $("#resultadoBusquedaCliente").datagrid('unselectAll');
                },
                error: function (e) {
                    //alert('Error: ' + e.toString());
                    $.messager.alert('Informacion', 'No se encontro ningun cliente con los datos de busqueda', "warning");
                }
            });
        }

        function cargarDatagrid() {
            $("#resultadoBusquedaCliente").datagrid({
                url: '',
                title: 'RESULTADO DE BUSQUEDA DE CLIENTES',
                loadMsg: "Cargando Datos",
                columns: [[
                        {field: 'codigo', title: 'CODIGO', align: "center", width: 75, sortable: true, resizable: true, hidden: false},
                        {field: 'documento', title: 'DNI / RUC', align: "center", width: 85, sortable: true, resizable: true},
                        {field: 'nombrRazon', title: 'APELLIDOS Y NOMBRES / RAZON SOCIAL', width: 200, align: 'left', sortable: true, resizable: true},
                        {field: 'telefono', title: 'TELEFONO', width: 75, align: 'center', sortable: true, resizable: true, hidden: false},
                        {field: 'direccion', title: 'DIRECCION', width: 170, align: 'left', sortable: true, resizable: true, hidden: false},
                        {field: 'email', title: 'CORREO ELECTRONICO', width: 170, align: 'left', sortable: true, resizable: true, hidden: false},
                        {field: 'ruta', title: 'RUTA', width: 75, align: 'center', sortable: true, resizable: true, hidden: false},
                        {field: 'fecuenciavisita', title: 'FREC. DE VISITA', width: 130, align: 'center', sortable: true, resizable: true, hidden: false},
                        {field: 'tiponegocio', title: 'TIPO NEGOCIO', width: 100, align: 'center', sortable: true, resizable: true, hidden: false},
                        {field: 'tipocliente', title: 'TIPO CLIENTE', width: 100, align: 'center', sortable: true, resizable: true, hidden: false}
                    ]],
                onClickRow: function (rowid, rowdata) {
                    $('#opcionTipoClienteActualiza').val(rowdata.idctipocliente);
                    $('#txtCodigoActualizar').val(rowdata.codigo);
                    $('#txtDniActualizar').val(rowdata.dni);
                    $('#txtNombreActualizar').val(rowdata.nombres);
                    $('#txtApePaternoActualizar').val(rowdata.apppat);
                    $('#txtApeMaternoActualizar').val(rowdata.appmat);
                    $('#txttelefonoActualizar').val(rowdata.telefono);
                    $('#txtDireccionActualizar').val(rowdata.direccion);
                    $('#txtemailActualizar').val(rowdata.email);
                    $('#txtRucActualizar').val(rowdata.ruc);
                    $('#txtNombreEmpresaActualizar').val(rowdata.razonsocial);
                    $('#comboGiroNegocioActualizar').val(rowdata.idctiponegocio);
                    $('#comboFrecuenciaVisitaActualizar').val(rowdata.idcfecuenciavisita);
                    $('#comboRutaActualizar').val(rowdata.idcruta);
                    $('#txtObservacionActualizar').val(rowdata.observacionpro);
                    idCliente = rowdata.idcliente;
                    idPersona = rowdata.idpersona;

                    /*$('#formActualizarCliente').form("disableValidation");
                     $('#ActualizarCliente').css({'display': 'block'});
                     MostrarDivActualizar();*/
                },
                singleSelect: true,
                height: 400,
                nowrap: true,
                striped: true,
                collapsible: true,
                rownumbers: true,
                remoteSort: false,
                rowNumbers: true,
                idField: 'idPersona',
                pagination: false
            });
        }

        function limpiarFormularioRegistrar() {
            $('#txtCodigo').val("");
            $('#txtDni').val("");
            $('#txtNombre').val("");
            $('#txtApePaterno').val("");
            $('#txtApeMaterno').val("");
            $('#txttelefono').val("");
            $('#txtDireccion').val("");
            $('#txtemail').val("");
            $('#txtRuc').val("");
            $('#txtNombreEmpresa').val("");
            //$('#opcionTipoCliente').val("");
            /*$('#comboGiroNegocio').val("");
             $('#comboFrecuenciaVisita').val("");
             $('#comboRuta').val("");*/
            $('#txtObservacion').val("");
            idCliente = 0;
            idPersona = 0;
        }

        function limpiarFormularioActualizar() {
            $('#txtCodigoActualizar').val("");
            $('#txtDniActualizar').val("");
            $('#txtNombreActualizar').val("");
            $('#txtApePaternoActualizar').val("");
            $('#txtApeMaternoActualizar').val("");
            $('#txttelefonoActualizar').val("");
            $('#txtDireccionActualizar').val("");
            $('#txtemailActualizar').val("");
            $('#txtRucActualizar').val("");
            $('#txtNombreEmpresaActualizar').val("");
            //$('#opcionTipoClienteActualizar').val("");
            /*$('#comboGiroNegocioActualizar').val("");
             $('#comboFrecuenciaVisitaActualizar').val("");
             $('#comboRutaActualizar').val("");*/
            $('#txtObservacionActualizar').val("");
            idCliente = 0;
            idPersona = 0;
        }
    </script>




