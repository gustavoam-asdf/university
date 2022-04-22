
CREATE TABLE Area
(
  id_area     INT         NOT NULL AUTO_INCREMENT,
  nombre      VARCHAR(80) NOT NULL,
  id_personal INT         NOT NULL,
  PRIMARY KEY (id_area)
);

CREATE TABLE Autorizacion
(
  id_autorizacion INT         NOT NULL AUTO_INCREMENT,
  resumen         VARCHAR(50) NOT NULL,
  descripcion     TEXT        NULL    ,
  id_cargo        INT         NOT NULL,
  PRIMARY KEY (id_autorizacion)
);

CREATE TABLE Cargo
(
  id_cargo INT         NOT NULL AUTO_INCREMENT,
  nombre   VARCHAR(80) NOT NULL,
  puestos  SMALLINT    NOT NULL,
  PRIMARY KEY (id_cargo)
);

CREATE TABLE Cotizacion
(
  id_cotizacion  INT              NOT NULL AUTO_INCREMENT,
  id_item        INT              NOT NULL,
  id_proveedor   INT              NOT NULL,
  valor_unitario DOUBLE PRECISION NOT NULL,
  PRIMARY KEY (id_cotizacion)
);

CREATE TABLE Documento
(
  id_documento INT NOT NULL,
  nombre       INT NOT NULL,
  PRIMARY KEY (id_documento)
);

ALTER TABLE Documento
  ADD CONSTRAINT UQ_id_documento UNIQUE (id_documento);

ALTER TABLE Documento
  ADD CONSTRAINT UQ_nombre UNIQUE (nombre);

CREATE TABLE Documento_Autorizacion
(
  id_autorizacion INT NOT NULL,
  id_documento    INT NOT NULL
);

CREATE TABLE Entrada_Salida
(
  id_factura_detalle INT NOT NULL,
  id_salida_detalle  INT NOT NULL
);

CREATE TABLE Estado_Documento
(
  id_estado_documento INT NOT NULL AUTO_INCREMENT,
  nombre              INT NOT NULL,
  PRIMARY KEY (id_estado_documento)
);

CREATE TABLE Factura
(
  nro_entrada_factura INT              NOT NULL AUTO_INCREMENT,
  fecha_facturacion   DATETIME         NOT NULL,
  nro_factura         INT              NOT NULL,
  nro_orden           INT              NOT NULL,
  total_items         NUMERIC          NULL    ,
  valor_total         DOUBLE PRECISION NOT NULL DEFAULT 0,
  id_proveedor        INT              NOT NULL,
  PRIMARY KEY (nro_entrada_factura)
);

CREATE TABLE Factura_Detalle
(
  id_factura_detalle  INT     NOT NULL AUTO_INCREMENT,
  nro_entrada_factura INT     NOT NULL,
  id_cotizacion       INT     NOT NULL,
  cantidad_entregada  NUMERIC NOT NULL,
  PRIMARY KEY (id_factura_detalle)
);

CREATE TABLE Item
(
  id_item       INT         NOT NULL AUTO_INCREMENT,
  id_tipo_item  INT         NOT NULL,
  nombre        VARCHAR(80) NOT NULL,
  unidad_medida VARCHAR(40) NOT NULL,
  PRIMARY KEY (id_item)
);

CREATE TABLE Orden_Compra
(
  nro_orden           INT              NOT NULL AUTO_INCREMENT,
  id_documento        INT              NOT NULL,
  valor_total         DOUBLE PRECISION NOT NULL DEFAULT 0,
  fecha_creacion      DATETIME         NOT NULL,
  fecha_entrega       DATETIME         NOT NULL,
  id_estado_documento INT              NOT NULL,
  PRIMARY KEY (nro_orden, id_documento)
);

CREATE TABLE Orden_Compra_Detalle
(
  id_orden_compra_detalle INT              NOT NULL AUTO_INCREMENT,
  nro_orden               INT              NOT NULL,
  id_cotizacion           INT              NOT NULL,
  id_solicitud_detalle    INT              NOT NULL,
  cantidad_solicitada     NUMERIC          NOT NULL,
  valor_total             DOUBLE PRECISION NOT NULL DEFAULT 0,
  PRIMARY KEY (id_orden_compra_detalle)
);

CREATE TABLE Personal
(
  id_personal INT         NOT NULL AUTO_INCREMENT,
  nombre      VARCHAR(80) NOT NULL,
  DNI         CHAR(8)     NOT NULL,
  id_cargo    INT         NOT NULL,
  PRIMARY KEY (id_personal)
);

CREATE TABLE Proveedor
(
  id_proveedor INT         NOT NULL AUTO_INCREMENT,
  nombre       VARCHAR(80) NOT NULL,
  PRIMARY KEY (id_proveedor)
);

CREATE TABLE Rubro_Presupuestal
(
  id_rubro    INT              NOT NULL AUTO_INCREMENT,
  nombre      VARCHAR(80)      NOT NULL,
  presupuesto DOUBLE PRECISION NOT NULL,
  PRIMARY KEY (id_rubro)
);

CREATE TABLE Salida
(
  nro_salida    INT      NOT NULL AUTO_INCREMENT,
  fecha_salida  DATETIME NOT NULL,
  fecha_entrega DATETIME NOT NULL,
  PRIMARY KEY (nro_salida)
);

CREATE TABLE Salida_Detalle
(
  id_salida_detalle   INT         NOT NULL AUTO_INCREMENT,
  nro_salida          INT         NOT NULL,
  id_personal         INT         NOT NULL,
  id_item             INT         NOT NULL,
  cantidad_despachada NUMERIC     NOT NULL,
  codigo_ubicacion    VARCHAR(12) NOT NULL,
  PRIMARY KEY (id_salida_detalle)
);

CREATE TABLE Solicitud
(
  nro_solicitud       INT              NOT NULL AUTO_INCREMENT,
  id_documento        INT              NOT NULL,
  id_rubro            INT              NOT NULL,
  id_area             INT              NOT NULL,
  valor_total         DOUBLE PRECISION NOT NULL DEFAULT 0,
  fecha_creacion      DATETIME         NOT NULL,
  id_estado_documento INT              NOT NULL,
  PRIMARY KEY (nro_solicitud, id_documento)
);

CREATE TABLE Solicitud_Detalle
(
  id_solicitud_detalle INT              NOT NULL AUTO_INCREMENT,
  nro_solicitud        INT              NOT NULL,
  id_item              INT              NOT NULL,
  cantidad_requerida   NUMERIC          NOT NULL,
  valor_total          DOUBLE PRECISION NOT NULL DEFAULT 0,
  PRIMARY KEY (id_solicitud_detalle)
);

CREATE TABLE Tipo_Item
(
  id_tipo_item INT         NOT NULL AUTO_INCREMENT,
  nombre       VARCHAR(80) NOT NULL,
  PRIMARY KEY (id_tipo_item)
);

ALTER TABLE Area
  ADD CONSTRAINT FK_Personal_TO_Area
    FOREIGN KEY (id_personal)
    REFERENCES Personal (id_personal);

ALTER TABLE Autorizacion
  ADD CONSTRAINT FK_Cargo_TO_Autorizacion
    FOREIGN KEY (id_cargo)
    REFERENCES Cargo (id_cargo);

ALTER TABLE Personal
  ADD CONSTRAINT FK_Cargo_TO_Personal
    FOREIGN KEY (id_cargo)
    REFERENCES Cargo (id_cargo);

ALTER TABLE Documento_Autorizacion
  ADD CONSTRAINT FK_Autorizacion_TO_Documento_Autorizacion
    FOREIGN KEY (id_autorizacion)
    REFERENCES Autorizacion (id_autorizacion);

ALTER TABLE Documento_Autorizacion
  ADD CONSTRAINT FK_Documento_TO_Documento_Autorizacion
    FOREIGN KEY (id_documento)
    REFERENCES Documento (id_documento);

ALTER TABLE Solicitud
  ADD CONSTRAINT FK_Documento_TO_Solicitud
    FOREIGN KEY (id_documento)
    REFERENCES Documento (id_documento);

ALTER TABLE Solicitud
  ADD CONSTRAINT FK_Rubro_Presupuestal_TO_Solicitud
    FOREIGN KEY (id_rubro)
    REFERENCES Rubro_Presupuestal (id_rubro);

ALTER TABLE Solicitud
  ADD CONSTRAINT FK_Area_TO_Solicitud
    FOREIGN KEY (id_area)
    REFERENCES Area (id_area);

ALTER TABLE Solicitud_Detalle
  ADD CONSTRAINT FK_Solicitud_TO_Solicitud_Detalle
    FOREIGN KEY (nro_solicitud)
    REFERENCES Solicitud (nro_solicitud);

ALTER TABLE Item
  ADD CONSTRAINT FK_Tipo_Item_TO_Item
    FOREIGN KEY (id_tipo_item)
    REFERENCES Tipo_Item (id_tipo_item);

ALTER TABLE Solicitud_Detalle
  ADD CONSTRAINT FK_Item_TO_Solicitud_Detalle
    FOREIGN KEY (id_item)
    REFERENCES Item (id_item);

ALTER TABLE Cotizacion
  ADD CONSTRAINT FK_Item_TO_Cotizacion
    FOREIGN KEY (id_item)
    REFERENCES Item (id_item);

ALTER TABLE Cotizacion
  ADD CONSTRAINT FK_Proveedor_TO_Cotizacion
    FOREIGN KEY (id_proveedor)
    REFERENCES Proveedor (id_proveedor);

ALTER TABLE Orden_Compra
  ADD CONSTRAINT FK_Documento_TO_Orden_Compra
    FOREIGN KEY (id_documento)
    REFERENCES Documento (id_documento);

ALTER TABLE Orden_Compra_Detalle
  ADD CONSTRAINT FK_Orden_Compra_TO_Orden_Compra_Detalle
    FOREIGN KEY (nro_orden)
    REFERENCES Orden_Compra (nro_orden, id_documento);

ALTER TABLE Solicitud
  ADD CONSTRAINT FK_Estado_Documento_TO_Solicitud
    FOREIGN KEY (id_estado_documento)
    REFERENCES Estado_Documento (id_estado_documento);

ALTER TABLE Orden_Compra
  ADD CONSTRAINT FK_Estado_Documento_TO_Orden_Compra
    FOREIGN KEY (id_estado_documento)
    REFERENCES Estado_Documento (id_estado_documento);

ALTER TABLE Orden_Compra_Detalle
  ADD CONSTRAINT FK_Cotizacion_TO_Orden_Compra_Detalle
    FOREIGN KEY (id_cotizacion)
    REFERENCES Cotizacion (id_cotizacion);

ALTER TABLE Orden_Compra_Detalle
  ADD CONSTRAINT FK_Solicitud_Detalle_TO_Orden_Compra_Detalle
    FOREIGN KEY (id_solicitud_detalle)
    REFERENCES Solicitud_Detalle (id_solicitud_detalle);

ALTER TABLE Factura
  ADD CONSTRAINT FK_Orden_Compra_TO_Factura
    FOREIGN KEY (nro_orden)
    REFERENCES Orden_Compra (nro_orden, id_documento);

ALTER TABLE Factura_Detalle
  ADD CONSTRAINT FK_Cotizacion_TO_Factura_Detalle
    FOREIGN KEY (id_cotizacion)
    REFERENCES Cotizacion (id_cotizacion);

ALTER TABLE Factura_Detalle
  ADD CONSTRAINT FK_Factura_TO_Factura_Detalle
    FOREIGN KEY (nro_entrada_factura)
    REFERENCES Factura (nro_entrada_factura);

ALTER TABLE Factura
  ADD CONSTRAINT FK_Proveedor_TO_Factura
    FOREIGN KEY (id_proveedor)
    REFERENCES Proveedor (id_proveedor);

ALTER TABLE Salida_Detalle
  ADD CONSTRAINT FK_Personal_TO_Salida_Detalle
    FOREIGN KEY (id_personal)
    REFERENCES Personal (id_personal);

ALTER TABLE Salida_Detalle
  ADD CONSTRAINT FK_Item_TO_Salida_Detalle
    FOREIGN KEY (id_item)
    REFERENCES Item (id_item);

ALTER TABLE Entrada_Salida
  ADD CONSTRAINT FK_Factura_Detalle_TO_Entrada_Salida
    FOREIGN KEY (id_factura_detalle)
    REFERENCES Factura_Detalle (id_factura_detalle);

ALTER TABLE Entrada_Salida
  ADD CONSTRAINT FK_Salida_Detalle_TO_Entrada_Salida
    FOREIGN KEY (id_salida_detalle)
    REFERENCES Salida_Detalle (id_salida_detalle);

ALTER TABLE Salida_Detalle
  ADD CONSTRAINT FK_Salida_TO_Salida_Detalle
    FOREIGN KEY (nro_salida)
    REFERENCES Salida (nro_salida);
