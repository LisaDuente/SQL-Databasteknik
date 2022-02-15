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
-- Table structure for table `streets`
--

DROP TABLE IF EXISTS `streets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `streets` (
  `StreetID` int NOT NULL AUTO_INCREMENT,
  `PostCodeID` int DEFAULT NULL,
  `StreetName` varchar(255) DEFAULT NULL,
  `HouseNr` int DEFAULT NULL,
  PRIMARY KEY (`StreetID`),
  KEY `PostCodeID` (`PostCodeID`),
  CONSTRAINT `streets_ibfk_1` FOREIGN KEY (`PostCodeID`) REFERENCES `postcodes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streets`
--

LOCK TABLES `streets` WRITE;
/*!40000 ALTER TABLE `streets` DISABLE KEYS */;
INSERT INTO `streets` VALUES (1,1,'Bambelbergstrasse',1),(2,1,'Bambelbergstrasse',2),(3,1,'Bambelbergstrasse',3),(4,2,'Bambelbergstrasse',1),(5,2,'Bambelbergstrasse',2),(6,2,'bamBelbergstrasse',3),(7,10,'Nordhafen',5),(8,10,'Nordhafen',6),(9,10,'Nordhafen',7),(10,16,'Nordhafen',7),(11,17,'Nordhafen',7),(12,18,'Nordhafen',7),(13,19,'Kniestrasse',15),(14,20,'Kopernikusstrasse',27),(15,18,'Nordhafen',99),(16,18,'Nordhafen',23),(17,18,'Nordhafen',44);
/*!40000 ALTER TABLE `streets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-15 14:14:20
