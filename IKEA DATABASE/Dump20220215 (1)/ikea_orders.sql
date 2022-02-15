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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `OrderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ShippingDate` datetime DEFAULT NULL,
  `ShipperID` int DEFAULT NULL,
  `OrderStatusID` int NOT NULL,
  `PayStatus` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `OrderID` (`OrderID`),
  KEY `ShipperID` (`ShipperID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `FK_orders` (`OrderStatusID`),
  KEY `PayStatus` (`PayStatus`),
  CONSTRAINT `FK_orders` FOREIGN KEY (`OrderStatusID`) REFERENCES `orderstatus` (`StatusID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ShipperID`) REFERENCES `shippers` (`ShipperID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `PayStatus` FOREIGN KEY (`PayStatus`) REFERENCES `paystatus` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,'2022-02-08 11:21:02',NULL,3,3,1),(2,2,'2022-02-08 11:43:09',NULL,3,2,1),(3,1,'2022-02-10 14:16:53',NULL,6,3,1),(5,1,'2022-02-10 14:21:02',NULL,6,3,1),(6,1,'2022-02-10 14:45:01',NULL,6,3,1),(7,2,'2022-02-10 15:49:58',NULL,4,3,2),(8,2,'2022-02-11 14:48:13',NULL,4,3,1),(9,2,'2022-02-11 14:48:54',NULL,4,3,1),(10,2,'2022-02-11 14:48:54',NULL,4,3,1),(11,2,'2022-02-11 14:50:39',NULL,4,3,1),(12,2,'2022-02-11 14:50:39',NULL,4,3,1),(13,2,'2022-02-11 14:52:19',NULL,4,3,1),(14,2,'2022-02-11 14:52:19',NULL,4,3,1),(17,2,'2022-02-11 14:54:37',NULL,4,3,1),(18,2,'2022-02-11 14:59:20',NULL,4,3,1),(19,2,'2022-02-11 15:03:08',NULL,4,3,1),(20,2,'2022-02-11 15:06:41',NULL,4,3,1),(21,2,'2022-02-11 15:07:53',NULL,4,3,1),(22,2,'2022-02-11 15:08:32',NULL,4,3,1),(23,2,'2022-02-11 15:09:35',NULL,4,3,1),(24,2,'2022-02-11 15:10:57',NULL,4,3,1),(25,2,'2022-02-11 16:01:26',NULL,4,3,1),(26,2,'2022-02-11 16:02:37',NULL,4,3,1),(38,2,'2022-02-13 10:38:11',NULL,4,3,1),(39,2,'2022-02-13 10:42:15',NULL,4,3,1),(40,2,'2022-02-13 10:43:34',NULL,4,3,1),(41,2,'2022-02-13 10:49:12',NULL,4,3,1),(42,2,'2022-02-13 10:50:44',NULL,4,3,1),(43,2,'2022-02-13 10:53:07',NULL,4,3,1),(44,2,'2022-02-13 10:55:48',NULL,4,3,1),(45,2,'2022-02-13 10:57:59',NULL,4,3,1),(46,2,'2022-02-13 11:01:41',NULL,4,3,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orders_AFTER_INSERT` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
INSERT INTO TransactionHistory VALUES(NULL, 1, NOW(),new.orderid);
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

-- Dump completed on 2022-02-15 14:14:19
