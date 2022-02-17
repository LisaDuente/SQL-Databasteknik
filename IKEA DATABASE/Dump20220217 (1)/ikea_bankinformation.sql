-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: ikea
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bankinformation`
--

DROP TABLE IF EXISTS `bankinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankinformation` (
  `CustomerID` int NOT NULL,
  `IBAN` varchar(255) DEFAULT NULL,
  `BIC` varchar(255) DEFAULT NULL,
  `KreditNr` varchar(255) DEFAULT NULL,
  `KreditCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  CONSTRAINT `bankinformation_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankinformation`
--

LOCK TABLES `bankinformation` WRITE;
/*!40000 ALTER TABLE `bankinformation` DISABLE KEYS */;
INSERT INTO `bankinformation` VALUES (1,'Æœ-d Ûånôz\"ðJ','ÉfÌtã6üË6úð¼¸9ƒ','Å†ØàJ©!„¯†«2á','Å†ØàJ©!„¯†«2á'),(2,'T½Vã÷f²¯d²u','_¡‡¥ŠK¦úÉOM ªZ','©â…\"IRõC&IAÎ','E ÇWrhY\rÜ¶9ŠÛ'),(11,'¾ænÓþQŸ±Îùtí­æ®ñAøÓä¨TD÷½,‰Ž2W¾Ï!vF»éü','ãr5+¤ºSZc‹QÌÛõÒ÷½,‰Ž2W¾Ï!vF»éü','çA7ªRökC³¡(ª÷½,‰Ž2W¾Ï!vF»éü','ŽÄ(Óc\0à“¡Y=ŸnüÊ÷½,‰Ž2W¾Ï!vF»éü');
/*!40000 ALTER TABLE `bankinformation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bankinformation_BEFORE_INSERT` BEFORE INSERT ON `bankinformation` FOR EACH ROW BEGIN
SET new.IBAN := AES_ENCRYPT(CONCAT(new.IBAN,new.CustomerID), "123Test");
SET new.BIC := AES_ENCRYPT(CONCAT(new.BIC,new.CustomerID), "123Test");
SET new.KreditNR := AES_ENCRYPT(CONCAT(new.KreditNr,new.CustomerID), "123Test");
SET new.KreditCode := AES_ENCRYPT(CONCAT(new.KreditCode,new.CustomerID), "123Test");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bankinformation_AFTER_INSERT` AFTER INSERT ON `bankinformation` FOR EACH ROW BEGIN
INSERT INTO TransactionHistory VALUES(NULL, 4, NOW(),new.CustomerID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bankinformation_BEFORE_UPDATE` BEFORE UPDATE ON `bankinformation` FOR EACH ROW BEGIN
SET new.IBAN := AES_ENCRYPT(CONCAT(new.IBAN,new.CustomerID), "123Test");
SET new.BIC := AES_ENCRYPT(CONCAT(new.BIC,new.CustomerID), "123Test");
SET new.KreditNR := AES_ENCRYPT(CONCAT(new.KreditNr,new.CustomerID), "123Test");
SET new.KreditCode := AES_ENCRYPT(CONCAT(new.KreditCode,new.CustomerID), "123Test");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bankinformation_AFTER_UPDATE` AFTER UPDATE ON `bankinformation` FOR EACH ROW BEGIN
INSERT INTO TransactionHistory VALUES(NULL, 4, NOW(),new.CustomerID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-17 16:35:14
