<div class="row">
    <div class="col-md-12 col-sm-12">
        <h3 class="text-left">Gestion Boveda</h3>
        <hr/>
    </div>
</div>



<div class="row">
    <div class="form-group col-md-3 col-sm-4">
        <label class="control-label">Efectivo en boveda: S/. </label>
        <input id="txtefectivo" type="text" class="form-control" disabled="disabled">
    </div>                
</div>

<br>
<div>

    <div id="divBuscarBoveda" style="display: block">
        <div class="row">
            <div class="form-group col-md-3 col-sm-4">
                <label class="control-label">Desde</label>
                <input id="fechaA" type="text" class="form-control easyui-validatebox" data-options="required:true" />
            </div>  
            <div class="form-group col-md-3 col-sm-4">
                <label class="control-label">Hasta</label>
                <input id="fechaB" type="text" class="form-control easyui-validatebox" data-options="required:false" />
            </div>  
            <div class="form-group col-md-3 col-sm-4">
                <label class="control-label">&nbsp;</label>
                <br>
                <input id="idbtnBuscarBoveda" type="button" class="btn btn-primary"  value="Buscar" >
            </div>  
        </div>
        <br>
        <table id="dgBoveda"></table>
        <br>

    </div>

</div>

<script>


    var indexTablaEdicion = -1;
    var indexTabla = -1;
    var banderaEdicion = 0;
    $(document).on('ready', function () {
        Efectivo();
        $("#fechaA").datepicker();
        $("#fechaB").datepicker();
        cargarDatagrid();
    });

    function convertDateTommddyyyy(mmm) {
        var dia = mmm.substring(2, 0);
        var mes = mmm.substring(5, 3);
        var anio = mmm.substring(10, 6);
        //var mmm2 = mes + "/" + dia + "/" + anio;
        var mmm2 = anio + "/" + mes + "/" + dia;
        return mmm2;
    }
    ;

    $('#idbtnBuscarBoveda').on('click', function () {
        $('#divRegistrarSalida').css({'display': 'none'});
        $('#divBuscarBoveda').css({'display': 'block'});
        $('#divActualizarSalida').css({'display': 'none'});
        ListarBoveda();
    });



    function cargarDatagrid() {
        $("#dgBoveda").datagrid({
            url: '',
            title: 'SALIDAS',
            loadMsg: "Cargando Datos",
            singleSelect: true,
            select: true,
            columns: [[
                    {field: 'ck', title: '', checkbox: 'true'},
                    {field: 'idboveda', title: 'idboveda ', align: "left", width: 50, sortable: true, resizable: true, hidden: false},
                    {field: 'denominacion', title: 'concepto ', align: "left", width: 600, sortable: true, resizable: true, hidden: false,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: true
                            }
                        }
                    },
                    {field: 'monto', title: 'monto', align: "left", width: 200, sortable: true, resizable: true,
                        editor: {
                            type: 'numberbox',
                            options: {
                                required: true,
                                precision: 3
                            }
                        }
                    },
                    {field: 'observacion', title: 'Observación', align: "left", width: 250, sortable: true, resizable: true,
                        editor: {
                            type: 'validatebox'

                        }
                    },
                    {field: 'estado', title: 'Estado', align: "left", width: 250, sortable: true, resizable: true, hidden: true}
                ]],
            onClickRow: function (rowid, rowdata) {

                indexTabla = rowid;
            },
            onBeforeEdit: function (rowid, rowdata) {
                indexTablaEdicion = rowid;
                banderaEdicion = 1;
              //  alert(banderaEdicion);
            },
            onAfterEdit: function (index, rowData) {
                ActualizarRegistrarBoveda(rowData);
            },
            toolbar: [{
                    text: ' NUEVO ',
                    iconCls: 'icon-add',
                    handler: function () {
                        // si c está editando(baderaEdicion=1) no puede agregarse otro
                        //alert(banderaEdicion);
                        if (banderaEdicion !== 1) {
                            $('#dgBoveda').datagrid('appendRow', {
                                estado: '1'
                            });
                            var editIndex = $('#dgBoveda').datagrid('getRows').length - 1;
                            $('#dgBoveda').datagrid('beginEdit', editIndex);
                        } else {
                            $.messager.alert('Error', 'Esta editando Una Fila', 'error');
                        }
                    }
                },
                {
                    text: ' ACTUALIZAR ',
                    iconCls: 'icon-reload',
                    handler: function () {
                        if (banderaEdicion !== 1) {
                            if (indexTabla !== -1) {
                                $('#dgBoveda').datagrid('beginEdit', indexTabla);
                            } else {
                                $.messager.alert('Error', 'Seleccione una fila!', 'error');
                            }
                        } else {
                            $.messager.alert('Error', 'Esta editando una fila', 'error');
                        }
                    }
                },
                {
                    text: 'Guardar',
                    iconCls: 'icon-save',
                    handler: function () {

                        if (banderaEdicion === 0) {
                            $.messager.alert('Error', 'No ha realizado cambios', 'error');
                        }
                        else {
                            if ($('#dgBoveda').datagrid('validateRow', indexTablaEdicion)) {
                                $('#dgBoveda').datagrid('endEdit', indexTablaEdicion);
                                $("#dgBoveda").datagrid('unselectAll');

                                indexTabla = -1;/*no*/
                                indexTablaEdicion = -1;
                                banderaEdicion = 0;
                            } else {
                                $.messager.alert('Error', 'Verifique Campos!', 'error');
                            }
                        }
                    }
                },
                {
                    text: 'Cancelar',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        ListarBoveda();
                        $("#dgBoveda").datagrid('unselectAll');

                        indexTabla = -1;
                        indexTablaEdicion = -1;
                        banderaEdicion = 0;
                    }
                },
                {
                    text: 'Eliminar ',
                    iconCls: 'icon-remove',
                    handler: function () {
                        if (banderaEdicion !== 1) {

                            if (indexTabla !== -1) {
                                var odetalleBoveda = $('#dgBoveda').datagrid('getSelected');
                                var index = $('#dgBoveda').datagrid('getRowIndex', odetalleBoveda);

                                $.messager.confirm('Confirmacion', '¿Esta Ud. seguro que desea eliminar?', function (r) {
                                    if (r) {
                                        if (r) {
                                            EliminarBoveda(odetalleBoveda.idboveda);
                                            $('#dgBoveda').datagrid('deleteRow', index);
                                        }
                                    }
                                });
                            } else {
                                $.messager.alert('Error', 'Seleccione una fila!', 'error');
                            }
                        } else {
                            $.messager.alert('Error', 'Esta editando una fila', 'error');
                        }
                    }
                }
            ],
            // singleSelect: true,
            //height: auto,
            // width: 1000,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true
        });
    }

    function ListarBoveda() {
        var fechaA = convertDateTommddyyyy($('#fechaA').val());
        var fechaB = convertDateTommddyyyy($('#fechaB').val());

        if ($('#fechaB').val() === '') {
            fechaB = fechaA;
        }

        //alert(fecha);
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionBovedaServlet",
            data: {
                fechaA: fechaA,
                fechaB: fechaB,
                action: '1'
            },
            success: function (data) {
                //alert(JSON.stringify(data));
                if (data.length === 0)
                    $.messager.alert('Error', 'Sin Resultados', "error");

                $("#dgBoveda").datagrid({
                    data: data});
                $("#dgBoveda").datagrid('unselectAll');

            },
            error: function (e) {
                //alert('Error: ' + e.message);
                // alert('Error: ' + e.toString());
                $.messager.alert('Error', 'Contactese con el administrador', "error");
            }
        });

    }

    function ActualizarRegistrarBoveda(rowData) {
        rowData.fechacreac = null;
        //alert(JSON.stringify(rowData));
        $.ajax({
            data: {
                boveda: JSON.stringify(rowData),
                action: '2'
            },
            type: "POST",
            datatype: "json",
            url: 'GestionBovedaServlet',
            success: function (data) {
                if (data === true) {
                    $.messager.alert('Confirmacion', 'la operacion se realizo satisfactoriamente!', 'info');
                    //$("#dgBoveda").datagrid({reload:true});
                    ListarBoveda();
                }
                else {
                    $.messager.alert('Error', 'No se registroooooo', 'error');
                }

            },
            error: function () {
                $.messager.alert('Error', 'Error al Registrar ', 'error');
            }
        });
    }

    function EliminarBoveda(idboveda) {

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionBovedaServlet",
            data: {
                idboveda: idboveda,
                action: '3'
            },
            success: function (data) {
                if (data === true)
                    $.messager.alert('Informacion', 'Se elimino correctamente', "info");

                else
                    $.messager.alert('Error', 'No se pudo eliminar', "error");

            },
            error: function (e) {
                $.messager.alert('Error', 'Contactese con el administrador', "error");
            }
        });

    }

    function Efectivo() {

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionBovedaServlet",
            data: {
                action: '4'
            },
            success: function (data) {
                $("#txtefectivo").val(data);
            },
            error: function (e) {
                //alert('Error: ' + e.message);
                //alert('Error: ' + e.toString());
                $.messager.alert('Error', 'Contactese con el administrador', "error");
            }
        });
    }

</script>