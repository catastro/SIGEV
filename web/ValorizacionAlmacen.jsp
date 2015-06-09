

<div class="row">
    <div class="col-md-12 col-sm-12">
        <h3 class="text-left">Valorizacion de Almacen</h3>
        <hr/>
    </div>
</div>

   <div class="row">


                    <div class="form-group col-md-4 col-sm-6">
                        <label class="control-label">Denominación</label>
                        <input id="ApPaterno" type="text" class="form-control" pattern="[A-Za-z ]{1,30}" placeholder="Denominación" >
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
        
          <!--Inicio botones menu-->

        <div class="menuDerecho">
            <div class="btn-group-vertical" role="group" aria-label="...">

                <button id="btnActualizarAlumno" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-refresh">&nbsp;</span><strong>Actualizar</strong></button>

            </div>     

        </div>
        <!--Fin botones menu-->

</div>

<script>
    $(document).on('ready', function () {

        cargarDatagrid();

    });

    function cargarDatagrid() {
        $("#resultadoBusquedaAlumno").datagrid({
            url: '',
             data: [{
                    denominacion: 'Cuates',
                    cajas: '60',
                    unidades:'24',
                    devoluciones:'10',
                    dañados:'5',
                    costo:'400',
                }],
            title: 'Almacen',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'denominacion', title: 'DENOMINACION', align: "center", width: 500, sortable: true, resizable: true, hidden: false},
                    {field: 'cajas', title: 'CAJAS', align: "center", width: 150, sortable: true, resizable: true},
                    {field: 'unidades', title: 'UNIDADES SUELTAS', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'devoluciones', title: 'DEVOLUCIONES', align: "center", width: 150, sortable: true, resizable: true},
                    {field: 'dañados', title: 'DAÑADOS', align: "center", width: 150, sortable: true, resizable: true},
                    {field: 'costo', title: 'COSTO', width: 150, align: 'center', sortable: true, resizable: true}
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