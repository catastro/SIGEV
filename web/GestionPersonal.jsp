    

<div >
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h3 class="text-left">Gestion Personal</h3>

            </div>
        </div>

        <form id="formBuscarPersonal">
            <div class="row">
                <div class="form-group col-md-2 col-sm-2" id="opcionNombre" >
                    <label  class="control-label">Nombre</label>
                    <input id="txtNombreBusqueda" type="text" class="form-control" onKeyUp="this.value=this.value.toUpperCase();"/>
                </div>
                <div class="form-group col-md-2 col-sm-2"  id="opcionApPaterno" >
                    <label  class="control-label">Ap. Paterno</label>
                    <input id="txtApPaternoBusqueda" type="text" class="form-control"/>
                </div>
                <div class="form-group col-md-2 col-sm-2"  id="opcionApMaterno">
                    <label  class="control-label">Ap. Materno</label>
                    <input id="txtApMaternoBusqueda" type="text" class="form-control"/>
                </div>
                <div class="form-group col-md-2 col-sm-2">
                    <br/>
                    <input class="btn btn-primary" value="Buscar" type="submit" />
                </div>
            </div>
        </form>
        <div class="menuDerecho">
            <div class="btn-group-vertical" role="group" aria-label="...">

                <button id="btnListaPersonal" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-list">&nbsp;</span><strong>Lista</strong></button>
                <button id="btnNuevoPersonal" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-plus">&nbsp;</span><strong>Nuevo</strong></button>

                <button id="btnActualizarPersonal" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-refresh">&nbsp;</span><strong>Actualizar</strong></button>

                <button id="btnEliminarPersonal" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-remove">&nbsp;</span><strong>Eliminar</strong></button>

            </div>     

        </div>
        <!--Fin botones menu-->

        <br>


        <div id="BuscarPersonal" style="display: block">

            <table id="resultadoBusquedaPersonal"></table>
        </div> 
        <div id="NuevoPersonal" style="display: none">
            <%@include file="_RegistroPersonal.html" %>
        </div>
        <div id="ActualizarPersonal" style="display: none">
            <%@include file="_ActualizarPersonal.html" %>    
        </div>

    </div>




    <script>



        $(document).on('ready', function () {


            ListarPersonal();

            $("#txtFechaIngreso").datepicker();
            
           

            $('#txtHoraEntrada').timepicker({'timeFormat': 'H:i:s'});
            $('#txtHoraSalida').timepicker({'timeFormat': 'H:i:s'});
            
            $('#txtHoraEntradaActualizar').timepicker({'timeFormat': 'H:i:s'});
            $('#txtHoraSalidaActualizar').timepicker({'timeFormat': 'H:i:s'});


            listarCombos(idCTipoPersonal, "cbTipoPersonal");
            listarCombos(idCEstadoPersonal, "cbEstadoPersonal");
            listarCombos(idCModalidadPago, "cbModalidadPago");
            listarCombos(idRutaAsignada, "cbRutaAsignada");

            listarCombos(idCTipoPersonal, "cbTipoPersonalActualizar");
            listarCombos(idCEstadoPersonal, "cbEstadoPersonalActualizar");
            listarCombos(idCModalidadPago, "cbModalidadPagoActualizar");
            listarCombos(idRutaAsignada, "cbRutaAsignadaActualizar");
            //$('#txtHoraEntrada').timepicker();
            //$('#txtHoraSalida').timepicker();

        });
//#btnBuscarAlumno,

        $('#btnNuevoPersonal').on('click', function () {



            //$('#formRegistroPersonal').form("disableValidation");
            $('#NuevoPersonal').css({'display': 'block'});
            $('#ActualizarPersonal').css({'display': 'none'});
            $('#BuscarPersonal').css({'display': 'none'});
            $('#formBuscarPersonal').css({'display': 'none'});
        });

        $('#btnActualizarPersonal').on('click', function () {
            var data = null;
            data = $('#resultadoBusquedaPersonal').datagrid("getSelected");

            if (data !== null) {
                $('#NuevoPersonal').css({'display': 'none'});
                $('#ActualizarPersonal').css({'display': 'block'});
                $('#BuscarPersonal').css({'display': 'none'});
                $('#formBuscarPersonal').css({'display': 'none'});

                //document.getElementById("formActualizarPersonal").reset();
                cargarDatosActualizar();

            }
            else {
                $.messager.alert('Alerta', "Por favor seleccione un personal");

            }
        });
        
         $('#btnEliminarPersonal').on('click', function() {

            $.messager.confirm('Confirmacion', 'Estas seguro que deseas eliminar?', function(r) {
                if (r) {
                    EliminarPersonal();
                }
            });
        });


        $('#btnListaPersonal').on('click', function () {

            ListarPersonal();
        });

        $("#formRegistrarPersonal").submit(function () {
            RegistrarPersonal();
            return false;
        });

        $("#formActualizarPersonal").submit(function () {
            ActualizarPersonal();
            return false;
        });

        $('#btnrstRegistroPersonal').on('click', function () {
            document.getElementById("formRegistrarPersonal").reset();

        });
        
        $("#formBuscarPersonal").submit(function () {
            BuscarPersonal();
            return false;
        });

        
        function cargarDatagrid() {
            $("#resultadoBusquedaPersonal").datagrid({
                url: '',
                title: 'Resultado de la Busqueda de Personal',
                loadMsg: "Cargando Datos",
                columns: [[
                        {field: 'idcrutaasignada', title: 'idcrutaasignada', align: "center", width: 70, sortable: true, resizable: true, hidden: true},
                        {field: 'idctipopersonal', title: 'idctipopersonal', align: "center", width: 70, sortable: true, resizable: true, hidden: true},
                        {field: 'idcmodalidadpago', title: 'idcmodalidadpago', align: "center", width: 70, sortable: true, resizable: true, hidden: true},
                        {field: 'idcestadopersonal', title: 'idcestadopersonal', align: "center", width: 70, sortable: true, resizable: true, hidden: true},
                        {field: 'idpersona', title: 'idpersona', align: "center", width: 70, sortable: true, resizable: true, hidden: true},
                        {field: 'idpersonal', title: 'idpersonal', align: "center", width: 70, sortable: true, resizable: true, hidden: true},
                        {field: 'codigo', title: 'CODIGO', align: "center", width: 70, sortable: true, resizable: true, hidden: false},
                        {field: 'dni', title: 'DNI', align: "center", width: 70, sortable: true, resizable: true},
                        {field: 'nombres', title: 'NOMBRES', width: 130, align: 'center', sortable: true, resizable: true},
                        {field: 'apppat', title: 'AP. PATERNO', width: 130, align: 'center', sortable: true, resizable: true},
                        {field: 'appmat', title: 'AP. MATERNO', width: 130, align: 'center', sortable: true, resizable: true},
                        {field: 'telefono', title: 'TELEFONO', width: 70, align: 'center', sortable: true, resizable: true, hidden: false},
                        {field: 'direccion', title: 'DIRECCION', width: 130, align: 'center', sortable: true, resizable: true, hidden: true},
                        {field: 'ruta', title: 'RUTA', width: 130, align: 'center', sortable: true, resizable: true, hidden: false},
                        {field: 'tipoPersonal', title: 'TIPO PERSONAL', width: 130, align: 'center', sortable: true, resizable: true, hidden: false},
                        {field: 'email', title: 'E-MAIL', width: 100, align: 'center', sortable: true, resizable: true, hidden: true},
                        {field: 'horaentrada', title: 'horaentrada', width: 100, align: 'center', sortable: true, resizable: true, hidden: true},
                        {field: 'horasalida', title: 'horasalida', width: 100, align: 'center', sortable: true, resizable: true, hidden: true},
                        {field: 'fechaIngreso', title: 'fechaIngreso', width: 100, align: 'center', sortable: true, resizable: true, hidden: true},
                        {field: 'montoPago', title: 'montoPago', width: 100, align: 'center', sortable: true, resizable: true, hidden: true}
                    ]],
                onClickRow: function (rowid, rowdata) {
                },
                singleSelect: true,
                height: 400,
                nowrap: true,
                striped: true,
                collapsible: true,
                rownumbers: true,
                remoteSort: false,
                rowNumbers: true,
                idField: 'idPartida',
                pagination: false
            });
        }
        ;

        function RegistrarPersonal() {
            var oPersonal = {
                idcrutaasignada: $('#cbRutaAsignada').val(),
                idctipopersonal: $('#cbTipoPersonal').val(),
                idcmodalidadpago: $('#cbModalidadPago').val(),
                idcestadopersonal: $('#cbEstadoPersonal').val(),
                montopago :$('#txtMontoPago').val()
                        //horaentrada: $('#txtHoraEntrada').val(),
                        // horasalida : $('#txtHoraSalida').val()

            };

            var oPersona = {
                codigo: $('#txtCodigo').val(),
                dni: $('#txtDni').val(),
                nombres: $('#txtNombre').val(),
                apppat: $('#txtApePaterno').val(),
                appmat: $('#txtApeMaterno').val(),
                telefono: $('#txttelefono').val(),
                email: $('#txtemail').val(),
                direccion: $('#txtDireccion').val()

            };

            var fechaingreso = $('#txtFechaIngreso').val();
            var horaentrada = $('#txtHoraEntrada').val();
            var horasalida = $('#txtHoraSalida').val();
            var accion = "registrarPersonal";



            if ($('#cbRutaAsignada').val() !== '0'
                    && $('#cbTipoPersonal').val() !== '0'
                    && $('#cbEstadoPersonal').val() !== '0') {

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "GestionPersonalServlet",
                    data: {
                        oTPersonal: JSON.stringify(oPersonal), // look here!
                        oTPersona: JSON.stringify(oPersona),
                        accion: accion,
                        horaentrada: horaentrada,
                        horasalida: horasalida,
                        fechaingreso : fechaingreso
                    },
                    success: function (data) {
                        //alert(data);
                        if (data === true)
                            $.messager.alert('Confirmacion', "Se registro correctamente");
                        else
                            $.messager.alert('Error', "No se pudo registrar");

                        ListarPersonal();

                    },
                    error: function (error) {
                        alert("errror: " + error.toString());
                    }
                });
            }
            else {
                $.messager.alert('Error', "Selecciones todos los campos");

            }
        }

        function ActualizarPersonal() {
            var oPersonal = {
                idpersonal: $('#txtIdPersonal').val(),
                idcrutaasignada: $('#cbRutaAsignadaActualizar').val(),
                idctipopersonal: $('#cbTipoPersonalActualizar').val(),
                idcmodalidadpago: $('#cbModalidadPagoActualizar').val(),
                idcestadopersonal: $('#cbEstadoPersonalActualizar').val(),
                montopago :$('#txtMontoPagoActualizar').val(),
                fechaingreso :$('#txtFechaIngresoActualizar').val()
                        //horaentrada: $('#txtHoraEntrada').val(),
                        // horasalida : $('#txtHoraSalida').val()

            };

            var oPersona = {
                idpersona: $('#txtIdPersona').val(),
                codigo: $('#txtCodigoActualizar').val(),
                dni: $('#txtDniActualizar').val(),
                nombres: $('#txtNombreActualizar').val(),
                apppat: $('#txtApePaternoActualizar').val(),
                appmat: $('#txtApeMaternoActualizar').val(),
                telefono: $('#txttelefonoActualizar').val(),
                email: $('#txtemailActualizar').val(),
                direccion: $('#txtDireccionActualizar').val()

            };

            var horaentrada = $('#txtHoraEntradaActualizar').val();
            var horasalida = $('#txtHoraSalidaActualizar').val();
            var accion = "actualizarPersonal";
            
            $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "GestionPersonalServlet",
                    data: {
                        oTPersonal: JSON.stringify(oPersonal), // look here!
                        oTPersona: JSON.stringify(oPersona),
                        accion: accion,
                        horaentrada: horaentrada,
                        horasalida: horasalida
                    },
                    success: function (data) {
                        //alert(data);
                        if (data === true)
                            $.messager.alert('Confirmacion', "Se actualizo correctamente");
                        else
                            $.messager.alert('Error', "No se pudo actualizar");

                        ListarPersonal();

                    },
                    error: function (error) {
                        alert("errror: " + error.toString());
                    }
                });
            
        }

        function ListarPersonal() {
            $('#NuevoPersonal').css({'display': 'none'});
            $('#ActualizarPersonal').css({'display': 'none'});
            $('#formBuscarPersonal').css({'display': 'block'});
            $('#BuscarPersonal').css({'display': 'block'});

            cargarDatagrid();

            var accion = "ListarPersonal";

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "GestionPersonalServlet",
                data: {
                    accion: accion
                },
                success: function (data) {
                    $("#resultadoBusquedaPersonal").datagrid({
                        data: data});
                },
                error: function (error) {
                    alert("error cargando datos" + error.toString());
                }
            });


        };
        
        function EliminarPersonal(){
            var datos = $('#resultadoBusquedaPersonal').datagrid("getSelected");
            
            var oPersonal = {
                idpersonal: datos.idpersonal
            };
            
            var oPersona = {
                idpersona: datos.idpersona
            };
            
             var accion = "eliminarPersonal";
            
             $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionPersonalServlet",
            data: {
                oTPersonal: JSON.stringify(oPersonal), // look here!
                oTPersona: JSON.stringify(oPersona),
                accion : accion

            },
            success: function(data) {
                if (data === true)
                    $.messager.confirm('Confirmacion', 'Se elimino correctamente', "confirmacion");
                else
                    $.messager.alert('Error', "No se pudo eliminar");

                ListarPersonal();
            },
            error: function(e) {
                $.messager.alert('Error', "No se pudo eliminar personal");
            }
        });
        };
        
        function BuscarPersonal(){
             var oPersona = {
                nombres: $('#txtNombreBusqueda').val(),
                apppat: $('#txtApPaternoBusqueda').val(),
                appmat: $('#txtApMaternoBusqueda').val()

            };
            var accion = "buscarPersonal";
            
             $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "GestionPersonalServlet",
                    data: {
                        oTPersona: JSON.stringify(oPersona),
                        accion: accion
                    },
                    success: function (data) {
                        $("#resultadoBusquedaPersonal").datagrid({
                        data: data});

                    },
                    error: function (error) {
                         alert("error cargando datos" + error.toString());
                    }
                });
            
        }

        function cargarDatosActualizar() {
            var datos = $('#resultadoBusquedaPersonal').datagrid("getSelected");

            $('#txtIdPersonal').val(datos.idpersonal);
            $('#txtIdPersona').val(datos.idpersona);
            //$('#txtFoto').val(datos.idpersona);
            $('#txtCodigoActualizar').val(datos.codigo);
            $('#txtDniActualizar').val(datos.dni);
            $('#txtNombreActualizar').val(datos.nombres);
            $('#txtApePaternoActualizar').val(datos.apppat);
            $('#txtApeMaternoActualizar').val(datos.appmat);
            $('#txttelefonoActualizar').val(datos.telefono);
            $('#txtemailActualizar').val(datos.email);
            $('#txtDireccionActualizar').val(datos.direccion);
            //$('#cbRutaAsignadaActualizar > option[value="' + datos.idcrutaasignada + '"]').attr('selected', 'selected');
            $('#cbRutaAsignadaActualizar').val(datos.idcrutaasignada);
            $('#cbTipoPersonalActualizar').val(datos.idctipopersonal);
            $('#cbEstadoPersonalActualizar').val(datos.idcestadopersonal);
            //$('#txtFechaIngresoActualizar').val(datos.idpersona);
            $('#cbModalidadPagoActualizar').val(datos.idcmodalidadpago);
            $('#txtHoraEntradaActualizar').val(datos.horaentrada);
            $('#txtHoraSalidaActualizar').val(datos.horasalida);
            $('#txtMontoPagoActualizar').val(datos.montoPago);
            $('#txtFechaIngresoActualizar').val(datos.fechaIngreso);



        }
        ;
    </script>




