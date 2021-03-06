USE [master]
GO
/****** Object:  Database [logistica_unheval]    Script Date: 10/05/2022 10:11:55 ******/
CREATE DATABASE [logistica_unheval]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'logistica_unheval', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\logistica_unheval.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'logistica_unheval_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\logistica_unheval_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [logistica_unheval] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [logistica_unheval].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [logistica_unheval] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [logistica_unheval] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [logistica_unheval] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [logistica_unheval] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [logistica_unheval] SET ARITHABORT OFF 
GO
ALTER DATABASE [logistica_unheval] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [logistica_unheval] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [logistica_unheval] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [logistica_unheval] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [logistica_unheval] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [logistica_unheval] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [logistica_unheval] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [logistica_unheval] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [logistica_unheval] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [logistica_unheval] SET  DISABLE_BROKER 
GO
ALTER DATABASE [logistica_unheval] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [logistica_unheval] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [logistica_unheval] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [logistica_unheval] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [logistica_unheval] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [logistica_unheval] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [logistica_unheval] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [logistica_unheval] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [logistica_unheval] SET  MULTI_USER 
GO
ALTER DATABASE [logistica_unheval] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [logistica_unheval] SET DB_CHAINING OFF 
GO
ALTER DATABASE [logistica_unheval] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [logistica_unheval] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [logistica_unheval] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [logistica_unheval] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [logistica_unheval] SET QUERY_STORE = OFF
GO
USE [logistica_unheval]
GO
/****** Object:  Table [dbo].[area]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[area](
	[id_area] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[id_personal] [int] NOT NULL,
	[id_area_superior] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[autorizacion]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autorizacion](
	[id_autorizacion] [int] IDENTITY(1,1) NOT NULL,
	[resumen] [varchar](50) NOT NULL,
	[descripcion] [text] NULL,
	[id_cargo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_autorizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cargo]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargo](
	[id_cargo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cotizacion]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cotizacion](
	[id_cotizacion] [int] IDENTITY(1,1) NOT NULL,
	[id_item] [int] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[valor_unitario] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cotizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[documento]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[documento](
	[id_documento] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_documento] UNIQUE NONCLUSTERED 
(
	[id_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[documento_autorizacion]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[documento_autorizacion](
	[id_autorizacion] [int] NOT NULL,
	[id_documento] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entrada_salida]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entrada_salida](
	[id_factura_detalle] [int] NOT NULL,
	[id_salida_detalle] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado_documento]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_documento](
	[id_estado_documento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[nro_entrada_factura] [int] IDENTITY(1,1) NOT NULL,
	[fecha_facturacion] [datetime] NOT NULL,
	[nro_factura] [int] NOT NULL,
	[nro_orden] [int] NOT NULL,
	[total_items] [decimal](10, 0) NULL,
	[valor_total] [float] NOT NULL,
	[id_proveedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_entrada_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura_detalle]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura_detalle](
	[id_factura_detalle] [int] IDENTITY(1,1) NOT NULL,
	[nro_entrada_factura] [int] NOT NULL,
	[id_cotizacion] [int] NOT NULL,
	[cantidad_entregada] [decimal](10, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_factura_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[id_item] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_item] [int] NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[unidad_medida] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden_compra]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_compra](
	[nro_orden] [int] IDENTITY(1,1) NOT NULL,
	[id_documento] [int] NOT NULL,
	[valor_total] [float] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_entrega] [datetime] NOT NULL,
	[id_estado_documento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden_compra_detalle]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_compra_detalle](
	[id_orden_compra_detalle] [int] IDENTITY(1,1) NOT NULL,
	[nro_orden] [int] NOT NULL,
	[id_cotizacion] [int] NOT NULL,
	[id_solicitud_detalle] [int] NOT NULL,
	[cantidad_solicitada] [decimal](10, 0) NOT NULL,
	[valor_total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_compra_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personal]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personal](
	[id_personal] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[DNI] [char](8) NOT NULL,
	[id_cargo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rubro_presupuestal]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rubro_presupuestal](
	[id_rubro] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[presupuesto] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rubro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salida]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salida](
	[nro_salida] [int] IDENTITY(1,1) NOT NULL,
	[fecha_salida] [datetime] NOT NULL,
	[fecha_entrega] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salida_detalle]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salida_detalle](
	[id_salida_detalle] [int] IDENTITY(1,1) NOT NULL,
	[nro_salida] [int] NOT NULL,
	[id_personal] [int] NOT NULL,
	[id_item] [int] NOT NULL,
	[cantidad_despachada] [decimal](10, 0) NOT NULL,
	[codigo_ubicacion] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_salida_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitud]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitud](
	[nro_solicitud] [int] IDENTITY(1,1) NOT NULL,
	[id_documento] [int] NOT NULL,
	[id_rubro] [int] NOT NULL,
	[id_area] [int] NOT NULL,
	[valor_total] [float] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[id_estado_documento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitud_detalle]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitud_detalle](
	[id_solicitud_detalle] [int] IDENTITY(1,1) NOT NULL,
	[nro_solicitud] [int] NOT NULL,
	[id_item] [int] NOT NULL,
	[cantidad_requerida] [decimal](10, 0) NOT NULL,
	[valor_total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_solicitud_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitud_orden_detalle]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitud_orden_detalle](
	[id_solicitud_orden_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_solicitud_detalle] [int] NULL,
	[id_orden_compra_detalle] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_solicitud_orden_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_item]    Script Date: 10/05/2022 10:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_item](
	[id_tipo_item] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[area] ADD  DEFAULT (NULL) FOR [id_area_superior]
GO
ALTER TABLE [dbo].[factura] ADD  DEFAULT (NULL) FOR [total_items]
GO
ALTER TABLE [dbo].[factura] ADD  DEFAULT ('0') FOR [valor_total]
GO
ALTER TABLE [dbo].[orden_compra] ADD  DEFAULT ('0') FOR [valor_total]
GO
ALTER TABLE [dbo].[orden_compra_detalle] ADD  DEFAULT ('0') FOR [valor_total]
GO
ALTER TABLE [dbo].[solicitud] ADD  DEFAULT ('1') FOR [id_documento]
GO
ALTER TABLE [dbo].[solicitud] ADD  DEFAULT ('0') FOR [valor_total]
GO
ALTER TABLE [dbo].[solicitud_detalle] ADD  DEFAULT ('0') FOR [valor_total]
GO
ALTER TABLE [dbo].[solicitud_orden_detalle] ADD  DEFAULT (NULL) FOR [id_solicitud_detalle]
GO
ALTER TABLE [dbo].[solicitud_orden_detalle] ADD  DEFAULT (NULL) FOR [id_orden_compra_detalle]
GO
ALTER TABLE [dbo].[area]  WITH CHECK ADD  CONSTRAINT [fk_area_personal] FOREIGN KEY([id_personal])
REFERENCES [dbo].[personal] ([id_personal])
GO
ALTER TABLE [dbo].[area] CHECK CONSTRAINT [fk_area_personal]
GO
ALTER TABLE [dbo].[autorizacion]  WITH CHECK ADD  CONSTRAINT [fk_autorizacion_Cargo] FOREIGN KEY([id_cargo])
REFERENCES [dbo].[cargo] ([id_cargo])
GO
ALTER TABLE [dbo].[autorizacion] CHECK CONSTRAINT [fk_autorizacion_Cargo]
GO
ALTER TABLE [dbo].[cotizacion]  WITH CHECK ADD  CONSTRAINT [fk_cotizacion_item] FOREIGN KEY([id_item])
REFERENCES [dbo].[item] ([id_item])
GO
ALTER TABLE [dbo].[cotizacion] CHECK CONSTRAINT [fk_cotizacion_item]
GO
ALTER TABLE [dbo].[cotizacion]  WITH CHECK ADD  CONSTRAINT [fk_cotizacion_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[cotizacion] CHECK CONSTRAINT [fk_cotizacion_proveedor]
GO
ALTER TABLE [dbo].[documento_autorizacion]  WITH CHECK ADD  CONSTRAINT [fk_documento_autorizacion_autorizacion] FOREIGN KEY([id_autorizacion])
REFERENCES [dbo].[autorizacion] ([id_autorizacion])
GO
ALTER TABLE [dbo].[documento_autorizacion] CHECK CONSTRAINT [fk_documento_autorizacion_autorizacion]
GO
ALTER TABLE [dbo].[documento_autorizacion]  WITH CHECK ADD  CONSTRAINT [fk_documento_autorizacion_documento] FOREIGN KEY([id_documento])
REFERENCES [dbo].[documento] ([id_documento])
GO
ALTER TABLE [dbo].[documento_autorizacion] CHECK CONSTRAINT [fk_documento_autorizacion_documento]
GO
ALTER TABLE [dbo].[entrada_salida]  WITH CHECK ADD  CONSTRAINT [fk_entrada_salida_factura_detalle] FOREIGN KEY([id_factura_detalle])
REFERENCES [dbo].[factura_detalle] ([id_factura_detalle])
GO
ALTER TABLE [dbo].[entrada_salida] CHECK CONSTRAINT [fk_entrada_salida_factura_detalle]
GO
ALTER TABLE [dbo].[entrada_salida]  WITH CHECK ADD  CONSTRAINT [fk_entrada_salida_salida_detalle] FOREIGN KEY([id_salida_detalle])
REFERENCES [dbo].[salida_detalle] ([id_salida_detalle])
GO
ALTER TABLE [dbo].[entrada_salida] CHECK CONSTRAINT [fk_entrada_salida_salida_detalle]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [fk_factura_orden_compra] FOREIGN KEY([nro_orden])
REFERENCES [dbo].[orden_compra] ([nro_orden])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [fk_factura_orden_compra]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [fk_factura_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [fk_factura_proveedor]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [fk_factura_detalle_cotizacion] FOREIGN KEY([id_cotizacion])
REFERENCES [dbo].[cotizacion] ([id_cotizacion])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [fk_factura_detalle_cotizacion]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [fk_factura_detalle_factura] FOREIGN KEY([nro_entrada_factura])
REFERENCES [dbo].[factura] ([nro_entrada_factura])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [fk_factura_detalle_factura]
GO
ALTER TABLE [dbo].[item]  WITH CHECK ADD  CONSTRAINT [fk_item_tipo_item] FOREIGN KEY([id_tipo_item])
REFERENCES [dbo].[tipo_item] ([id_tipo_item])
GO
ALTER TABLE [dbo].[item] CHECK CONSTRAINT [fk_item_tipo_item]
GO
ALTER TABLE [dbo].[orden_compra]  WITH CHECK ADD  CONSTRAINT [fk_orden_compra_documento] FOREIGN KEY([id_documento])
REFERENCES [dbo].[documento] ([id_documento])
GO
ALTER TABLE [dbo].[orden_compra] CHECK CONSTRAINT [fk_orden_compra_documento]
GO
ALTER TABLE [dbo].[orden_compra]  WITH CHECK ADD  CONSTRAINT [fk_orden_compra_estado_documento] FOREIGN KEY([id_estado_documento])
REFERENCES [dbo].[estado_documento] ([id_estado_documento])
GO
ALTER TABLE [dbo].[orden_compra] CHECK CONSTRAINT [fk_orden_compra_estado_documento]
GO
ALTER TABLE [dbo].[orden_compra_detalle]  WITH CHECK ADD  CONSTRAINT [fk_orden_compra_detalle_cotizacion] FOREIGN KEY([id_cotizacion])
REFERENCES [dbo].[cotizacion] ([id_cotizacion])
GO
ALTER TABLE [dbo].[orden_compra_detalle] CHECK CONSTRAINT [fk_orden_compra_detalle_cotizacion]
GO
ALTER TABLE [dbo].[orden_compra_detalle]  WITH CHECK ADD  CONSTRAINT [fk_orden_compra_detalle_orden_compra] FOREIGN KEY([nro_orden])
REFERENCES [dbo].[orden_compra] ([nro_orden])
GO
ALTER TABLE [dbo].[orden_compra_detalle] CHECK CONSTRAINT [fk_orden_compra_detalle_orden_compra]
GO
ALTER TABLE [dbo].[orden_compra_detalle]  WITH CHECK ADD  CONSTRAINT [fk_orden_compra_detalle_solicitud_detalle] FOREIGN KEY([id_solicitud_detalle])
REFERENCES [dbo].[solicitud_detalle] ([id_solicitud_detalle])
GO
ALTER TABLE [dbo].[orden_compra_detalle] CHECK CONSTRAINT [fk_orden_compra_detalle_solicitud_detalle]
GO
ALTER TABLE [dbo].[personal]  WITH CHECK ADD  CONSTRAINT [fk_personal_cargo] FOREIGN KEY([id_cargo])
REFERENCES [dbo].[cargo] ([id_cargo])
GO
ALTER TABLE [dbo].[personal] CHECK CONSTRAINT [fk_personal_cargo]
GO
ALTER TABLE [dbo].[salida_detalle]  WITH CHECK ADD  CONSTRAINT [fk_salida_detalle_item] FOREIGN KEY([id_item])
REFERENCES [dbo].[item] ([id_item])
GO
ALTER TABLE [dbo].[salida_detalle] CHECK CONSTRAINT [fk_salida_detalle_item]
GO
ALTER TABLE [dbo].[salida_detalle]  WITH CHECK ADD  CONSTRAINT [fk_salida_detalle_personal] FOREIGN KEY([id_personal])
REFERENCES [dbo].[personal] ([id_personal])
GO
ALTER TABLE [dbo].[salida_detalle] CHECK CONSTRAINT [fk_salida_detalle_personal]
GO
ALTER TABLE [dbo].[salida_detalle]  WITH CHECK ADD  CONSTRAINT [fk_salida_detalle_salida] FOREIGN KEY([nro_salida])
REFERENCES [dbo].[salida] ([nro_salida])
GO
ALTER TABLE [dbo].[salida_detalle] CHECK CONSTRAINT [fk_salida_detalle_salida]
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD  CONSTRAINT [fk_solicitud_area] FOREIGN KEY([id_area])
REFERENCES [dbo].[area] ([id_area])
GO
ALTER TABLE [dbo].[solicitud] CHECK CONSTRAINT [fk_solicitud_area]
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD  CONSTRAINT [fk_solicitud_documento] FOREIGN KEY([id_documento])
REFERENCES [dbo].[documento] ([id_documento])
GO
ALTER TABLE [dbo].[solicitud] CHECK CONSTRAINT [fk_solicitud_documento]
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD  CONSTRAINT [fk_solicitud_estado_documento] FOREIGN KEY([id_estado_documento])
REFERENCES [dbo].[estado_documento] ([id_estado_documento])
GO
ALTER TABLE [dbo].[solicitud] CHECK CONSTRAINT [fk_solicitud_estado_documento]
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD  CONSTRAINT [fk_solicitud_rubro_presupuestal] FOREIGN KEY([id_rubro])
REFERENCES [dbo].[rubro_presupuestal] ([id_rubro])
GO
ALTER TABLE [dbo].[solicitud] CHECK CONSTRAINT [fk_solicitud_rubro_presupuestal]
GO
ALTER TABLE [dbo].[solicitud_detalle]  WITH CHECK ADD  CONSTRAINT [fk_solicitud_detalle_item] FOREIGN KEY([id_item])
REFERENCES [dbo].[item] ([id_item])
GO
ALTER TABLE [dbo].[solicitud_detalle] CHECK CONSTRAINT [fk_solicitud_detalle_item]
GO
ALTER TABLE [dbo].[solicitud_detalle]  WITH CHECK ADD  CONSTRAINT [fk_solicitud_detalle_solicitud] FOREIGN KEY([nro_solicitud])
REFERENCES [dbo].[solicitud] ([nro_solicitud])
GO
ALTER TABLE [dbo].[solicitud_detalle] CHECK CONSTRAINT [fk_solicitud_detalle_solicitud]
GO
ALTER TABLE [dbo].[solicitud_orden_detalle]  WITH CHECK ADD  CONSTRAINT [fk_sod_orden_comprar_detalle] FOREIGN KEY([id_orden_compra_detalle])
REFERENCES [dbo].[orden_compra_detalle] ([id_orden_compra_detalle])
GO
ALTER TABLE [dbo].[solicitud_orden_detalle] CHECK CONSTRAINT [fk_sod_orden_comprar_detalle]
GO
ALTER TABLE [dbo].[solicitud_orden_detalle]  WITH CHECK ADD  CONSTRAINT [fk_sod_solicitud_detalle] FOREIGN KEY([id_solicitud_detalle])
REFERENCES [dbo].[solicitud_detalle] ([id_solicitud_detalle])
GO
ALTER TABLE [dbo].[solicitud_orden_detalle] CHECK CONSTRAINT [fk_sod_solicitud_detalle]
GO
USE [master]
GO
ALTER DATABASE [logistica_unheval] SET  READ_WRITE 
GO
