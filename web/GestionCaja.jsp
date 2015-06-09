<div>
    <div>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h3 class="text-left">Gestion Caja</h3>
                <hr/>
            </div>
        </div>        
    </div>



    <div class="menuDerecho" >
        <div class="btn-group-vertical" role="group" aria-label="...">

            <button id="btnRegistrarArqueo" style="margin: 5px;text-align: left"  class="btn btn-primary">
                <span class="glyphicon glyphicon-plus">&nbsp;</span><strong>Registrar Arqueo</strong>
            </button>

            <button id="btnActualizarArqueo" style="margin: 5px;text-align: left"  class="btn btn-primary">
                <span class="glyphicon glyphicon-refresh">&nbsp;</span><strong>Ver / Actualizar Arqueo</strong>
            </button>

        </div>
    </div>
    <br>
    <div>
        <div id="divBuscarCaja" style="display: block">
            <div class="row">
                <div class="form-group col-md-2 col-sm-2" id="opcionFecha">
                    <label  class="control-label">Fecha</label>
                    <input id="dtFecha" type="text" class="form-control" required/>
                </div>

                <div class="form-group col-md-2 col-sm-2" id="opcionFecha">
                    <br>
                    <label  class="control-label">&nbsp;</label>
                    <button id="btnBuscarCaja" class="btn btn-primary"><strong>Buscar</strong></button>
                </div>

            </div>
            <table id="resultadoBusquedaCaja"></table>
        </div>
       <div id="divRegistrarArqueo" style="display: none">

            <form id="formTblaRegistrarArqueo">
                <div class="row">
                    <div class="form-group col-md-2 col-sm-2" id="opcionFecha">
                        <label  class="control-label">Fecha de Arqueo</label>
                        <input id="fechaArqueo" type="text" class="form-control easyui-validatebox" data-options="required:true" />
                    </div>
                </div>

                <table id="RegistrarArqueo"></table>

                <br>
                <div class="form-group col-md-1 col-sm-3 col-md-offset-9">
                    <label  style="align-left">Total</label>
                </div>
                <div class="form-group col-md-2 col-sm-3">
                    <input id="sumaTotal" placeholder="Total"  type="text" class="easyui-numberbox"  data-options="precision:3" disabled="disabled">
                    
                </div>
                <br>
            </form>
            <div class="form-group col-md-1 col-sm-2">
                <button id="idbtnGuardarArqueo" class="btn btn-primary"><strong>Guardar</strong></button>
            </div>
            <div class="form-group col-md-1 col-sm-2">
                <button id="idbtnCancelarRegistroAr" class="btn btn-primary"><strong>Cancelar</strong></button>
            </div>

        </div>
        <div id="divActualizarArqueo" style="display: none">
            <div class="row">
                <div class="form-group col-md-2 col-sm-2" id="opcionFecha">
                    <label  class="control-label">Fecha de Arqueo</label>
                    <input id="fechaArqueoActualizar" type="text" class="form-control" required disabled="disabled"/>
                </div>
            </div>

            <form id="formTblaActualizarArqueo"> 
                <table id="ActualizarArqueo"></table>

                <br>
                <div class="form-group col-md-1 col-sm-3 col-md-offset-9">
                    <label  style="align-left">Total</label>
                </div>
                <div class="form-group col-md-2 col-sm-3">
                    <input id="sumaTotalActualizar" placeholder="Total"  type="text" class="easyui-numberbox"  data-options="precision:3" disabled="disabled">                    
                </div>
                <br>
            </form>
            <div class="form-group col-md-1 col-sm-2">
                <button id="idbtnGuardarArqueoActualizado" class="btn btn-primary"><strong>Guardar</strong></button>
            </div>
            <div class="form-group col-md-1 col-sm-2">
                <button  id="idbtnCancelarActualizarAr" class="btn btn-primary"><strong>Cancelar</strong></button>
            </div>
        </div>
    </div>
</div>

<script>

    var idCaja = -1;

    $(document).on('ready', function () {
                
        $("#dtFecha").datepicker();
        $("#fechaArqueo").datepicker();

        $("#fechaArqueoActualizar").datepicker();
        cargarDatagrid();

    });

    //$(document).keypress(function (e) {
    // if (e.which == 13)
    //     $('.save').click();   // enter (works as expected)
    //               if (e.which === 27){};
    // alert(rowIndex);
    //          });



    function convertDateTommddyyyy(mmm) {
        var dia = mmm.substring(2, 0);
        var mes = mmm.substring(5, 3);
        var anio = mmm.substring(10, 6);
        //var mmm2 = mes + "/" + dia + "/" + anio;
        var mmm2 = anio + "/" + mes + "/" + dia;
        return mmm2;
    };

    $('#btnRegistrarArqueo').on('click', function () {
        idCaja = -1;
        $('#divBuscarCaja').css({'display': 'none'});
        $('#divRegistrarArqueo').css({'display': 'block'});
        $('#divActualizarArqueo').css({'display': 'none'});
        
        $("#RegistrarArqueo").datagrid();
    });

    $('#btnActualizarArqueo').on('click', function () {

        if (idCaja !== -1) {
            $('#divBuscarCaja').css({'display': 'none'});
            $('#divRegistrarArqueo').css({'display': 'none'});
            $('#divActualizarArqueo').css({'display': 'block'});
            
            $("#ActualizarArqueo").datagrid();
            //cargarDatagrid();
            ListarParaActualizarCaja();
        }
        else {

            $.messager.alert('Error', 'Por favor seleccione una fila', "error");
        }
    });

    $('#btnBuscarCaja').on('click', function () {
        $('#divBuscarCaja').css({'display': 'block'});
        $('#divRegistrarArqueo').css({'display': 'none'});
        $('#divActualizarArqueo').css({'display': 'none'});
        //cargarDatagrid();
        //alert(convertDateTommddyyyy($('#dtFecha').val()));
        ListarCaja();
    });

    $('#idbtnGuardarArqueo').on('click', function () {
        var tamañoCamposTabla = $("#RegistrarArqueo").datagrid('getRows').length;
        if (tamañoCamposTabla > 0) {
            if ($("#formTblaRegistrarArqueo").form("validate")) {
                for (var i = 0; i < tamañoCamposTabla; i++) {
                    $('#RegistrarArqueo').datagrid('endEdit', i);
                }


                var listCajaDetalle = $("#RegistrarArqueo").datagrid('getRows');
                alert(JSON.stringify(listCajaDetalle));
                /*   jQuery.each(listDetalleCajaAux, function (index, obj) {
                 
                 denominacion: obj.denominacion,
                 ingreso: obj.ingreso,
                 egreso:
                 listExamenNotaBE.push(oExamenMatricula);
                 
                 }); */
                MetRegistrarArqueo(listCajaDetalle);


            }
            else {
                $.messager.alert('Error', 'Verifique datos', "error");
            }
        }
        else {
            $.messager.alert('Error', 'No se encontraron Resultados', "error");
        }
    });


    $('#idbtnGuardarArqueoActualizado').on('click', function () {
        var tamañoCamposTabla = $("#ActualizarArqueo").datagrid('getRows').length;
        if (tamañoCamposTabla > 0) {
            if ($("#formTblaActualizarArqueo").form("validate")) {
                for (var i = 0; i < tamañoCamposTabla; i++) {
                    $('#ActualizarArqueo').datagrid('endEdit', i);
                }


                var listCajaDetalle = $("#ActualizarArqueo").datagrid('getRows');
                alert(JSON.stringify(listCajaDetalle));
                /*   jQuery.each(listDetalleCajaAux, function (index, obj) {
                 
                 
                 denominacion: obj.denominacion,
                 ingreso: obj.ingreso,
                 egreso:
                 listExamenNotaBE.push(oExamenMatricula);
                 
                 }); */

                ActualizarArqueo(listCajaDetalle);

            }
            else {
                $.messager.alert('Error', 'Verifique datos', "error");
            }
        }
        else {
            $.messager.alert('Error', 'No se encontraron Resultados', "error");
        }
    });

    $('#idbtnCancelarRegistroAr,#idbtnCancelarActualizarAr').on('click', function () {
        $('#divBuscarCaja').css({'display': 'block'});
        $('#divRegistrarArqueo').css({'display': 'none'});
        $('#divActualizarArqueo').css({'display': 'none'});
      //  cargarDatagrid();
        //alert(convertDateTommddyyyy($('#dtFecha').val()));
        $("#resultadoBusquedaCaja").datagrid();
    });

    function cargarDatagrid() {
        $("#resultadoBusquedaCaja").datagrid({
            title: 'Resultado busqueda de Caja',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'idcaja', title: 'idCaja', align: "left", width: 200, sortable: true, resizable: true, hidden: true},
                    {field: 'fechaarqueo', title: 'FECHA', align: "left", width: 800, sortable: true, resizable: true},
                    {field: 'monto', title: 'MONTO', width: 400, align: 'left', sortable: true, resizable: true}

                ]],
            onClickRow: function (rowid, rowdata) {
                idCaja = rowdata.idcaja;

                $('#fechaArqueoActualizar').val(rowdata.fechaarqueo);
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
        $("#RegistrarArqueo").datagrid({
            url: '',
            singleSelect: true,
            select: true,
            title: 'Registro de Arqueo',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'ck', title: '', checkbox: 'true'},
                    {field: 'denominacion', title: 'CONCEPTO', align: "center", width: 520, sortable: true, resizable: true, hidden: false,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: true
                            }
                        }
                    },
                    {field: 'ingreso', title: 'INGRESOS', align: "center", width: 200, sortable: true, resizable: true,
                        editor: {
                            type: 'numberbox',
                            options: {
                                required: true,
                                precision: 3
                            }
                        }
                    },
                    {field: 'egreso', title: 'EGRESOS', width: 200, align: 'center', sortable: true, resizable: true,
                        editor: {
                            type: 'numberbox',
                            options: {
                                required: true,
                                precision: 3
                            }
                        }
                    },
                    {field: 'subtotal', title: 'SUB TOTAL', align: "center", width: 200, sortable: true, resizable: true,
                        editor: {
                            //validacion tipo easy ui 
                            type: 'numberbox',
                            //letras valitadebox
                            options: {
                                required: true,
                                disabled: true,
                                precision: 3
                            }
                        }

                    }

                ]],
            onBeginEdit: function (rowIndex) {

                var editors = $("#RegistrarArqueo").datagrid('getEditors', rowIndex);
                var n1 = $(editors[0].target);
                var n2 = $(editors[1].target);
                var n3 = $(editors[2].target);
                var n4 = $(editors[3].target);

                n2.numberbox({
                    onChange: function () {
                        var subTotal = n2.numberbox('getValue') * (1);
                        n4.numberbox('setValue', subTotal);
                        n3.numberbox('disable');
                        Total('RegistrarArqueo','sumaTotal');
                    }
                });
                n3.numberbox({
                    onChange: function () {
                        var subTotal = n3.numberbox('getValue') * (-1);
                        n4.numberbox('setValue', subTotal);
                        n2.numberbox('disable');
                        
                        Total('RegistrarArqueo','sumaTotal');
                    }
                });


              //  $(document).bind('keypress', function (e) {
              //      if (e.keyCode === 13) {

                //    }
                 //   if (e.keyCode === 27) {

                   // }
               // });


            },
            onClickRow: function (rowid, rowdata) {
            },
            height: 200,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true,
            idField: 'idPartida',
            pagination: true,
            fitColumns: true,
            showFooter: true,
            toolbar: [{
                    text: 'Agregar',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#formTblaRegistrarArqueo").form('validate')) {
                            $('#RegistrarArqueo').datagrid('appendRow', {
                                ingreso: 0,
                                egreso: 0,
                                subtotal: 0
                            });
                            var editIndex = $('#RegistrarArqueo').datagrid('getRows').length - 1;
                            $('#RegistrarArqueo').datagrid('beginEdit', editIndex);
                        }
                        else {
                            $.messager.alert('Error', 'Verifique Campos!', 'error');
                        }
                    }
                }
                //"-",
                ,
                //"-",
                {
                    text: 'Eliminar ',
                    iconCls: 'icon-remove',
                    handler: function () {
                        var odetalleCaja = $('#RegistrarArqueo').datagrid('getSelected');
                        var index = $('#RegistrarArqueo').datagrid('getRowIndex', odetalleCaja);

                        $.messager.confirm('Confirmacion', '¿Esta Ud. seguro que desea eliminar?', function (r) {
                            if (r) {
                                $('#RegistrarArqueo').datagrid('deleteRow', index);
                                Total('RegistrarArqueo','sumaTotal');
                            }
                        });


                    }
                }
            ]
        });


        $("#ActualizarArqueo").datagrid({
            url: '',
            singleSelect: true,
            select: true,
            title: 'Actualizar Arqueo',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'ck', title: '', checkbox: 'true'},
                    {field: 'denominacion', title: 'CONCEPTO', align: "center", width: 520, sortable: true, resizable: true, hidden: false,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: true
                            }
                        }
                    },
                    {field: 'ingreso', title: 'INGRESOS', align: "center", width: 200, sortable: true, resizable: true,
                        editor: {
                            type: 'numberbox',
                            options: {
                                required: true,
                                precision: 3
                            }
                        }
                    },
                    {field: 'egreso', title: 'EGRESOS', width: 200, align: 'center', sortable: true, resizable: true,
                        editor: {
                            type: 'numberbox',
                            options: {
                                required: true,
                                precision: 3
                            }
                        }
                    },
                    {field: 'subtotal', title: 'SUB TOTAL', align: "center", width: 200, sortable: true, resizable: true,
                        editor: {
                            //validacion tipo easy ui 
                            type: 'numberbox',
                            //letras valitadebox
                            options: {
                                required: true,
                                disabled: true,
                                precision: 3
                            }
                        }

                    },
                    {field: 'idcajadetalle', title: 'idCajaDetalle', align: "left", width: 200, sortable: true, resizable: true}
                ]],
            onBeginEdit: function (rowIndex) {



                var editors = $("#ActualizarArqueo").datagrid('getEditors', rowIndex);

                $("#ActualizarArqueo").datagrid('selectRow', rowIndex);

                //var generico = rowIndex;
                //eliminar(generico);

                var n1 = $(editors[0].target);
                var n2 = $(editors[1].target);
                var n3 = $(editors[2].target);
                var n4 = $(editors[3].target);

                n2.numberbox({
                    onChange: function () {
                        n3.numberbox('disable');
                        var subTotal = n2.numberbox('getValue') * (1);
                        n4.numberbox('setValue', subTotal);
                       
                        Total('ActualizarArqueo','sumaTotalActualizar');
                    }
                });
                n3.numberbox({
                    onChange: function () {
                        n2.numberbox('disable');
                        var subTotal = n3.numberbox('getValue') * (-1);
                        n4.numberbox('setValue', subTotal);
                        
                        Total('ActualizarArqueo','sumaTotalActualizar');
                    }
                });

            },
            onClickRow: function (rowid, rowdata) {
            },
            height: 200,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true,
            idField: 'idPartida',
            pagination: true,
            fitColumns: true,
            showFooter: true,
            toolbar: [{
                    text: 'Agregar',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#formTblaActualizarArqueo").form('validate')) {
                            $('#ActualizarArqueo').datagrid('appendRow', {
                                ingreso: 0,
                                egreso: 0,
                                subtotal: 0
                            });
                            var editIndex = $('#ActualizarArqueo').datagrid('getRows').length - 1;
                            $('#ActualizarArqueo').datagrid('beginEdit', editIndex);
                        }
                        else {
                            $.messager.alert('Error', 'Verifique Campos!', 'error');
                        }
                    }
                },
                //"-",
                {
                    text: 'Eliminar ',
                    iconCls: 'icon-remove',
                    handler: function () {
                        var odetalleCaja = $('#ActualizarArqueo').datagrid('getSelected');
                        var index = $('#ActualizarArqueo').datagrid('getRowIndex', odetalleCaja);

                        //  alert(JSON.stringify(odetalleCaja));
                        //  alert(index);

                        $.messager.confirm('Confirmacion', '¿Esta Ud. seguro que desea eliminar?', function (r) {
                            if (r) {
                                if (odetalleCaja.idcajadetalle == null) {
                                    $('#ActualizarArqueo').datagrid('deleteRow', index);
                                    Total('ActualizarArqueo','sumaTotalActualizar');
                                }
                                else {
                                    EliminarCaja(odetalleCaja.idcajadetalle);
                                    $('#ActualizarArqueo').datagrid('deleteRow', index);
                                    Total('ActualizarArqueo','sumaTotalActualizar');
                                }
                            }
                        });


                    }
                }
            ]
        });
    }



    function MetRegistrarArqueo(listCajaDetalle) {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionCajaServlet",
            data: {
                listCajaDetalle: JSON.stringify(listCajaDetalle),
                fecha: $('#fechaArqueo').val(),
                sumaTotal: $('#sumaTotal').val(),
                action: '1'
            },
            success: function (data) {
                if (data === true) {
                    $.messager.alert('Informacion', 'Se registro correctamente', "info");

                }
                else
                    $.messager.alert('Error', 'No se pudo realizar el registro', "error");
                //  monto

                $('#divBuscarCaja').css({'display': 'block'});
                $('#divRegistrarArqueo').css({'display': 'none'});
                $('#divActualizarArqueo').css({'display': 'none'});
                    
                    $("#resultadoBusquedaCaja").datagrid();
                //cargarDatagrid();
                //alert(convertDateTommddyyyy($('#dtFecha').val()));

            },
            error: function (e) {
                //alert('Error: ' + e.message);
                // alert('Error: ' + e.toString());
                $.messager.alert('Error', 'Contactese con el administrador', "error");
            }
        });
    }

    function ListarCaja() {
        var fecha = convertDateTommddyyyy($('#dtFecha').val());
        //alert(fecha);
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionCajaServlet",
            data: {
                fecha: fecha,
                action: '2'
            },
            success: function (data) {
                alert(JSON.stringify(data));
                if (data.length === 0)
                    $.messager.alert('Error', 'Sin Resultados', "error");

                $("#resultadoBusquedaCaja").datagrid({
                    data: data});
                $("#resultadoBusquedaCaja").datagrid('unselectAll');
                
            },
            error: function (e) {
                //alert('Error: ' + e.message);
                // alert('Error: ' + e.toString());
                $.messager.alert('Error', 'Contactese con el administrador', "error");
            }
        });

    }

    function ListarParaActualizarCaja() {

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionCajaServlet",
            data: {
                idCaja: idCaja,
                action: '3'
            },
            success: function (data) {
                alert(JSON.stringify(data));
                if (data.length === 0)
                    $.messager.alert('Error', 'Sin Resultados', "error");

                $("#ActualizarArqueo").datagrid({
                    data: data});
                $("#ActualizarArqueo").datagrid('unselectAll');

                var index = $('#ActualizarArqueo').datagrid('getRows').length;
                for (var i = 0; i < index; i++) {
                    $('#ActualizarArqueo').datagrid('beginEdit', i);
                }

                Total('ActualizarArqueo','sumaTotalActualizar');

            },
            error: function (e) {
                $.messager.alert('Error', 'Contactese con el administrador', "error");
            }
        });

    }

    function ActualizarArqueo(listCajaDetalle) {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionCajaServlet",
            data: {
                listCajaDetalle: JSON.stringify(listCajaDetalle),
                sumaTotal: $('#sumaTotalActualizar').val(),
                idCaja: idCaja,
                action: '4'
            },
            success: function (data) {
                if (data === true) {
                    $.messager.alert('Informacion', 'Se actualizo correctamente', "info");

                }
                else
                    $.messager.alert('Error', 'No se pudo realizar la actualizacion', "error");
                //  monto

                $('#divBuscarCaja').css({'display': 'block'});
                $('#divRegistrarArqueo').css({'display': 'none'});
                $('#divActualizarArqueo').css({'display': 'none'});
                $("#resultadoBusquedaCaja").datagrid();

            },
            error: function (e) {
                //alert('Error: ' + e.message);
                // alert('Error: ' + e.toString());
                $.messager.alert('Error', 'Contactese con el administrador', "error");
            }
        });
    }

    function EliminarCaja(idcajadetalle) {

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "GestionCajaServlet",
            data: {
                idcajadetalle: idcajadetalle,
                action: '5'
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
    
    function Total(tabla,sumatotal) {
           var sum = 0;

                var cant = $('#' +tabla).datagrid('getRows').length;
                for (i = 0; i < cant; i++) {
                    var editors = $('#' +tabla).datagrid('getEditors', i);
                    var temp = $(editors[3].target);

                    sum = sum + parseFloat(temp.numberbox('getValue'));

                }
                $('#'+sumatotal).numberbox('setValue', sum);

    }
   

</script>