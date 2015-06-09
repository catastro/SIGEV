<div>
    <div>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h3 class="text-left">Gestion Ventas</h3>
                <hr/>
            </div>
        </div>        
    </div>


    <div class="row">

        <div class="form-group col-md-3 col-sm-4">

            <label class="control-label">Opciones de busqueda</label>
            <select id="opcionBusqueda" class="form-control" onChange="mostrar(this.selectedIndex)">
                <option value="1">Cliente</option>
                <option value="2">Personal</option>
                <option value="3">Numero Comprobante</option>
                <option value="3">Fecha</option>
            </select>
        </div>

        <div id="c1">
            <form id="formBuscarXCliente">    
                <div class="form-group col-md-3 col-sm-4 ">
                    <label class="control-label">Cliente</label>
                    <input id="txtCliente" type="text" class="form-control" placeholder="Ap. Pat +  Ap. Mat + Nombres" required>
                </div>
                <div class="form-group col-md-2 col-sm-4">
                    <label class="control-label">De</label>
                    <input id="txtFechaDeXCliente" type="text" class="form-control" required>
                </div> 
                <div class="form-group col-md-2 col-sm-4">
                    <label class="control-label">Hasta</label>
                    <input id="txtFechaHastaXCliente" type="text" class="form-control"  >
                </div>             
                <div class="form-group col-md-1 col-sm-2">
                    <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                    <input  type="submit" class="btn btn-primary" value="Buscar" >
                </div>
            </form>
        </div>
        <div id="c2" style="display:none">
            <form id="formBuscarXPersonal">    
                <div class="form-group col-md-3 col-sm-4">
                    <label class="control-label">Personal</label>
                    <select id="cmbPersonal" class="form-control" ></select>
                </div> 
                <div class="form-group col-md-2 col-sm-4">
                    <label class="control-label">De</label>
                    <input id="txtFechaDeXPersonal" type="text" class="form-control"  >
                </div> 
                <div class="form-group col-md-2 col-sm-4">
                    <label class="control-label">Hasta</label>
                    <input id="txtFechaHastaXPersonal" type="text" class="form-control"  >
                </div>             
                <div class="form-group col-md-1 col-sm-2">
                    <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                    <input  type="submit" class="btn btn-primary" value="Buscar" >
                </div>
            </form>
        </div>
        <div id="c3" style="display:none;">
            <form id="formBuscarXComprobante">    
                <div class="form-group col-md-2 col-sm-4">
                    <label class="control-label">Nro de Comprobante </label>
                    <input id="txtNroComprobante" type="number" class="form-control" placeholder="nro comprobante" required>
                </div>
                <div class="form-group col-md-1 col-sm-2">
                    <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                    <input  type="submit" class="btn btn-primary" value="Buscar" >
                </div>
            </form>

        </div>
        <div id="c4" style="display:none">
            <form id="formBuscarXFecha">
                <div class="form-group col-md-2 col-sm-4">
                    <label class="control-label">Fecha </label>
                    <input id="txtFecha" type="text" class="form-control" placeholder="Fecha" required>
                </div>
                <div class="form-group col-md-2 col-sm-4">
                    <label class="control-label">Estado</label>
                    <select id="cmdEstado" class="form-control" ></select>
                </div>
                <div class="form-group col-md-1 col-sm-2">
                    <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                    <input  type="submit" class="btn btn-primary" value="Buscar" >
                </div>
            </form>
        </div>

    </div>
    <div class="menuDerecho" >
        <div class="btn-group-vertical" role="group" aria-label="...">

            <button id="btnNuevoVenta" style="margin: 5px;text-align: left"  class="btn btn-primary">
                <span class="glyphicon glyphicon-plus">&nbsp;</span><strong>Nuevo</strong></button>

            <button id="btnActualizarVenta" style="margin: 5px;text-align: left"  class="btn btn-primary">
                <span class="glyphicon glyphicon-refresh">&nbsp;</span><strong>Actualizar</strong></button>

            <button id="btnEliminarVenta" style="margin: 5px;text-align: left"  class="btn btn-primary">
                <span class="glyphicon glyphicon-remove">&nbsp;</span><strong>Eliminar</strong></button>

        </div>
    </div>
    <br>
    <div>
        <div id="divBuscarVenta" style="display: block">
            <table id="resultadoBusquedaVentas"></table>
        </div>
        <div id="divNuevoVenta" style="display: none">
            <%@include file="_RegistrarVenta.html" %>
        </div>
        <div id="divActualizarVenta" style="display: none">
            <%@include file="_ActualizarVenta.html" %>
        </div>
    </div>
</div>

<script>
    $("#formBuscarXCliente").submit(function () {
        BuscarXCliente();
        mostrarDivBusqueda();
        return false;
    });
    $("#formBuscarXPersonal").submit(function () {
        BuscarXPersonal();
        mostrarDivBusqueda();
        return false;
    });
    $("#formBuscarXFecha").submit(function () {
        BuscarXFecha();
        mostrarDivBusqueda();
        return false;
    });
    $("#formBuscarXComprobante").submit(function () {
        BuscarXComprobante();
        mostrarDivBusqueda();
        return false;
    });
    $("#formularioBuscarClienteModal").submit(function () {
        BuscarClienteModal();
        return false;
    });
    $("#formBuscarProductoxCodigo").submit(function () {
        BuscarProductoXCodigoModal();
        return false;
    });
    $("#formBuscarProductoxDenominacion").submit(function () {
        BuscarProductoXDenominacionModal();
        return false;
    });

    $("#registrarVentaModal").submit(function () {
        if ($('#resultadoBusquedaProducto').datagrid('getRows').length !== 0) {
            RegistrarVentaModal();
        } else {
            $.messager.alert('Error', 'Seleccione un Producto', 'error');
        }
        return false;
    });


    $('#btnNuevoVenta').on('click', function () {
        cargarDatagridProductoDetalle();
        $('#divBuscarVenta').css({'display': 'none'});
        $('#divNuevoVenta').css({'display': 'block'});
        $('#divActualizarVenta').css({'display': 'none'});
    });

    $('#btnActualizarVenta').on('click', function () {
        if ($("#resultadoBusquedaVentas").datagrid('getSelected') !== null) {
            $('#divBuscarVenta').css({'display': 'none'});
            $('#divNuevoVenta').css({'display': 'none'});
            $('#divActualizarVenta').css({'display': 'block'});
        } else {
            $.messager.alert('Informacion', 'Seleccione una Fila', "info");
        }
    });

    /*     
     $('#btnEliminarVenta').on('click', function () {
     if (idExamen != -1) {
     $.messager.confirm('Confirme Registro', 'Esta Ud. seguro que desea eliminar el Registro?', function (r) {
     if (r) {
     EliminarExamen();
     }
     else {
     //no pasa nada
     }
     });
     } else {
     $.messager.alert('Informacion', 'Seleccione una Fila', "info");
     }
     });*/

    $("#modalBuscarCliente").click(function (event) {
        $("#modalBuscarClienteModal").dialog("open");
        cargarDatagridBuscarClienteModal();
        event.preventDefault();
    });
    
    $("#modalBuscarClienteA").click(function (event) {
        $("#modalBuscarClienteModal").dialog("open");
        cargarDatagridBuscarClienteModal();
        event.preventDefault();
    });


</script>
<script>

    $(document).on('ready', function () {
        c1 = document.getElementById('c1');
        cP1 = document.getElementById('cP1');
        $("#txtFecha").datepicker();
        $("#txtFechaDeXCliente").datepicker();
        $("#txtFechaHastaXCliente").datepicker();
        $("#txtFechaDeXPersonal").datepicker();
        $("#txtFechaHastaXPersonal").datepicker();
        listarCombos(idcEstadoVenta, 'cmdEstado');
        listarCombos(idcEstadoVenta, 'cmbEstadoVentaRegistro');
        ListarPersonal();
        cargarDatagridBuscarVentar();
    });

    function convertDateTommddyyyy(mmm) {
        var dia = mmm.substring(2, 0);
        var mes = mmm.substring(5, 3);
        var anio = mmm.substring(10, 6);
        //var mmm2 = mes + "/" + dia + "/" + anio;
        var mmm2 = anio + "/" + mes + "/" + dia;
        return mmm2;
    }

    function mostrar(num) {
        cx = document.getElementById('c' + (num + 1));
        c1.style.display = 'none';
        cx.style.display = 'block';
        c1 = cx;
    }

    function mostrarProducto(num) {
        cPx = document.getElementById('cP' + (num + 1));
        cP1.style.display = 'none';
        cPx.style.display = 'block';
        cP1 = cPx;
    }

    $("#modalBuscarClienteModal").dialog({
        title: "Cliente",
        autoOpen: false,
        resizable: false,
        //height: 300,
        width: 800,
        modal: true,
        closeOnEscape: true,
        buttons: {
            Aceptar: function () {
                var row = $("#buscarCliente").datagrid('getSelected');
                if (row !== null) {
                    $('#txtIdCliente').val(row.idCliente);
                    $('#txtClienteRespuesta').val(row.cliente);
                    $("#formularioBuscarClienteModal").trigger("reset");
                    $("#buscarCliente").datagrid({
                        data: []});
                    $(this).dialog("close");
                } else {
                    $.messager.alert('Error', 'Seleccione un Cliente', 'error');
                }
            },
            Cancelar: function () {
                $("#formularioBuscarClienteModal").trigger("reset");
                $("#buscarCliente").datagrid({
                    data: []});
                $(this).dialog("close");
            }
        },
        close: function () {
        }
    });

    $("#modalBuscarProductoModal").dialog({
        title: "Producto",
        autoOpen: false,
        width: 800,
        modal: true,
        closeOnEscape: true, /*sacar*/
        buttons: {
            Aceptar: function () {
                var row = $("#buscarProductos").datagrid('getSelected');
                if (row !== null) {
                    if ($('#txtcantidad').val() !== "" && $('#txtcantidad').val() <= row.stock) {
                        alert(row.stock);
                        var numb = $('#txtcantidad').val() * $('#cmbPrecioModal').val() - $('#txtDescuento').val();
                        numb = numb.toFixed(3);
                        var desc = 0;
                        if ($('#txtDescuento').val() !== "") {
                            desc = $('#txtDescuento').val();
                        }
                        $('#resultadoBusquedaProducto').datagrid('appendRow', {
                            idProducto: row.idProducto,
                            denominacion: row.denominacion,
                            cantidad: $('#txtcantidad').val(),
                            precio: $('#cmbPrecioModal').val(),
                            descuento: desc,
                            subTotal: numb
                        });
                        limpiarModalBuscarProducto();
                        $(this).dialog("close");
                        var sum = 0;
                        var cant = $('#resultadoBusquedaProducto').datagrid('getRows');
                        $.each(cant, function (entrylndex, entry) {
                            sum = sum + parseFloat(entry['subTotal']);
                        });
                        sum = sum.toFixed(3);
                        $('#txtTotalVentaReguistro').val(sum);
                    } else {
                        $.messager.alert('Error', 'Verifique Cantidad', 'error');
                    }
                } else {
                    $.messager.alert('Error', 'Seleccione un Producto', 'error');
                }

            },
            Cancelar: function () {
                limpiarModalBuscarProducto();
                $(this).dialog("close");
            }
        },
        close: function () {
        }
    });


    function limpiarModalBuscarProducto() {
        $("#formBuscarProductoxCodigo").trigger("reset");
        $("#formBuscarProductoxDenominacion").trigger("reset");
        $("#buscarProductos").datagrid({
            data: []});
        $('#txtcantidad').val("");
        $('#cmbPrecioModal').html("");
        $('#txtDescuento').val("");
    }

    function limpiarFormRegistroVenta() {
        $("#registrarVentaModal").trigger("reset");
        $("#resultadoBusquedaProducto").datagrid({
            data: []});
    }

    function mostrarDivBusqueda() {
        $('#divBuscarVenta').css({'display': 'block'});
        $('#divNuevoVenta').css({'display': 'none'});
        $('#divActualizarVenta').css({'display': 'none'});
    }
</script>

<script>

    function RegistrarVentaModal() {

        var oVenta = {
            TCliente: {
                idcliente: $('#txtIdCliente').val()
            },
            monto: $('#txtTotalVentaReguistro').val(),
            idcventa: $('#cmbEstadoVentaRegistro').val(),
            idpersonal: $('#cmbPersonalVentaRegistro').val()
        };
        var listVentaDetalle = new Array();
        var listVentaDetalle_ = $("#resultadoBusquedaProducto").datagrid('getRows');
        jQuery.each(listVentaDetalle_, function (index, obj) {
            var jsonArg = {
                TProducto: {
                    idproducto: obj.idProducto
                },
                cantidadventa: obj.cantidad,
                precioventaunid: obj.precio,
                descuento: obj.descuento,
                subtotal: obj.subTotal
            };
            listVentaDetalle.push(jsonArg);
        });
        $.ajax({
            type: 'post',
            url: 'GestionVentasServlet',
            dataType: "json",
            data: {
                action: '10',
                oVenta: JSON.stringify(oVenta),
                listDetalleVenta: JSON.stringify(listVentaDetalle)
            }
        }).done(function (dataRpta) {
            if (dataRpta !== 0) {
                alert(dataRpta);
            } else {
                alert("nose puedo");
            }
        }).fail(function (jqXHR, textStatus) {
            //alert("jqXHR: " + jqXHR + " - " +  "Request failed: " + textStatus );            
            alert("Request failed: " + textStatus);
        }).always(function () {
            limpiarFormRegistroVenta();
        });
    }

    function BuscarXCliente() {
        var fechaDeXCliente = convertDateTommddyyyy($('#txtFechaDeXCliente').val());
        var fechaHastaXCliente = convertDateTommddyyyy($('#txtFechaHastaXCliente').val());
        if ($('#txtFechaHastaXCliente').val() === "") {
            fechaHastaXCliente = fechaDeXCliente;
        }
        $.ajax({
            type: 'post',
            url: 'GestionVentasServlet',
            dataType: "json",
            data: {
                action: '4',
                fechaDe: fechaDeXCliente,
                fechaHasta: fechaHastaXCliente,
                cliente: $('#txtCliente').val()
            }
        }).done(function (dataRpta) {
            if (dataRpta.length === 0) {
                $.messager.alert('Error', 'Sin Resultados', "error");
            }
            $("#resultadoBusquedaVentas").datagrid({
                data: dataRpta});
            $("#resultadoBusquedaVentas").datagrid('unselectAll');
        }).fail(function (jqXHR, textStatus) {
            alert("Request failed: " + textStatus);
        });
    }

    function BuscarXPersonal() {
        var fechaDeXPersonal = convertDateTommddyyyy($('#txtFechaDeXPersonal').val());
        var fechaHastaXPersonal = convertDateTommddyyyy($('#txtFechaHastaXPersonal').val());
        if ($('#txtFechaHastaXPersonal').val() === "") {
            fechaHastaXPersonal = fechaDeXPersonal;
        }
        $.ajax({
            type: 'post',
            url: 'GestionVentasServlet',
            dataType: "json",
            data: {
                action: '3',
                fechaDe: fechaDeXPersonal,
                fechaHasta: fechaHastaXPersonal,
                //personal: '1'
                personal: $('#cmbPersonal').val()
            }
        }).done(function (dataRpta) {
            if (dataRpta.length === 0) {
                $.messager.alert('Error', 'Sin Resultados', "error");
            }
            $("#resultadoBusquedaVentas").datagrid({
                data: dataRpta});
            $("#resultadoBusquedaVentas").datagrid('unselectAll');
        }).fail(function (jqXHR, textStatus) {
            alert("Request failed: " + textStatus);
        });
    }

    function BuscarXComprobante() {

        $.ajax({
            type: 'post',
            url: 'GestionVentasServlet',
            dataType: "json",
            data: {
                action: '2',
                comprobante: $('#txtNroComprobante').val()
            }
        }).done(function (dataRpta) {
            if (dataRpta.length === 0) {
                $.messager.alert('Error', 'Sin Resultados', "error");
            }
            $("#resultadoBusquedaVentas").datagrid({
                data: dataRpta});
            $("#resultadoBusquedaVentas").datagrid('unselectAll');
        }).fail(function (jqXHR, textStatus) {
            //alert("jqXHR: " + jqXHR + " - " +  "Request failed: " + textStatus );            
            alert("Request failed: " + textStatus);
        });
    }

    function BuscarXFecha() {
        var fecha = convertDateTommddyyyy($('#txtFecha').val());
        $.ajax({
            type: 'post',
            url: 'GestionVentasServlet',
            dataType: "json",
            data: {
                action: '1',
                fecha: fecha,
                estado: $('#cmdEstado').val()
            }
        }).done(function (dataRpta) {
            if (dataRpta.length === 0) {
                $.messager.alert('Error', 'Sin Resultados', "error");
            }
            $("#resultadoBusquedaVentas").datagrid({
                data: dataRpta});
            $("#resultadoBusquedaVentas").datagrid('unselectAll');
        }).fail(function (jqXHR, textStatus) {
            alert("Request failed: " + textStatus);
        });
    }

    function ListarPersonal() {

        $.ajax({
            type: 'post',
            url: 'GestionVentasServlet',
            dataType: "json",
            data: {
                action: '5'
            }
        }).done(function (dataRpta) {
            var html = "";
            jQuery.each(dataRpta, function (i, val) {

                html = html + "<option value='" + val.idPersonal + "'>" + val.personal + "</option>";
            });
            $('#cmbPersonal').html(html);
            $('#cmbPersonalVentaRegistro').html(html);
        }).fail(function (jqXHR, textStatus) {
            alert("Request failed: " + textStatus);
        });
    }

    function BuscarClienteModal() {
        $.ajax({
            type: 'post',
            url: 'GestionVentasServlet',
            dataType: "json",
            data: {
                action: '6',
                //codigo: $('#txtClienteCodigoModal').val(),
                codigo: '',
                cliente: $('#txtClienteModal').val()
            }
        }).done(function (dataRpta) {
            alert(JSON.stringify(dataRpta));
            if (dataRpta.length === 0) {
                $.messager.alert('Error', 'Sin Resultados', "error");
            }
            $("#buscarCliente").datagrid({
                data: dataRpta});
            $("#buscarCliente").datagrid('unselectAll');
        }).fail(function (jqXHR, textStatus) {
            alert("Request failed: " + textStatus);
        });
    }

    function BuscarProductoXCodigoModal() {
        $.ajax({
            type: 'post',
            url: 'GestionVentasServlet',
            dataType: "json",
            data: {
                action: '7',
                codigo: $('#txtCodigoProductomModal').val()
            }
        }).done(function (dataRpta) {
            alert(JSON.stringify(dataRpta));
            if (dataRpta.length === 0) {
                $.messager.alert('Error', 'Sin Resultados', "error");
            }
            $("#buscarProductos").datagrid({
                data: dataRpta});
            $("#buscarProductos").datagrid('unselectAll');
        }).fail(function (jqXHR, textStatus) {
            alert("Request failed: " + textStatus);
        });
    }

    function BuscarProductoXDenominacionModal() {
        $.ajax({
            type: 'post',
            url: 'GestionVentasServlet',
            dataType: "json",
            data: {
                action: '8',
                denominacion: $('#txtDenominacionProductoModal').val()
            }
        }).done(function (dataRpta) {
            alert(JSON.stringify(dataRpta));
            if (dataRpta.length === 0) {
                $.messager.alert('Error', 'Sin Resultados', "error");
            }
            $("#buscarProductos").datagrid({
                data: dataRpta});
            $("#buscarProductos").datagrid('unselectAll');
        }).fail(function (jqXHR, textStatus) {
            alert("Request failed: " + textStatus);
        });
    }

    function ListarPreciosModal(idProducto) {

        $.ajax({
            type: 'post',
            url: 'GestionVentasServlet',
            dataType: "json",
            data: {
                action: '9',
                idProducto: idProducto
            }
        }).done(function (dataRpta) {
            var html = "";
            jQuery.each(dataRpta, function (i, val) {

                html = html + "<option value='" + val.precio + "'>" + val.denomimacion + "</option>";
            });
            $('#cmbPrecioModal').html(html);
        }).fail(function (jqXHR, textStatus) {
            alert("Request failed: " + textStatus);
        });
    }
</script>

<script>
    function cargarDatagridBuscarVentar() {
        $("#resultadoBusquedaVentas").datagrid({
            url: '',
            title: 'VENTAS',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'numcomprobante', title: 'Nro Comprobante de venta', align: "left", width: 150, sortable: true, resizable: true},
                    {field: 'cliente', title: 'Cliente', align: "left", width: 200, sortable: true, resizable: true},
                    {field: 'fecha', title: 'Fecha', width: 100, align: 'left', sortable: true, resizable: true},
                    {field: 'monto', title: 'Monto', width: 100, align: 'left', sortable: true, resizable: true},
                    {field: 'idcVenta', title: 'idcVenta', width: 100, align: 'left', sortable: true, resizable: true},
                    {field: 'observacion', title: 'Observacion', width: 400, align: 'left', sortable: true, resizable: true}
                ]],
            onClickRow: function (rowid, rowdata) {
            },
            singleSelect: true,
            //height: auto,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true
                    //idField: 'idPartida'
        });
    }

    function cargarDatagridBuscarClienteModal() {
        $("#buscarCliente").datagrid({
            url: '',
            title: 'VENTAS',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'idCliente', title: 'idCliente', align: "left", width: 120, sortable: true, resizable: true, hidden: true},
                    {field: 'codigoCliente', title: 'Codigo', align: "left", width: 120, sortable: true, resizable: true},
                    {field: 'cliente', title: 'Nombres y Apellidos', align: "left", width: 300, sortable: true, resizable: true},
                    {field: 'direccion', title: 'Direccion', width: 300, align: 'left', sortable: true, resizable: true}
                ]],
            onClickRow: function (rowid, rowdata) {
            },
            singleSelect: true,
            //width:500,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true
        });
    }

    function cargarDatagridProducto() {
        $("#buscarProductos").datagrid({
            url: '',
            title: 'PRODUCTOS',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'idProducto', title: 'idProducto', align: "left", width: 50, sortable: true, resizable: true, hidden: false},
                    {field: 'codigo', title: 'Codigo', align: "left", width: 50, sortable: true, resizable: true},
                    {field: 'denominacion', title: 'Denominacion', align: "left", width: 200, sortable: true, resizable: true},
                    {field: 'stock', title: 'Stock', align: "left", width: 100, sortable: true, resizable: true},
                    {field: 'observacion', title: 'observacion', align: "left", width: 300, sortable: true, resizable: true}
                ]],
            onClickRow: function (rowid, rowdata) {
                ListarPreciosModal(rowdata.idProducto);
            },
            height: 150,
            singleSelect: true,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true
        });
    }

    function cargarDatagridProductoDetalle() {
        $("#resultadoBusquedaProducto").datagrid({
            url: '',
            title: 'DETALLES DE VENTAS',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'idProducto', title: 'idProducto', align: "left", width: 50, sortable: true, resizable: true},
                    {field: 'denominacion', title: 'Denominacion', align: "left", width: 150, sortable: true, resizable: true},
                    {field: 'cantidad', title: 'Cantidad', align: "left", width: 150, sortable: true, resizable: true},
                    {field: 'precio', title: 'Precio', align: "left", width: 150, sortable: true, resizable: true},
                    {field: 'descuento', title: 'Descuento', align: "left", width: 150, sortable: true, resizable: true},
                    {field: 'subTotal', title: 'Sub Total', align: "left", width: 200, sortable: true, resizable: true}
                ]],
            onClickRow: function (rowid, rowdata) {
            },
            toolbar: [{
                    text: ' NUEVO ',
                    iconCls: 'icon-add',
                    handler: function () {
                        $(this).click(function (event) {
                            $("#modalBuscarProductoModal").dialog("open");
                            cargarDatagridProducto();
                            event.preventDefault();
                        });
                    }
                }, {
                    text: ' ELIMINAR DE LISTA ',
                    iconCls: 'icon-cancel',
                    handler: function () {

                        var oResultadoBusquedaProducto = $('#resultadoBusquedaProducto').datagrid('getSelected');
                        if (oResultadoBusquedaProducto !== null) {
                            $.messager.confirm('Confirmacion', '¿Esta Ud. seguro que desea eliminar?', function (r) {
                                if (r) {
                                    var index = $('#resultadoBusquedaProducto').datagrid('getRowIndex', oResultadoBusquedaProducto);
                                    $('#resultadoBusquedaProducto').datagrid('deleteRow', index);
                                    var sum = 0;
                                    var cant = $('#resultadoBusquedaProducto').datagrid('getRows');
                                    $.each(cant, function (entrylndex, entry) {
                                        sum = sum + parseFloat(entry['subTotal']);
                                    });
                                    sum = sum.toFixed(3);
                                    $('#txtTotalVentaReguistro').val(sum);
                                }
                            });
                        } else {
                            $.messager.alert('Error', 'Seleccione un Producto', 'error');
                        }
                    }
                }],
            singleSelect: true,
            width: 850,
            height: 300,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true
        });
    }
</script>