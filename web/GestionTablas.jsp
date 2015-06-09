<div>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <h3 class="text-left">Gestion Tablas</h3>
            <hr/>
        </div>
    </div>    
    <form id="formBuscarContenedor">
        <div class="row">
            <div class="form-group col-md-2 col-sm-4">
                <label class="control-label">Denominacion</label>
                <input id="txtDenominacion" type="text" class="form-control" placeholder="Denominacion" >
            </div> 
            <div class="form-group col-md-1 col-sm-2">
                <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                <input  type="submit" class="btn btn-primary" value="Buscar" >
            </div>
        </div>
    </form>
    <br>
</div>


<div class="row">
    <div class="col-md-12 form-group">
        <fieldset>
            <legend>Resultados de Busqueda Combos</legend>
            <div class="row form-group">
                <div class="col-xs-12 col-md-12">
                    <table id="tablaListaMaestro"></table>
                </div>
            </div>
        </fieldset>
        <br />
        <fieldset>
            <legend>Resultados de busqueda Items </legend>
            <div class="row form-group">
                <div class="col-xs-12 col-md-12">
                    <table id="tablaListaMaestroSubTabla"></table>
                </div>
            </div>
        </fieldset>
    </div>
</div>

<script>

    $(document).ready(function () {
        crearGrillaListMaestro();
        crearGrillaListMaestroSubTabla();
    });

    var indexSubTabla = -1;
    var indexSubTablaEdicion = -1;
    var rowidM = -1;
    var tablaId = -1;
    var banderaEdicion = 0;

    $("#formBuscarContenedor").submit(function () {
        buscarMaestro();
        indexSubTabla = -1;
        indexSubTablaEdicion = -1;
        rowidM = -1;
        tablaId = -1;
        $("#tablaListaMaestroSubTabla").datagrid("loadData", []);
        $("#tablaListaMaestro").datagrid("unselectAll");
        return false;
    });

    function buscarMaestro() {

        $.ajax({
            data: {
                action: "1",
                denominacion: $('#txtDenominacion').val()
            },
            type: "POST",
            datatype: "json",
            url: 'GestionTablasServlet',
            success: function (data) {
                $("#tablaListaMaestro").datagrid("loadData", data);
            },
            error: function () {
                $.messager.alert('Error', 'Error al Buscar Combo!', 'error');
            }
        });
    }

    function crearGrillaListMaestro() {
        $("#tablaListaMaestro").datagrid({
            url: '',
            title: 'COMBOS',
            columns: [[
                    {field: 'idcontenedor', title: 'Id', width: 50, align: 'left', sortable: true, resizable: false, hidden: true},
                    {field: 'idtabla', title: 'idtabla', width: 50, align: 'left', sortable: true, resizable: false, hidden: true},
                    {field: 'iditem', title: 'iditem', width: 50, align: 'left', sortable: true, resizable: false, hidden: true},
                    {field: 'idsuperior', title: 'idsuperior', width: 50, align: 'left', sortable: true, resizable: false, hidden: true},
                    {field: 'orden', title: 'orden', width: 50, align: 'left', sortable: true, resizable: false, hidden: true},
                    {field: 'abreviatura', title: 'ABREVIATURA', width: 100, align: 'left', sortable: true, resizable: false, hidden: false},
                    {field: 'denominacion', title: 'DENOMINACION', width: 250, align: 'left', sortable: true, resizable: false, hidden: false},
                    {field: 'estado', title: 'estado', width: 50, align: 'left', sortable: true, resizable: false, hidden: true},
                    {field: 'observacion', title: 'OBSERVACION', width: 750, align: 'left', sortable: true, resizable: false, hidden: false}

                ]],
            singleSelect: true,
            //height: 250,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true,
            idField: 'idPersona',
            onClickRow: function (rowid, rowdata) {
                
                if(banderaEdicion ===0){
                    rowidM = rowid;
                    tablaId = rowdata.idtabla;
                    buscarMaestroSubTabla(tablaId);
                }else {
                    $.messager.alert('Error', 'Exta Editando Una Fila Precione Cancelar', 'error');
                }
            }
        });
    }

    function buscarMaestroSubTabla(idTabla) {
        $.ajax({
            data: {
                action: '2',
                idTabla: idTabla
            },
            type: "POST",
            datatype: "json",
            url: 'GestionTablasServlet',
            success: function (data) {
                $("#tablaListaMaestroSubTabla").datagrid("loadData", data);
                $("#tablaListaMaestroSubTabla").datagrid("unselectAll");
            },
            error: function () {
                $.messager.alert('Error', 'Error al Buscar Items!', 'error');
            }
        });
    }

    function crearGrillaListMaestroSubTabla() {
        $("#tablaListaMaestroSubTabla").datagrid({
            url: '',
            title: 'ITEMS',
            columns: [[
                    {field: 'idcontenedor', title: 'Id', width: 50, align: 'left', sortable: true, resizable: false, hidden: true},
                    {field: 'abreviatura', title: 'ABREVIATURA', width: 150, align: 'left', sortable: true, resizable: false, hidden: false, editor: 'text'},
                    {
                        field: 'denominacion', title: 'DENOMINACION', width: 200, align: 'left', sortable: true, resizable: false, hidden: false,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: true
                            }
                        }
                    },
                    {field: 'observacion', title: 'OBSERVACION', width: 660, align: 'left', sortable: true, resizable: false, hidden: false, editor: 'text'},
                    {field: 'idtabla', title: 'IdTabla', width: 50, align: 'left', sortable: true, resizable: false, hidden: true},
                    {field: 'iditem', title: 'Iditem', width: 50, align: 'left', sortable: true, resizable: false, hidden: true},
                    {
                        field: 'orden', title: 'Nro ORDEN', width: 90, align: 'left', sortable: true, resizable: false, hidden: false,
                        editor: {
                            type: 'numberbox',
                            options: {
                                required: true
                            }
                        }
                    },
                    {field: 'estado', title: 'Estado', width: 50, align: 'left', sortable: true, resizable: false, hidden: true},
                    {field: 'idsuperior', title: 'IdSuperior', width: 50, align: 'left', sortable: true, resizable: false, hidden: true}]],
            toolbar: [{
                    text: ' NUEVO ',
                    iconCls: 'icon-add',
                    handler: function () {
                        if (rowidM !== -1) {
                            if (banderaEdicion !== 1) {
                                var datos = $("#tablaListaMaestroSubTabla").datagrid('getRows');
                                var mayor = 0;
                                jQuery.each(datos, function (index, val) {
                                    if (index === 0) {
                                        mayor = val.iditem;
                                    } else {
                                        if (mayor < val.iditem) {
                                            mayor = val.iditem;
                                        }
                                    }
                                });

                                $('#tablaListaMaestroSubTabla').datagrid('appendRow', {
                                    idtabla: tablaId,
                                    estado: '1',
                                    iditem: mayor +1
                                });
                                var editIndex = $('#tablaListaMaestroSubTabla').datagrid('getRows').length - 1;
                                $('#tablaListaMaestroSubTabla').datagrid('beginEdit', editIndex);
                            } else {
                                $.messager.alert('Error', 'Exta editando Una Fila', 'error');
                            }
                        } else {
                            $.messager.alert('Error', 'Seleccione Combo!', 'error');
                        }
                    }
                }, {
                    text: ' ACTUALIZAR ',
                    iconCls: 'icon-reload',
                    handler: function () {
                        if (banderaEdicion !== 1) {
                            if (indexSubTabla !== -1) {
                                $('#tablaListaMaestroSubTabla').datagrid('beginEdit', indexSubTabla);
                            } else {
                                $.messager.alert('Error', 'Seleccione Items!', 'error');
                            }
                        } else {
                            $.messager.alert('Error', 'Esta editando Una Fila', 'error');
                        }
                    }
                }, {
                    text: ' GUARDAR ',
                    iconCls: 'icon-save',
                    handler: function () {
                        if (banderaEdicion === 0) {
                            $.messager.alert('Error', 'No ha realizado cambios', 'error');
                        }
                        else {
                            if ($('#tablaListaMaestroSubTabla').datagrid('validateRow', indexSubTablaEdicion)) {
                                $('#tablaListaMaestroSubTabla').datagrid('endEdit', indexSubTablaEdicion);
                                $("#tablaListaMaestroSubTabla").datagrid('unselectAll');
                                indexSubTabla = -1;
                                indexSubTablaEdicion = -1;
                                banderaEdicion = 0;
                            } else {
                                $.messager.alert('Error', 'Verifique Campos!', 'error');
                            }
                        }
                    }
                }, {
                    text: ' CANCELAR ',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        buscarMaestroSubTabla(tablaId);
                        $("#tablaListaMaestroSubTabla").datagrid('unselectAll');
                        indexSubTabla = -1;
                        indexSubTablaEdicion = -1;
                        banderaEdicion = 0;
                    }
                }],
            singleSelect: true,
            //height: 250,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true,
            idField: 'idPersona',
            onClickRow: function (rowid, rowdata) {
                indexSubTabla = rowid;
            },
            onBeforeEdit: function (rowid, rowdata) {
                indexSubTablaEdicion = rowid;
                banderaEdicion = 1;
            },
            onAfterEdit: function (index, rowData) {
                ActualizarRegistrarMaestro(rowData);
            },
            onCancelEdit: function (index, rowData) {
                $(document).unbind('keypress');
                rowData.editing = false;
            }
        });
    }

    function ActualizarRegistrarMaestro(rowData) {
        $.ajax({
            data: {
                contenedor: JSON.stringify(rowData),
                action: '3'
            },
            type: "POST",
            datatype: "json",
            url: 'GestionTablasServlet',
            success: function (data) {
                if (data === true) {
                    buscarMaestroSubTabla(tablaId);
                    $.messager.alert('Confirmacion', 'la operacion se realizo satisfactoriamente!', 'info');
                }
                else {
                    $.messager.alert('Error', 'No se registro', 'error');
                }
            },
            error: function () {
                $.messager.alert('Error', 'Error al Registrar ', 'error');
            }
        });
    }
</script>