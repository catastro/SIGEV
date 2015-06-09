﻿-- Script was generated by Devart dbForge Studio Express for MySQL, Version 6.0.622.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 28/05/2015 10:45:34 p.m.
-- Server version: 5.5.34
-- Client version: 4.1

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

-- 
-- Set default database
--
USE calipsodb;

--
-- Definition for table t_boveda
--
DROP TABLE IF EXISTS t_boveda;
CREATE TABLE t_boveda (
  IDBOVEDA INT(11) NOT NULL,
  MONTO DOUBLE DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  DENOMINACION VARCHAR(100) DEFAULT NULL,
  IDCTIPODETALLE INT(11) DEFAULT NULL,
  IDRAZONSOCIAL INT(11) DEFAULT NULL,
  PRIMARY KEY (IDBOVEDA)
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_menu
--
DROP TABLE IF EXISTS t_menu;
CREATE TABLE t_menu (
  IDMENU INT(11) NOT NULL,
  DENOMINACION VARCHAR(100) DEFAULT NULL,
  IDSUPERIOR INT(11) DEFAULT NULL,
  ORDEN INT(11) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRIMARY KEY (IDMENU)
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_persona
--
DROP TABLE IF EXISTS t_persona;
CREATE TABLE t_persona (
  IDPERSONA INT(11) NOT NULL,
  DNI VARCHAR(8) DEFAULT NULL,
  NOMBRES VARCHAR(40) DEFAULT NULL,
  APPPAT VARCHAR(30) DEFAULT NULL,
  APPMAT VARCHAR(30) DEFAULT NULL,
  TELEFONO VARCHAR(15) DEFAULT NULL,
  DIRECCION VARCHAR(100) DEFAULT NULL,
  EMAIL VARCHAR(100) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  CODIGO VARCHAR(8) DEFAULT NULL,
  PRIMARY KEY (IDPERSONA)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 744
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_privilegio
--
DROP TABLE IF EXISTS t_privilegio;
CREATE TABLE t_privilegio (
  IDPRIVILEGIO INT(11) NOT NULL,
  DENOMINACION VARCHAR(100) DEFAULT NULL,
  IDMENU INT(11) DEFAULT NULL,
  ORDEN INT(11) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRIMARY KEY (IDPRIVILEGIO)
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_producto
--
DROP TABLE IF EXISTS t_producto;
CREATE TABLE t_producto (
  IDPRODUCTO INT(11) NOT NULL,
  CODIGO VARCHAR(8) DEFAULT NULL,
  IDCMARCA INT(11) DEFAULT NULL,
  FECHA DATE DEFAULT NULL,
  NOMBREPRODUCTO VARCHAR(100) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRECIOCOMPRAXCAJA DOUBLE DEFAULT NULL,
  CANTUNIDADESXCAJA INT(11) DEFAULT NULL,
  PRECIOVENTAMAYOR DOUBLE DEFAULT NULL,
  PRECIOVENTAMENOR DOUBLE DEFAULT NULL,
  PRECIOVENTAESPECIAL DOUBLE DEFAULT NULL,
  IDPROVEEDOR INT(11) DEFAULT NULL,
  PRIMARY KEY (IDPRODUCTO)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_rol
--
DROP TABLE IF EXISTS t_rol;
CREATE TABLE t_rol (
  IDROL INT(11) NOT NULL,
  NOMBREROL VARCHAR(100) DEFAULT NULL,
  DESCRIPCION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FACHAMODIF DATE DEFAULT NULL,
  PRIMARY KEY (IDROL)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_tabla_maestra
--
DROP TABLE IF EXISTS t_tabla_maestra;
CREATE TABLE t_tabla_maestra (
  IDTABLAMAESTRA INT(11) NOT NULL,
  IDTABLA INT(11) DEFAULT NULL,
  IDITEM INT(11) DEFAULT NULL,
  IDSUPERIOR INT(11) DEFAULT NULL,
  ORDEN INT(11) DEFAULT NULL,
  DENOMINACION VARCHAR(50) DEFAULT NULL,
  ABREVIATURA VARCHAR(50) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRIMARY KEY (IDTABLAMAESTRA)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 712
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_cliente
--
DROP TABLE IF EXISTS t_cliente;
CREATE TABLE t_cliente (
  IDCLIENTE INT(11) NOT NULL,
  IDPERSONA INT(11) DEFAULT NULL,
  IDCTIPOCLIENTE INT(11) DEFAULT NULL,
  IDCRUTA INT(11) DEFAULT NULL,
  IDCFECUENCIAVISITA INT(11) DEFAULT NULL,
  IDCTIPONEGOCIO INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRIMARY KEY (IDCLIENTE),
  CONSTRAINT FK_REFERENCE_8 FOREIGN KEY (IDPERSONA)
    REFERENCES t_persona(IDPERSONA) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_devolucion_producto
--
DROP TABLE IF EXISTS t_devolucion_producto;
CREATE TABLE t_devolucion_producto (
  IDDEVOLUCIONPRODUCTO INT(11) NOT NULL,
  IDPRODUCTO INT(11) DEFAULT NULL,
  FECHADEVOLUCION DATE DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  CANTIDADPRODUCTO INT(11) DEFAULT NULL,
  FECHARETORNO DATE DEFAULT NULL,
  IDCESTADOPROCESO INT(11) DEFAULT NULL,
  PRIMARY KEY (IDDEVOLUCIONPRODUCTO),
  CONSTRAINT FK_REFERENCE_29 FOREIGN KEY (IDPRODUCTO)
    REFERENCES t_producto(IDPRODUCTO) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_menu_rol
--
DROP TABLE IF EXISTS t_menu_rol;
CREATE TABLE t_menu_rol (
  IDMENUROL INT(11) NOT NULL,
  IDMENU INT(11) DEFAULT NULL,
  IDROL INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRIMARY KEY (IDMENUROL),
  CONSTRAINT FK_REFERENCE_19 FOREIGN KEY (IDMENU)
    REFERENCES t_menu(IDMENU) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_REFERENCE_20 FOREIGN KEY (IDROL)
    REFERENCES t_rol(IDROL) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_personal
--
DROP TABLE IF EXISTS t_personal;
CREATE TABLE t_personal (
  IDPERSONAL INT(11) NOT NULL,
  IDPERSONA INT(11) DEFAULT NULL,
  IDCRUTAASIGNADA INT(11) DEFAULT NULL,
  IDCTIPOPERSONAL INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  IDCESTADOPERSONAL INT(11) DEFAULT NULL,
  IDCMODALIDADPAGO INT(11) DEFAULT NULL,
  HORAENTRADA TIME DEFAULT NULL,
  HORASALIDA TIME DEFAULT NULL,
  URLFOTO VARCHAR(100) DEFAULT NULL,
  URLIMAGEN VARCHAR(100) DEFAULT NULL,
  MONTOPAGO DOUBLE DEFAULT NULL,
  FECHAINGRESO DATETIME DEFAULT NULL,
  PRIMARY KEY (IDPERSONAL),
  CONSTRAINT FK_REFERENCE_9 FOREIGN KEY (IDPERSONA)
    REFERENCES t_persona(IDPERSONA) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 819
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_precio
--
DROP TABLE IF EXISTS t_precio;
CREATE TABLE t_precio (
  IDPRECIO INT(11) NOT NULL,
  IDPRODUCTO INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRIMARY KEY (IDPRECIO),
  CONSTRAINT FK_REFERENCE_28 FOREIGN KEY (IDPRODUCTO)
    REFERENCES t_producto(IDPRODUCTO) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_proveedor
--
DROP TABLE IF EXISTS t_proveedor;
CREATE TABLE t_proveedor (
  IDPROVEEDOR INT(11) NOT NULL,
  IDPERSONA INT(11) DEFAULT NULL,
  IDCTIPOPROVEEDOR INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRIMARY KEY (IDPROVEEDOR),
  CONSTRAINT FK_REFERENCE_7 FOREIGN KEY (IDPERSONA)
    REFERENCES t_persona(IDPERSONA) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_rol_privilegio
--
DROP TABLE IF EXISTS t_rol_privilegio;
CREATE TABLE t_rol_privilegio (
  IDMENUROL INT(11) NOT NULL,
  IDROL INT(11) DEFAULT NULL,
  IDPRIVILEGIO INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRIMARY KEY (IDMENUROL),
  CONSTRAINT FK_REFERENCE_23 FOREIGN KEY (IDROL)
    REFERENCES t_rol(IDROL) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_REFERENCE_24 FOREIGN KEY (IDPRIVILEGIO)
    REFERENCES t_privilegio(IDPRIVILEGIO) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_usuario
--
DROP TABLE IF EXISTS t_usuario;
CREATE TABLE t_usuario (
  IDUSUARIO INT(11) NOT NULL,
  IDROL INT(11) DEFAULT NULL,
  IDPERSONA INT(11) DEFAULT NULL,
  NOMBREUSUARIO VARCHAR(40) DEFAULT NULL,
  PASSWORD VARCHAR(40) DEFAULT NULL,
  IPACCESO VARCHAR(40) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRIMARY KEY (IDUSUARIO),
  CONSTRAINT FK_REFERENCE_2 FOREIGN KEY (IDROL)
    REFERENCES t_rol(IDROL) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_REFERENCE_6 FOREIGN KEY (IDPERSONA)
    REFERENCES t_persona(IDPERSONA) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_caja
--
DROP TABLE IF EXISTS t_caja;
CREATE TABLE t_caja (
  IDCAJA INT(11) NOT NULL,
  IDUSUARIO INT(11) DEFAULT NULL,
  IDBOVEDA INT(11) DEFAULT NULL,
  MONTO DOUBLE DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  IDRAZONSOCIAL INT(11) DEFAULT NULL,
  PRIMARY KEY (IDCAJA),
  CONSTRAINT FK_REFERENCE_12 FOREIGN KEY (IDUSUARIO)
    REFERENCES t_usuario(IDUSUARIO) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_REFERENCE_13 FOREIGN KEY (IDBOVEDA)
    REFERENCES t_boveda(IDBOVEDA) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_compra
--
DROP TABLE IF EXISTS t_compra;
CREATE TABLE t_compra (
  IDCOMPRA INT(11) NOT NULL,
  IDPROVEEDOR INT(11) DEFAULT NULL,
  MONTOCOMPRA DOUBLE DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  COMPROVANTE VARCHAR(20) DEFAULT NULL,
  IDRAZONSOCIAL INT(11) DEFAULT NULL,
  IDCESTADOCOMPRA INT(11) DEFAULT NULL,
  PRIMARY KEY (IDCOMPRA),
  CONSTRAINT FK_REFERENCE_25 FOREIGN KEY (IDPROVEEDOR)
    REFERENCES t_proveedor(IDPROVEEDOR) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_historial_asistencia
--
DROP TABLE IF EXISTS t_historial_asistencia;
CREATE TABLE t_historial_asistencia (
  IDHISTORIALASISTENCIA INT(11) NOT NULL,
  IDPERSONAL INT(11) DEFAULT NULL,
  CAPACIDADMAXIMA INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRIMARY KEY (IDHISTORIALASISTENCIA),
  CONSTRAINT FK_REFERENCE_14 FOREIGN KEY (IDPERSONAL)
    REFERENCES t_personal(IDPERSONAL) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_pago
--
DROP TABLE IF EXISTS t_pago;
CREATE TABLE t_pago (
  IDPAGO INT(11) NOT NULL,
  IDPERSONAL INT(11) DEFAULT NULL,
  FECHAPAGOFIN DATE DEFAULT NULL,
  FECHAPAGOINICIO DATE DEFAULT NULL,
  MONTO DOUBLE NOT NULL,
  MINUTOSTARDANZA INT(11) DEFAULT NULL,
  HORASEXTRA INT(11) DEFAULT NULL,
  DESCUENTO DOUBLE DEFAULT NULL,
  AUMENTO DOUBLE DEFAULT NULL,
  MONTOTOTAL DOUBLE DEFAULT NULL,
  FECHACREACION DATE DEFAULT NULL,
  FECHAMODIFICACION DATE DEFAULT NULL,
  USUARIOCREACION INT(11) DEFAULT NULL,
  USUARIOMODIFICACION INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (IDPAGO),
  CONSTRAINT FK_REFERENCE_15 FOREIGN KEY (IDPERSONAL)
    REFERENCES t_personal(IDPERSONAL) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 1820
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_razon_social
--
DROP TABLE IF EXISTS t_razon_social;
CREATE TABLE t_razon_social (
  IDRAZONSOCIAL INT(11) NOT NULL,
  IDUSUARIO INT(11) DEFAULT NULL,
  DENOMINACION VARCHAR(40) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  RUC VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (IDRAZONSOCIAL),
  CONSTRAINT FK_REFERENCE_27 FOREIGN KEY (IDUSUARIO)
    REFERENCES t_usuario(IDUSUARIO) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_venta
--
DROP TABLE IF EXISTS t_venta;
CREATE TABLE t_venta (
  IDVENTA INT(11) NOT NULL,
  IDCLIENTE INT(11) DEFAULT NULL,
  MONTO DOUBLE DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  TOTAL DOUBLE DEFAULT NULL,
  IDCTIPOCOMPROVANTE INT(11) DEFAULT NULL,
  NUMCOMPROVANTE VARCHAR(20) DEFAULT NULL,
  IDRAZONSOCIAL INT(11) DEFAULT NULL,
  IDCVENTA INT(11) DEFAULT NULL,
  PRIMARY KEY (IDVENTA),
  CONSTRAINT FK_REFERENCE_26 FOREIGN KEY (IDCLIENTE)
    REFERENCES t_cliente(IDCLIENTE) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_caja_detalle
--
DROP TABLE IF EXISTS t_caja_detalle;
CREATE TABLE t_caja_detalle (
  IDCAJADETALLE INT(11) NOT NULL,
  IDCAJA INT(11) DEFAULT NULL,
  DENOMINACION VARCHAR(50) DEFAULT NULL,
  IDCTIPODETALLE INT(11) DEFAULT NULL,
  MONTO DOUBLE DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  IDRAZONSOCIAL INT(11) DEFAULT NULL,
  PRIMARY KEY (IDCAJADETALLE),
  CONSTRAINT FK_REFERENCE_11 FOREIGN KEY (IDCAJA)
    REFERENCES t_caja(IDCAJA) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_detalle_compra
--
DROP TABLE IF EXISTS t_detalle_compra;
CREATE TABLE t_detalle_compra (
  IDDETALLECOMPRA INT(11) NOT NULL,
  IDCOMPRA INT(11) DEFAULT NULL,
  IDPRODUCTO INT(11) DEFAULT NULL,
  FECHAVENCIMIENTO DATETIME DEFAULT NULL,
  CANTIDADCOMPRA INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  CANTIDADDANIADO INT(11) DEFAULT NULL,
  IDCOBSERVACION INT(11) DEFAULT NULL,
  SUBTOTAL DOUBLE DEFAULT NULL,
  PRECIOCOMPRAUNID DOUBLE DEFAULT NULL,
  PRIMARY KEY (IDDETALLECOMPRA),
  CONSTRAINT FK_REFERENCE_21 FOREIGN KEY (IDCOMPRA)
    REFERENCES t_compra(IDCOMPRA) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_REFERENCE_22 FOREIGN KEY (IDPRODUCTO)
    REFERENCES t_producto(IDPRODUCTO) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table t_detalle_venta
--
DROP TABLE IF EXISTS t_detalle_venta;
CREATE TABLE t_detalle_venta (
  IDDETALLEVENTA INT(11) NOT NULL,
  IDVENTA INT(11) DEFAULT NULL,
  IDPRODUCTO INT(11) DEFAULT NULL,
  CANTIDADVENTA INT(11) DEFAULT NULL,
  ESTADO VARCHAR(1) DEFAULT NULL,
  OBSERVACION VARCHAR(100) DEFAULT NULL,
  IDUSUARIOCREAC INT(11) DEFAULT NULL,
  IDUSUARIOMODIF INT(11) DEFAULT NULL,
  FECHACREAC DATE DEFAULT NULL,
  FECHAMODIF DATE DEFAULT NULL,
  PRECIOVENTAUNID DOUBLE DEFAULT NULL,
  DESCUENTO DOUBLE DEFAULT NULL,
  SUBTOTAL DOUBLE DEFAULT NULL,
  PRIMARY KEY (IDDETALLEVENTA),
  CONSTRAINT FK_REFERENCE_17 FOREIGN KEY (IDVENTA)
    REFERENCES t_venta(IDVENTA) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_REFERENCE_18 FOREIGN KEY (IDPRODUCTO)
    REFERENCES t_producto(IDPRODUCTO) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

-- 
-- Dumping data for table t_boveda
--

-- Table calipsodb.t_boveda does not contain any data (it is empty)

-- 
-- Dumping data for table t_menu
--

-- Table calipsodb.t_menu does not contain any data (it is empty)

-- 
-- Dumping data for table t_persona
--
INSERT INTO t_persona VALUES
(0, '11111111', '11111', '11', '11', '', '', '', '1', NULL, NULL, NULL, '2015-05-08', NULL, '11111111'),
(1, '11111111', '1111111111111', '11111111', '11111111111', '123456789', 'las flores', 'davis@clicnet.com', '1', NULL, NULL, NULL, NULL, '2015-04-25', '11111111'),
(2, '32222222', 'adaf||nkjn||jn', 'jnjk', 'jn', '111111222', 'dasds', 'davis@f.om', '0', NULL, NULL, NULL, '2015-04-21', NULL, '12222222'),
(3, '22222222', 'ss', 'ss', 'ss', '111111111', 'ss', 'a@gmail.com', '1', NULL, NULL, NULL, '2015-04-21', NULL, '11111111'),
(4, '22222222', 'dd', 'ddd', 'ewwew', '', '', '', '0', NULL, NULL, NULL, '2015-04-22', NULL, '22222222'),
(5, '22222222', 'dd', 'ddd', 'ewwew', '', '', '', '0', NULL, NULL, NULL, '2015-04-22', NULL, '22222222'),
(6, '11111111', '111', '11', '111', '', '', '', '0', NULL, NULL, NULL, '2015-04-22', NULL, '11111111'),
(7, '11111111', '111', '11', '111', '', '', '', '1', NULL, NULL, NULL, '2015-04-22', NULL, '11111111'),
(8, '33333333', '333', '33', '333', '', '', '', '1', NULL, NULL, NULL, '2015-04-22', NULL, '22222222'),
(9, '33333333', '333', '33', '333', '', '', '', '1', NULL, NULL, NULL, '2015-04-22', NULL, '22222222'),
(10, '22222222', '2222', '222', '222', '', '', '', '1', NULL, NULL, NULL, '2015-04-22', NULL, '22222222'),
(11, '11111111', '1111', '111', '1111', '', '', '', '1', NULL, NULL, NULL, '2015-04-22', NULL, '11111111'),
(12, '55555555', '555', '555', '55', '', '', '', '1', NULL, NULL, NULL, '2015-04-22', NULL, '55555555'),
(13, '44444444', '444', '44', '444', '', '', '', '1', NULL, NULL, NULL, '2015-04-22', NULL, '44444444'),
(14, '66666666', '66', '66', '666', '', '', '', '1', NULL, NULL, NULL, '2015-04-22', NULL, '66666666'),
(15, '99999999', '99999999999', '99999', '9999999', '999999999', '', '', '0', NULL, NULL, NULL, NULL, '2015-04-24', '99999991'),
(16, '00000000', '0000', '000', '000', '000000000', '', '', '1', NULL, NULL, NULL, '2015-04-24', NULL, '00000000'),
(17, '12345678', 'wwrrrr', 'wwwrrr', 'wwwwrrrr', '', '', 'f@f.com', '1', NULL, NULL, NULL, NULL, '2015-04-26', '12345678'),
(18, '11111111', '1111', '111', '111', '', '22222222', '', '1', NULL, NULL, NULL, NULL, '2015-04-27', '11111111'),
(19, '00000000', 'orland', 'chuqui', 'chuqui', '111111111', 'las verdes manzanas', NULL, '1', NULL, NULL, NULL, NULL, NULL, '00000000'),
(20, '11111111', 'nico', 'demo', 'demonio', NULL, 'los panchos', NULL, '1', NULL, NULL, NULL, NULL, NULL, '11111111'),
(21, '44444444', '44', '4444', '444', '', '', '', '1', NULL, NULL, NULL, '2015-05-08', NULL, '44444444');

-- 
-- Dumping data for table t_privilegio
--

-- Table calipsodb.t_privilegio does not contain any data (it is empty)

-- 
-- Dumping data for table t_producto
--
INSERT INTO t_producto VALUES
(1, '11111111', 4, '2015-06-01', 'galletas', '1', NULL, NULL, NULL, NULL, NULL, 20, 6, 22, 23, 21, 1),
(2, '22222222', 4, '2015-04-01', 'chocolates', '1', NULL, NULL, NULL, NULL, NULL, 30, 12, 31, 32, 30, 1);

-- 
-- Dumping data for table t_rol
--
INSERT INTO t_rol VALUES
(1, '1', 'ventas', NULL, NULL, '1', NULL, NULL, NULL);

-- 
-- Dumping data for table t_tabla_maestra
--
INSERT INTO t_tabla_maestra VALUES
(1, 1, 0, NULL, NULL, 'rutaAsignada', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(2, 1, 1, NULL, 1, 'norte', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(3, 2, 0, NULL, NULL, 'tipoPersonal', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(4, 2, 1, NULL, 1, 'contratado', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(5, 3, 0, NULL, NULL, 'estadoPersonal', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(6, 3, 1, NULL, 1, 'perfecto', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(7, 4, 0, NULL, NULL, 'modalidadPago', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(8, 4, 1, NULL, 1, 'por caja', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(9, 5, 0, NULL, NULL, 'tipoCliente', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(10, 5, 1, NULL, 1, 'personaNatural', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(11, 6, 0, NULL, NULL, 'tipoCliente', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(12, 6, 1, NULL, 1, 'importante', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(13, 7, 0, NULL, NULL, 'frecuenciaVisita', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(14, 7, 1, NULL, 1, 'lunes-miercoles', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(15, 8, 0, NULL, NULL, 'tipoNegocio', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(16, 8, 1, NULL, 1, 'mayorista', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(17, 9, 0, NULL, NULL, 'tipoComprobante', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(18, 9, 1, NULL, 1, 'boletaVenta', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(19, 9, 2, NULL, 2, 'factura', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(20, 10, 0, NULL, NULL, 'estadoVenta', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(21, 10, 1, NULL, 1, 'pedido', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(22, 10, 2, NULL, 2, 'entregado', NULL, '1', NULL, NULL, NULL, NULL, NULL),
(23, 10, 3, NULL, 3, 'cancelado', NULL, '1', NULL, NULL, NULL, NULL, NULL);

-- 
-- Dumping data for table t_cliente
--
INSERT INTO t_cliente VALUES
(1, 19, 12, 2, 14, 16, '1', NULL, NULL, NULL, NULL, NULL),
(2, 20, 12, 2, 14, 16, '1', NULL, NULL, NULL, NULL, NULL);

-- 
-- Dumping data for table t_devolucion_producto
--

-- Table calipsodb.t_devolucion_producto does not contain any data (it is empty)

-- 
-- Dumping data for table t_menu_rol
--

-- Table calipsodb.t_menu_rol does not contain any data (it is empty)

-- 
-- Dumping data for table t_personal
--
INSERT INTO t_personal VALUES
(0, 0, 8, 2, '1', NULL, NULL, NULL, '2015-05-08', NULL, 4, 6, '02:00:00', '02:00:00', NULL, NULL, 22222, '2015-05-16 00:00:00'),
(1, 1, 8, 2, '1', NULL, NULL, NULL, NULL, '2015-04-25', 0, 6, '01:30:00', '02:00:00', NULL, NULL, NULL, NULL),
(2, 2, 8, 2, '0', NULL, NULL, NULL, '2015-04-21', NULL, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 8, 2, '1', NULL, NULL, NULL, '2015-04-21', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 8, 2, '0', NULL, NULL, NULL, '2015-04-22', NULL, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 8, 2, '0', NULL, NULL, NULL, '2015-04-22', NULL, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 8, 2, '0', NULL, NULL, NULL, '2015-04-22', NULL, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 8, 2, '1', NULL, NULL, NULL, '2015-04-22', NULL, 4, 6, '01:30:00', NULL, NULL, NULL, NULL, NULL),
(8, 8, 8, 2, '1', NULL, NULL, NULL, '2015-04-22', NULL, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 9, 8, 2, '1', NULL, NULL, NULL, '2015-04-22', NULL, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 10, 8, 2, '1', NULL, NULL, NULL, '2015-04-22', NULL, 4, 6, '01:30:00', NULL, NULL, NULL, NULL, NULL),
(11, 11, 8, 2, '1', NULL, NULL, NULL, '2015-04-22', NULL, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 12, 8, 2, '1', NULL, NULL, NULL, '2015-04-22', NULL, 4, 6, '02:00:00', NULL, NULL, NULL, NULL, NULL),
(13, 13, 8, 2, '1', NULL, NULL, NULL, '2015-04-22', NULL, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 14, 8, 2, '1', NULL, NULL, NULL, '2015-04-22', NULL, 4, 6, '21:00:00', NULL, NULL, NULL, NULL, NULL),
(15, 15, 8, 2, '0', NULL, NULL, NULL, NULL, '2015-04-24', 4, 6, '00:00:00', '01:30:00', NULL, NULL, NULL, NULL),
(16, 16, 8, 2, '1', NULL, NULL, NULL, '2015-04-24', NULL, 4, 6, '01:00:00', '06:00:00', NULL, NULL, NULL, NULL),
(17, 17, 8, 2, '1', NULL, NULL, NULL, NULL, '2015-04-26', 4, 6, '02:00:00', '01:30:00', NULL, NULL, NULL, NULL),
(18, 18, 8, 2, '1', NULL, NULL, NULL, NULL, '2015-04-27', 4, 6, '00:30:00', '01:30:00', NULL, NULL, NULL, NULL),
(19, 21, 8, 2, '1', NULL, NULL, NULL, '2015-05-08', NULL, 4, 6, '01:00:00', '02:00:00', NULL, NULL, 4444, '2015-05-09 00:00:00');

-- 
-- Dumping data for table t_precio
--

-- Table calipsodb.t_precio does not contain any data (it is empty)

-- 
-- Dumping data for table t_proveedor
--
INSERT INTO t_proveedor VALUES
(1, 5, 3, '1', NULL, NULL, NULL, NULL, NULL);

-- 
-- Dumping data for table t_rol_privilegio
--

-- Table calipsodb.t_rol_privilegio does not contain any data (it is empty)

-- 
-- Dumping data for table t_usuario
--
INSERT INTO t_usuario VALUES
(1, 1, 1, 'marco', 'marco', NULL, NULL, NULL, '1', NULL, NULL, NULL);

-- 
-- Dumping data for table t_caja
--

-- Table calipsodb.t_caja does not contain any data (it is empty)

-- 
-- Dumping data for table t_compra
--

-- Table calipsodb.t_compra does not contain any data (it is empty)

-- 
-- Dumping data for table t_historial_asistencia
--

-- Table calipsodb.t_historial_asistencia does not contain any data (it is empty)

-- 
-- Dumping data for table t_pago
--
INSERT INTO t_pago VALUES
(0, 3, '2015-05-07', '2015-05-03', 111, 2222, 3333, 444, 5555, 66666, '2015-05-13', NULL, NULL, NULL, '1', NULL),
(1, 3, '2015-05-07', '2015-05-03', 111, 2222, 3333, 444, 5555, 66666, '2015-05-13', NULL, NULL, NULL, '1', NULL),
(2, 9, '0000-00-00', '0000-00-00', 100, 200, 1, 1, 1, 1, '2015-05-13', '0000-00-00', NULL, NULL, '1', NULL),
(3, 7, '2015-05-03', '2015-05-16', 11111, 111, 111, 111, 111, 1111, '2015-05-13', NULL, NULL, NULL, '1', NULL),
(4, 19, '2015-05-09', '2015-05-09', 555, 555, 555, 555, 555, 555, '2015-05-13', '2015-05-19', 0, 0, '0', ''),
(5, 19, '2015-05-27', '2015-05-16', 6666, 6666, 66, 77766, 666, 7777, '2015-05-16', '2015-05-19', 0, 0, '1', ''),
(6, 16, '2015-05-05', '2015-05-15', 222, 12, 222, 22, 22, 22, '2015-05-16', '2015-05-16', 0, 0, '0', ''),
(7, 12, '2015-05-12', '2015-05-08', 33, 33, 33, 33, 33, 33, '2015-05-16', '2015-05-16', 0, 0, '1', ''),
(8, 19, '2015-05-16', '2015-05-16', 33, 1333, 333, 333, 333, 54444, '2015-05-19', '2015-05-19', 0, 0, '1', '');

-- 
-- Dumping data for table t_razon_social
--
INSERT INTO t_razon_social VALUES
(1, 1, 'fargoz', '1', NULL, NULL, NULL, NULL, NULL, '20600198051');

-- 
-- Dumping data for table t_venta
--
INSERT INTO t_venta VALUES
(1, 1, 1000, '1', NULL, NULL, NULL, NULL, NULL, 1080, 18, '2343', 1, 21),
(2, 2, 3000, '1', NULL, NULL, NULL, NULL, NULL, 3000, 19, '12222', 1, 21);

-- 
-- Dumping data for table t_caja_detalle
--

-- Table calipsodb.t_caja_detalle does not contain any data (it is empty)

-- 
-- Dumping data for table t_detalle_compra
--

-- Table calipsodb.t_detalle_compra does not contain any data (it is empty)

-- 
-- Dumping data for table t_detalle_venta
--
INSERT INTO t_detalle_venta VALUES
(1, 1, 1, 40, '1', NULL, NULL, NULL, NULL, NULL, 3, 1, 23),
(2, 2, 2, 4, '1', NULL, NULL, NULL, NULL, NULL, 2, 0, 500);

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;