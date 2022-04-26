-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: logistica_unheval
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `id_personal` int NOT NULL,
  PRIMARY KEY (`id_area`),
  KEY `FK_Personal_TO_Area` (`id_personal`),
  CONSTRAINT `FK_Personal_TO_Area` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Logística',4),(2,'Almacen',1),(3,'Informática',7),(4,'Contabilidad',9);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;

--
-- Table structure for table `autorizacion`
--

DROP TABLE IF EXISTS `autorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autorizacion` (
  `id_autorizacion` int NOT NULL AUTO_INCREMENT,
  `resumen` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `id_cargo` int NOT NULL,
  PRIMARY KEY (`id_autorizacion`),
  KEY `FK_Cargo_TO_Autorizacion` (`id_cargo`),
  CONSTRAINT `FK_Cargo_TO_Autorizacion` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacion`
--

/*!40000 ALTER TABLE `autorizacion` DISABLE KEYS */;
INSERT INTO `autorizacion` VALUES (1,'Emision de solicitud ','El jefe de area aprueba la emisión de una solicitud',1),(2,'Aprobacion de solicitud','El director financiero autoriza la validez de una solicitud',2),(3,'Emision de orden de compra','El director financiero autoriza la emision de la orden de compra al proveedor',2);
/*!40000 ALTER TABLE `autorizacion` ENABLE KEYS */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Jefe de Área'),(2,'Director(a) Financiero'),(3,'Secretario(a)');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;

--
-- Table structure for table `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizacion` (
  `id_cotizacion` int NOT NULL AUTO_INCREMENT,
  `id_item` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `valor_unitario` double NOT NULL,
  PRIMARY KEY (`id_cotizacion`),
  KEY `FK_Item_TO_Cotizacion` (`id_item`),
  KEY `FK_Proveedor_TO_Cotizacion` (`id_proveedor`),
  CONSTRAINT `FK_Item_TO_Cotizacion` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
  CONSTRAINT `FK_Proveedor_TO_Cotizacion` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion`
--

/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento` (
  `id_documento` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_documento`),
  UNIQUE KEY `UQ_id_documento` (`id_documento`),
  UNIQUE KEY `UQ_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (3,'Factura'),(2,'Orden de compra'),(1,'Solicitud');
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;

--
-- Table structure for table `documento_autorizacion`
--

DROP TABLE IF EXISTS `documento_autorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento_autorizacion` (
  `id_autorizacion` int NOT NULL,
  `id_documento` int NOT NULL,
  KEY `FK_Autorizacion_TO_Documento_Autorizacion` (`id_autorizacion`),
  KEY `FK_Documento_TO_Documento_Autorizacion` (`id_documento`),
  CONSTRAINT `FK_Autorizacion_TO_Documento_Autorizacion` FOREIGN KEY (`id_autorizacion`) REFERENCES `autorizacion` (`id_autorizacion`),
  CONSTRAINT `FK_Documento_TO_Documento_Autorizacion` FOREIGN KEY (`id_documento`) REFERENCES `documento` (`id_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento_autorizacion`
--

/*!40000 ALTER TABLE `documento_autorizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento_autorizacion` ENABLE KEYS */;

--
-- Table structure for table `entrada_salida`
--

DROP TABLE IF EXISTS `entrada_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada_salida` (
  `id_factura_detalle` int NOT NULL,
  `id_salida_detalle` int NOT NULL,
  KEY `FK_Factura_Detalle_TO_Entrada_Salida` (`id_factura_detalle`),
  KEY `FK_Salida_Detalle_TO_Entrada_Salida` (`id_salida_detalle`),
  CONSTRAINT `FK_Factura_Detalle_TO_Entrada_Salida` FOREIGN KEY (`id_factura_detalle`) REFERENCES `factura_detalle` (`id_factura_detalle`),
  CONSTRAINT `FK_Salida_Detalle_TO_Entrada_Salida` FOREIGN KEY (`id_salida_detalle`) REFERENCES `salida_detalle` (`id_salida_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_salida`
--

/*!40000 ALTER TABLE `entrada_salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrada_salida` ENABLE KEYS */;

--
-- Table structure for table `estado_documento`
--

DROP TABLE IF EXISTS `estado_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_documento` (
  `id_estado_documento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_documento`
--

/*!40000 ALTER TABLE `estado_documento` DISABLE KEYS */;
INSERT INTO `estado_documento` VALUES (1,'Aprobado'),(2,'Enviado'),(3,'Procesado');
/*!40000 ALTER TABLE `estado_documento` ENABLE KEYS */;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `nro_entrada_factura` int NOT NULL AUTO_INCREMENT,
  `fecha_facturacion` datetime NOT NULL,
  `nro_factura` int NOT NULL,
  `nro_orden` int NOT NULL,
  `total_items` decimal(10,0) DEFAULT NULL,
  `valor_total` double NOT NULL DEFAULT '0',
  `id_proveedor` int NOT NULL,
  PRIMARY KEY (`nro_entrada_factura`),
  KEY `FK_Orden_Compra_TO_Factura` (`nro_orden`),
  KEY `FK_Proveedor_TO_Factura` (`id_proveedor`),
  CONSTRAINT `FK_Orden_Compra_TO_Factura` FOREIGN KEY (`nro_orden`) REFERENCES `orden_compra` (`nro_orden`),
  CONSTRAINT `FK_Proveedor_TO_Factura` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;

--
-- Table structure for table `factura_detalle`
--

DROP TABLE IF EXISTS `factura_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_detalle` (
  `id_factura_detalle` int NOT NULL AUTO_INCREMENT,
  `nro_entrada_factura` int NOT NULL,
  `id_cotizacion` int NOT NULL,
  `cantidad_entregada` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_factura_detalle`),
  KEY `FK_Cotizacion_TO_Factura_Detalle` (`id_cotizacion`),
  KEY `FK_Factura_TO_Factura_Detalle` (`nro_entrada_factura`),
  CONSTRAINT `FK_Cotizacion_TO_Factura_Detalle` FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`),
  CONSTRAINT `FK_Factura_TO_Factura_Detalle` FOREIGN KEY (`nro_entrada_factura`) REFERENCES `factura` (`nro_entrada_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalle`
--

/*!40000 ALTER TABLE `factura_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_detalle` ENABLE KEYS */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_tipo_item` int NOT NULL,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `unidad_medida` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `FK_Tipo_Item_TO_Item` (`id_tipo_item`),
  CONSTRAINT `FK_Tipo_Item_TO_Item` FOREIGN KEY (`id_tipo_item`) REFERENCES `tipo_item` (`id_tipo_item`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,'Millar papel bond','gramos'),(2,1,'Pantalla de computadora','unidades'),(3,1,'Caja de lapiceros','100 unidades'),(4,1,'Silla giratoria','unidades'),(5,1,'Escritorios','unidades');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

--
-- Table structure for table `orden_compra`
--

DROP TABLE IF EXISTS `orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra` (
  `nro_orden` int NOT NULL AUTO_INCREMENT,
  `id_documento` int NOT NULL,
  `valor_total` double NOT NULL DEFAULT '0',
  `fecha_creacion` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `id_estado_documento` int NOT NULL,
  PRIMARY KEY (`nro_orden`,`id_documento`),
  KEY `FK_Documento_TO_Orden_Compra` (`id_documento`),
  KEY `FK_Estado_Documento_TO_Orden_Compra` (`id_estado_documento`),
  CONSTRAINT `FK_Documento_TO_Orden_Compra` FOREIGN KEY (`id_documento`) REFERENCES `documento` (`id_documento`),
  CONSTRAINT `FK_Estado_Documento_TO_Orden_Compra` FOREIGN KEY (`id_estado_documento`) REFERENCES `estado_documento` (`id_estado_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra`
--

/*!40000 ALTER TABLE `orden_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra` ENABLE KEYS */;

--
-- Table structure for table `orden_compra_detalle`
--

DROP TABLE IF EXISTS `orden_compra_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra_detalle` (
  `id_orden_compra_detalle` int NOT NULL AUTO_INCREMENT,
  `nro_orden` int NOT NULL,
  `id_cotizacion` int NOT NULL,
  `id_solicitud_detalle` int NOT NULL,
  `cantidad_solicitada` decimal(10,0) NOT NULL,
  `valor_total` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_orden_compra_detalle`),
  KEY `FK_Orden_Compra_TO_Orden_Compra_Detalle` (`nro_orden`),
  KEY `FK_Cotizacion_TO_Orden_Compra_Detalle` (`id_cotizacion`),
  KEY `FK_Solicitud_Detalle_TO_Orden_Compra_Detalle` (`id_solicitud_detalle`),
  CONSTRAINT `FK_Cotizacion_TO_Orden_Compra_Detalle` FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`),
  CONSTRAINT `FK_Orden_Compra_TO_Orden_Compra_Detalle` FOREIGN KEY (`nro_orden`) REFERENCES `orden_compra` (`nro_orden`),
  CONSTRAINT `FK_Solicitud_Detalle_TO_Orden_Compra_Detalle` FOREIGN KEY (`id_solicitud_detalle`) REFERENCES `solicitud_detalle` (`id_solicitud_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra_detalle`
--

/*!40000 ALTER TABLE `orden_compra_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra_detalle` ENABLE KEYS */;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `id_personal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `DNI` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `id_cargo` int NOT NULL,
  PRIMARY KEY (`id_personal`),
  KEY `FK_Cargo_TO_Personal` (`id_cargo`),
  CONSTRAINT `FK_Cargo_TO_Personal` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Juan Perez','71661497',1),(2,'Raul Salinas','84563214',2),(3,'Alberto Salas','75684235',3),(4,'Karla Rojas','45621478',1),(5,'Carlos Lopez','75621465',2),(6,'Alvaro Iglesias','69854752',3),(7,'Miguel Rojas','47618951',1),(8,'Luiz Meza','63256271',2),(9,'Raúl Álvares','92345123',1),(10,'Adrián Romero','68953471',2);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

--
-- Table structure for table `rubro_presupuestal`
--

DROP TABLE IF EXISTS `rubro_presupuestal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubro_presupuestal` (
  `id_rubro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `presupuesto` double NOT NULL,
  PRIMARY KEY (`id_rubro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubro_presupuestal`
--

/*!40000 ALTER TABLE `rubro_presupuestal` DISABLE KEYS */;
INSERT INTO `rubro_presupuestal` VALUES (1,'Materiales de oficina',10500),(2,'Materiales de almacen',20000);
/*!40000 ALTER TABLE `rubro_presupuestal` ENABLE KEYS */;

--
-- Table structure for table `salida`
--

DROP TABLE IF EXISTS `salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salida` (
  `nro_salida` int NOT NULL AUTO_INCREMENT,
  `fecha_salida` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  PRIMARY KEY (`nro_salida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida`
--

/*!40000 ALTER TABLE `salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `salida` ENABLE KEYS */;

--
-- Table structure for table `salida_detalle`
--

DROP TABLE IF EXISTS `salida_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salida_detalle` (
  `id_salida_detalle` int NOT NULL AUTO_INCREMENT,
  `nro_salida` int NOT NULL,
  `id_personal` int NOT NULL,
  `id_item` int NOT NULL,
  `cantidad_despachada` decimal(10,0) NOT NULL,
  `codigo_ubicacion` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_salida_detalle`),
  KEY `FK_Personal_TO_Salida_Detalle` (`id_personal`),
  KEY `FK_Item_TO_Salida_Detalle` (`id_item`),
  KEY `FK_Salida_TO_Salida_Detalle` (`nro_salida`),
  CONSTRAINT `FK_Item_TO_Salida_Detalle` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
  CONSTRAINT `FK_Personal_TO_Salida_Detalle` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`),
  CONSTRAINT `FK_Salida_TO_Salida_Detalle` FOREIGN KEY (`nro_salida`) REFERENCES `salida` (`nro_salida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida_detalle`
--

/*!40000 ALTER TABLE `salida_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `salida_detalle` ENABLE KEYS */;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `nro_solicitud` int NOT NULL AUTO_INCREMENT,
  `id_documento` int NOT NULL DEFAULT '1',
  `id_rubro` int NOT NULL,
  `id_area` int NOT NULL,
  `valor_total` double NOT NULL DEFAULT '0',
  `fecha_creacion` datetime NOT NULL,
  `id_estado_documento` int NOT NULL,
  PRIMARY KEY (`nro_solicitud`,`id_documento`),
  KEY `FK_Documento_TO_Solicitud` (`id_documento`),
  KEY `FK_Rubro_Presupuestal_TO_Solicitud` (`id_rubro`),
  KEY `FK_Area_TO_Solicitud` (`id_area`),
  KEY `FK_Estado_Documento_TO_Solicitud` (`id_estado_documento`),
  CONSTRAINT `FK_Area_TO_Solicitud` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`),
  CONSTRAINT `FK_Documento_TO_Solicitud` FOREIGN KEY (`id_documento`) REFERENCES `documento` (`id_documento`),
  CONSTRAINT `FK_Estado_Documento_TO_Solicitud` FOREIGN KEY (`id_estado_documento`) REFERENCES `estado_documento` (`id_estado_documento`),
  CONSTRAINT `FK_Rubro_Presupuestal_TO_Solicitud` FOREIGN KEY (`id_rubro`) REFERENCES `rubro_presupuestal` (`id_rubro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (1,1,1,1,0,'2022-04-20 10:00:00',3),(2,1,1,2,0,'2022-02-28 11:23:00',3),(3,1,1,1,0,'2022-02-15 13:23:20',3),(4,1,1,3,0,'2022-04-11 09:20:00',3);
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;

--
-- Table structure for table `solicitud_detalle`
--

DROP TABLE IF EXISTS `solicitud_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_detalle` (
  `id_solicitud_detalle` int NOT NULL AUTO_INCREMENT,
  `nro_solicitud` int NOT NULL,
  `id_item` int NOT NULL,
  `cantidad_requerida` decimal(10,0) NOT NULL,
  `valor_total` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_solicitud_detalle`),
  KEY `FK_Solicitud_TO_Solicitud_Detalle` (`nro_solicitud`),
  KEY `FK_Item_TO_Solicitud_Detalle` (`id_item`),
  CONSTRAINT `FK_Item_TO_Solicitud_Detalle` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
  CONSTRAINT `FK_Solicitud_TO_Solicitud_Detalle` FOREIGN KEY (`nro_solicitud`) REFERENCES `solicitud` (`nro_solicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_detalle`
--

/*!40000 ALTER TABLE `solicitud_detalle` DISABLE KEYS */;
INSERT INTO `solicitud_detalle` VALUES (1,1,1,20,0),(2,1,2,2,0),(3,2,3,30,0),(4,1,4,5,0),(5,3,1,15,0),(6,2,2,3,0),(7,4,3,20,0),(8,2,4,2,0);
/*!40000 ALTER TABLE `solicitud_detalle` ENABLE KEYS */;

--
-- Table structure for table `tipo_item`
--

DROP TABLE IF EXISTS `tipo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_item` (
  `id_tipo_item` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_item`
--

/*!40000 ALTER TABLE `tipo_item` DISABLE KEYS */;
INSERT INTO `tipo_item` VALUES (1,'suministro'),(2,'inmueble');
/*!40000 ALTER TABLE `tipo_item` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 23:08:07
