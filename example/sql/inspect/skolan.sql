-- MySQL dump 10.13  Distrib 5.6.30, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: skolan
-- ------------------------------------------------------
-- Server version	5.6.30-1

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
-- Temporary view structure for view `VNamnAlder`
--

DROP TABLE IF EXISTS `VNamnAlder`;
/*!50001 DROP VIEW IF EXISTS `VNamnAlder`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `VNamnAlder` AS SELECT 
 1 AS `Namn`,
 1 AS `Ålder`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vlarare`
--

DROP TABLE IF EXISTS `Vlarare`;
/*!50001 DROP VIEW IF EXISTS `Vlarare`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Vlarare` AS SELECT 
 1 AS `akronym`,
 1 AS `avdelning`,
 1 AS `fornamn`,
 1 AS `efternamn`,
 1 AS `kon`,
 1 AS `lon`,
 1 AS `fodd`,
 1 AS `kompetens`,
 1 AS `Ålder`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vplanering`
--

DROP TABLE IF EXISTS `Vplanering`;
/*!50001 DROP VIEW IF EXISTS `Vplanering`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Vplanering` AS SELECT 
 1 AS `kod`,
 1 AS `namn`,
 1 AS `poang`,
 1 AS `niva`,
 1 AS `id`,
 1 AS `kurskod`,
 1 AS `kursansvarig`,
 1 AS `lasperiod`,
 1 AS `akronym`,
 1 AS `avdelning`,
 1 AS `fornamn`,
 1 AS `efternamn`,
 1 AS `kon`,
 1 AS `lon`,
 1 AS `fodd`,
 1 AS `kompetens`,
 1 AS `Ålder`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kurs`
--

DROP TABLE IF EXISTS `kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kurs` (
  `kod` char(6) COLLATE utf8_swedish_ci NOT NULL,
  `namn` varchar(40) COLLATE utf8_swedish_ci DEFAULT NULL,
  `poang` float DEFAULT NULL,
  `niva` char(3) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurs`
--

LOCK TABLES `kurs` WRITE;
/*!40000 ALTER TABLE `kurs` DISABLE KEYS */;
INSERT INTO `kurs` VALUES ('AST101','Astronomi',5,'G1N'),('DJU101','Skötsel och vård av magiska djur',4,'G1F'),('DRY101','Trolldryckslära',6,'G1N'),('DRY102','Trolldryckslära',6,'G1F'),('KVA101','Kvastflygning',4,'G1N'),('MUG101','Mugglarstudier',6,'G1F'),('SVT101','Försvar mot svartkonster',8,'G1N'),('SVT201','Försvar mot svartkonster',6,'G1F'),('SVT202','Försvar mot svartkonster',6,'G1F'),('SVT401','Försvar mot svartkonster',6,'G2F'),('VAN101','Förvandlingskonst',5,'G1F');
/*!40000 ALTER TABLE `kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurs2`
--

DROP TABLE IF EXISTS `kurs2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kurs2` (
  `kod` char(6) NOT NULL,
  `namn` varchar(40) DEFAULT NULL,
  `poang` int(11) DEFAULT NULL,
  `niva` char(3) DEFAULT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurs2`
--

LOCK TABLES `kurs2` WRITE;
/*!40000 ALTER TABLE `kurs2` DISABLE KEYS */;
INSERT INTO `kurs2` VALUES ('AST101','Astronomi',5,'G1N'),('DJU101','Skötsel och vård av magiska djur',4,'G1F'),('DRY101','Trolldryckslära',6,'G1N'),('DRY102','Trolldryckslära',6,'G1F'),('KVA101','Kvastflygning',4,'G1N'),('MUG101','Mugglarstudier',6,'G1F'),('SVT101','Försvar mot svartkonster',8,'G1N'),('SVT201','Försvar mot svartkonster',6,'G1F'),('SVT202','Försvar mot svartkonster',6,'G1F'),('SVT401','Försvar mot svartkonster',6,'G2F'),('VAN101','Förvandlingskonst',5,'G1F');
/*!40000 ALTER TABLE `kurs2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurstillfalle`
--

DROP TABLE IF EXISTS `kurstillfalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kurstillfalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kurskod` char(6) COLLATE utf8_swedish_ci NOT NULL,
  `kursansvarig` char(3) COLLATE utf8_swedish_ci NOT NULL,
  `lasperiod` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kurskod` (`kurskod`),
  KEY `kursansvarig` (`kursansvarig`),
  CONSTRAINT `kurstillfalle_ibfk_1` FOREIGN KEY (`kurskod`) REFERENCES `kurs` (`kod`),
  CONSTRAINT `kurstillfalle_ibfk_2` FOREIGN KEY (`kursansvarig`) REFERENCES `larare` (`akronym`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurstillfalle`
--

LOCK TABLES `kurstillfalle` WRITE;
/*!40000 ALTER TABLE `kurstillfalle` DISABLE KEYS */;
INSERT INTO `kurstillfalle` VALUES (1,'SVT101','gyl',1),(2,'SVT101','gyl',3),(3,'SVT201','ala',1),(4,'SVT202','ala',2),(5,'SVT401','sna',1),(6,'KVA101','hoc',1),(7,'DJU101','hag',3),(8,'DRY101','sna',2),(9,'DRY102','sna',3),(10,'MUG101','min',4);
/*!40000 ALTER TABLE `kurstillfalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurstillfalle2`
--

DROP TABLE IF EXISTS `kurstillfalle2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kurstillfalle2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kurskod` char(6) NOT NULL,
  `kursansvarig` char(3) DEFAULT NULL,
  `lasperiod` int(11) NOT NULL,
  `programtillfalle` char(9) DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kurskod` (`kurskod`),
  KEY `kursansvarig` (`kursansvarig`),
  KEY `programtillfalle` (`programtillfalle`),
  CONSTRAINT `kurstillfalle2_ibfk_1` FOREIGN KEY (`kurskod`) REFERENCES `kurs2` (`kod`),
  CONSTRAINT `kurstillfalle2_ibfk_2` FOREIGN KEY (`kursansvarig`) REFERENCES `larare2` (`akronym`),
  CONSTRAINT `kurstillfalle2_ibfk_3` FOREIGN KEY (`programtillfalle`) REFERENCES `programtillfalle2` (`kod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurstillfalle2`
--

LOCK TABLES `kurstillfalle2` WRITE;
/*!40000 ALTER TABLE `kurstillfalle2` DISABLE KEYS */;
INSERT INTO `kurstillfalle2` VALUES (1,'KVA101','mos',1,'SNÄLL2028','Godkänd','2018-02-20 11:19:25','2018-02-20 11:19:25'),(2,'DRY101','mos',2,'SNÄLL2028','Godkänd','2018-02-20 11:19:25','2018-02-20 11:19:25'),(3,'SVT101',NULL,3,'SNÄLL2028','Beställd','2018-02-20 11:19:25','0000-00-00 00:00:00'),(4,'VAN101',NULL,4,'SNÄLL2028','Beställd','2018-02-20 11:19:25','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `kurstillfalle2` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`localhost`*/ /*!50003 TRIGGER loggInsertKurstillfalle
AFTER INSERT
ON kurstillfalle2 FOR EACH ROW
    INSERT INTO logg2 (programtillfalle, kurskod, lasperiod, `status`)
        VALUES (NEW.programtillfalle, NEW.kurskod, NEW.lasperiod, NEW.`status`) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`localhost`*/ /*!50003 TRIGGER loggUpdateKurstillfalle
AFTER UPDATE
ON kurstillfalle2 FOR EACH ROW
    INSERT INTO logg2 (programtillfalle, kurskod, lasperiod, `status`)
        VALUES (NEW.programtillfalle, NEW.kurskod, NEW.lasperiod, NEW.`status`) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `larare`
--

DROP TABLE IF EXISTS `larare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `larare` (
  `akronym` char(3) COLLATE utf8_swedish_ci NOT NULL DEFAULT '',
  `avdelning` char(4) COLLATE utf8_swedish_ci DEFAULT NULL,
  `fornamn` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `efternamn` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `kon` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `lon` int(11) DEFAULT NULL,
  `fodd` date DEFAULT NULL,
  `kompetens` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`akronym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `larare`
--

LOCK TABLES `larare` WRITE;
/*!40000 ALTER TABLE `larare` DISABLE KEYS */;
INSERT INTO `larare` VALUES ('ala','DIPT','Alastor','Moody','M',27594,'1943-04-03',1),('dum','ADM','Albus','Dumbledore','M',85000,'1941-04-01',7),('fil','ADM','Argus','Filch','M',27594,'1946-04-06',3),('gyl','DIPT','Gyllenroy','Lockman','M',27594,'1952-05-02',1),('hag','ADM','Hagrid','Rubeus','M',30000,'1956-05-06',2),('hoc','DIDD','Madam','Hooch','K',37580,'1948-04-08',1),('min','DIDD','Minerva','McGonagall','K',49880,'1955-05-05',2),('sna','DIPT','Severus','Snape','M',45000,'1951-05-01',2);
/*!40000 ALTER TABLE `larare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `larare2`
--

DROP TABLE IF EXISTS `larare2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `larare2` (
  `akronym` char(3) NOT NULL DEFAULT '',
  `avdelning` char(4) DEFAULT NULL,
  `fornamn` varchar(20) DEFAULT NULL,
  `efternamn` varchar(20) DEFAULT NULL,
  `kon` char(1) DEFAULT NULL,
  `lon` int(11) DEFAULT NULL,
  `fodd` date DEFAULT NULL,
  PRIMARY KEY (`akronym`),
  KEY `i_fornamn` (`fornamn`),
  KEY `i_efternamn` (`efternamn`),
  KEY `i_avdelning` (`avdelning`),
  KEY `i_fodd` (`fodd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `larare2`
--

LOCK TABLES `larare2` WRITE;
/*!40000 ALTER TABLE `larare2` DISABLE KEYS */;
INSERT INTO `larare2` VALUES ('ala','DIPT','Alastor','Moody','M',30000,'1943-04-03'),('dum','ADM','Albus','Dumbledore','M',80000,'1941-04-01'),('fil','ADM','Argus','Filch','M',25000,'1986-04-06'),('gyl','DIPT','Gyllenroy','Lockman','M',30000,'1992-05-02'),('hag','ADM','Hagrid','Rubeus','M',25000,'1986-05-06'),('hoc','DIDD','Madam','Hooch','K',35000,'1998-04-08'),('min','DIDD','Minerva','McGonagall','K',40000,'1955-05-05'),('mos','DBWE','Mikael','Roos','M',99000,'1968-03-07'),('sna','DIPT','Severus','Snape','M',40000,'1951-05-01');
/*!40000 ALTER TABLE `larare2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `larare_pre`
--

DROP TABLE IF EXISTS `larare_pre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `larare_pre` (
  `akronym` char(3) COLLATE utf8_swedish_ci NOT NULL DEFAULT '',
  `avdelning` char(4) COLLATE utf8_swedish_ci DEFAULT NULL,
  `fornamn` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `efternamn` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `kon` char(1) COLLATE utf8_swedish_ci DEFAULT NULL,
  `lon` int(11) DEFAULT NULL,
  `fodd` date DEFAULT NULL,
  `kompetens` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`akronym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `larare_pre`
--

LOCK TABLES `larare_pre` WRITE;
/*!40000 ALTER TABLE `larare_pre` DISABLE KEYS */;
INSERT INTO `larare_pre` VALUES ('ala','DIPT','Alastor','Moody','M',30000,'1943-04-03',1),('dum','ADM','Albus','Dumbledore','M',80000,'1941-04-01',1),('fil','ADM','Argus','Filch','M',25000,'1946-04-06',1),('gyl','DIPT','Gyllenroy','Lockman','M',30000,'1952-05-02',1),('hag','ADM','Hagrid','Rubeus','M',25000,'1956-05-06',1),('hoc','DIDD','Madam','Hooch','K',35000,'1948-04-08',1),('min','DIDD','Minerva','McGonagall','K',40000,'1955-05-05',1),('sna','DIPT','Severus','Snape','M',40000,'1951-05-01',1);
/*!40000 ALTER TABLE `larare_pre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logg2`
--

DROP TABLE IF EXISTS `logg2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logg2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `programtillfalle` char(9) DEFAULT NULL,
  `kurskod` char(6) DEFAULT NULL,
  `lasperiod` int(11) NOT NULL,
  `status` char(10) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kurskod` (`kurskod`),
  KEY `programtillfalle` (`programtillfalle`),
  CONSTRAINT `logg2_ibfk_1` FOREIGN KEY (`kurskod`) REFERENCES `kurs2` (`kod`),
  CONSTRAINT `logg2_ibfk_2` FOREIGN KEY (`programtillfalle`) REFERENCES `programtillfalle2` (`kod`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logg2`
--

LOCK TABLES `logg2` WRITE;
/*!40000 ALTER TABLE `logg2` DISABLE KEYS */;
INSERT INTO `logg2` VALUES (1,'SNÄLL2028','KVA101',1,'Beställd','2018-02-20 11:19:25'),(2,'SNÄLL2028','DRY101',2,'Beställd','2018-02-20 11:19:25'),(3,'SNÄLL2028','SVT101',3,'Beställd','2018-02-20 11:19:25'),(4,'SNÄLL2028','VAN101',4,'Beställd','2018-02-20 11:19:25'),(5,'SNÄLL2028','KVA101',1,'Godkänd','2018-02-20 11:19:25'),(6,'SNÄLL2028','DRY101',2,'Godkänd','2018-02-20 11:19:25');
/*!40000 ALTER TABLE `logg2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program2`
--

DROP TABLE IF EXISTS `program2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program2` (
  `kod` char(5) NOT NULL DEFAULT '',
  `namn` varchar(40) DEFAULT NULL,
  `ansvarig` char(3) DEFAULT NULL,
  PRIMARY KEY (`kod`),
  KEY `ansvarig` (`ansvarig`),
  CONSTRAINT `program2_ibfk_1` FOREIGN KEY (`ansvarig`) REFERENCES `larare2` (`akronym`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program2`
--

LOCK TABLES `program2` WRITE;
/*!40000 ALTER TABLE `program2` DISABLE KEYS */;
INSERT INTO `program2` VALUES ('LURIG','Det luriga trollkarlsprogrammet','mos'),('SNÄLL','Det snälla trollkarlsprogrammet','sna');
/*!40000 ALTER TABLE `program2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programtillfalle2`
--

DROP TABLE IF EXISTS `programtillfalle2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programtillfalle2` (
  `kod` char(9) NOT NULL DEFAULT '',
  `antagning` char(4) DEFAULT NULL,
  `program` char(5) DEFAULT NULL,
  PRIMARY KEY (`kod`),
  KEY `program` (`program`),
  CONSTRAINT `programtillfalle2_ibfk_1` FOREIGN KEY (`program`) REFERENCES `program2` (`kod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programtillfalle2`
--

LOCK TABLES `programtillfalle2` WRITE;
/*!40000 ALTER TABLE `programtillfalle2` DISABLE KEYS */;
INSERT INTO `programtillfalle2` VALUES ('LURIG2027','2027','LURIG'),('LURIG2028','2028','LURIG'),('SNÄLL2027','2027','SNÄLL'),('SNÄLL2028','2028','SNÄLL');
/*!40000 ALTER TABLE `programtillfalle2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `VNamnAlder`
--

/*!50001 DROP VIEW IF EXISTS `VNamnAlder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VNamnAlder` AS select concat(`larare`.`fornamn`,' ',`larare`.`efternamn`,' (',lcase(`larare`.`avdelning`),')') AS `Namn`,timestampdiff(YEAR,`larare`.`fodd`,curdate()) AS `Ålder` from `larare` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vlarare`
--

/*!50001 DROP VIEW IF EXISTS `Vlarare`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Vlarare` AS select `larare`.`akronym` AS `akronym`,`larare`.`avdelning` AS `avdelning`,`larare`.`fornamn` AS `fornamn`,`larare`.`efternamn` AS `efternamn`,`larare`.`kon` AS `kon`,`larare`.`lon` AS `lon`,`larare`.`fodd` AS `fodd`,`larare`.`kompetens` AS `kompetens`,timestampdiff(YEAR,`larare`.`fodd`,curdate()) AS `Ålder` from `larare` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vplanering`
--

/*!50001 DROP VIEW IF EXISTS `Vplanering`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Vplanering` AS select `k`.`kod` AS `kod`,`k`.`namn` AS `namn`,`k`.`poang` AS `poang`,`k`.`niva` AS `niva`,`kt`.`id` AS `id`,`kt`.`kurskod` AS `kurskod`,`kt`.`kursansvarig` AS `kursansvarig`,`kt`.`lasperiod` AS `lasperiod`,`l`.`akronym` AS `akronym`,`l`.`avdelning` AS `avdelning`,`l`.`fornamn` AS `fornamn`,`l`.`efternamn` AS `efternamn`,`l`.`kon` AS `kon`,`l`.`lon` AS `lon`,`l`.`fodd` AS `fodd`,`l`.`kompetens` AS `kompetens`,`l`.`Ålder` AS `Ålder` from ((`kurs` `k` join `kurstillfalle` `kt` on((`k`.`kod` = `kt`.`kurskod`))) join `Vlarare` `l` on((`l`.`akronym` = `kt`.`kursansvarig`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-05 23:47:13
