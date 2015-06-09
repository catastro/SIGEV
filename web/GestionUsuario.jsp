
<%-- 
    Document   : GestionUsuario
    Created on : 11/03/2015, 07:09:17 AM
    Author     : WINDOWS 8
--%>

<div>
    <div >
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h3 class="text-left">Gestion Usuario</h3>
                <hr/>
            </div>
        </div>
        

        <!--Opcion: Buscar style="border: 1px" style="float: right" -->


        <div class="menuDerecho">
            <div class="btn-group-vertical" role="group" aria-label="...">
                <button id="btnListarUsuario" style="margin: 5px;text-align: left;" class="btn btn-primary"><span class="glyphicon glyphicon-list">&nbsp;</span><strong>Lista</strong></button>
                
                <button id="btnNuevoUsuario" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-plus">&nbsp;</span><strong>Nuevo</strong></button>
                
                <button id="btnActualizarUsuario" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-refresh">&nbsp;</span><strong>Actualizar</strong></button>
                
                <button id="btnEliminarUsuario" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-remove">&nbsp;</span><strong>Eliminar</strong></button>
                
            </div>     

        </div>


        <!--Opcion: Resultado Busqueda-->

        <div>

            <div id="ListarUsuario" style="display: block">
                
                <table id="resultadoListarUsuario"></table>
            </div>
            <div id="NuevoUsuario" style="display: none">
                <%@include file="_RegistrarUsuario.html" %>
            </div>
            <div id="ActualizarUsuario" style="display: none">
                <%@include file="_ActualizarUsuario.html" %>
            </div>
        </div>

    </div>

</div>


<script>
    var idPersona = -1;
    var idUsuario = -1;

    $(document).on('ready', function () {
        
    });


        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionUsuarioServlet",
            data: {
                action: '1'
            },
            success: function (data) {
                var html = "";
              //  alert(data);
                jQuery.each(data, function (i, val) {

                    html = html + "<option value='" + val.idrol + "'>" + val.nombrerol + "</option>";
                });

                $('#cmbrolUsuario').html(html);
                $('#cmbrolUsuarioActualizar').html(html);
            },
            error: function (e) {
                alert('Error: ' + e.toString() + "roles");
                //$.messager.alert('Error',e.toString() , "error");
            }
        });
    
    $('#btnListarUsuario,#btnrstRegistroUsuario,#btnrstActualizarUsuario').on('click', function () {
        $('#NuevoUsuario').css({'display': 'none'});
        $('#ActualizarUsuario').css({'display': 'none'});
        $('#ListarUsuario').css({'display': 'block'});
        cargarDatagrid();
        ListarUsuario();
    });

    $('#btnNuevoUsuario').on('click', function () {
        $('#formRegistrousuario').form("disableValidation");
        $('#NuevoUsuario').css({'display': 'block'});
        $('#ActualizarUsuario').css({'display': 'none'});
        $('#ListarUsuario').css({'display': 'none'});

        idPersona = -1;
        idUsuario = -1;
    });
    
    $('#spnbuscarpersona').on('click', function () {
        BuscarUsuarioxDni();
    });

    $("#formRegistrousuario").submit(function () {
        RegistrarUsuario();
        return false;
    });

    $('#btnActualizarUsuario').on('click', function () {
        if (idPersona !== -1) {
            $('#formActualizarRegUsuario').form("disableValidation");
            $('#NuevoUsuario').css({'display': 'none'});
            $('#ActualizarUsuario').css({'display': 'block'});
            $('#ListarUsuario').css({'display': 'none'});
        }
        else {

            $.messager.alert('Error', 'Por favor seleccione a un alumno', "error");
        }
    });

    $("#formActualizarRegUsuario").submit(function () {
        ActualizarUsuario();
        return false;
    });

    $('#btnEliminarUsuario').on('click', function () {


        if (idPersona !== -1) {
            $.messager.confirm('Confirmacion', '¿Esta Ud. seguro que desea eliminar?', function (r) {
                if (r) {
                    EliminarUsuario();
                }
            });

        }
        else {
            $.messager.alert('Error', 'Por favor seleccione a un alumno', "error");

        }
    });



    function cargarDatagrid() {
        $("#resultadoListarUsuario").datagrid({
            url: '',
            title: 'Lista de Usuarios',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'nombreusuario', title: 'USUARIO', width: 160, align: 'center', sortable: true, resizable: true, hidden: false},
                    {field: 'password', title: 'PASSWORD', width: 130, align: 'center', sortable: true, resizable: true, hidden: true},
                    {field: 'nombrerol', title: 'ROL', width: 160, align: 'center', sortable: true, resizable: true, hidden: false},
                    {field: 'nombres', title: 'NOMBRES', width: 250, align: 'center', sortable: true, resizable: true},
                    {field: 'apppat', title: 'AP. PATERNO', width: 205, align: 'center', sortable: true, resizable: true},
                    {field: 'appmat', title: 'AP. MATERNO', width: 205, align: 'center', sortable: true, resizable: true, hidden: false},
                    {field: 'dni', title: 'DNI', width: 122, align: 'center', sortable: true, resizable: false, hidden: false},
                    {field: 'idusuario', title: 'Idusuario', width: 130, align: 'center', sortable: true, resizable: true, hidden: true},
                    {field: 'idpersona', title: 'IdPersona', width: 50, align: 'center', sortable: true, resizable: false, hidden: true},
                    {field: 'idrol', title: 'IdRol', width: 50, align: 'center', sortable: true, resizable: false, hidden: true}

                ]],
            onClickRow: function (rowid, rowdata) {
                $('#txtNombreUsActualizar').val(rowdata.nombres);
                $('#txtApePaternoUsuActualizar').val(rowdata.apppat);
                $('#txtApeMaternoUsuActualizar').val(rowdata.appmat);
                $('#txtDniUsuActualizar').val(rowdata.dni);
                $('#txtUsuarioActualizar').val(rowdata.nombreusuario);
               
                idPersona = rowdata.idpersona;
                idUsuario = rowdata.idusuario;


                document.getElementById("cmbrolUsuarioActualizar").value = rowdata.idrol;
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

      function ListarUsuario() {
        idPersona = -1;
        idUsuario = -1;
        var object = {
            action: '2'
        };

        // alert(JSON.stringify(object));

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionUsuarioServlet",
            data: object,
            success: function (data) {

              //  alert("ok");
                //alert(JSON.stringify(data));
                if (data.length === 0)
                    $.messager.alert('Error', 'Sin Resultados', "error");

                $("#resultadoListarUsuario").datagrid({
                    data: data
                    //pagination: true
                });


                $("#resultadoListarUsuario").datagrid('unselectAll');

            },
            error: function (e) {
                
                $.messager.alert('Error', 'Contactese con el administrador', "error");
            }
        });
    }
    
      function BuscarUsuarioxDni() {
             

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionUsuarioServlet",
            data: {
                dni: $("#txtDni").val(), // look here!
               
                action: '3'
            },
            success: function (data) {
                // 
                if (data !== 0) {
                    alert("ok");
                    $("#txtNombre").val(data.nombres);
                    $("#txtApePaterno").val(data.apppat);
                    $("#txtApeMaterno").val(data.appmat);
                }
                else
                    $.messager.alert('Error', 'El dni no fue registrado', "error");



            },
            error: function (e) {
                //alert('Error: ' + e.message);
                //alert('Error: ' + e.toString());
                $.messager.alert('Error', 'Persona no encontrada, Verifique o contactese con el administrador', "error");
            }
        });
    }

      function RegistrarUsuario() {

        var persona = {
            nombres: $('#txtNombre').val(),
            apppat: $('#txtApePaterno').val(),
            appmat: $('#txtApeMaterno').val(),
            dni: $('#txtDni').val()
        };

        var usuario = {
            nombreusuario: $('#txtUsuario').val(),
            password: $('#txtPassword').val(),
            TRol: {
                idrol: $('#cmbrolUsuario').val()
            }
        };

        //alert(JSON.stringify(persona));

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionUsuarioServlet",
            data: {
                persona: JSON.stringify(persona), // look here!,
                usuario: JSON.stringify(usuario), // look here!
                action: '4'
            },
            success: function (data) {
                if (data === true) {
                    $.messager.alert('Informacion', 'Se registro correctamente', "info");

                    limpiarFormularioRegistrar();
                }
                else
                    $.messager.alert('Error', 'No se pudo realizar el registro: Elija otro nombre de usuario', "error");

            },
            error: function (e) {
                //alert('Error: ' + e.message);
                $.messager.alert('Error', 'Contactese con el administrador', "error");
            }
        });
    }
    
    function ActualizarUsuario() {
        var persona = {
            idpersona: idPersona,
            nombres: $('#txtNombreUsActualizar').val(),
            apppat: $('#txtApePaternoUsuActualizar').val(),
            appmat: $('#txtApeMaternoUsuActualizar').val(),
            dni: $('#txtDniUsuActualizar').val()

        };

        var usuario = {
            idusuario: idUsuario,
            nombreusuario: $('#txtUsuarioActualizar').val(),
            password: $('#txtPasswordActualizar').val(),
            TRol: {
                idrol: $('#cmbrolUsuarioActualizar').val()
            }
        };

        //alert(JSON.stringify(persona));
        //alert(JSON.stringify(aidcCarreraPostulalumno));
        //alert(JSON.stringify(alumno));

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionUsuarioServlet",
            data: {
                persona: JSON.stringify(persona), // look here!
                usuario: JSON.stringify(usuario),
                action: '5'
            },
            success: function (data) {
                // alert("ok");
                if (data === true) {
                    $.messager.alert('Informacion', 'Se actualizo correctamente', "info");
                    ListarUsuario();
                }
                else
                    $.messager.alert('Error', 'No se pudo actualizar el registro: Elija otro nombre de usuario', "error");

                idPersona = -1;
                idUsuario = -1;

                $('#NuevoUsuario').css({'display': 'none'});
                $('#ActualizarUsuario').css({'display': 'none'});
                $('#ListarUsuario').css({'display': 'block'});

            },
            error: function (e) {
                //alert('Error: ' + e.message);
                //alert('Error: ' + e.toString());
                $.messager.alert('Error', 'Contactese con el administrador', "error");
            }
        });
    }
    
     function EliminarUsuario() {

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionUsuarioServlet",
            data: {
                idUsuario: idUsuario,
                action: '6'
            },
            success: function (data) {
                if (data === true)
                    $.messager.alert('Informacion', 'Se elimino correctamente', "info");

                else
                    $.messager.alert('Error', 'No se pudo eliminar', "error");

                idPersona = -1;
                idUsuario = -1;

                //alert("ok");             
                ListarUsuario();
            },
            error: function (e) {
                //alert('Error: ' + e.message);
                //alert('Error: ' + e.toString());
                $.messager.alert('Error', 'Contactese con el administrador', "error");
            }
        });

    }
    
     function limpiarFormularioRegistrar() {
        $('#txtDni').val("");
        $('#txtNombre').val("");
        $('#txtApePaterno').val("");
        $('#txtApeMaterno').val("");
        $('#txtUsuario').val("");
        $('#txtPassword').val("");
    }


</script>


