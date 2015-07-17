-- MySQL dump 10.13  Distrib 5.6.22, for Win64 (x86_64)
--
-- Host: localhost    Database: paispueblos
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `estadosalfa`
--

DROP TABLE IF EXISTS `estadosalfa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadosalfa` (
  `estadoID` int(11) NOT NULL,
  `nombreEstado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`estadoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosalfa`
--

LOCK TABLES `estadosalfa` WRITE;
/*!40000 ALTER TABLE `estadosalfa` DISABLE KEYS */;
INSERT INTO `estadosalfa` VALUES (1,'Aguascalientes'),(2,'Baja California'),(3,'Baja California Sur'),(4,'Campeche'),(5,'Chiapas'),(6,'Chihuahua'),(7,'Coahuila'),(8,'Colima'),(9,'Durango'),(10,'Guanajuato'),(11,'Guerrero'),(12,'Hidalgo'),(13,'Jalisco'),(14,'Mexico'),(15,'Michoacan'),(16,'Morelos'),(17,'Nayarit'),(18,'Nuevo Leon'),(19,'Oaxaca'),(20,'Puebla'),(21,'Queretaro'),(22,'Quintana Roo'),(23,'San Luis Potosi'),(24,'Sinaloa'),(25,'Sonora'),(26,'Tabasco'),(27,'Tamaulipas'),(28,'Tlaxcala'),(29,'Veracruz'),(30,'Yucatan'),(31,'Zacatecas');
/*!40000 ALTER TABLE `estadosalfa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pueblos`
--

DROP TABLE IF EXISTS `pueblos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pueblos` (
  `idpueblo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  PRIMARY KEY (`idpueblo`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pueblos`
--

LOCK TABLES `pueblos` WRITE;
/*!40000 ALTER TABLE `pueblos` DISABLE KEYS */;
INSERT INTO `pueblos` VALUES (1,'Real de Asientos','Aguascalientes',22.2384759,-102.0890121459961),(2,'Todos Santos','Baja California Sur',23.4463619,-110.22650909423828),(3,'Palizada','Campeche',18.2545777,-92.09147644042969),(4,'Parras de la Fuente','Coahuila',25.4492883,-102.1747055053711),(5,'Comala','Colima',19.3190634,-103.7549819946289),(6,'San Cristobal de las Casas','Chiapas',16.7370359,-92.63761901855469),(7,'Creel','Chihuahua',27.7504473,-107.63688659667969),(8,'Dolores Hidalgo','Guanajuato',21.151597,-100.93672180175781),(9,'Taxco','Guerrero',18.5565468,-99.60511779785156),(10,'Real del Monte','Hidalgo',20.1381378,-98.67347717285156),(11,'Huasca de Ocampo','Hidalgo',20.2040067,-98.57413482666016),(12,'Mazamitla','Jalisco',19.9165757,-103.02129364013672),(13,'Tapalpa','Jalisco',19.9476711,-103.76078033447266),(14,'Tequila','Jalisco',20.8819452,-103.8324966430664),(15,'Malinalco','Mexico',18.9483917,-99.49357604980469),(16,'Tepotzotlan','Mexico',19.7185096,-99.2065200805664),(17,'Valle de Bravo','Mexico',19.1950964,-100.13267517089844),(18,'Cuitzeo','Michoacan',19.9685057,-101.1406021118164),(19,'Patzcuaro','Michoacan',19.5134498,-101.6091537475586),(20,'Sta. Clara del Cobre','Michoacan',19.4064279,-101.63969421386719),(21,'Tlalpujahua','Michoacan',19.80913,-100.17240142822266),(22,'Tepoztlan','Morelos',18.9848015,-99.09305572509766),(23,'Santiago','Nuevo Leon',25.4166153,-100.15911865234375),(24,'Capulalpam de Mendez','Oaxaca',17.0701937,-96.75706481933594),(25,'Cuetzalan del Progreso','Puebla',20.033333,-97.51667022705078),(26,'Zacatlan','Puebla',19.9441384,-97.9538345336914),(27,'Bernal','Queretaro',20.7326109,-99.9472427368164),(28,'Jalpan de Serra','Queretaro',21.2190312,-99.471435546875),(29,'Bacalar','Quintana Roo',18.6782919,-88.39239501953125),(30,'Real de Catorce','San Luis Potosi',23.6893967,-100.88554382324219),(31,'Cosala','Sinaloa',24.4136366,-106.69153594970703),(32,'El Fuerte','Sinaloa',26.417632,-108.61459350585938),(33,'Alamos','Sonora',27.0254869,-108.9413070678711),(34,'Tapijulapa','Tabasco',17.4645689,-92.7730712890625),(35,'Mier','Tamaulipas',26.4331614,-99.15338897705078),(36,'Huamantla','Tlaxcala',19.3192196,-97.92115783691406),(37,'Coatepec','Veracruz',19.4531616,-96.95848846435547),(38,'Izamal','Yucatan',20.9299997,-89.02271270751953),(39,'Jerez de Garcia Salinas','Zacatecas',22.6468746,-102.98762512207031),(40,'Teul de Gonzalez Ortega','Zacatecas',21.4658511,-103.45984649658203),(41,'Mineral del Chico','Hidalgo',20.2156264,-98.73014068603516),(42,'Tlayacapan','Morelos',18.960767,-98.98250579833984),(43,'Cadereyta de Montes','Queretaro',20.6904037,-99.82086181640625),(44,'Tula','Tamaulipas',23.0000612,-99.71451568603516),(45,'El Oro','Estado de Mexico',19.802839,-100.13819885253906),(46,'Xico','Veracruz',19.4247826,-97.004150390625),(47,'San Sebastian del Oeste','Jalisco',20.7613306,-104.8528060913086),(48,'Xilitla','San Luis Potosi',21.3841719,-98.99217224121094),(49,'Mineral de Pozos','Guanajuato',21.2137374,-100.49240112304688),(50,'Sombrerete','Zacatecas',23.633333,-103.63333129882812),(51,'Mineral de Angangueo','Michoacan',19.6196444,-100.28353118896484),(52,'Cuatro Cienegas','Coahuila',26.9865592,-102.06369018554688),(53,'Magdalena de Kino','Sonora',30.6272249,-110.96416473388672),(54,'Pahuatlan','Puebla',20.2759351,-98.15005493164062),(55,'Loreto','Baja California Sur',26.0117564,-111.3477554321289),(56,'Valladolid','Yucatan',20.68964,-88.2022476196289),(57,'Metepec','Estado de Mexico',19.2623785,-99.59516906738281),(58,'Comitan','Chiapas',16.2436147,-92.12354278564453),(59,'Chiapa de Corzo','Chiapas',16.7021616,-93.00814056396484),(60,'Huichapan','Hidalgo',20.3786677,-99.65084075927734),(61,'Tequisquiapan','Queretaro',20.520556,-99.89583587646484),(62,'Batopilas','Chihuahua',27.026667,-107.73944091796875),(63,'Chignahuapan','Puebla',19.8373863,-98.02742767333984),(64,'Cholula','Puebla',19.0764375,-98.30182647705078),(65,'Pino','Zacatecas',22.75208187,-102.61260223388672),(66,'Lagos de Moreno','Jalisco',21.3614715,-101.93022918701172),(67,'Tacambaro','Michoacan',19.225809,-101.4573974609375),(68,'Calvillo','Aguascalientes',21.8468345,-102.71864318847656),(69,'Nochistlan','Zacatecas',21.5588603,-102.78678894042969),(70,'Jiquilpan','Michoacan',19.9933638,-102.72339630126953),(71,'Tlatlauquitepec','Puebla',19.8463511,-97.49723815917969),(72,'Tzintzuntzan','Michoacan',19.6287856,-101.57769012451172),(73,'Mapimi','Durango',25.833708,-103.84873962402344),(74,'Papantla','Veracruz',20.4566709,-97.31561279296875),(75,'Tecate','Baja California',32.5685837,-116.63469696044922),(76,'Arteaga','Coahuila',25.4546718,-100.85079193115234),(77,'Viesca','Coahuila',25.3384294,-102.7998275756836),(78,'Jalpa','Guanajuato',21.1097225,-101.70831298828125),(79,'Salvatierra','Guanajuato',20.2090023,-100.88184356689453),(80,'Yuriria','Guanajuato',20.210945,-101.13059997558594),(81,'Xicotepec','Puebla',18.9499841,-98.24444580078125),(82,'Jala','Nayarit',21.1046363,-104.43785858154297),(83,'El Rosario','Sinaloa',22.9914716,-105.86132049560547);
/*!40000 ALTER TABLE `pueblos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pueblosmagicos`
--

DROP TABLE IF EXISTS `pueblosmagicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pueblosmagicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `coordenadasGPS` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pueblosmagicos`
--

LOCK TABLES `pueblosmagicos` WRITE;
/*!40000 ALTER TABLE `pueblosmagicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pueblosmagicos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-17 13:07:27
