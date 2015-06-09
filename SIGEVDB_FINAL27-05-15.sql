/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     27/05/2015 13:00:42                          */
/*==============================================================*/


drop table if exists T_BOVEDA;

drop table if exists T_CAJA;

drop table if exists T_CAJA_DETALLE;

drop table if exists T_CLIENTE;

drop table if exists T_COMPRA;

drop table if exists T_CONTENEDOR;

drop table if exists T_DETALLE_COMPRA;

drop table if exists T_DETALLE_VENTA;

drop table if exists T_DEVOLUCION_PRODUCTO;

drop table if exists T_FRECUENCIA;

drop table if exists T_HISTORIAL_ASISTENCIA;

drop table if exists T_MENU;

drop table if exists T_MENU_ROL;

drop table if exists T_PAGO;

drop table if exists T_PERSONA;

drop table if exists T_PERSONAL;

drop table if exists T_PRECIO;

drop table if exists T_PRIVILEGIO;

drop table if exists T_PRODUCTO;

drop table if exists T_PROVEEDOR;

drop table if exists T_RAZON_SOCIAL;

drop table if exists T_ROL;

drop table if exists T_ROL_PRIVILEGIO;

drop table if exists T_USUARIO;

drop table if exists T_VENTA;

/*==============================================================*/
/* Table: T_BOVEDA                                              */
/*==============================================================*/
create table T_BOVEDA
(
   IDBOVEDA             int not null,
   MONTO                double,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   DENOMINACION         varchar(100),
   IDCTIPODETALLE       int,
   IDRAZONSOCIAL        int,
   primary key (IDBOVEDA)
);

/*==============================================================*/
/* Table: T_CAJA                                                */
/*==============================================================*/
create table T_CAJA
(
   IDCAJA               int not null,
   IDUSUARIO            INT,
   IDBOVEDA             int,
   MONTO                double,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   IDRAZONSOCIAL        int,
   FECHAARQUEO          date,
   primary key (IDCAJA)
);

/*==============================================================*/
/* Table: T_CAJA_DETALLE                                        */
/*==============================================================*/
create table T_CAJA_DETALLE
(
   IDCAJADETALLE        int not null,
   IDCAJA               int,
   DENOMINACION         varchar(50),
   IDCTIPODETALLE       int,
   MONTO                double,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   IDRAZONSOCIAL        int,
   SUBTOTAL             double,
   EGRESO               double,
   INGRESO              double,
   primary key (IDCAJADETALLE)
);

/*==============================================================*/
/* Table: T_CLIENTE                                             */
/*==============================================================*/
create table T_CLIENTE
(
   IDCLIENTE            INT not null,
   IDPERSONA            INT,
   IDCTIPOCLIENTE       INT,
   IDCRUTA              INT,
   IDCFECUENCIAVISITA   INT,
   IDCTIPONEGOCIO       INT,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   primary key (IDCLIENTE)
);

/*==============================================================*/
/* Table: T_COMPRA                                              */
/*==============================================================*/
create table T_COMPRA
(
   IDCOMPRA             INT not null,
   IDPROVEEDOR          INT,
   MONTOCOMPRA          double,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   COMPROVANTE          varchar(20),
   IDRAZONSOCIAL        int,
   IDCESTADOCOMPRA      int,
   primary key (IDCOMPRA)
);

/*==============================================================*/
/* Table: T_CONTENEDOR                                          */
/*==============================================================*/
create table T_CONTENEDOR
(
   IDCONTENEDOR         INT not null,
   IDTABLA              INT,
   IDITEM               INT,
   IDSUPERIOR           INT,
   ORDEN                INT,
   DENOMINACION         varchar(50),
   ABREVIATURA          varchar(50),
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   primary key (IDCONTENEDOR)
);

/*==============================================================*/
/* Table: T_DETALLE_COMPRA                                      */
/*==============================================================*/
create table T_DETALLE_COMPRA
(
   IDDETALLECOMPRA      int not null,
   IDCOMPRA             INT,
   IDPRODUCTO           int,
   FECHAVENCIMIENTO     datetime,
   CANTIDADCOMPRA       int,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   CANTIDADDANIADO      int,
   IDCOBSERVACION       int,
   SUBTOTAL             double,
   PRECIOCOMPRAUNID     double,
   primary key (IDDETALLECOMPRA)
);

/*==============================================================*/
/* Table: T_DETALLE_VENTA                                       */
/*==============================================================*/
create table T_DETALLE_VENTA
(
   IDDETALLEVENTA       int not null,
   IDVENTA              INT,
   IDPRODUCTO           int,
   CANTIDADVENTA        int,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   PRECIOVENTAUNID      double,
   DESCUENTO            double,
   SUBTOTAL             double,
   primary key (IDDETALLEVENTA)
);

/*==============================================================*/
/* Table: T_DEVOLUCION_PRODUCTO                                 */
/*==============================================================*/
create table T_DEVOLUCION_PRODUCTO
(
   IDDEVOLUCIONPRODUCTO int not null,
   IDPRODUCTO           int,
   FECHADEVOLUCION      date,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   CANTIDADPRODUCTO     int,
   FECHARETORNO         date,
   IDCESTADOPROCESO     int,
   primary key (IDDEVOLUCIONPRODUCTO)
);

/*==============================================================*/
/* Table: T_FRECUENCIA                                          */
/*==============================================================*/
create table T_FRECUENCIA
(
   IDFECHAPEDIDO        INT not null,
   IDVENTA              INT,
   FECHAPEDIDO          date,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   primary key (IDFECHAPEDIDO)
);

/*==============================================================*/
/* Table: T_HISTORIAL_ASISTENCIA                                */
/*==============================================================*/
create table T_HISTORIAL_ASISTENCIA
(
   IDHISTORIALASISTENCIA INT not null,
   IDPERSONAL           INT,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   primary key (IDHISTORIALASISTENCIA)
);

/*==============================================================*/
/* Table: T_MENU                                                */
/*==============================================================*/
create table T_MENU
(
   IDMENU               INT not null,
   DENOMINACION         varchar(100),
   IDSUPERIOR           INT,
   ORDEN                INT,
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   FECHACREAC           date,
   FECHAMODIF           date,
   primary key (IDMENU)
);

/*==============================================================*/
/* Table: T_MENU_ROL                                            */
/*==============================================================*/
create table T_MENU_ROL
(
   IDMENUROL            INT not null,
   IDMENU               INT,
   IDROL                INT,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   primary key (IDMENUROL)
);

/*==============================================================*/
/* Table: T_PAGO                                                */
/*==============================================================*/
create table T_PAGO
(
   IDPAGO               int not null,
   IDPERSONAL           INT,
   FECHAINICIO          date,
   FECHAFIN             date,
   MONTO                double,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   MINUTOSTARDANZA      int,
   HORASEXTRA           int,
   AUMENTO              double,
   DESCUENTO            double,
   MONTOTOTAL           double,
   primary key (IDPAGO)
);

/*==============================================================*/
/* Table: T_PERSONA                                             */
/*==============================================================*/
create table T_PERSONA
(
   IDPERSONA            INT not null,
   DNI                  varchar(8),
   NOMBRES              varchar(40),
   APPPAT               varchar(30),
   APPMAT               varchar(30),
   TELEFONO             varchar(15),
   DIRECCION            varchar(100),
   EMAIL                varchar(100),
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   CODIGO               VARCHAR(8),
   RUC                  varchar(12),
   RAZONSOCIAL          varchar(60),
   primary key (IDPERSONA)
);

/*==============================================================*/
/* Table: T_PERSONAL                                            */
/*==============================================================*/
create table T_PERSONAL
(
   IDPERSONAL           INT not null,
   IDPERSONA            INT,
   IDCRUTAASIGNADA      INT,
   IDCTIPOPERSONAL      INT,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   IDCESTADOPERSONAL    int,
   IDCMODALIDADPAGO     int,
   HORAENTRADA          time,
   HORASALIDA           time,
   URLFOTO              varchar(100),
   URLIMAGEN            varchar(100),
   MONTOPAGO            double,
   FECHAINGRESO         datetime,
   primary key (IDPERSONAL)
);

/*==============================================================*/
/* Table: T_PRECIO                                              */
/*==============================================================*/
create table T_PRECIO
(
   IDPRECIO             int not null,
   IDPRODUCTO           int,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   PRECIO               double,
   primary key (IDPRECIO)
);

/*==============================================================*/
/* Table: T_PRIVILEGIO                                          */
/*==============================================================*/
create table T_PRIVILEGIO
(
   IDPRIVILEGIO         INT not null,
   DENOMINACION         varchar(100),
   IDMENU               INT,
   ORDEN                INT,
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   FECHACREAC           date,
   FECHAMODIF           date,
   IDPRIVILEGIOBOTON    varchar(100),
   IMAGEN               varchar(100),
   primary key (IDPRIVILEGIO)
);

/*==============================================================*/
/* Table: T_PRODUCTO                                            */
/*==============================================================*/
create table T_PRODUCTO
(
   IDPRODUCTO           int not null,
   CODIGO               varchar(8),
   IDCMARCA             int,
   FECHA                date,
   NOMBREPRODUCTO       varchar(100),
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   PRECIOCOMPRA         double,
   CANTUNIDADESXCAJA    int,
   IDPROVEEDOR          int,
   STOCK                int,
   primary key (IDPRODUCTO)
);

/*==============================================================*/
/* Table: T_PROVEEDOR                                           */
/*==============================================================*/
create table T_PROVEEDOR
(
   IDPROVEEDOR          INT not null,
   IDPERSONA            INT,
   IDCTIPOPROVEEDOR     INT,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   primary key (IDPROVEEDOR)
);

/*==============================================================*/
/* Table: T_RAZON_SOCIAL                                        */
/*==============================================================*/
create table T_RAZON_SOCIAL
(
   IDRAZONSOCIAL        int not null,
   IDUSUARIO            INT,
   DENOMINACION         varchar(40),
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   RUC                  varchar(20),
   primary key (IDRAZONSOCIAL)
);

/*==============================================================*/
/* Table: T_ROL                                                 */
/*==============================================================*/
create table T_ROL
(
   IDROL                INT not null,
   NOMBREROL            varchar(100),
   DESCRIPCION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   FECHACREAC           date,
   FACHAMODIF           date,
   primary key (IDROL)
);

/*==============================================================*/
/* Table: T_ROL_PRIVILEGIO                                      */
/*==============================================================*/
create table T_ROL_PRIVILEGIO
(
   IDMENUROL            INT not null,
   IDROL                INT,
   IDPRIVILEGIO         INT,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   primary key (IDMENUROL)
);

/*==============================================================*/
/* Table: T_USUARIO                                             */
/*==============================================================*/
create table T_USUARIO
(
   IDUSUARIO            INT not null,
   IDROL                INT,
   IDPERSONA            INT,
   NOMBREUSUARIO        varchar(40),
   PASSWORD             varchar(40),
   IPACCESO             varchar(40),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   FECHACREAC           date,
   FECHAMODIF           date,
   primary key (IDUSUARIO)
);

/*==============================================================*/
/* Table: T_VENTA                                               */
/*==============================================================*/
create table T_VENTA
(
   IDVENTA              INT not null,
   IDCLIENTE            INT,
   MONTO                double,
   ESTADO               varchar(1),
   OBSERVACION          varchar(100),
   IDUSUARIOCREAC       INT,
   IDUSUARIOMODIF       INT,
   FECHACREAC           date,
   FECHAMODIF           date,
   TOTAL                double,
   IDCTIPOCOMPROVANTE   int,
   NUMCOMPROVANTE       varchar(20),
   IDRAZONSOCIAL        int,
   IDCVENTA             int,
   IDPERSONAL           int,
   primary key (IDVENTA)
);

alter table T_CAJA add constraint FK_REFERENCE_12 foreign key (IDUSUARIO)
      references T_USUARIO (IDUSUARIO) on delete restrict on update restrict;

alter table T_CAJA add constraint FK_REFERENCE_13 foreign key (IDBOVEDA)
      references T_BOVEDA (IDBOVEDA) on delete restrict on update restrict;

alter table T_CAJA_DETALLE add constraint FK_REFERENCE_11 foreign key (IDCAJA)
      references T_CAJA (IDCAJA) on delete restrict on update restrict;

alter table T_CLIENTE add constraint FK_REFERENCE_8 foreign key (IDPERSONA)
      references T_PERSONA (IDPERSONA) on delete restrict on update restrict;

alter table T_COMPRA add constraint FK_REFERENCE_25 foreign key (IDPROVEEDOR)
      references T_PROVEEDOR (IDPROVEEDOR) on delete restrict on update restrict;

alter table T_DETALLE_COMPRA add constraint FK_REFERENCE_21 foreign key (IDCOMPRA)
      references T_COMPRA (IDCOMPRA) on delete restrict on update restrict;

alter table T_DETALLE_COMPRA add constraint FK_REFERENCE_22 foreign key (IDPRODUCTO)
      references T_PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table T_DETALLE_VENTA add constraint FK_REFERENCE_17 foreign key (IDVENTA)
      references T_VENTA (IDVENTA) on delete restrict on update restrict;

alter table T_DETALLE_VENTA add constraint FK_REFERENCE_18 foreign key (IDPRODUCTO)
      references T_PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table T_DEVOLUCION_PRODUCTO add constraint FK_REFERENCE_29 foreign key (IDPRODUCTO)
      references T_PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table T_FRECUENCIA add constraint FK_REFERENCE_30 foreign key (IDVENTA)
      references T_VENTA (IDVENTA) on delete restrict on update restrict;

alter table T_HISTORIAL_ASISTENCIA add constraint FK_REFERENCE_14 foreign key (IDPERSONAL)
      references T_PERSONAL (IDPERSONAL) on delete restrict on update restrict;

alter table T_MENU_ROL add constraint FK_REFERENCE_19 foreign key (IDMENU)
      references T_MENU (IDMENU) on delete restrict on update restrict;

alter table T_MENU_ROL add constraint FK_REFERENCE_20 foreign key (IDROL)
      references T_ROL (IDROL) on delete restrict on update restrict;

alter table T_PAGO add constraint FK_REFERENCE_15 foreign key (IDPERSONAL)
      references T_PERSONAL (IDPERSONAL) on delete restrict on update restrict;

alter table T_PERSONAL add constraint FK_REFERENCE_9 foreign key (IDPERSONA)
      references T_PERSONA (IDPERSONA) on delete restrict on update restrict;

alter table T_PRECIO add constraint FK_REFERENCE_28 foreign key (IDPRODUCTO)
      references T_PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table T_PROVEEDOR add constraint FK_REFERENCE_7 foreign key (IDPERSONA)
      references T_PERSONA (IDPERSONA) on delete restrict on update restrict;

alter table T_RAZON_SOCIAL add constraint FK_REFERENCE_27 foreign key (IDUSUARIO)
      references T_USUARIO (IDUSUARIO) on delete restrict on update restrict;

alter table T_ROL_PRIVILEGIO add constraint FK_REFERENCE_23 foreign key (IDROL)
      references T_ROL (IDROL) on delete restrict on update restrict;

alter table T_ROL_PRIVILEGIO add constraint FK_REFERENCE_24 foreign key (IDPRIVILEGIO)
      references T_PRIVILEGIO (IDPRIVILEGIO) on delete restrict on update restrict;

alter table T_USUARIO add constraint FK_REFERENCE_2 foreign key (IDROL)
      references T_ROL (IDROL);

alter table T_USUARIO add constraint FK_REFERENCE_6 foreign key (IDPERSONA)
      references T_PERSONA (IDPERSONA) on delete restrict on update restrict;

alter table T_VENTA add constraint FK_REFERENCE_26 foreign key (IDCLIENTE)
      references T_CLIENTE (IDCLIENTE) on delete restrict on update restrict;

