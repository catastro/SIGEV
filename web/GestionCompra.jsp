
<div>
    <div>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h3 class="text-left">Gestion Compras</h3>
                <hr/>
            </div>
        </div>


        <div class="row">
            <div class="form-group col-md-3 col-sm-6">
                <label class="control-label">Opcion de Busqueda </label>
                <select id="cmbOpcionBusquedaDetalleProducto"  class="form-control" >
                    <option value="1">Proveedor</option>                        
                    <option value="2">Nro Comprobante</option>                        
                </select>
            </div>
            <form id="formBuscarNroComprobante" style="display: none;">
                <div class="row">
                    <div class="form-group col-md-4 col-sm-6">
                        <label class="control-label">Nro de Comprobante</label>
                        <input id="txtNroComprobante" type="text" class="form-control" pattern="{1,30}" placeholder="Nro de comprobante" required>
                    </div>
                    <div class="form-group col-md-1 col-sm-2">
                        <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                        <input class="btn btn-primary" value="Buscar" type="submit" />
                    </div>

                </div>
            </form>
            <form id="formBuscarProveedor" style="display: none;">
                <div class="form-group col-md-4 col-sm-6">
                    <label class="control-label">Proveedor </label>
                    <select id="cmbProveedorCompra"  class="form-control" required>
                        <!--<option>- Seleccionar -</option>-->
                    </select>
                </div>
                <div class="form-group col-md-3 col-sm-6">
                    <label class="control-label">Fecha</label>
                    <input id="txtFechaCompra" type="text" class="form-control" required>
                </div>
                <div class="form-group col-md-1 col-sm-2">
                    <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                    <input class="btn btn-primary" value="Buscar" type="submit" />
                </div>
            </form>
        </div>



        <!--Inicio botones menu-->
        <div class="menuDerecho">
            <div class="btn-group-vertical" role="group" aria-label="...">
                <button id="btnNuevoAlumno" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-plus">&nbsp;</span><strong>Nuevo</strong></button>
                <button id="btnActualizarAlumno" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-refresh">&nbsp;</span><strong>Actualizar</strong></button>
                <button id="btnEliminarAlumno" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-remove">&nbsp;</span><strong>Eliminar</strong></button>
            </div>     
        </div>
        <!--Fin botones menu-->
        <br>
    </div>

    <!--Modal-->
    <div class="modal fade" id="modalProductoBuscar" style="display: none;" tabindex="-1" role="dialog" aria-labelledby="MyModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="height: 600px; width: 700px">
                <div class="modal-header">
                    <div class="row">
                        <div class="form-group col-md-5 col-sm-6">
                            <label class="control-label">Opcion de Busqueda </label>
                            <select id="cmbOpcionBusquedaProducto"  class="form-control" >
                                <option value="1">Codigo Producto</option>                        
                                <option value="2">Nombre Producto</option>
                            </select>
                        </div>
                        <form id="formBuscarXNombreProducto" style="display: none;">
                            <div class="form-group col-md-5 col-sm-4">
                                <label class="control-label">Nombre Producto</label>
                                <input id="txtNombreProducto" type="text" class="form-control"  placeholder="Producto"  />
                            </div>
                            <div class="form-group col-md-1 col-sm-2">
                                <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                                <input class="btn btn-primary" value="Buscar" type="submit" />
                            </div>
                        </form>

                        <form id="formBuscarXCodigoProducto" style="display: none;">
                            <div class="form-group col-md-5 col-sm-4">
                                <label class="control-label">Codigo de Producto</label>
                                <input id="txtCodidgoProducto" type="text" class="form-control"  maxlength="8" placeholder="Codigo de Producto"  />
                            </div>
                            <div class="form-group col-md-1 col-sm-2">
                                <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                                <input class="btn btn-primary" value="Buscar" type="submit" />
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row form-group" >
                        <div class="form-group col-md-12 col-sm-6">
                            <label class="control-label"> <span class="claseObligatorio">(*) Campos obligatorios</span></label>
                        </div> 
                        <div class="col-xs-12 col-md-12">
                            <table id="dgProductoBuscar"></table>
                            <br>
                        </div>
                        <div class="form-group col-md-4 col-sm-4">
                            <label class="control-label">Cantidad de Compra <span class="claseObligatorio">(*)</span></label>
                            <input id="txtCantidadCompraProducto" type="number" class="form-control"   placeholder="Cantidad de Compra"  />
                        </div>
                        <div class="form-group col-md-4 col-sm-4">
                            <label class="control-label">Precio Compra <span class="claseObligatorio">(*)</span></label>
                            <input id="txtPrecioCompra" type="text" class="form-control" placeholder="Precio de Compra producto"  />
                        </div>
                        <div class="form-group col-md-4 col-sm-4">
                            <label class="control-label">Cant. de Prod. Daniados</label>
                            <input id="txtCantidadCompraDaniadosProducto" type="number" class="form-control"  placeholder="Cantidad de productos daniados"  />
                        </div>

                        <div class="form-group col-md-2 col-sm-3">
                            <br/>
                            <button id="btnAgregarProductoBuscar" class="btn btn-primary"><strong>Agregar</strong></button>
                        </div>
                        <div class="form-group col-md-2 col-sm-3">
                            <br/>
                            <input id="btnrstProductoBuscar" class="btn btn-primary" value="Cancelar" type="reset" /> 
                        </div>
                    </div> 
                </div>
            </div> 
        </div> 
    </div>


    <!--Inicio grilla principal-->
    <div>
        <div class="row">
            <div class="col-md-11">
                <table id="dgProductoComprar"></table>     
            </div>
        </div>
        <div>
            <form id="formRegistrarCompra">
                <div class="row">
                    <div class="col-md-2 text-right">
                        <br/>
                        <label class="control-label">Nro Comprobante</label>
                    </div>
                    <div class="col-md-3">
                        <br/>
                        <input id="txtNroComprobanteRegistrar" type="number" class="form-control" required>
                    </div>
                    <div class="col-md-2">                
                    </div>
                    <div class="col-md-2 text-right">    
                        <br/>
                        <label class="control-label">Monto Total Compra</label>
                    </div>
                    <div class="col-md-2">  
                        <br/>
                        <input id="txtTotalCompra" type="text" class="form-control" placeholder="Total compra" disabled>
                    </div>

                </div>

                <div class="row">
                    <div class="form-group col-md-1 col-sm-3">
                        <br/>
                        <input class="btn btn-primary" value="Guardar" type="submit" />
                        <!--<button id="btnGuardarCompra"  class="btn btn-primary"><strong>Guardar</strong></button>-->
                    </div>
                    <div class="form-group col-md-1 col-sm-3">
                        <br/>
                        <button id="btnCancelarCompra" class="btn btn-primary"><strong>Cancelar</strong></button>
                    </div>
                </div>

            </form>


        </div>
        <br/>

    </div>    
    <!--fin grilla principal-->
</div>

<script>


    var opcionRegistrarActualizar = 0;

    $(function() {
        $('#formBuscarProveedor').css({'display': 'block'});
        $('#formBuscarXCodigoProducto').css({'display': 'block'});
        listarProveedor();
        //crearGrillaListMaestro();
        cargarDgProductoComprar();
        cargarDgProductoBuscar();

        $("#cmbProveedorCompra").val($("#target option:first").val());
        $("#txtFechaCompra").datepicker();
    });

    $("#cmbOpcionBusquedaDetalleProducto").change(function() {
        if ($("#cmbOpcionBusquedaDetalleProducto").val() === "1") {
            $('#formBuscarNroComprobante').css({'display': 'none'});
            $('#formBuscarProveedor').css({'display': 'block'});
            $('#formBuscarNroComprobante')[0].reset();
            $('#formBuscarProveedor')[0].reset();
        } else if ($("#cmbOpcionBusquedaDetalleProducto").val() === "2") {
            $('#formBuscarNroComprobante').css({'display': 'block'});
            $('#formBuscarProveedor').css({'display': 'none'});
            $('#formBuscarNroComprobante')[0].reset();
            $('#formBuscarProveedor')[0].reset();
        }
    });


    $("#cmbOpcionBusquedaProducto").change(function() {
        if ($("#cmbOpcionBusquedaProducto").val() === "2") {
            $('#formBuscarXNombreProducto').css({'display': 'block'});
            $('#formBuscarXCodigoProducto').css({'display': 'none'});
            $('#formBuscarXNombreProducto')[0].reset();
            $('#formBuscarXCodigoProducto')[0].reset();
        } else if ($("#cmbOpcionBusquedaProducto").val() === "1") {
            $('#formBuscarXNombreProducto').css({'display': 'none'});
            $('#formBuscarXCodigoProducto').css({'display': 'block'});
            $('#formBuscarXNombreProducto')[0].reset();
            $('#formBuscarXCodigoProducto')[0].reset();
        }
    });


    $("#formBuscarXNombreProducto, #formBuscarXCodigoProducto ").submit(function() {
        buscarProductos();
        return false;
    });


    $('#btnrstProductoBuscar').click(function() {
        $('#formBuscarXNombreProducto')[0].reset();
        $('#formBuscarXCodigoProducto')[0].reset();
        $('#modalProductoBuscar').modal('hide');
        $('#txtCantidadCompraProducto').val("");
        $('#dgProductoBuscar').datagrid('unselectAll');
        $('#dgProductoBuscar').datagrid({data: []});
    });


    $('#btnAgregarProductoBuscar').click(function() {
        var data = null;
        data = $('#dgProductoBuscar').datagrid('getSelected');
        if (data !== null) {
            if (opcionRegistrarActualizar === 1) {
                if ($('#txtCantidadCompraProducto').val() === "") {
                    $.messager.alert('Informacion', 'Por favor ingrese la cantidad de compra', 'warning');
                } else if ($('#txtPrecioCompra').val() === "") {
                    $.messager.alert('Informacion', 'Por favor ingrese el precio de compra', 'warning');
                } else {
                    var cantidadDaniados = 0;
                    if ($('#txtCantidadCompraDaniadosProducto').val() !== "") {
                        cantidadDaniados = $('#txtCantidadCompraDaniadosProducto').val();
                    }

                    var productoBuscar = $('#dgProductoBuscar').datagrid('getSelected');
                    productoBuscar.estadoCompra = 0;
                    productoBuscar.cantidadUnidCompra = $('#txtCantidadCompraProducto').val();
                    productoBuscar.precioCompra = $('#txtPrecioCompra').val();
                    productoBuscar.cantidadDaniado = cantidadDaniados;
                    productoBuscar.subTotal = productoBuscar.precioCompra * productoBuscar.cantidadUnidCompra;
                    if ($('#txtCantidadCompraDaniadosProducto') === "") {
                        productoBuscar.cantidadDaniados = 0;
                    }
                    $('#dgProductoComprar').datagrid('appendRow', productoBuscar);
                    $('#btnrstProductoBuscar').click();

                    var listProductosSeleccionado = $('#dgProductoComprar').datagrid('getRows');
                    var precioTotal = 0;
                    jQuery.each(listProductosSeleccionado, function(index, val) {
                        precioTotal = precioTotal + parseFloat(val.subTotal);
                    });
                    $('#txtTotalCompra').val(precioTotal);
                }

            } else if (opcionRegistrarActualizar === 2) {

                var indiceDetalleSeleccionado = $('#dgProductoComprar').datagrid("getRowIndex", $('#dgProductoComprar').datagrid('getSelected'));
                //var data = $('#dgProductoComprar').datagrid('selectRow', indiceDetalleSeleccionado);//.estadoCompra = 3;
                var cantidadDaniadoActualizar = 0;
                if ($('#txtCantidadCompraDaniadosProducto').val() === "") {
                    cantidadDaniadoActualizar = 0;
                } else {
                    cantidadDaniadoActualizar = $('#txtCantidadCompraDaniadosProducto').val();
                }
                $('#dgProductoComprar').datagrid('updateRow', {
                    index: indiceDetalleSeleccionado,
                    row: {
                        estadoCompra: 0,
                        cantidadUnidCompra: $('#txtCantidadCompraProducto').val(),
                        precioCompra: $('#txtPrecioCompra').val(),
                        cantidadDaniado: cantidadDaniadoActualizar,
                        idProducto: $('#dgProductoBuscar').datagrid('getSelected').idProducto,
                        idProveedor: $('#dgProductoBuscar').datagrid('getSelected').idProveedor,
                        idcMarca: $('#dgProductoBuscar').datagrid('getSelected').idcMarca,
                        codigo: $('#dgProductoBuscar').datagrid('getSelected').codigo,
                        nombre: $('#dgProductoBuscar').datagrid('getSelected').nombre,
                        stock: $('#dgProductoBuscar').datagrid('getSelected').stock,
                        cantidadUnidCajas: $('#dgProductoBuscar').datagrid('getSelected').cantidadUnidCajas,
                        subTotal: parseFloat($('#txtPrecioCompra').val()) * parseInt($('#txtCantidadCompraProducto').val())
                    }
                });


                $('#btnrstProductoBuscar').click();

                var listProductosSeleccionado = $('#dgProductoComprar').datagrid('getRows');
                var precioTotal = 0;
                jQuery.each(listProductosSeleccionado, function(index, val) {
                    precioTotal = precioTotal + parseFloat(val.subTotal);
                });
                $('#txtTotalCompra').val(precioTotal);
            }
        } else {
            $.messager.alert('Informacion', 'Por favor seleccione un producto', 'warning');
        }
    });


    $('#formRegistrarCompra').submit(function() {
        var listDetalleCompra = new Array();
        var idCompraRegistrada = 0;
        var listProductos = $('#dgProductoComprar').datagrid('getRows');

        if (listProductos.length > 0) {
            jQuery.each(listProductos, function(index, val) {
                if (val.estadoCompra === 0) {
                    var detalleCompra = {
                        iddetallecompra: parseInt(val.idDetalleCompra),
                        cantidadcompra: parseInt(val.cantidadUnidCompra),
                        cantidaddaniado: parseInt(val.cantidadDaniado),
                        subtotal: parseFloat(val.subTotal),
                        preciocompraunid: parseFloat(val.precioCompra),
                        TProducto: {
                            idproducto: parseInt(val.idProducto)
                        }
                    };
                    listDetalleCompra.push(detalleCompra);
                }
            });
            for (var i = 0; i < listProductos.length; i++) {
                if (listProductos[i].estadoCompra === 1) {
                    idCompraRegistrada = listProductos[i].idCompra;
                    break;
                }
            }
            registrarCompra(listDetalleCompra, idCompraRegistrada);
        } else {
            $.messager.alert('Informacion', 'No se tiene ningun detalle de compra, por favor ingrese detalles de compra', 'warning');
        }
        return false;
    });


    $('#btnCancelarCompra').click(function() {
        $.messager.confirm('Confirmacion', 'Estas seguro que desea cancelar la compra?', function(r) {
            if (r) {
                buscarDetalleCompra();
            }
        });
        return false;
    });


    $('#formBuscarNroComprobante, #formBuscarProveedor').submit(function() {
        buscarDetalleCompra();
        return false;
    });



    function cargarDgProductoComprar() {
        $("#dgProductoComprar").datagrid({
            //url: '',
            title: 'Detalle de Compra',
            columns: [[
                    {field: 'idCompra', title: 'idCompra', align: "center", width: 100, sortable: true, resizable: true, hidden: false},
                    {field: 'idDetalleCompra', title: 'idDetalleCompra', align: "center", width: 100, sortable: true, resizable: true, hidden: false},
                    {field: 'idProducto', title: 'idProducto', align: "center", width: 100, sortable: true, resizable: true, hidden: false},
                    {field: 'idProveedor', title: 'idProveedor', align: "center", width: 100, sortable: true, resizable: true, hidden: false},
                    {field: 'idcMarca', title: 'idcMarca', width: 100, align: 'center', sortable: true, resizable: true, hidden: false},
                    {field: 'codigo', title: 'Codigo', width: 150, align: 'center', sortable: true, resizable: true, hidden: false},
                    {field: 'nombre', title: 'Nombre', width: 150, align: 'center', sortable: true, resizable: true, hidden: false},
                    {field: 'stock', title: 'Stock', width: 100, align: 'center', sortable: true, resizable: true, hidden: false},
                    {field: 'cantidadUnidCajas', title: 'Cant. Unid X Caja', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'precioCompra', title: 'Precio Compra', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'cantidadUnidCompra', title: 'Cant. Compra', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'cantidadDaniado', title: 'Cant. Daniados', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'subTotal', title: 'Sub total', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'nroComprobante', title: 'nroComprobante', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'estadoCompra', title: 'EstadoCompra', width: 150, align: 'center', sortable: true, resizable: true}
                ]],
            toolbar: [{
                    text: ' AGREGAR PRODUCTO ',
                    iconCls: 'icon-add',
                    handler: function() {
                        $(this).attr({
                            'data-toggle': 'modal',
                            'data-target': '#modalProductoBuscar'
                        });
                        opcionRegistrarActualizar = 1;
                        $('#txtCantidadCompraProducto').val("");
                        $('#txtPrecioCompra').val("");
                        $('#txtCantidadCompraDaniadosProducto').val("");

                    }
                }, {
                    text: ' ACTUALIZAR PRODUCTO ',
                    iconCls: 'icon-reload',
                    handler: function() {
                        var detalleSeleccionado = null;
                        detalleSeleccionado = $('#dgProductoComprar').datagrid('getSelected');
                        if (detalleSeleccionado !== null) {
                            //('#dgProductoBuscar').datagrid({data: null});
                            $(this).attr({
                                'data-toggle': 'modal',
                                'data-target': '#modalProductoBuscar'
                            });
                            opcionRegistrarActualizar = 2;

                            $('#cmbOpcionBusquedaProducto > option[value="1"]').attr('selected', 'selected');

                            $('#txtCodidgoProducto').val(detalleSeleccionado.codigo);
                            $('#formBuscarXNombreProducto').submit();
                            $('#formBuscarXCodigoProducto').submit();

                            /*var dataBusqueda = $('#dgProductoBuscar').datagrid('getRows');
                             var indiceAbierto = $('#dgProductoBuscar').datagrid("getRowIndex", dataBusqueda[0]);
                             alert("indice abierto: " + indiceAbierto);
                             $('#dgProductoBuscar').datagrid('selectRow', 0);*/

                            $('#txtCantidadCompraProducto').val(detalleSeleccionado.cantidadUnidCompra);
                            $('#txtPrecioCompra').val(detalleSeleccionado.precioCompra);
                            $('#txtCantidadCompraDaniadosProducto').val(detalleSeleccionado.cantidadDaniado);

                        } else {
                            $.messager.alert('Informacion', 'Por favor seleccione un detalle de compra', 'warning');
                        }

                    }
                }, {
                    text: ' QUITAR PRODUCTO ',
                    iconCls: 'icon-cancel',
                    handler: function() {
                        var data = null;
                        data = $('#dgProductoComprar').datagrid('getSelected');
                        if (data !== null) {
                            $.messager.confirm('Confirmacion', 'Estas seguro que desea eliminar el Detalle de Compra?', function(r) {
                                if (r) {
                                    eliminarDetalleCompra();
                                }
                            });

                        } else {
                            $.messager.alert('Informacion', 'Por favor seleccione un detalle de compra', 'warning');
                        }


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
            idField: 'idPersona'
        });
    }


    function cargarDgProductoBuscar() {
        $("#dgProductoBuscar").datagrid({
            //url: '',
            title: 'Resultado De La Busqueda De Productos',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'idProducto', title: 'idProducto', align: "center", width: 100, sortable: true, resizable: true, hidden: true},
                    {field: 'idProveedor', title: 'idProveedor', align: "center", width: 100, sortable: true, resizable: true, hidden: true},
                    {field: 'idcMarca', title: 'idcMarca', width: 100, align: 'center', sortable: true, resizable: true, hidden: true},
                    {field: 'codigo', title: 'Codigo', width: 150, align: 'center', sortable: true, resizable: true, hidden: false},
                    {field: 'nombre', title: 'Nombre', width: 150, align: 'center', sortable: true, resizable: true, hidden: false},
                    {field: 'stock', title: 'Stock', width: 100, align: 'center', sortable: true, resizable: true, hidden: false},
                    {field: 'cantidadUnidCajas', title: 'cantidad Unid X Caja', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'precioCompra', title: 'Precio Compra', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'precioVentaMayor', title: 'Precio Venta Mayor', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'precioVentaMenor', title: 'Precio Venta Menor', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'precioVentaEspecial', title: 'Precio Venta Especial', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'idPrecioCompra', title: 'id PrecioCompra', width: 100, align: 'center', sortable: true, resizable: true, hidden: true},
                    {field: 'idPrecioVentaMayor', title: 'id Precio Venta Mayor', width: 100, align: 'center', sortable: true, resizable: true, hidden: true},
                    {field: 'idPrecioVentaMenor', title: 'id Precio Venta Menor', width: 100, align: 'center', sortable: true, resizable: true, hidden: true},
                    {field: 'idPrecioVentaEspecial', title: 'id Precio Venta Especial', width: 100, align: 'center', sortable: true, resizable: true, hidden: true}
                ]],
            singleSelect: true,
            height: 200,
            width: 650,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true,
            idField: 'idProducto',
            onClickRow: function(rowid, rowdata) {
                //var data = $('#dgProductoBuscar').datagrid('getSelected');
                $('#txtPrecioCompra').val($('#dgProductoBuscar').datagrid('getSelected').precioCompra);
            }
        });
    }


    function listarProveedor() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "CompraSERVLET",
            data: {
                accion: "1"
            },
            success: function(data) {
                //alert("proveeodres: " + JSON.stringify(data));
                for (var i = 0; i < data.length; i++)
                {
                    $('#cmbProveedorCompra').append("<option value=" + data[i].idproveedor + ">" + data[i].observacion + "</option>");
                }
            },
            error: function(e) {
                //alert('Error ajax listar modalidad cabecera: ' + e.toString());
            }
        });
    }


    function buscarDetalleCompra() {
        /*alert("idProveedor: " + $('#cmbProveedorCompra').val() +
         "         fecha: " + $('#txtFechaCompra').val() +
         "         comprobante: " + $('#txtNroComprobante').val()
         );*/
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "CompraSERVLET",
            data: {
                accion: "4",
                idProveedor: $('#cmbProveedorCompra').val(),
                fecha: $('#txtFechaCompra').val(),
                comprobante: $('#txtNroComprobante').val()
            },
            success: function(data) {
                if (data.length > 0) {
                    var precioTotalCompra = 0;
                    for (var i = 0; i < data.length; i++) {
                        data[i].estadoCompra = 1;
                        precioTotalCompra = precioTotalCompra + parseFloat(data[i].subTotal);
                    }
                    $('#txtTotalCompra').val(precioTotalCompra);
                    $('#txtNroComprobanteRegistrar').val(data[0].nroComprobante);
                } else {
                    $.messager.alert('Informacion', 'No se encontraron resultados', 'info');
                }
                $('#dgProductoComprar').datagrid({data: data});
            },
            error: function(e) {
                //alert('Error ajax listar modalidad cabecera: ' + e.toString());
            }
        });

    }


    function buscarProductos() {
        //$('#formularioProducto').css({'display': 'none'});
        //$('#tableBuscarProducto').css({'display': 'block'});
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "CompraSERVLET",
            data: {
                accion: "2",
                codigo: $('#txtCodidgoProducto').val(),
                nombre: $('#txtNombreProducto').val(),
                idProveedor: $('#cmbProveedorCompra').val()
            },
            success: function(data) {
                if (data.length === 0) {
                    $.messager.alert('Informacion', 'No se encontraron productos con los datos de busqueda', 'info');
                }
                $('#dgProductoBuscar').datagrid({data: data});
            },
            error: function(e) {
                //alert('Error ajax listar modalidad cabecera: ' + e.toString());
            }
        });
    }


    function registrarCompra(listDetalleCompra, idCompraRegistrada) {
        //alert("se va a registrar la compra: " + JSON.stringify(listDetalleCompra));
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "CompraSERVLET",
            data: {
                accion: "3",
                listDetalleCompra: JSON.stringify(listDetalleCompra),
                //compra: JSON.stringify(TCompra)
                idProveedor: $('#cmbProveedorCompra').val(),
                comprobante: $('#txtNroComprobanteRegistrar').val(),
                montoTotalCompra: $('#txtTotalCompra').val(),
                idCompra: idCompraRegistrada

            },
            success: function(data) {
                if (data === 1) {
                    $.messager.alert('Informacion', 'Se registro correctamente', "info");
                } else
                {
                    $.messager.alert('Error', 'Error al registrar', "warning");
                }
                buscarDetalleCompra();
            },
            error: function(e) {
                //alert('Error: ' + e.message);
                //alert('Error: ' + e.toString());
            }
        });
    }


    function eliminarDetalleCompra() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "CompraSERVLET",
            data: {
                accion: "5",
                idDetalleCompra: $('#dgProductoComprar').datagrid('getSelected').idDetalleCompra,
                idProducto: $('#dgProductoComprar').datagrid('getSelected').idProducto

            },
            success: function(data) {
                if (data === 1) {
                    $.messager.alert('Informacion', 'Se elimino correctamente', "info");
                } else
                {
                    $.messager.alert('Error', 'Error al eliminar', "warning");
                }
                buscarDetalleCompra();
            },
            error: function(e) {
                //alert('Error: ' + e.message);
                //alert('Error: ' + e.toString());
            }
        });

    }



</script>