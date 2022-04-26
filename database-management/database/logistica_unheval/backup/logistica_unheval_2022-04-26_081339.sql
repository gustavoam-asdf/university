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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion`
--

/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
INSERT INTO `cotizacion` VALUES (1,2,34,42.58),(2,8,21,1.07),(3,3,53,6.93),(4,6,5,97.2),(5,5,13,190.26),(6,5,86,8.17),(7,8,86,124.91),(8,3,74,140.12),(9,3,55,156.09),(10,4,17,156.04),(11,8,4,140.96),(12,2,50,121.98),(13,5,10,196.79),(14,5,50,45.93),(15,1,54,7.11),(16,6,64,158.91),(17,4,19,180.51),(18,1,100,32.83),(19,4,66,90.15),(20,3,46,175.02),(21,1,14,162.43),(22,6,26,95.06),(23,6,99,157.99),(24,8,72,59.07),(25,6,35,69.72),(26,4,20,132.62),(27,6,72,146.7),(28,2,69,114.34),(29,8,67,58.41),(30,1,21,181.66),(31,3,5,172.37),(32,3,6,82.91),(33,7,96,92.5),(34,6,61,94.23),(35,6,63,184.18),(36,7,100,193.78),(37,8,78,128.53),(38,2,41,177.26),(39,2,92,67.41),(40,2,76,65.72),(41,6,25,55.73),(42,1,74,99.08),(43,3,80,107.07),(44,3,45,75.04),(45,7,65,16.44),(46,4,56,169.8),(47,8,87,58.42),(48,7,56,64.24),(49,3,65,98.08),(50,8,50,37.89),(51,3,52,64.13),(52,5,25,137.75),(53,7,74,8.56),(54,4,28,41.14),(55,4,70,63.43),(56,8,14,115.97),(57,3,86,84.56),(58,7,58,112.44),(59,7,31,108.73),(60,6,23,79.51),(61,4,27,148.33),(62,1,43,70.17),(63,4,24,70.94),(64,7,3,131.19),(65,7,63,185.23),(66,8,66,98.06),(67,4,40,28.53),(68,3,99,57.84),(69,5,61,145.03),(70,7,25,76.07),(71,7,26,88.31),(72,7,70,60.51),(73,2,72,92.13),(74,1,45,119.42),(75,1,46,97.02),(76,6,48,162.92),(77,6,64,132.02),(78,4,64,41.29),(79,3,98,184.97),(80,7,65,26.1),(81,6,11,21.16),(82,7,3,3.41),(83,1,67,76.52),(84,3,17,195),(85,8,26,150.99),(86,2,78,45.64),(87,5,20,128.58),(88,2,10,165.94),(89,8,94,33.15),(90,5,91,173.73),(91,6,40,5.14),(92,1,13,171.11),(93,2,68,28.09),(94,5,47,69.01),(95,7,59,94.49),(96,2,5,168.34),(97,4,72,66.28),(98,7,10,137.47),(99,6,63,158.6),(100,2,59,59.64);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,'Millar papel bond','gramos'),(2,1,'Pantalla de computadora','unidades'),(3,1,'Bolígrado L-036 Caja X 10','unidades'),(4,1,'Silla giratoria','unidades'),(5,1,'Escritorios','unidades'),(6,1,'Impresora','unidades'),(7,1,'Engrapadoras','unidades'),(8,1,'Caja de grapas 26/6 X 5000 ','unidades');
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
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Juan Perez','71661497',1),(2,'Raul Salinas','84563214',2),(3,'Alberto Salas','75684235',3),(4,'Karla Rojas','45621478',1),(5,'Carlos Lopez','75621465',2),(6,'Alvaro Iglesias','69854752',3),(7,'Miguel Rojas','47618951',1),(8,'Luiz Meza','63256271',2),(9,'Raúl Álvares','92345123',1),(10,'Adrián Romero','68953471',2),(11,'Marin Kennsley','13772524',2),(12,'Sibley Kisby','31434727',1),(13,'Agathe Bridgens','20239060',1),(14,'Patrizius Juleff','78030605',2),(15,'Beilul Bairnsfather','12747701',2),(16,'Aura Evershed','85825792',3),(17,'Den Purcell','31289418',3),(18,'Daphna Midford','89075288',3),(19,'Jaime Sotworth','99488823',2),(20,'Lyndell Roe','34629990',3),(21,'Austen Gilbart','26160640',2),(22,'Slade Pele','05436069',3),(23,'Brennan Spatig','32311449',3),(24,'Courtnay Poltun','90539072',1),(25,'Hyacinthie Quiddihy','56400385',3),(26,'Donavon Barnwill','43402823',2),(27,'Essa Hearne','26757863',3),(28,'Aron Vannet','50997027',1),(29,'Ced Purrier','08165767',3),(30,'Tressa Kineton','58196801',1),(31,'Dwayne Macieja','14696224',2),(32,'Nikolos Rape','22241098',2),(33,'Tedra Spriggs','17438338',3),(34,'Hill Pic','39356249',1),(35,'Quent O\'Hartnett','64260697',1),(36,'Alexio Kryszka','61259179',1),(37,'Katina Waison','92564991',2),(38,'Eleanora Dautry','63090950',1),(39,'Drugi Roja','94936601',2),(40,'Devonne Petrashkov','90106529',1),(41,'Elianore Baignard','76879137',2),(42,'Jilleen Pretswell','43048758',3),(43,'Gideon Gazey','23062036',3),(44,'Curcio Partkya','39986080',2),(45,'Agustin Roddick','46867492',2),(46,'Trenna Blackburne','70468551',1),(47,'Walsh Saunter','95088458',3),(48,'Abe Manville','06526327',1),(49,'Lexis Mowles','03337957',1),(50,'Felipe Dengel','78354286',3),(51,'Gardie Somerscales','03377689',1),(52,'Nanni Bartlomiejczyk','79641143',1),(53,'Arri Barsam','53877848',3),(54,'Galina Phonix','17946992',2),(55,'Tabby Craigie','34033987',3),(56,'Leisha Nulty','42375960',3),(57,'Leticia Wooffinden','23506091',2),(58,'Delcina Gantzman','99341715',1),(59,'Cassie Deavall','03011019',1),(60,'Ludvig Haugh','46493053',3),(61,'Martha Fawke','05551015',3),(62,'Arlin Antoniat','93853102',3),(63,'Rosella de Najera','09105336',1),(64,'Clay Rowan','64671332',1),(65,'Allen Eliyahu','47180332',3),(66,'Nadean Brader','15524923',3),(67,'Max Picford','97397790',3),(68,'Kip Tudbald','97553267',3),(69,'Sutton Fitchet','92383120',3),(70,'Arline Dengate','76031487',3),(71,'Fae Volett','45619215',1),(72,'Jammal Roberson','84781229',3),(73,'Vin Balharry','43482462',2),(74,'Kris Luckings','40958953',2),(75,'Ferne Rambaut','74825863',1),(76,'Bettye Gillum','72734278',2),(77,'Roselle Dobbinson','37212229',3),(78,'Vale Baxter','86390841',1),(79,'Anabella Scrange','43844548',2),(80,'Derward Cardoe','40091871',3),(81,'Lela Iacovaccio','44168725',1),(82,'Joete Littrik','70347891',2),(83,'Courtney Morcomb','78583485',1),(84,'Enrichetta Pickerill','21724972',3),(85,'Adolf Jeaycock','91417556',1),(86,'Glynis Scole','87278299',3),(87,'Beckie Barthrop','42028420',1),(88,'Corina Farnan','45383957',3),(89,'Derron Stirtle','49251151',1),(90,'Gladys Gutridge','22621697',1),(91,'Westbrook Bulger','37052978',2),(92,'Lauritz MacClenan','74045187',3),(93,'Pedro Tillett','73527895',3),(94,'Amy Veeler','54040639',1),(95,'Son Wych','70125618',3),(96,'Rosa Croce','76930048',3),(97,'Vivi Gallager','12380849',1),(98,'Brianna Bazley','43612419',2),(99,'Rosemarie Falloon','12411939',3),(100,'Dalston Hembery','96364525',1),(101,'Laural Bofield','88867053',2),(102,'Simeon Chaffyn','18213596',2),(103,'Sawyer Eilers','13578552',2),(104,'Joe Bourchier','42920503',1),(105,'Anatole Sappy','99915732',3),(106,'Wayland Volage','01748017',1),(107,'Bevan Madrell','28473852',2),(108,'Derril Kidds','88495534',3),(109,'Gaultiero Leverett','51252494',3),(110,'Deane Fann','84835421',2),(111,'Maxy Iacobassi','28647682',3),(112,'Conny Morch','53332705',1),(113,'Johny Muckian','32816690',3),(114,'Esme McGready','51174016',2),(115,'Elly Gianolo','77060457',1),(116,'Jules Wilfing','99108632',2),(117,'Jessamine Chippin','02032403',1),(118,'Celina Burrill','56521925',2),(119,'Hadrian Mongain','74779093',1),(120,'Byram Sneesby','60551778',3),(121,'Andrus Nosworthy','85648558',1),(122,'Raeann Elijahu','36239817',1),(123,'Malachi Gillson','14577035',2),(124,'Beverly Meneer','06531925',3),(125,'Catharine Mattack','08228199',2),(126,'Gwyn Sang','40547660',1),(127,'Hebert Keelan','78661083',3),(128,'Colas Ebbins','72887663',3),(129,'Welch Titmuss','97299573',3),(130,'Itch Feaver','69516512',2),(131,'Lyndel Kenzie','78384902',2),(132,'Elwira Lepope','31827617',2),(133,'Sonnie Rotherham','51735959',1),(134,'Bryana McSperrin','54892652',2),(135,'Chuck Bateman','89060767',2),(136,'Fransisco Baraja','94363244',3),(137,'Mathilde Goldin','22456711',1),(138,'Quentin Harmond','22251747',3),(139,'Kacy Tanswill','20442974',1),(140,'Shamus Seifert','85574829',3),(141,'Carver Steanson','98170868',3),(142,'Eilis Cusick','07524186',1),(143,'Gerry Bosket','72446501',2),(144,'Raimundo Standeven','96811026',3),(145,'Ruddy Upcott','32662944',1),(146,'Cordell Craine','63620514',2),(147,'Willi Vanne','46440926',3),(148,'Oneida Croshaw','41062815',3),(149,'Antonia Tillard','62627150',1),(150,'Hilton Symcox','41890369',3),(151,'Gayelord Bastard','71758322',3),(152,'Lincoln Geering','25424238',3),(153,'Rosalinda Hullin','93693613',1),(154,'Goober Kilty','45709223',3),(155,'Mavis Westover','03003038',1),(156,'Tommie Heaviside','32962705',2),(157,'Cathryn Jeff','80295603',3),(158,'Bev Cordle','15247055',3),(159,'Torrance Thrasher','45557390',1),(160,'Herschel Gauntlett','81633550',3),(161,'Georgie Kings','47656674',1),(162,'Zachary Mazillius','33871670',3),(163,'Shelagh Nevitt','70279693',3),(164,'Alvira Cabell','61657434',1),(165,'Celeste Bourley','64342353',1),(166,'Lena Morrieson','10604728',2),(167,'Holly-anne Sobey','46312068',2),(168,'Barbey Whiteman','64004064',3),(169,'Dennis Rance','80611270',2),(170,'Mannie McNelly','79502315',3),(171,'Clary Yacob','26858553',3),(172,'Fredek Waistell','90564469',2),(173,'Cayla Gonning','70993108',1),(174,'Woodrow Sabater','51000310',2),(175,'Normie Lapides','90979584',2),(176,'Odetta Fayers','93126087',3),(177,'Lucien Sugg','04850526',1),(178,'Daveen Klimek','49398537',3),(179,'Marjy Duffield','66062325',3),(180,'Joelie Redford','68600031',1),(181,'Florry Kiltie','82040439',1),(182,'Elspeth Paulillo','42806927',1),(183,'Sharla Ralling','80454425',3),(184,'Hollyanne Lambal','78056494',3),(185,'Colleen Gudde','96387647',2),(186,'Emmalynne Buckner','67232107',2),(187,'Donny Frangello','23594751',3),(188,'Torrey Gorini','31659986',2),(189,'Nari Spatari','86937121',2),(190,'Alaster Prawle','68554300',2),(191,'Shandie Habbeshaw','24971657',2),(192,'Rorie Decayette','64789817',1),(193,'Cinnamon Lusher','85554948',3),(194,'Oran Coetzee','26265318',3),(195,'Maynard Blackboro','22094148',1),(196,'Nixie Sisey','57995104',1),(197,'Carin Marini','62344271',2),(198,'Kathie Spurdens','25884549',1),(199,'Cortie Kinworthy','91865537',3),(200,'Gram Barcroft','33131903',2),(201,'Hallie Flawn','14575823',3),(202,'Kris Draysey','87534354',3),(203,'Bary Butterley','23847900',2),(204,'Paddie Cleyburn','11793288',1),(205,'Arvie Jacobowitz','44305022',3),(206,'Roderick Preshaw','98088323',1),(207,'Katerine Paulet','51377661',3),(208,'Charlene Goldsworthy','38091172',3),(209,'Christos Kerrod','87906576',1),(210,'Natasha Jenkin','11802875',3),(211,'Sileas Angove','93493152',3),(212,'Wallace Bridger','69636791',1),(213,'Tiena Baythorp','81546164',1),(214,'Kristin Truckett','06728018',2),(215,'Alberto Tuckwood','13720634',2),(216,'Garik Langan','83730108',2),(217,'Yanaton Torbard','10625482',2),(218,'Janela Emilien','88820232',3),(219,'Leeanne McCully','12285766',2),(220,'Staffard Perks','56054386',1),(221,'Cassandra Dockree','44641315',3),(222,'Gill Frayne','88456776',1),(223,'Tandi Seale','44471645',1),(224,'Roddie Chatelain','97363231',1),(225,'Sofia Oneill','56008458',1),(226,'Shoshana Blay','76004144',3),(227,'Beck Attawell','98762716',3),(228,'Marcile Alasdair','11727651',2),(229,'Perla Dundridge','63888193',3),(230,'Kip Viger','08545454',2),(231,'Junie Ropars','02992415',3),(232,'Orazio Swapp','74870297',3),(233,'Elfie Dainton','02226878',1),(234,'Wandis Edon','10652643',3),(235,'Michail Cord','93693304',2),(236,'Westbrooke Polendine','49551072',1),(237,'Christian Keller','65026536',3),(238,'Gregoire Killingback','18386314',3),(239,'Kassie Cavozzi','84420909',1),(240,'Shermie Foulks','42593441',1),(241,'Clint Brandon','35216562',2),(242,'Stephie Hindrick','19445823',1),(243,'Germayne Massy','44075362',2),(244,'Marnie Booton','44888172',2),(245,'Emyle Gilding','62927722',1),(246,'Aurlie Tschierasche','15812416',1),(247,'Maximo Rankling','11331227',2),(248,'Darice Trime','64089858',1),(249,'Jerad Dunton','58095384',2),(250,'Leo Gerrie','44056692',2),(251,'Neron Gier','27042507',1),(252,'Ashlen Jaycock','31976402',2),(253,'Graham Tewes','15349047',1),(254,'Otto Houtby','03347708',1),(255,'Jemmy Sansum','75628037',2),(256,'Hyman Olphert','63444458',2),(257,'Karin Barles','37765486',2),(258,'Delora Blythe','97928700',1),(259,'Sammy Hovie','53663909',3),(260,'Renelle Rawstorn','62437771',1),(261,'Virgie Fritchley','34591939',3),(262,'Pietra Chrippes','66313256',2),(263,'Marion Bronot','01593794',2),(264,'Rozanna Lugden','17635466',2),(265,'Reinaldos Jakubowski','20844171',3),(266,'Nicol Wickins','44995737',2),(267,'Kirsten Pyner','70449905',2),(268,'Suzi Gifkins','74327246',1),(269,'Isabeau Maasze','59100155',3),(270,'Skyler Swan','54631986',3),(271,'Raphaela Gooms','46841089',2),(272,'Annette Duchasteau','80123770',3),(273,'Townie McKiernan','56841670',1),(274,'Susette Meadley','80527106',1),(275,'Antoni Menier','46685492',2),(276,'Trstram Poolman','55832159',1),(277,'Jermayne Stoffler','53358829',1),(278,'Mufinella Falkus','16665614',3),(279,'Shelba MacDiarmid','89634685',3),(280,'Celinda Backe','36312745',3),(281,'Durant Durnford','81692498',2),(282,'Niccolo Bennen','33758772',2),(283,'Lotti Carwardine','24963254',3),(284,'Ravi Alvares','42588739',1),(285,'Marshal Brookshaw','71150695',2),(286,'Merrel Mundford','40541210',3),(287,'Flint Moule','03455540',3),(288,'Tucker Sheryne','68989640',1),(289,'Elias Marzelli','77255452',2),(290,'Duke Carlucci','51516015',3),(291,'Neille McKirton','90335009',1),(292,'Della Reily','83668676',1),(293,'Yulma Forsyde','83814132',3),(294,'Dedra McGiffin','78122833',2),(295,'Silvano Tift','53237152',1),(296,'Florence Rollin','08050887',1),(297,'Rachelle Jacombs','42779811',3),(298,'Ilyse Renols','13952040',1),(299,'Dorelle Wescott','13470808',2),(300,'Constantine Schruurs','43976455',1),(301,'Robers Proudlove','88992627',1),(302,'Colman Limb','86164565',1),(303,'Nathanael Morstatt','79787394',1),(304,'Vaughan McSporrin','03755652',1),(305,'Eadith Pickover','93641381',2),(306,'Nisse Quipp','25475467',2),(307,'Alexandr Gerasch','87353885',2),(308,'Vidovic Bricksey','63299207',2),(309,'Micki Domenget','01088532',3),(310,'Christyna Cansdale','30526638',3),(311,'Demeter Hackey','67879116',3),(312,'Susie Gregson','56589689',2),(313,'Ollie Peat','10516359',3),(314,'Amelie Angelini','82079178',2),(315,'Traci Trusty','62301439',1),(316,'Beau Bernier','52893246',1),(317,'Kathrine Dilston','26365438',3),(318,'Kirstyn Casel','21042401',3),(319,'Marlane Gye','30759644',2),(320,'Gusta Murfin','73376935',1),(321,'Stephi Vasey','00531832',3),(322,'Mandel Dobey','77349394',1),(323,'Helga Leivesley','08640576',3),(324,'Carson Jennions','36075637',1),(325,'Jehanna Giorgiutti','02952250',3),(326,'Kris Dupree','73074559',2),(327,'Louie Bolver','34637878',2),(328,'Mariele McMichell','78896954',3),(329,'Alyda Tomaino','81995714',1),(330,'Zebedee Fairs','64649972',2),(331,'Vanda MacCathay','18732768',2),(332,'Mel Pring','06820376',2),(333,'Melisenda Steere','53440443',1),(334,'Kittie Learoid','72863612',1),(335,'Bernadette Begent','62771006',3),(336,'Alla Methingam','11023267',2),(337,'Forrest Forgan','45149159',3),(338,'Nester Sylvester','51793911',2),(339,'Sydney Congrave','51226311',1),(340,'Stepha Jovis','17927311',1),(341,'Harbert MacNamara','46633687',3),(342,'Violette Corradengo','70188811',2),(343,'Tressa Bovaird','54213071',1),(344,'Carey Kilborn','93285389',3),(345,'Lynnett Skentelbury','32772707',2),(346,'Barbabra Burt','83714340',3),(347,'Loraine Garfield','00637178',2),(348,'Stirling Picott','79688787',2),(349,'Ingra Gehrtz','60224545',2),(350,'Ronny Fireman','78793693',3),(351,'Gates Cankett','01599660',2),(352,'Ashlie Hedin','28496816',2),(353,'Park Folliott','34881984',1),(354,'Sadie Simpkin','33843310',3),(355,'Daveta Halhead','76402875',3),(356,'Vic Scragg','43583688',1),(357,'Marlon Ilchuk','78086551',1),(358,'Lynnette Butland','46471668',3),(359,'Barbabra Humpatch','00560192',2),(360,'Miran Wadmore','90931856',3),(361,'Solly Burnsall','97776081',2),(362,'Gunner Ellerington','80055084',1),(363,'Karilynn Dillintone','91699985',1),(364,'Cullen Beningfield','97772097',2),(365,'Ruttger Wadforth','06705135',2),(366,'Elvina Shearstone','86921182',3),(367,'Dana Hurst','57166999',3),(368,'Wyn Treadaway','26498712',3),(369,'Celestine Cutler','41833345',1),(370,'Cleopatra Gilsthorpe','62268418',3),(371,'Jeffie Windram','90994671',1),(372,'Pierre Reynalds','58855995',3),(373,'Chantalle Matthieson','81515289',1),(374,'Stinky Loche','05106021',2),(375,'Nancy Mumbray','68938325',1),(376,'Lemmy Aberdalgy','23421997',1),(377,'Abbe Ackers','58345373',1),(378,'Stephie Androlli','13688034',1),(379,'May Curedale','62471749',2),(380,'Carmelita Leirmonth','29372153',3),(381,'Addie Champerlen','71598695',3),(382,'Kacey Beardon','15317675',3),(383,'Noach Axton','65870824',1),(384,'Cherey Glassborow','52201323',1),(385,'Christoper Peegrem','18362060',1),(386,'Kacie Poure','63381831',2),(387,'Claude Gutherson','67804215',3),(388,'Aeriell Boulder','37106850',2),(389,'Hanson Cassar','02282802',3),(390,'Jarvis Adcocks','55108612',3),(391,'Rosetta Dring','70933339',1),(392,'Flint Agass','18550357',3),(393,'Haroun Feye','49888621',3),(394,'Hallsy Anneslie','32362848',2),(395,'Romain Puffett','03568010',1),(396,'Sheppard de Verson','63360757',2),(397,'Jonathon Gosneye','91713001',2),(398,'Enrichetta Muschette','89018906',2),(399,'Corty Potkin','79231027',2),(400,'Sallee Riggeard','50099632',2),(401,'Pauly Borton','26812068',1),(402,'Antonius Laycock','70437615',1),(403,'Gweneth Cubbon','69865147',2),(404,'Genny Twizell','40686150',3),(405,'Kristin Baggot','51103595',3),(406,'Fredrika Pursehouse','22190625',3),(407,'Stavro Romayne','33684695',2),(408,'Cyndi Kielt','15577004',1),(409,'Cherise Biasotti','66512218',1),(410,'Marc Cassell','97748641',1),(411,'Margarete Jovasevic','10543299',1),(412,'Chad Byers','07168424',3),(413,'Anthe Dolby','77716138',3),(414,'Consuela Segrott','46597760',2),(415,'Agace Abley','70982753',1),(416,'Heloise Ritch','01594673',1),(417,'Alvis Joist','53554127',1),(418,'Lombard Ellson','37137227',3),(419,'Lu Newcomen','52240235',1),(420,'Kathrine Cranstoun','05795101',1),(421,'Jocko Fishlee','33636063',1),(422,'Walsh Braim','12752930',2),(423,'Sadie Kinchington','07485659',3),(424,'Sterne Bilney','36246191',2),(425,'Tory Dumbarton','56845429',1),(426,'Jerrilee Pengilly','54967651',1),(427,'Pincus Domelow','83987336',1),(428,'Gracia Lacoste','38757258',3),(429,'Aveline Hugin','64717966',3),(430,'Isak Folker','05627668',1),(431,'Morgan De Carlo','27571262',2),(432,'Florian Sabathier','92513703',3),(433,'Eugine Kittman','74557553',1),(434,'Standford Holywell','34176866',3),(435,'Chantalle Milkeham','81432584',1),(436,'Morganne Risebarer','56720405',3),(437,'Manfred Paver','18027387',3),(438,'Padgett Terrett','03522174',3),(439,'Ephrayim Delacourt','68231669',1),(440,'Neda Woolbrook','29389771',2),(441,'Morie O\'Dare','22510059',1),(442,'Lacey Gouly','79008525',2),(443,'Hobie Fidian','78560905',1),(444,'Nita Burnside','23059680',2),(445,'Kimberley Moakler','61032253',2),(446,'Conan Constable','43007211',3),(447,'Rickie Khomishin','58880679',1),(448,'Allyce Eyre','85201045',1),(449,'Carin Willcot','22337132',3),(450,'Ian Exall','24231968',2),(451,'Stavros Dell Casa','56041997',1),(452,'Paxton Le Bosse','07963788',2),(453,'Ofella Spitaro','15731794',3),(454,'Worden Wellan','87404245',3),(455,'Giraldo Jovic','70657252',1),(456,'Menard Rickards','84576075',2),(457,'Remus Poulney','92440629',3),(458,'Chandler Hintze','15841927',2),(459,'Emmy Sheaber','45050361',1),(460,'Darsey Bignell','26328944',3),(461,'Jimmie Demelt','98067941',2),(462,'Aile Kettlewell','93287181',1),(463,'Sloan McGriele','34887949',3),(464,'Lindon Duke','52105709',3),(465,'Rosina Elletson','53751651',2),(466,'Leicester Sieghart','29985612',1),(467,'Evangelin Starford','09872275',1),(468,'Steven Izkoveski','93474807',3),(469,'Lulita Garces','79178875',2),(470,'Trisha Thrasher','71249540',3),(471,'Merwin Guidone','49173642',1),(472,'Briant Elston','91198695',1),(473,'Brenden Creelman','76950210',3),(474,'Asher Jirick','95570851',1),(475,'Sax Calafate','20961010',1),(476,'Gayle Bonds','49718853',3),(477,'Julian MacCart','70231295',1),(478,'Cam Weight','49360865',3),(479,'Allys Stiles','36952313',2),(480,'Elke Stichall','96894129',1),(481,'Teodoor Jelly','94456820',1),(482,'Terza Skeete','80868697',2),(483,'Court Beddows','82884425',3),(484,'Emmalynn Buie','81189734',3),(485,'Katie Ekkel','96014935',2),(486,'Dylan Adkins','45408375',2),(487,'Frederico Labrone','73336238',3),(488,'Christal Aldrich','47648295',1),(489,'Nappy O\'Hegertie','49867723',3),(490,'Cody Lissemore','05226587',3),(491,'Marlena Pergens','57520112',1),(492,'Darcee Muzzi','13039438',3),(493,'Dallas Conkey','08214699',3),(494,'Sullivan Bretland','65404889',2),(495,'Eadith Hunnicutt','96325135',2),(496,'Win Von Oertzen','36890313',3),(497,'Winnie Shervil','27507710',2),(498,'Kerianne Parkman','18649191',1),(499,'Adriane Gass','60138278',3),(500,'Glynis Tilliard','52208214',1),(501,'Rudy Dollard','65166423',1),(502,'Elisabetta Acton','08989193',2),(503,'Beniamino Geldeard','68540374',1),(504,'Mechelle McKeighan','70087673',1),(505,'Carmon Houndesome','01402923',2),(506,'Carlen Winn','72579261',3),(507,'Francis Folds','94540574',3),(508,'Bruis Cradock','18201950',2),(509,'Payton Capinetti','05442034',3),(510,'Layton Colwell','65061070',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Kuhlman Group'),(2,'Kris Inc'),(3,'Conroy Inc'),(4,'Murazik Inc'),(5,'Schulist, Ratke and Mitchell'),(6,'Maggio-Bergstrom'),(7,'Bayer Group'),(8,'Purdy LLC'),(9,'Brakus, Lebsack and Fadel'),(10,'McLaughlin-McClure'),(11,'Ebert-McClure'),(12,'Braun, Howell and Kassulke'),(13,'Smith-Keeling'),(14,'Moore-Toy'),(15,'Huels, Schamberger and Cremin'),(16,'Lang-Rice'),(17,'Gusikowski, Blanda and Wilderman'),(18,'Koepp, Larkin and Jacobson'),(19,'Kilback LLC'),(20,'Kovacek Group'),(21,'Carroll Inc'),(22,'Ortiz Inc'),(23,'Stiedemann Inc'),(24,'Feeney and Sons'),(25,'Wuckert-Boyle'),(26,'Christiansen, Bradtke and Boehm'),(27,'Goldner and Sons'),(28,'Kovacek Group'),(29,'Langosh-Strosin'),(30,'Rolfson, Crona and Kiehn'),(31,'Shanahan-Kshlerin'),(32,'Heathcote-Osinski'),(33,'Beatty Inc'),(34,'Heathcote Group'),(35,'Champlin, Kiehn and Reinger'),(36,'Vandervort LLC'),(37,'Huel, Bayer and Bode'),(38,'Huel, Jacobson and Muller'),(39,'Hegmann, Bechtelar and Hamill'),(40,'Kling, Murray and Streich'),(41,'Rolfson-Wehner'),(42,'Runolfsdottir Inc'),(43,'Ruecker and Sons'),(44,'Yundt-Leuschke'),(45,'Jenkins-Morissette'),(46,'Lowe and Sons'),(47,'Lubowitz-Kutch'),(48,'Davis Group'),(49,'Reilly-Zieme'),(50,'Kling-Smith'),(51,'Wisoky and Sons'),(52,'Hickle-Rice'),(53,'Turner Group'),(54,'Witting, Renner and Hudson'),(55,'Rau, Stanton and Runolfsdottir'),(56,'Considine-Wehner'),(57,'Barrows and Sons'),(58,'Fadel-Goyette'),(59,'Kilback-O\'Connell'),(60,'Keebler-Feil'),(61,'O\'Hara, Wiza and Gleichner'),(62,'Lockman, Yost and Baumbach'),(63,'Deckow Group'),(64,'Douglas, Sauer and Bruen'),(65,'Moen, Wolf and Kautzer'),(66,'Rath, Parker and Kreiger'),(67,'Schoen and Sons'),(68,'Abernathy Group'),(69,'Ziemann, Wisozk and Pagac'),(70,'Torphy-Hand'),(71,'Pagac, Stamm and Koepp'),(72,'O\'Hara-Monahan'),(73,'Ziemann, Howe and Haley'),(74,'Hammes LLC'),(75,'Quigley, Cartwright and Stokes'),(76,'Franecki-Schuster'),(77,'Lueilwitz, Yundt and Tillman'),(78,'Hand-Hermann'),(79,'Bailey, Grimes and Cruickshank'),(80,'Armstrong-Connelly'),(81,'Pouros, Greenfelder and Monahan'),(82,'O\'Connell, Gislason and Volkman'),(83,'Quitzon Group'),(84,'VonRueden-Schmidt'),(85,'Dooley, Grimes and Gleason'),(86,'Walter-Steuber'),(87,'Kilback Group'),(88,'Mueller, Jakubowski and Anderson'),(89,'Bauch-Kuhlman'),(90,'Padberg LLC'),(91,'Steuber and Sons'),(92,'Strosin Inc'),(93,'Beatty-Hammes'),(94,'Roberts LLC'),(95,'Kovacek, Boyer and Price'),(96,'Schoen, Dicki and Steuber'),(97,'Bartell-O\'Kon'),(98,'Price, Torphy and Barrows'),(99,'Ernser, Dickens and Quigley'),(100,'Metz, Bernier and Ebert'),(101,'Stanton-Becker'),(102,'Willms Inc'),(103,'Kuhic-Pfannerstill'),(104,'Keeling, Beatty and Kihn'),(105,'Bruen, McDermott and Schamberger'),(106,'Mertz, Upton and Parker'),(107,'Kreiger, Barton and Hand'),(108,'Daniel-Murazik'),(109,'Jakubowski, Schinner and Wehner'),(110,'Ankunding LLC'),(111,'Shields-O\'Kon'),(112,'Olson, Russel and Marks'),(113,'Gorczany-Huels'),(114,'Parisian LLC'),(115,'Haag and Sons'),(116,'Labadie Inc'),(117,'Lemke and Sons'),(118,'Nienow-Mayer'),(119,'Bernier Group'),(120,'Donnelly, Treutel and Collier'),(121,'Hegmann, O\'Kon and Huel'),(122,'Trantow-Gleason'),(123,'Rau Group'),(124,'Corwin and Sons'),(125,'Ritchie LLC'),(126,'Hane LLC'),(127,'Reichert-Trantow'),(128,'Sporer Group'),(129,'Kerluke LLC'),(130,'Zulauf, Bins and Rutherford'),(131,'Haag-Rau'),(132,'Hilpert, Doyle and Kuhn'),(133,'Pagac, Murray and Maggio'),(134,'Hansen, Weber and Schuster'),(135,'Runolfsdottir-Dooley'),(136,'Feest Group'),(137,'Spinka-Durgan'),(138,'Ward and Sons'),(139,'Smith Inc'),(140,'Bahringer, Braun and McGlynn'),(141,'Kerluke, Boehm and Gerhold'),(142,'Friesen LLC'),(143,'Mertz, Parker and Hammes'),(144,'Mitchell-Walker'),(145,'Steuber-Kub'),(146,'Gaylord-Johnson'),(147,'O\'Keefe-Smitham'),(148,'Olson LLC'),(149,'Mitchell Inc'),(150,'Jacobi, Bosco and Fritsch'),(151,'Durgan Group'),(152,'Hamill, Balistreri and Sanford'),(153,'Flatley, Flatley and Schumm'),(154,'Bailey-Kemmer'),(155,'Cruickshank, Fahey and Ferry'),(156,'Leuschke Inc'),(157,'Bradtke, Tillman and Keeling'),(158,'Grimes, Ledner and Jacobs'),(159,'Haag Inc'),(160,'Luettgen-Mayert'),(161,'Borer, Gorczany and Skiles'),(162,'Feest-Abernathy'),(163,'Osinski LLC'),(164,'Batz-Baumbach'),(165,'Kiehn-Glover'),(166,'Dietrich, Murphy and Kohler'),(167,'Tremblay, Hickle and Parisian'),(168,'Schmeler, Littel and Smitham'),(169,'Volkman-Ankunding'),(170,'Ratke, Sauer and Bogan'),(171,'Osinski-Reilly'),(172,'Abshire-Hartmann'),(173,'Robel Inc'),(174,'Zieme, Toy and Hilll'),(175,'Gislason-Davis'),(176,'Rowe, Hirthe and Sauer'),(177,'Gutmann, Daniel and Koepp'),(178,'Prosacco, Bradtke and Powlowski'),(179,'Weimann-Hansen'),(180,'Halvorson, Trantow and McLaughlin'),(181,'Hartmann, McGlynn and Hamill'),(182,'Emard-Lehner'),(183,'Flatley Group'),(184,'Schaefer, Ondricka and O\'Reilly'),(185,'Erdman-Nolan'),(186,'Graham Inc'),(187,'Huel-Lebsack'),(188,'Effertz, Kuhic and White'),(189,'Kling and Sons'),(190,'Pfeffer and Sons'),(191,'Fritsch Inc'),(192,'Reinger-Wuckert'),(193,'Kuhic, Aufderhar and Muller'),(194,'Wuckert, Pfannerstill and Corwin'),(195,'Kling-Heidenreich'),(196,'Lynch and Sons'),(197,'Veum-Mann'),(198,'Boyle LLC'),(199,'Ullrich-Swaniawski'),(200,'King-Watsica'),(201,'Schmeler-Reynolds'),(202,'Carroll Group'),(203,'Heaney, Stark and Herman'),(204,'Connelly-Nolan'),(205,'Reynolds-Fritsch'),(206,'Runte, Leffler and Cassin'),(207,'Murphy, Marquardt and Bernhard'),(208,'Hansen-Sipes'),(209,'Osinski, Frami and Tillman'),(210,'McGlynn-Botsford'),(211,'Quigley, Erdman and Runolfsson'),(212,'Morar-Dickens'),(213,'Walter Group'),(214,'Stokes, Kulas and Tillman'),(215,'Braun Group'),(216,'Bednar, Toy and Marquardt'),(217,'Sanford Group'),(218,'Marvin, Kuhic and Jerde'),(219,'Wilkinson, Sauer and Medhurst'),(220,'Kuhic Inc'),(221,'Romaguera, Hintz and Kuvalis'),(222,'Sauer-Kirlin'),(223,'Hermann-Runolfsdottir'),(224,'Wilkinson, Lemke and Leannon'),(225,'Considine LLC'),(226,'Mills-Okuneva'),(227,'Johns, Connelly and Kub'),(228,'Waelchi, Mayert and Shanahan'),(229,'Ortiz-Williamson'),(230,'Conn-Brakus'),(231,'Gutmann, Nitzsche and Padberg'),(232,'Hauck-McKenzie'),(233,'Zemlak, Bayer and Lebsack'),(234,'Hessel, Hagenes and Bayer'),(235,'Beahan, Wehner and Considine'),(236,'Willms LLC'),(237,'Marks, Casper and Miller'),(238,'Kub-Ritchie'),(239,'Hoppe Group'),(240,'Boyer, Donnelly and Berge'),(241,'Dicki, Toy and Keeling'),(242,'Crooks-Kirlin'),(243,'Oberbrunner, Gaylord and Turner'),(244,'Powlowski, Johnston and Graham'),(245,'Ernser and Sons'),(246,'Bashirian Inc'),(247,'Simonis Inc'),(248,'Marvin, Torp and Fadel'),(249,'Yost, Fadel and Dietrich'),(250,'Sporer, Larkin and Robel'),(251,'Skiles Group'),(252,'Connelly-Schulist'),(253,'Roberts and Sons'),(254,'Wunsch Group'),(255,'Goldner Group'),(256,'Wolf-Mann'),(257,'Kemmer, Beahan and Kub'),(258,'Bode, Grant and Sporer'),(259,'Macejkovic-Lockman'),(260,'Jast Inc'),(261,'Koepp and Sons'),(262,'Metz-Predovic'),(263,'Dare Group'),(264,'Dietrich, Mertz and Konopelski'),(265,'Turcotte and Sons'),(266,'Towne, Brekke and Upton'),(267,'Kiehn, Turner and Hansen'),(268,'Farrell, Mitchell and Lueilwitz'),(269,'Mayer Inc'),(270,'Kshlerin LLC'),(271,'Jast, Weimann and Wyman'),(272,'Hahn, Baumbach and Kuhlman'),(273,'Conn, Maggio and Hane'),(274,'Schultz-Windler'),(275,'Upton-Johnson'),(276,'Reynolds-Pagac'),(277,'Hammes, Schneider and Dooley'),(278,'Dicki-Okuneva'),(279,'Rohan-Ritchie'),(280,'Kuhn-Glover'),(281,'Marvin-Gislason'),(282,'Ledner-Ward'),(283,'Hahn, Keeling and Macejkovic'),(284,'Nikolaus-Ullrich'),(285,'Towne Inc'),(286,'Jones, Huel and Gibson'),(287,'Morissette, Shields and Stroman'),(288,'Rogahn, Kilback and Jacobs'),(289,'Dare-Lindgren'),(290,'Ankunding, Flatley and Stroman'),(291,'Gorczany, Lowe and Jaskolski'),(292,'Monahan Inc'),(293,'Leffler, Upton and Bosco'),(294,'Morar-Koss'),(295,'Jacobi-Block'),(296,'Okuneva-Langosh'),(297,'Jones, Glover and Weimann'),(298,'Barton and Sons'),(299,'Medhurst-Reichel'),(300,'Schultz-Corwin'),(301,'Kub, Rath and Howe'),(302,'Rempel LLC'),(303,'Grant, Breitenberg and Ryan'),(304,'Dickinson Group'),(305,'Crooks, Nienow and Boyer'),(306,'Hyatt-Wunsch'),(307,'Boyle, Schaden and Little'),(308,'Hermiston-Parker'),(309,'Yost and Sons'),(310,'Considine and Sons'),(311,'Morissette-Hodkiewicz'),(312,'Wunsch, Mitchell and Terry'),(313,'Rowe Inc'),(314,'Roob, Block and Kozey'),(315,'Aufderhar and Sons'),(316,'Hilpert Group'),(317,'Spinka-Larson'),(318,'Kohler Inc'),(319,'Schiller Inc'),(320,'Langosh, Bechtelar and Hartmann'),(321,'Zieme-Koss'),(322,'Huels-Hansen'),(323,'Wunsch-Reichel'),(324,'Waters Group'),(325,'Boyer-Collins'),(326,'Boyle-Blick'),(327,'Bashirian, Witting and Dickens'),(328,'Sawayn-Zieme'),(329,'Sanford-Murazik'),(330,'Schimmel LLC'),(331,'Lubowitz LLC'),(332,'Padberg, McCullough and Grimes'),(333,'Witting-D\'Amore'),(334,'Douglas, Harvey and Hessel'),(335,'Koss-Wisozk'),(336,'Hessel-Frami'),(337,'Crist-Satterfield'),(338,'Wiza, Hessel and Gutkowski'),(339,'Dickinson LLC'),(340,'Parker, Schultz and Schuppe'),(341,'Johnson, Mante and Schumm'),(342,'Waelchi-Crona'),(343,'Williamson LLC'),(344,'Bailey, Mayer and Abshire'),(345,'McGlynn and Sons'),(346,'Yost Group'),(347,'Brakus, Bruen and Abernathy'),(348,'Ondricka-Schmeler'),(349,'Romaguera-Wilkinson'),(350,'Abernathy Group'),(351,'Fisher-Moore'),(352,'Conroy, Hamill and Boehm'),(353,'Ferry-Conn'),(354,'Rodriguez Group'),(355,'Boyer and Sons'),(356,'Nikolaus, McClure and Gislason'),(357,'Nader-Crooks'),(358,'Pouros Group'),(359,'Vandervort LLC'),(360,'Mosciski-Steuber'),(361,'Farrell-Nader'),(362,'Zulauf and Sons'),(363,'Davis LLC'),(364,'Miller-Gleason'),(365,'Kuhlman LLC'),(366,'Nitzsche LLC'),(367,'Fadel-Waters'),(368,'Carroll-Schuster'),(369,'Reichert Group'),(370,'Halvorson Inc'),(371,'Reichert and Sons'),(372,'Haag-Ortiz'),(373,'Abbott LLC'),(374,'Abshire LLC'),(375,'Rosenbaum-Schmidt'),(376,'Hagenes and Sons'),(377,'Kertzmann-Anderson'),(378,'Paucek LLC'),(379,'Hegmann and Sons'),(380,'Bayer-Waters'),(381,'Hahn, Kautzer and Bradtke'),(382,'Dach Inc'),(383,'Parisian-Keeling'),(384,'Murray LLC'),(385,'Kuhn, Leuschke and Weimann'),(386,'Leuschke, McClure and Sauer'),(387,'Kling Inc'),(388,'Bayer, Kilback and Reichel'),(389,'Emard-Dicki'),(390,'Leffler-Johnson'),(391,'Glover-Gibson'),(392,'Hilpert, Stiedemann and Heaney'),(393,'Brekke Inc'),(394,'Schuster, Dickinson and Dooley'),(395,'Rowe LLC'),(396,'Watsica Inc'),(397,'Walsh and Sons'),(398,'Runolfsson-Reichel'),(399,'Farrell and Sons'),(400,'Shields, Ortiz and Ebert'),(401,'Rau, Schuster and Kuphal'),(402,'Schaden Inc'),(403,'Heathcote-Tillman'),(404,'Ortiz-Wiegand'),(405,'Murazik-Kub'),(406,'Von, Bartoletti and Flatley'),(407,'O\'Reilly-Mayert'),(408,'Lockman Group'),(409,'Mann, Berge and O\'Connell'),(410,'Kirlin Inc'),(411,'Emard-Schaefer'),(412,'Christiansen-Rolfson'),(413,'Funk, Stiedemann and Kemmer'),(414,'Hilll Inc'),(415,'Olson, Brakus and Anderson'),(416,'Shanahan Group'),(417,'Sanford-Roberts'),(418,'Feeney, Osinski and Beier'),(419,'Reichert-Dare'),(420,'Douglas-Murphy'),(421,'Ritchie-Gutkowski'),(422,'Dicki Inc'),(423,'Brown-Ondricka'),(424,'Feest LLC'),(425,'Bartoletti-Greenholt'),(426,'Mills-Hauck'),(427,'Veum, Bogan and Casper'),(428,'Ondricka and Sons'),(429,'Vandervort Group'),(430,'Flatley Group'),(431,'Grady, Beer and Morar'),(432,'Mraz-Kub'),(433,'Bayer, Muller and Shields'),(434,'Erdman LLC'),(435,'Batz LLC'),(436,'Hegmann, Jacobson and Kling'),(437,'Lynch Inc'),(438,'Bechtelar, Heaney and Pfannerstill'),(439,'King, Schinner and Schmeler'),(440,'Cremin-Kassulke'),(441,'Emmerich, Brown and Ortiz'),(442,'Breitenberg Group'),(443,'Mayert-Collier'),(444,'Pacocha and Sons'),(445,'Mayer, Smitham and Parker'),(446,'Ferry-Rippin'),(447,'Windler and Sons'),(448,'Legros, Monahan and Kuphal'),(449,'Quigley-Dickinson'),(450,'Klein, Wolf and Simonis'),(451,'Hayes, Thompson and Gusikowski'),(452,'Davis-Goldner'),(453,'Armstrong-Kirlin'),(454,'Mann and Sons'),(455,'Schulist-Predovic'),(456,'Osinski-Mohr'),(457,'Goodwin, McKenzie and Walsh'),(458,'Kassulke-Christiansen'),(459,'Mertz, Dickens and Bogisich'),(460,'Medhurst Group'),(461,'Wolf-Bashirian'),(462,'Bernhard, Wehner and Bosco'),(463,'Runolfsdottir-Schiller'),(464,'Grant-Kemmer'),(465,'Bartell Inc'),(466,'Feest-Pfeffer'),(467,'Schultz-Price'),(468,'Konopelski, Goyette and Halvorson'),(469,'Thompson Group'),(470,'Bernier Inc'),(471,'Rogahn, Wyman and Lynch'),(472,'Purdy, Gibson and Tillman'),(473,'Schuster, Flatley and Rowe'),(474,'Funk and Sons'),(475,'Bernier LLC'),(476,'Kihn LLC'),(477,'Towne, Harvey and Kuhn'),(478,'Williamson-Von'),(479,'Nikolaus-West'),(480,'Kuphal Inc'),(481,'O\'Keefe and Sons'),(482,'Strosin and Sons'),(483,'Haag-Greenholt'),(484,'Considine Group'),(485,'Purdy, Zboncak and Willms'),(486,'Kiehn, Schiller and Kuhlman'),(487,'Anderson LLC'),(488,'Mante, Torp and Bartoletti'),(489,'Abbott-Fadel'),(490,'Hessel, Hauck and Stehr'),(491,'Conn-Abshire'),(492,'Stracke-Emard'),(493,'Wisoky, Steuber and Haley'),(494,'Frami LLC'),(495,'MacGyver LLC'),(496,'Toy, Moore and Miller'),(497,'Mraz-Rippin'),(498,'Harvey-Rosenbaum'),(499,'Wilderman-Kuhlman'),(500,'Pagac and Sons'),(501,'Kovacek, Kshlerin and Braun'),(502,'Mayer LLC'),(503,'Kohler, Dickens and Howe'),(504,'Hirthe Inc'),(505,'Rowe LLC'),(506,'Krajcik-Christiansen'),(507,'Paucek-Kulas'),(508,'Fay-Tillman'),(509,'Weimann-Reynolds'),(510,'Nolan LLC'),(511,'Conroy Inc'),(512,'Cartwright and Sons'),(513,'Predovic LLC'),(514,'Russel, Pfeffer and Moen'),(515,'Fisher-Larson'),(516,'Fay-Gutmann'),(517,'Johns, Treutel and Haag'),(518,'Schoen, Powlowski and Sporer'),(519,'Prohaska, Lehner and Labadie'),(520,'Schneider, Hyatt and Ferry'),(521,'Gottlieb and Sons'),(522,'Carter-Wisoky'),(523,'Krajcik-Schinner'),(524,'Ryan Inc'),(525,'Legros-Bauch'),(526,'Beatty and Sons'),(527,'Labadie LLC'),(528,'Fahey and Sons'),(529,'Schneider-Grimes'),(530,'Olson and Sons'),(531,'Graham, Spinka and Gorczany'),(532,'Blick and Sons'),(533,'Nolan-Nienow'),(534,'Hickle, Blanda and Reynolds'),(535,'Macejkovic-Weimann'),(536,'Collins Group'),(537,'Morar and Sons'),(538,'Hauck-Rohan'),(539,'Altenwerth, Douglas and Stroman'),(540,'Denesik, Kuhic and MacGyver'),(541,'King-Terry'),(542,'Luettgen, Treutel and Balistreri'),(543,'Koch and Sons'),(544,'Feest, Rowe and Witting'),(545,'Watsica, Kozey and Mills'),(546,'Gibson-Okuneva'),(547,'Lubowitz-Rosenbaum'),(548,'Kassulke-Emard'),(549,'Hackett, Friesen and Lockman'),(550,'Medhurst LLC'),(551,'Wolf-Rohan'),(552,'Zieme, Bartell and Miller'),(553,'Tillman, Kulas and Predovic'),(554,'Fadel Inc'),(555,'Towne, Wunsch and Spencer'),(556,'Dare-Marquardt'),(557,'Gislason, Pagac and Schuppe'),(558,'Witting-Effertz'),(559,'Rowe-Botsford'),(560,'Braun, Borer and Carter'),(561,'Weimann-Roob'),(562,'Abernathy, Farrell and Kozey'),(563,'Hagenes Group'),(564,'Farrell Group'),(565,'Metz-Kovacek'),(566,'Mitchell Inc'),(567,'Cassin-Shanahan'),(568,'Effertz, O\'Reilly and King'),(569,'Beer, O\'Reilly and Pouros'),(570,'Prohaska Group'),(571,'Kirlin Group'),(572,'Aufderhar Group'),(573,'Kuvalis, Adams and Block'),(574,'Pfannerstill-Schiller'),(575,'Jenkins and Sons'),(576,'Grady-Hauck'),(577,'Crist, Moen and Mayer'),(578,'Waters-Durgan'),(579,'Kuvalis, Nicolas and McDermott'),(580,'Quigley-Schiller'),(581,'Baumbach, Runolfsdottir and Cassin'),(582,'Veum, Nicolas and Hagenes'),(583,'Abbott-Mosciski'),(584,'Morar, Dickens and Fay'),(585,'Emard Group'),(586,'Bergstrom-Lubowitz'),(587,'O\'Kon and Sons'),(588,'Schowalter-Padberg'),(589,'Yundt and Sons'),(590,'Stanton-Spencer'),(591,'Harris Inc'),(592,'Fisher, Effertz and Durgan'),(593,'Champlin-Murray'),(594,'Brekke Inc'),(595,'Gusikowski LLC'),(596,'Smitham LLC'),(597,'Robel-Boyle'),(598,'Stroman, Hudson and Watsica'),(599,'Spencer, Denesik and Jacobson'),(600,'Russel Group'),(601,'Schoen-Morar'),(602,'West Inc'),(603,'Wunsch LLC'),(604,'Wiza and Sons'),(605,'Doyle, McGlynn and Dach'),(606,'Gerlach-Mayer'),(607,'Marquardt-Fritsch'),(608,'Gleason-Ruecker'),(609,'Okuneva-Metz'),(610,'Bergnaum and Sons'),(611,'Wolff Group'),(612,'Heathcote-Schimmel'),(613,'Shields and Sons'),(614,'Schuster-Hermann'),(615,'Littel and Sons'),(616,'Stanton LLC'),(617,'Gottlieb-Fadel'),(618,'Rodriguez Inc'),(619,'Hoppe Group'),(620,'Renner, Langworth and Rath'),(621,'Murray-Wuckert'),(622,'Becker, Klocko and Bartell'),(623,'Sanford, Beer and Osinski'),(624,'Dickens and Sons'),(625,'Carroll, Kuhlman and Sipes'),(626,'McDermott, Effertz and Goldner'),(627,'Harris, Aufderhar and Murazik'),(628,'Russel-Murphy'),(629,'Paucek-Kessler'),(630,'Auer-Daniel'),(631,'Reilly-Predovic'),(632,'Corkery-Schinner'),(633,'Bernhard, Hyatt and Gaylord'),(634,'Runolfsson-Krajcik'),(635,'Boehm, Koss and Howe'),(636,'Langworth, Macejkovic and Predovic'),(637,'O\'Conner, Kub and Kassulke'),(638,'Bayer-Price'),(639,'Bauch, Konopelski and Swaniawski'),(640,'Feil Inc'),(641,'Stark-Prosacco'),(642,'Carroll-Parisian'),(643,'Huels-Doyle'),(644,'Orn-Sawayn'),(645,'Donnelly-Fisher'),(646,'Weber-Corwin'),(647,'Mueller-Kerluke'),(648,'Schroeder-Kozey'),(649,'Wiza-Schiller'),(650,'Halvorson, Schinner and Mante'),(651,'Stark-Terry'),(652,'Casper LLC'),(653,'Ernser-Connelly'),(654,'Kemmer, Schinner and Pagac'),(655,'Hyatt LLC'),(656,'Mayer-Ferry'),(657,'Hahn Group'),(658,'Tremblay-Zieme'),(659,'Keeling, Auer and Schuster'),(660,'Grady-Fisher'),(661,'Wolf Group'),(662,'Reichel-Maggio'),(663,'Reichert, Bahringer and Halvorson'),(664,'Block Group'),(665,'Okuneva Inc'),(666,'Dibbert and Sons'),(667,'Borer-Bogisich'),(668,'Murazik, McLaughlin and Gibson'),(669,'Erdman LLC'),(670,'Boyle LLC'),(671,'Mitchell Inc'),(672,'Gottlieb-Strosin'),(673,'Doyle-Will'),(674,'Toy and Sons'),(675,'Bergnaum-Bahringer'),(676,'Raynor, Nicolas and Corwin'),(677,'Wolf LLC'),(678,'Hermiston, Rutherford and Kreiger'),(679,'Corwin-Bartoletti'),(680,'Price-Wilkinson'),(681,'Shanahan, Streich and Weissnat'),(682,'Halvorson and Sons'),(683,'Ruecker-Buckridge'),(684,'Schuppe and Sons'),(685,'Schuster Group'),(686,'Murray-D\'Amore'),(687,'Parker-Boehm'),(688,'Franecki-Roberts'),(689,'Leffler Inc'),(690,'Donnelly-Gorczany'),(691,'Hammes, Corwin and Stokes'),(692,'Kozey-Jones'),(693,'Emmerich-Zemlak'),(694,'Weissnat, Kertzmann and Spinka'),(695,'MacGyver-Morar'),(696,'Moen Group'),(697,'Cremin Inc'),(698,'Robel Inc'),(699,'Zboncak-Lockman'),(700,'Gottlieb Inc'),(701,'Von and Sons'),(702,'Corwin-Weissnat'),(703,'Gaylord Inc'),(704,'Roob-Simonis'),(705,'Bayer-Crona'),(706,'Gulgowski-Hoeger'),(707,'Murazik, Nitzsche and Shields'),(708,'Balistreri-Glover'),(709,'Bins-Lowe'),(710,'Schowalter-Wyman'),(711,'Tremblay LLC'),(712,'Stroman LLC'),(713,'Herman-Kunde'),(714,'Gaylord-Wuckert'),(715,'Will and Sons'),(716,'Beahan-Homenick'),(717,'O\'Reilly-Kuvalis'),(718,'Brown, Lueilwitz and Hintz'),(719,'Nikolaus-Stanton'),(720,'Gutmann, Medhurst and Beier'),(721,'Bartell, Walter and Jaskolski'),(722,'Maggio, McLaughlin and Hartmann'),(723,'Hermiston-Spencer'),(724,'Hegmann-Dibbert'),(725,'Reichert, Schmitt and Champlin'),(726,'Predovic-Heidenreich'),(727,'Gorczany-Schmitt'),(728,'Heathcote-Stehr'),(729,'McGlynn, Gutkowski and Huels'),(730,'O\'Connell-Miller'),(731,'Effertz, Stoltenberg and Zieme'),(732,'Okuneva-Reinger'),(733,'Gibson-Klocko'),(734,'Gleason-Rohan'),(735,'Zboncak, Satterfield and Von'),(736,'Powlowski-Wilkinson'),(737,'Brown-Gorczany'),(738,'Gutmann, Schneider and Labadie'),(739,'Cummings-Jenkins'),(740,'Funk, Rath and Jacobi'),(741,'Gleichner LLC'),(742,'Bogisich and Sons'),(743,'Schulist Inc'),(744,'West-Schulist'),(745,'Gerlach, Ziemann and Lubowitz'),(746,'Crooks-Weimann'),(747,'Koelpin Group'),(748,'Corwin Inc'),(749,'Pacocha-Russel'),(750,'Ward Group'),(751,'Pfeffer-Dooley'),(752,'Farrell, Fritsch and Lehner'),(753,'Stehr-Fahey'),(754,'Homenick, Bayer and Huels'),(755,'Flatley-Stamm'),(756,'Smith, Abernathy and Ward'),(757,'Robel, King and Runolfsdottir'),(758,'Maggio-Predovic'),(759,'Nitzsche LLC'),(760,'Ankunding and Sons'),(761,'Hackett, Jacobson and Paucek'),(762,'Brown, Brown and Dare'),(763,'Prohaska and Sons'),(764,'Hyatt, Effertz and Smitham'),(765,'Romaguera Inc'),(766,'Koelpin, Huels and Beahan'),(767,'Boyle-Reichert'),(768,'Feil, Ruecker and Wolf'),(769,'Ledner-Durgan'),(770,'Stehr-Hane'),(771,'Howell, Kautzer and Mitchell'),(772,'Dare Inc'),(773,'Rohan and Sons'),(774,'Wiegand Group'),(775,'Hoeger-Mayer'),(776,'Murazik, Johnson and Green'),(777,'Prosacco and Sons'),(778,'Osinski-Heaney'),(779,'Fay, Altenwerth and Koepp'),(780,'Schroeder-Conn'),(781,'Shields Inc'),(782,'Herman Inc'),(783,'Lueilwitz-Carroll'),(784,'Collier Group'),(785,'Emard-Little'),(786,'Carter LLC'),(787,'Fisher, Corwin and Jaskolski'),(788,'Jerde Group'),(789,'Douglas-Koepp'),(790,'Altenwerth, Schimmel and Bergnaum'),(791,'Larkin LLC'),(792,'Cole-Bayer'),(793,'Rempel, Gorczany and Graham'),(794,'Murazik, Stroman and Heaney'),(795,'Bode, Keebler and Dare'),(796,'Bradtke-Weber'),(797,'Schaden-Hegmann'),(798,'Schmeler, Douglas and Casper'),(799,'Crist Inc'),(800,'Nicolas, Schoen and Smith'),(801,'Schiller-Ankunding'),(802,'Kuvalis-Pollich'),(803,'Stroman-Howe'),(804,'Kohler Group'),(805,'Breitenberg LLC'),(806,'DuBuque-Thompson'),(807,'Jones Inc'),(808,'O\'Connell and Sons'),(809,'Stanton Group'),(810,'Welch and Sons'),(811,'Flatley-Veum'),(812,'Dickens LLC'),(813,'Langworth Group'),(814,'Ankunding-Marvin'),(815,'Sporer LLC'),(816,'Wolf Inc'),(817,'Wilderman Group'),(818,'Hoeger-Langosh'),(819,'Gutkowski, Langworth and Huel'),(820,'Parisian, Parisian and Casper'),(821,'Greenfelder, Simonis and Schinner'),(822,'DuBuque LLC'),(823,'Pacocha Inc'),(824,'Hickle, Ratke and Klocko'),(825,'Willms and Sons'),(826,'Swaniawski and Sons'),(827,'Russel-Kunde'),(828,'Torphy-Johns'),(829,'Prohaska, Balistreri and Kassulke'),(830,'Wuckert Group'),(831,'Cronin-Hammes'),(832,'Pfannerstill Group'),(833,'McCullough-Armstrong'),(834,'Bartoletti Inc'),(835,'Bergstrom Inc'),(836,'Hilll, Stracke and Becker'),(837,'Emard and Sons'),(838,'Roob LLC'),(839,'Mayert and Sons'),(840,'Dach and Sons'),(841,'Feil-Torphy'),(842,'Dietrich Group'),(843,'Hettinger LLC'),(844,'Kshlerin Group'),(845,'Lakin Group'),(846,'Christiansen, Douglas and Ratke'),(847,'Mohr Group'),(848,'Harber Group'),(849,'Schmidt, Heidenreich and Runolfsson'),(850,'Schmitt-Towne'),(851,'Flatley, Kertzmann and Block'),(852,'Fahey, Larkin and Roob'),(853,'Cassin, Robel and Kuvalis'),(854,'Mayer, Ledner and Moore'),(855,'Treutel, Parker and Hettinger'),(856,'Bechtelar, Schaden and Wunsch'),(857,'Howell Inc'),(858,'Ritchie Group'),(859,'Stracke and Sons'),(860,'Halvorson LLC'),(861,'Schaden and Sons'),(862,'Smitham, Schmeler and Koelpin'),(863,'Hamill-Ziemann'),(864,'Mraz Inc'),(865,'Moen-Kessler'),(866,'Thiel-Klocko'),(867,'Dibbert, Johns and Bahringer'),(868,'Hauck Group'),(869,'Gibson-Terry'),(870,'Becker-Keebler'),(871,'McClure Group'),(872,'Tremblay, Veum and Pfannerstill'),(873,'Pouros LLC'),(874,'Bartell Inc'),(875,'Jaskolski, Stoltenberg and Okuneva'),(876,'Ullrich and Sons'),(877,'Erdman Group'),(878,'Tremblay-Carroll'),(879,'Grimes-Ferry'),(880,'Nitzsche, O\'Keefe and Ferry'),(881,'Koss-Kuvalis'),(882,'Goodwin-Trantow'),(883,'Rodriguez and Sons'),(884,'Larkin, Dare and Schiller'),(885,'Gulgowski Inc'),(886,'Gorczany Group'),(887,'Robel, Grimes and Ratke'),(888,'Reichel Inc'),(889,'Stracke, Cole and Hahn'),(890,'Treutel-Purdy'),(891,'Hilll LLC'),(892,'Dietrich-Klocko'),(893,'Smith, Johnson and Kozey'),(894,'Hessel-Friesen'),(895,'Hills-Effertz'),(896,'Dickens, Schmitt and Rutherford'),(897,'Monahan, Will and Fisher'),(898,'Yundt-Daugherty'),(899,'Graham, Dare and O\'Connell'),(900,'Hamill Group'),(901,'Morar and Sons'),(902,'Towne, Mitchell and Yundt'),(903,'Schumm, Shields and Schuppe'),(904,'Stracke, Dibbert and Bogan'),(905,'Hahn-Wilderman'),(906,'Morar, Maggio and Baumbach'),(907,'Mitchell-Weimann'),(908,'Koch-Kulas'),(909,'Bosco-Wilkinson'),(910,'Dibbert, Braun and Nader'),(911,'Rodriguez, Stroman and Huels'),(912,'Mann, Ullrich and McLaughlin'),(913,'Hansen, Will and Huel'),(914,'Paucek, Kassulke and Moen'),(915,'Quigley-Hilpert'),(916,'Herman LLC'),(917,'Schoen, Miller and Christiansen'),(918,'Spinka LLC'),(919,'Stamm-Rath'),(920,'Little, McDermott and Beahan'),(921,'Lakin LLC'),(922,'Schowalter and Sons'),(923,'Gutmann, Conroy and Lockman'),(924,'Roob LLC'),(925,'Daniel-Crooks'),(926,'Mayer, Mante and Rohan'),(927,'Towne and Sons'),(928,'Kuhlman-Buckridge'),(929,'Abernathy, Waters and Will'),(930,'Parker-Grant'),(931,'Klocko, Connelly and Stamm'),(932,'Breitenberg-Koss'),(933,'Kohler, Satterfield and Murphy'),(934,'Schumm, Robel and Treutel'),(935,'Luettgen-Koepp'),(936,'Waters LLC'),(937,'Weissnat, Schinner and O\'Hara'),(938,'Mayert, Boehm and McKenzie'),(939,'Hagenes, Olson and Crooks'),(940,'Ondricka-Bergstrom'),(941,'Fay, Barrows and Jast'),(942,'Yost-Hauck'),(943,'Hoppe Inc'),(944,'Pouros-Haag'),(945,'Renner-Kuhn'),(946,'Feest-Nienow'),(947,'Herzog and Sons'),(948,'Rutherford Group'),(949,'O\'Kon-Hermiston'),(950,'Pfeffer, Price and Turcotte'),(951,'Kuhlman-Luettgen'),(952,'Tromp-Hickle'),(953,'Daugherty-Mertz'),(954,'Stoltenberg, Bartell and Hilpert'),(955,'McCullough-Hane'),(956,'Pollich, Abbott and Terry'),(957,'Yundt-Wiza'),(958,'Harris, Gaylord and Bruen'),(959,'Olson and Sons'),(960,'Bins LLC'),(961,'West and Sons'),(962,'Lesch, Hagenes and Schiller'),(963,'Boyer Inc'),(964,'Jakubowski-Miller'),(965,'Fahey, Wyman and Streich'),(966,'Reinger, Von and Erdman'),(967,'O\'Kon, Robel and Dibbert'),(968,'Weissnat, Lockman and Kris'),(969,'McCullough and Sons'),(970,'Fadel LLC'),(971,'Funk-Gibson'),(972,'Jerde-Bode'),(973,'Wintheiser-Schinner'),(974,'Kreiger-Abbott'),(975,'Shanahan-Hettinger'),(976,'Bosco-Sawayn'),(977,'Harris, Kunde and Armstrong'),(978,'Hand Group'),(979,'Dibbert, Konopelski and Hilll'),(980,'Stiedemann-Simonis'),(981,'Treutel Inc'),(982,'O\'Reilly LLC'),(983,'Kautzer-Kreiger'),(984,'Klocko Group'),(985,'Crona-Nicolas'),(986,'Ritchie and Sons'),(987,'Willms, Gulgowski and Gleichner'),(988,'Hayes Inc'),(989,'Heathcote-Sawayn'),(990,'Durgan, Walker and Murazik'),(991,'Schuppe and Sons'),(992,'Kihn and Sons'),(993,'Littel, Kreiger and Osinski'),(994,'Dach-Conroy'),(995,'Rempel-Stokes'),(996,'Schmitt-Shanahan'),(997,'Reichel Group'),(998,'Lang Inc'),(999,'Koss, Wolff and Collins'),(1000,'Bergnaum and Sons');
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
-- Table structure for table `solicitud_orden_detalle`
--

DROP TABLE IF EXISTS `solicitud_orden_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_orden_detalle` (
  `id_solicitud_orden_detalle` int NOT NULL AUTO_INCREMENT,
  `id_solicitud_detalle` int DEFAULT NULL,
  `id_orden_compra_detalle` int DEFAULT NULL,
  PRIMARY KEY (`id_solicitud_orden_detalle`) USING BTREE,
  KEY `fk_sod_solicitud_detalle` (`id_solicitud_detalle`),
  KEY `fk_sod_orden_comprar_detalle` (`id_orden_compra_detalle`),
  CONSTRAINT `fk_sod_orden_comprar_detalle` FOREIGN KEY (`id_orden_compra_detalle`) REFERENCES `orden_compra_detalle` (`id_orden_compra_detalle`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sod_solicitud_detalle` FOREIGN KEY (`id_solicitud_detalle`) REFERENCES `solicitud_detalle` (`id_solicitud_detalle`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_orden_detalle`
--

/*!40000 ALTER TABLE `solicitud_orden_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_orden_detalle` ENABLE KEYS */;

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

-- Dump completed on 2022-04-26  8:13:50
