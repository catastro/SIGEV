
<div>
    <div>
        <br>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h3 class="text-left">GESTION PROVEEDOR</h3>
                <hr/>
            </div>
        </div>

        <form id="formBuscarContenedor" style="display: block">
            <div class="row">
                <div class="form-group col-md-4 col-md-2 col-sm-4">
                    <label class="control-label">OPCION BUSQUEDA</label>
                    <select  class="form-control" id="opcionBusquedaProveedor" onchange="MostrarDivBusqueda()">
                        <option value="1">Seleccionar...</option>
                        <option value="2">Codigo Proveeedor</option>                         
                        <option value="3">Datos Personales</option>                         
                        <option value="4">Razon Social</option>                         
                    </select>
                </div>

                <div class="form-group col-md-2 col-sm-4" id="divBusquedaCodigo" style="display: none">
                    <label class="control-label">CODIGO PROVEEDOR</label>
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
                <button id="btnNuevoProveedor" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-plus">&nbsp;</span><strong>Nuevo</strong></button>
                <button id="btnActualizarProveedor" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-refresh">&nbsp;</span><strong>Actualizar</strong></button>
                <button id="btnEliminarProveedor" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-remove">&nbsp;</span><strong>Eliminar</strong></button>
            </div>     
        </div>
        <!--Fin botones menu-->

        <br>

        <div id="BuscarProveedor" style="display: block">
            <table id="resultadoBusquedaProveedor"></table>
        </div> 
        <div id="NuevoProveedor" style="display: none">
            <%@include file="_RegistrarProveedor.html" %>
        </div>
        <div id="ActualizarProveedor" style="display: none">
            <%@include file="_ActualizarProveedor.html" %>
        </div>

    </div>

    <script>
        var idProveedor = 0;
        var idPersona = 0;

        $(document).on('ready', function () {
            cargarDatagrid();
        });

        function MostrarDivBusqueda() {
            data = $('#opcionBusquedaProveedor').val();
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

        $('#btnNuevoProveedor').on('click', function () {
            $('#formRegistroProveedor').form("disableValidation");
            $('#NuevoProveedor').css({'display': 'block'});
            $('#ActualizarProveedor').css({'display': 'none'});
            $('#BuscarProveedor').css({'display': 'none'});
            $('#formBuscarContenedor').css({'display': 'none'});
            idProveedor = 0;
            idPersona = 0;
        });

        //formulario de actualizar
        $('#btnActualizarProveedor').on('click', function () {
            if (idPersona !== 0 && idProveedor !== 0) {
                $('#formActualizarProveedor').form("disableValidation");
                $('#NuevoProveedor').css({'display': 'none'});
                $('#ActualizarProveedor').css({'display': 'block'});
                $('#BuscarProveedor').css({'display': 'none'});
                $('#formBuscarContenedor').css({'display': 'none'});
                MostrarDivActualizar();
            }
            else {
                $.messager.alert('Informacion', 'Por favor seleccione a un Proveedor', "info");
            }
        });

        //boton eliminar
        $('#btnEliminarProveedor').on('click', function () {
            if (idPersona !== 0 && idProveedor !== 0) {
                $.messager.confirm('Confirmacion', '¿Esta Ud. seguro que deseas eliminar?', function (r) {
                    if (r) {
                        //CambiarEstadoProveedor();
                        BuscarProveedorEnCompra();
                    }
                });
            }
            else {
                $.messager.alert('Informacion', 'Por favor seleccione a un Proveedor', "info");
            }
        });

        $('#btnrstRegistroProveedor,#btnrstActualizarProveedor').on('click', function () {
            reiniciar();
        });

        function reiniciar() {
            $('#NuevoProveedor').css({'display': 'none'});
            $('#ActualizarProveedor').css({'display': 'none'});
            $('#BuscarProveedor').css({'display': 'block'});
            $('#formBuscarContenedor').css({'display': 'block'});
            idProveedor = 0;
            idPersona = 0;
        }

        //campos para la busqueda
        $("#formBuscarContenedor").submit(function () {
            BuscarProveedor();
            return false;
        });

        //formulario de registro
        $("#formRegistroProveedor").submit(function () {
            RegistrarProveedor();
            return false;
        });

        //formulario de Actualizar
        $("#formActualizarProveedor").submit(function () {
            ActualizarProveedor();
            return false;
        });

        //Registrar Proveedor
        function RegistrarProveedor() {
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
            var proveedor = {
                idctipoproveedor: $('#opcionTipoProveedor').val(),
                observacion: $('#txtObservacion').val()
            };
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "GestionProveedorServlet",
                data: {
                    persona: JSON.stringify(persona),
                    proveedor: JSON.stringify(proveedor),
                    action: '1'
                },
                success: function (data) {
                    //alert("codigo alumno: " + data);
                    if (data !== "")
                        $.messager.alert('Confirmacion', "Se registro correctamente.\n\
                           El codigo del Cliente es " + data, "info");
                    else
                        $.messager.alert('Error', 'No se pudo registrar', "error");
                    //reiniciar();
                    limpiarFormularioRegistrar();
                },
                error: function (e) {
                    //alert('Error: ' + e.message);
                    $.messager.alert('Error', 'No se pudo registrar', "error");
                }
            });
        }

        //Actualizar Proveedor    
        function ActualizarProveedor() {
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
            var proveedor = {
                idproveedor: idProveedor,
                idctipoproveedor: $('#opcionTipoProveedorActualizar').val(),
                observacion: $('#txtObservacionActualizar').val()
            };
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "GestionProveedorServlet",
                data: {
                    persona: JSON.stringify(persona),
                    proveedor: JSON.stringify(proveedor),
                    /*idpersona: idPersona,
                     codigo: $('#txtCodigoActualizar').val(),
                     dni: $('#txtDniActualizar').val(),
                     nombres: $('#txtNombreActualizar').val(),
                     apppat: $('#txtApePaternoActualizar').val(),
                     appmat: $('#txtApeMaternoActualizar').val(),
                     telefono: $('#txttelefonoActualizar').val(),
                     direccion: $('#txtDireccionActualizar').val(),
                     email: $('#txtemailActualizar').val(),
                     idproveedor: idProveedor,
                     opcionTipoProveedor: $('#opcionTipoProveedorActualizar').val(),
                     ruc: $('#txtRucActualizar').val(),
                     NombreEmpresa: $('#txtNombreEmpresaActualizar').val(),
                     Observacion: $('#txtObservacionActualizar').val(),*/
                    action: '2'
                },
                success: function (data) {
                    if (data === true)
                        $.messager.alert('Confirmacion', 'Se actualizo correctamente', "info");
                    else
                        $.messager.alert('Error', 'No se pudo actualizar', "error");
                    reiniciar();
                    BuscarProveedor();
                    limpiarFormularioActualizar();
                },
                error: function (e) {
                    $.messager.alert('Error', 'No se pudo actualizar', "error");
                }
            });
        }

        //Cambiar estado Proveedor    
        function CambiarEstadoProveedor() {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "GestionProveedorServlet",
                data: {
                    idpersona: idPersona,
                    idproveedor: idProveedor,
                    estado: "0",
                    action: '3'
                },
                success: function (data) {
                    if (data === true)
                        $.messager.alert('Confirmacion', 'Se Elimino correctamente', "info");
                    else
                        $.messager.alert('Error', 'No se pudo Elminiar', "error");
                    BuscarProveedor();
                    reiniciar();
                },
                error: function (e) {
                    $.messager.alert('Error', 'No se pudo Elminiar..', "error");
                }
            });
        }

        //Buscar Proveedor en Compras
        function BuscarProveedorEnCompra() {    
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "GestionProveedorServlet",
                data: {
                    idproveedor: idProveedor,
                    action: '4'
                },
                success: function (data) {
                    if (data === true)
                        $.messager.alert('Confirmacion', 'El Proveedor tiene Operaciones y No se pordra Eliminar', "info");
                    else
                        //$.messager.alert('Error', 'Normal elimina', "error");
                        CambiarEstadoProveedor();
                    reiniciar();
                    BuscarProveedor();
                },
                error: function (e) {
                    $.messager.alert('Error', 'Normal elimina ... ', "error");
                }
            });
        }

        function BuscarProveedor() {
            idProveedor = 0;
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
                url: "GestionProveedorServlet",
                data: object,
                success: function (data) {
                    //alert("ok");
                    //alert(JSON.stringify(data));
                    if (data.length === 0)
                        $.messager.alert('Informacion', 'No se encontro ningun proveedor con los datos de busqueda', "warning");
                    $("#resultadoBusquedaProveedor").datagrid({data: data});
                    $("#resultadoBusquedaProveedor").datagrid('unselectAll');
                },
                error: function (e) {
                    //alert('Error: ' + e.toString());
                    $.messager.alert('Informacion', 'No se encontro ningun alumno con los datos de busqueda', "warning");
                }
            });
        }

        function cargarDatagrid() {
            $("#resultadoBusquedaProveedor").datagrid({
                url: '',
                title: 'RESULTADO DE LA BUSQUEDA DE PROVEEDORES',
                loadMsg: "Cargando Datos",
                columns: [[
                        {field: 'codigo', title: 'CODIGO', align: "center", width: 75, sortable: true, resizable: true, hidden: false},
                        {field: 'documento', title: 'DNI / RUC', align: "center", width: 85, sortable: true, resizable: true},
                        {field: 'nombrRazon', title: 'APELLIDOS Y NOMBRES / RAZON SOCIAL', width: 300, align: 'left', sortable: true, resizable: true},
                        //{field: 'apppat', title: 'AP. PATERNO', width: 130, align: 'center', sortable: true, resizable: true},
                        //{field: 'appmat', title: 'AP. MATERNO', width: 130, align: 'center', sortable: true, resizable: true},
                        {field: 'telefono', title: 'TELEFONO', width: 75, align: 'center', sortable: true, resizable: true, hidden: false},
                        {field: 'direccion', title: 'DIRECCION', width: 210, align: 'left', sortable: true, resizable: true, hidden: false},
                        {field: 'email', title: 'CORREO ELECTRONICO', width: 220, align: 'left', sortable: true, resizable: true, hidden: false},
                        {field: 'tipoproveedor', title: 'TIPO PROVEEDOR', width: 120, align: 'center', sortable: true, resizable: true, hidden: false}
                    ]],
                onClickRow: function (rowid, rowdata) {
                    $('#opcionTipoProveedorActualizar').val(rowdata.idctipoproveedor);
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
                    $('#txtObservacionActualizar').val(rowdata.observacionpro);
                    idPersona = rowdata.idpersona;
                    idProveedor = rowdata.idproveedor;

                    /*$('#formActualizarProveedor').form("disableValidation");
                     $('#ActualizarProveedor').css({'display': 'block'});
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
            $('#txtObservacion').val("");
            idProveedor = 0;
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
            $('#txtObservacionActualizar').val("");
            idProveedor = 0;
            idPersona = 0;
        }
    </script>