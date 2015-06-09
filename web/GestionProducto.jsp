
<div>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <h3 class="text-left">Gestion Producto</h3>
            <hr/>
        </div>
    </div>


    <!--Opcion: Buscar-->
    <div class="row">
        <div>
            <div class="form-group col-md-3 col-sm-6">
                <label class="control-label">Opcion de Busqueda </label>
                <select id="cmbOpcionBusquedaProducto"  class="form-control" >
                    <option value="1">Nombre Producto</option>
                    <option value="2">Codigo Producto</option>                        
                </select>
            </div>

            <form id="formBuscarXNombreProducto" style="display: none;">
                <div class="form-group col-md-3 col-sm-4">
                    <label class="control-label">Nombre Producto</label>
                    <input id="txtNombreProducto" type="text" class="form-control"  placeholder="Producto"  />
                </div>
                <div class="form-group col-md-1 col-sm-2">
                    <label class="control-label">&nbsp;&nbsp;&nbsp </label>
                    <input class="btn btn-primary" value="Buscar" type="submit" />
                </div>
            </form>

            <form id="formBuscarXCodigoProducto" style="display: none;">
                <div class="form-group col-md-3 col-sm-4">
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
    <!--Fin Opcion: Buscar-->

    <!--Inicio botones menu-->
    <div class="menuDerecho">
        <div class="btn-group-vertical" role="group" aria-label="...">

            <button id="btnListarProducto" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-plus">&nbsp;</span><strong>Listar</strong></button>

            <button id="btnRegistrarProducto" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-plus">&nbsp;</span><strong>Nuevo</strong></button>

            <button id="btnActualizarProducto" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-refresh">&nbsp;</span><strong>Actualizar</strong></button>

            <button id="btnEliminarProducto" style="margin: 5px;text-align: left"  class="btn btn-primary"><span class="glyphicon glyphicon-remove">&nbsp;</span><strong>Eliminar</strong></button>

        </div>
    </div>
    <!--Fin botones menu-->
    <br/>
    
    <div class="row">
        <div class="col-md-11" id="tableBuscarProducto">
            <table id="dgProducto"></table>
        </div>        
    </div>

    <div id="formularioProducto" style="display: none;">
        <form id="formRegistrarProducto">
            <div>
                <div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <p><label id="tituloFormularioRegAct"></label></p>
                        </div>
                        <div class="panel-body">
                            <div class="form-group col-md-12 col-sm-6">
                                <label class="control-label"> <span class="claseObligatorio">(*) Campos obligatorios</span></label>
                            </div>                                
                            <div class="col-md-12"> <h3>Detalle Producto<hr style="margin: 0;"></h3></div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label class="control-label">Codigo <span class="claseObligatorio">(*)</span></label>
                                <input id="txtCodigo"  type="text" class="form-control" maxlength="8" pattern="[0-9]{8}" placeholder="Codigo" autofocus="autofocus" required>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label class="control-label">Nombre <span class="claseObligatorio">(*)</span></label>
                                <input id="txtNombre" type="text" class="form-control" placeholder="Nombre" pattern="[A-Za-z ]{1,30}" required>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label class="control-label">Proveedor <span class="claseObligatorio">(*)</span></label>
                                <select id="cmbProveedor"  class="form-control" >
                                </select>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label class="control-label">Marca <span class="claseObligatorio">(*)</span></label>
                                <select id="cmbMarca"  class="form-control" >
                                </select>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label class="control-label">Cantidad de unidades por Caja <span class="claseObligatorio">(*)</span></label>
                                <input id="txtCantidadUnidCaja" type="number" class="form-control" placeholder="Cantidad por Caja" pattern="{1,30}" required>
                            </div>


                            <div class="col-md-12"><br><br></div>

                            <div class="col-md-12"> <h3>Lista de Precios  <small>Ejm precio: 12.50</small><hr style="margin: 0;"></h3></div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label class="control-label">Precio de Compra <span class="claseObligatorio">(*)</span></label>
                                <input id="txtPrecioCompra" type="text" class="form-control" placeholder="Precio de Compra" pattern="{1,30}" required>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label class="control-label">Precio de venta por mayor</label>
                                <input  id="txtPrecioVentaMayor" type="text" class="form-control" placeholder="Precio de venta por mayor" >
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label class="control-label">Precio de venta por menor</label>
                                <input  id="txtPrecioVentaMenor" type="text" class="form-control" placeholder="Precio de venta por menor" >
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label class="control-label">Precio de venta especial</label>
                                <input  id="txtPrecioVentaEspecial" type="text" class="form-control"  placeholder="Precio de venta especial" >
                            </div>

                            <div class="form-group col-md-1 col-sm-12  col-md-offset-8 col-md-pull-8">
                                <!-- <button class="btn btn-primary"  onclick="RegistrarUsuario()"><strong>Registrar</strong></button> -->
                                <input class="btn btn-primary" value="Guardar" type="submit" />
                            </div>
                            <div class="form-group col-md-1 col-sm-12 col-md-pull-7">
                                <!-- <button class="btn btn-primary"  onclick="RegistrarUsuario()"><strong>Registrar</strong></button> -->
                                <input id="btnrstRegistroProducto" class="btn btn-primary" value="Cancelar" type="reset" /> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>




<script>
    //var idAlumno = -1;
    //var idPersona = -1;
    //var idMatriculado = -1;

    $(function() {
        $('#formBuscarXNombreProducto').css({'display': 'block'});
        cargarDgProducto();
        listarMarcas();
        listarProveedor();
    });

    //Variables
    var opcionRegActProducto = 0;

    $("#cmbOpcionBusquedaProducto").change(function() {
        if ($("#cmbOpcionBusquedaProducto").val() === "1") {
            $('#formBuscarXNombreProducto').css({'display': 'block'});
            $('#formBuscarXCodigoProducto').css({'display': 'none'});
            $('#formBuscarXNombreProducto')[0].reset();
            $('#formBuscarXCodigoProducto')[0].reset();
        } else if ($("#cmbOpcionBusquedaProducto").val() === "2") {
            $('#formBuscarXNombreProducto').css({'display': 'none'});
            $('#formBuscarXCodigoProducto').css({'display': 'block'});
            $('#formBuscarXNombreProducto')[0].reset();
            $('#formBuscarXCodigoProducto')[0].reset();
        }
    });

    $('#btnListarProducto').on('click', function() {
        $('#formularioProducto').css({'display': 'none'});
        $('#tableBuscarProducto').css({'display': 'block'});
    });

    $('#btnRegistrarProducto').on('click', function() {
        $('#formRegistrarProducto')[0].reset();
        $('#formularioProducto').css({'display': 'block'});
        $('#tableBuscarProducto').css({'display': 'none'});
        $('#tituloFormularioRegAct').html("<strong>REGISTRAR PRODUCTO</strong>");
        opcionRegActProducto = 1;
        $('#dgProducto').datagrid('unselectAll');
    });

    $('#btnActualizarProducto').on('click', function() {
        $('#formRegistrarProducto')[0].reset();
        var data = null;
        data = $('#dgProducto').datagrid('getSelected');
        if (data !== null) {
            $('#formularioProducto').css({'display': 'block'});
            $('#tableBuscarProducto').css({'display': 'none'});
            //cargarDatosProductoSeleccionado();
            opcionRegActProducto = 2;
            $('#tituloFormularioRegAct').html("<strong>ACTUALIZAR PRODUCTO</strong>");


            $('#txtCodigo').val(data.codigo);
            $('#txtNombre').val(data.nombre);
            $("#cmbProveedor option[value=" + data.idProveedor + "]").attr("selected", true);
            $("#cmbMarca option[value=" + data.idcMarca + "]").attr("selected", true);
            $('#txtCantidadUnidCaja').val(data.cantidadUnidCajas);
            $('#txtPrecioCompra').val(data.precioCompra);
            $('#txtPrecioVentaMayor').val(data.precioVentaMayor);
            $('#txtPrecioVentaMenor').val(data.precioVentaMenor);
            $('#txtPrecioVentaEspecial').val(data.precioVentaEspecial);
        }
        else {
            $.messager.alert('Informacion', 'Por favor seleccione un producto', "warning");
        }
    });

    $('#btnEliminarProducto').on('click', function() {
        var data = null;
        data = $('#dgProducto').datagrid('getSelected');
        if (data !== null) {
            $.messager.confirm('Confirmacion', 'Estas seguro que desea eliminar el producto?', function(r) {
                if (r) {
                    eliminarProducto();
                }
            });
        }
        else {
            $.messager.alert('Informacion', 'Por favor seleccione un producto', "warning");
        }
        return false;
    });

    $('#btnrstRegistroProducto').on('click', function() {
        if (opcionRegActProducto === 2) {
            $('#formularioProducto').css({'display': 'none'});
            $('#tableBuscarProducto').css({'display': 'block'});
        }
    });

    $("#formRegistrarProducto").submit(function() {
        if (opcionRegActProducto === 1) {
            registrarProducto();
        } else if (opcionRegActProducto === 2) {
            actualizarProducto();
        }
        return false;
    });

    $("#formBuscarXNombreProducto, #formBuscarXCodigoProducto ").submit(function() {
        buscarProductos();
        return false;
    });


    function cargarDgProducto() {
        $("#dgProducto").datagrid({
            //url: '',
            title: 'Resultado De La Busqueda De Productos',
            loadMsg: "Cargando Datos",
            columns: [[
                    {field: 'idProducto', title: 'idProducto', align: "center", width: 100, sortable: true, resizable: true, hidden: false},
                    {field: 'idProveedor', title: 'idProveedor', align: "center", width: 100, sortable: true, resizable: true},
                    {field: 'idcMarca', title: 'idcMarca', width: 100, align: 'center', sortable: true, resizable: true},
                    {field: 'codigo', title: 'Codigo', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'nombre', title: 'Nombre', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'cantidadUnidCajas', title: 'cantidad Unid X Caja', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'precioCompra', title: 'Precio Compra', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'precioVentaMayor', title: 'Precio Venta Mayor', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'precioVentaMenor', title: 'Precio Venta Menor', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'precioVentaEspecial', title: 'Precio Venta Especial', width: 150, align: 'center', sortable: true, resizable: true},
                    {field: 'idPrecioCompra', title: 'id PrecioCompra', width: 100, align: 'center', sortable: true, resizable: true},
                    {field: 'idPrecioVentaMayor', title: 'id Precio Venta Mayor', width: 100, align: 'center', sortable: true, resizable: true},
                    {field: 'idPrecioVentaMenor', title: 'id Precio Venta Menor', width: 100, align: 'center', sortable: true, resizable: true},
                    {field: 'idPrecioVentaEspecial', title: 'id Precio Venta Especial', width: 100, align: 'center', sortable: true, resizable: true}
                ]],
            singleSelect: true,
            height: 300,
            nowrap: true,
            striped: true,
            collapsible: true,
            rownumbers: true,
            remoteSort: false,
            rowNumbers: true,
            idField: 'idProducto'
        });
    }


    function listarMarcas() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "ProductoSERVLET",
            data: {
                accion: "1"
            },
            success: function(data) {    
                //alert("marcas: " + JSON.stringify(data));
                for (var i = 0; i < data.length; i++)
                {
                    $('#cmbMarca').append("<option value=" + data[i].idcontenedor + ">" + data[i].denominacion + "</option>");
                }
            },
            error: function(e) {
                //alert('Error ajax listar modalidad cabecera: ' + e.toString());
            }
        });
    }


    function listarProveedor() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "ProductoSERVLET",
            data: {
                accion: "3"
            },
            success: function(data) {
                for (var i = 0; i < data.length; i++)
                {
                    $('#cmbProveedor').append("<option value=" + data[i].idproveedor + ">" + data[i].observacion + "</option>");
                }
            },
            error: function(e) {
                //alert('Error ajax listar modalidad cabecera: ' + e.toString());
            }
        });
    }


    function buscarProductos() {
        $('#formularioProducto').css({'display': 'none'});
        $('#tableBuscarProducto').css({'display': 'block'});
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "ProductoSERVLET",
            data: {
                accion: "2",
                codigo: $('#txtCodidgoProducto').val(),
                nombre: $('#txtNombreProducto').val()
            },
            success: function(data) {
                if (data.length === 0) {
                    $.messager.alert('Informacion', 'No se encontraron resultados', 'info');
                }
                $('#dgProducto').datagrid({data: data});
            },
            error: function(e) {
                //alert('Error ajax listar modalidad cabecera: ' + e.toString());
            }
        });
    }


    function registrarProducto() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "ProductoSERVLET",
            data: {
                accion: "4",
                codigo: $('#txtCodigo').val(),
                nombre: $('#txtNombre').val(),
                idProveedor: $('#cmbProveedor').val(),
                idcmarca: $('#cmbMarca').val(),
                cantidadUnidCaja: $('#txtCantidadUnidCaja').val(),
                precioCompra: $('#txtPrecioCompra').val(),
                precioVentaMayor: $('#txtPrecioVentaMayor').val(),
                precioVentaMenor: $('#txtPrecioVentaMenor').val(),
                precioVentaEspecial: $('#txtPrecioVentaEspecial').val()
            },
            success: function(data) {
                if (data === 1) {
                    $.messager.alert('Informacion', 'Se registro correctamente', 'info');
                } else {
                    $.messager.alert('Error', 'No se registro', 'warning');
                }
                $('#formRegistrarProducto')[0].reset();
            },
            error: function(e) {
                //alert('Error ajax listar modalidad cabecera: ' + e.toString());
            }
        });

    }


    function actualizarProducto() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "ProductoSERVLET",
            data: {
                accion: "5",
                idProducto: $('#dgProducto').datagrid('getSelected').idProducto,
                codigo: $('#txtCodigo').val(),
                nombre: $('#txtNombre').val(),
                idProveedor: $('#cmbProveedor').val(),
                idcmarca: $('#cmbMarca').val(),
                cantidadUnidCaja: $('#txtCantidadUnidCaja').val(),
                precioCompra: $('#txtPrecioCompra').val(),
                precioVentaMayor: $('#txtPrecioVentaMayor').val(),
                precioVentaMenor: $('#txtPrecioVentaMenor').val(),
                precioVentaEspecial: $('#txtPrecioVentaEspecial').val(),
                idPrecioCompra: $('#dgProducto').datagrid('getSelected').idPrecioCompra,
                idPrecioVentaMayor: $('#dgProducto').datagrid('getSelected').idPrecioVentaMayor,
                idPrecioVentaMenor: $('#dgProducto').datagrid('getSelected').idPrecioVentaMenor,
                idPrecioVentaEspecial: $('#dgProducto').datagrid('getSelected').idPrecioVentaEspecial
            },
            success: function(data) {
                if (data === 1) {
                    $.messager.alert('Informacion', 'Se actualizo correctamente', 'info');
                } else {
                    $.messager.alert('Error', 'No se pudo actualizar', 'warning');
                }
                $('#formRegistrarProducto')[0].reset();
                $('#btnrstRegistroProducto').click();
                buscarProductos();

            },
            error: function(e) {
                //alert('Error ajax listar modalidad cabecera: ' + e.toString());
            }
        });

    }


    function eliminarProducto() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "ProductoSERVLET",
            data: {
                accion: "6",
                idProducto: $('#dgProducto').datagrid('getSelected').idProducto
            },
            success: function(data) {
                if (data === 1) {
                    $.messager.alert('Informacion', 'Se elimino correctamente', 'info');
                } else if (data === 0) {
                    $.messager.alert('Error', 'No se pudo eliminar', 'warning');
                } else if (data === 2) {
                    $.messager.alert('Error', 'No se puede eliminar el producto porque esta registrado en compra/venta', 'warning');
                }
                buscarProductos();
                $('#dgProducto').datagrid('unselectAll');
            },
            error: function(e) {
                //alert('Error ajax listar modalidad cabecera: ' + e.toString());
            }

        });

    }


</script>




