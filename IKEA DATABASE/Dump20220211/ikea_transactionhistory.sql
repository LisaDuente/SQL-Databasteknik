-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ikea
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `transactionhistory`
--

DROP TABLE IF EXISTS `transactionhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionhistory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Type` int DEFAULT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Reference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Type` (`Type`),
  CONSTRAINT `transactionhistory_ibfk_1` FOREIGN KEY (`Type`) REFERENCES `transactiontype` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionhistory`
--

LOCK TABLES `transactionhistory` WRITE;
/*!40000 ALTER TABLE `transactionhistory` DISABLE KEYS */;
INSERT INTO `transactionhistory` VALUES (1,1,'2022-02-10 14:49:58','7'),(2,2,'2022-02-10 15:14:51','4'),(3,2,'2022-02-10 15:15:06','5'),(6,1,'2022-02-11 13:48:13','8'),(7,1,'2022-02-11 13:48:54','9'),(8,1,'2022-02-11 13:48:54','10'),(9,1,'2022-02-11 13:50:39','11'),(10,1,'2022-02-11 13:50:39','12'),(11,1,'2022-02-11 13:52:19','13'),(12,1,'2022-02-11 13:52:19','14'),(15,1,'2022-02-11 13:54:37','17'),(16,1,'2022-02-11 13:59:20','18'),(17,1,'2022-02-11 14:03:08','19'),(18,1,'2022-02-11 14:06:41','20'),(19,1,'2022-02-11 14:07:53','21'),(20,1,'2022-02-11 14:08:32','22'),(21,1,'2022-02-11 14:09:35','23'),(22,1,'2022-02-11 14:10:57','24'),(23,4,'2022-02-11 14:41:45','2'),(24,2,'2022-02-11 14:47:07','5'),(25,2,'2022-02-11 14:47:08','5');
/*!40000 ALTER TABLE `transactionhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-11 15:48:49
