<div class="row">
    <div class="col-md-12 col-sm-12">
        <h3 class="text-left">Listado de Asistencia</h3>
        <hr/>
    </div>
</div>

 <div class="row">


                    <div class="form-group col-md-4 col-sm-6">
                        <label class="control-label">Nombre</label>
                        <input id="ApPaterno" type="text" class="form-control" pattern="[A-Za-z ]{1,30}" placeholder="Nombre" >
                    </div>
                    
                     <div class="form-group col-md-4 col-sm-6">
                        <label class="control-label">Fecha</label>
                        <input id="ApPaterno" type="date" class="form-control" >
                    </div>
                    
                    <div class="form-group col-md-1 col-sm-2">
                        <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                        <input class="btn btn-primary" value="Buscar" type="submit" />
                    </div>

        
    </div>

<div>
  
        <div class="row" style="display: block">
            <div  >
                <table  id="resultadoBusquedaAlumno"></table>
                <br>
                             
            </div>
        </div>
        <div id="RegistrarAsistencia" style="display: none">
            <%@include file="_RegistrarAsistencia.html" %>
        </div>
        
          <!--Inicio botones menu-->

        <div class="menuDerecho">
            <div class="btn-group-vertical" role="group" aria-label="...">
                
                <button id="btnRegistrarAsistencia" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-plus">&nbsp;</span><strong>Nuevo</strong></button>
                <button id="btnActualizarAlumno" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-refresh">&nbsp;</span><strong>Actualizar</strong></button>

            </div>     

        </div>
        <!--Fin botones menu-->

</div>

<script>
    $(document).on('ready', function () {

        cargarDatagrid();

    });
    
     $('#btnRegistrarAsistencia').on('click', function () {
           
            $('#RegistrarAsistencia').css({'display': 'block'});
            $('#ActualizarAlumno').css({'display': 'none'});
            $('#BuscarAlumno').css({'display': 'none'});
           
        });

    function cargarDatagrid() {
        $("#resultadoBusquedaAlumno").datagrid({
            url: '',
             data: [{
                    nombre: 'Li',
                    appat: 'Orquideas',
                    apmat:'Rosadas',
                    horallegada:'7:30',
                    horasalida:'5:30',
                    
                }],
            title: 'Almacen',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'nombre', title: 'NOMBRE', align: "center", width: 200, sortable: true, resizable: true, hidden: false},
                    {field: 'appat', title: 'AP. PATERNO', align: "center", width: 200, sortable: true, resizable: true},
                    {field: 'apmat', title: 'AP. MATERNO', width: 200, align: 'center', sortable: true, resizable: true},
                    {field: 'horallegada', title: 'HORA DE LLEGADA', align: "center", width: 150, sortable: true, resizable: true},
                    {field: 'horasalida', title: 'HORA DE SALIDA', align: "center", width: 150, sortable: true, resizable: true}
                    
                ]],
            onClickRow: function (rowid, rowdata) {
                $('#txtCodigoActualizar').val(rowdata.codigo);
                $('#txtDniActualizar').val(rowdata.dni);
                $('#txtNombreActualizar').val(rowdata.nombres);
                $('#txtApePaternoActualizar').val(rowdata.apppat);
                $('#txtApeMaternoActualizar').val(rowdata.appmat);
                $('#txttelefonoActualizar').val(rowdata.telefono);
                $('#txtDireccionActualizar').val(rowdata.direccion);
                $('#txtemailActualizar').val(rowdata.email);
                // $('#colegioProcedenciaActualizar').val(rowdata.colegioProcedencia);
                //$('#modalidadPagoActualizar').val(rowdata.modalidadPago);
                // $('#CarreraActualizar').val(rowdata.carrera);
                idPersona = rowdata.idpersona;
                idAlumno = rowdata.idalumno;
                idMatriculado = rowdata.idmatricula;

                document.getElementById("cmbmodalidadPagoActualizar").value = rowdata.idmodalidadPago;
                document.getElementById("cmbSalonActualizar").value = rowdata.idSalon;
                document.getElementById("cmbCarreraPostulaActualizar").value = rowdata.idcarrera;
                document.getElementById("cmbColegioProcedenciaActualizar").value = rowdata.idcolegioProcedencia;
            },
            singleSelect: true,
            height: 200,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true,
            idField: 'idPartida',
            pagination: true
        });
    }


</script>