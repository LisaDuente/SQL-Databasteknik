CREATE DATABASE  IF NOT EXISTS `ikea` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ikea`;
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
-- Table structure for table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresses` (
  `ID` varchar(255) NOT NULL,
  `StreetID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresses`
--

LOCK TABLES `adresses` WRITE;
/*!40000 ALTER TABLE `adresses` DISABLE KEYS */;
INSERT INTO `adresses` VALUES ('1',11),('10',8),('11',9),('12',10),('13',13),('14',14),('2',12),('3',1),('4',2),('5',3),('6',4),('7',5),('8',6),('9',7);
/*!40000 ALTER TABLE `adresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `adressview`
--

DROP TABLE IF EXISTS `adressview`;
/*!50001 DROP VIEW IF EXISTS `adressview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `adressview` AS SELECT 
 1 AS `ID`,
 1 AS `StreetName`,
 1 AS `HouseNr`,
 1 AS `PostCode`,
 1 AS `CityName`,
 1 AS `CountryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bankinformation`
--

DROP TABLE IF EXISTS `bankinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankinformation` (
  `CustomerID` int NOT NULL,
  `IBAN` varchar(255) DEFAULT NULL,
  `BIC` varchar(30) DEFAULT NULL,
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
INSERT INTO `bankinformation` VALUES (1,'Æœ-d Ûånôz\"ðJ','ÉfÌtã6üË6úð¼¸9ƒ','Å†ØàJ©!„¯†«2á','Å†ØàJ©!„¯†«2á'),(2,'T½Vã÷f²¯d²u','_¡‡¥ŠK¦úÉOM ªZ','©â…\"IRõC&IAÎ','E ÇWrhY\rÜ¶9ŠÛ');
/*!40000 ALTER TABLE `bankinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `CityID` int NOT NULL,
  `CityName` varchar(255) DEFAULT NULL,
  `CountryID` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`CityID`),
  KEY `CountryID` (`CountryID`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Hannover','DE'),(2,'Stockholm','SE'),(3,'Koppenhagen','DK'),(4,'Paris','F'),(5,'Berlin','DE'),(6,'Malmö','SE'),(7,'Hirtshals','DK'),(8,'Lyon','F'),(9,'Hannover','DK'),(10,'Holmstedt','DE');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `contactinfoemployees`
--

DROP TABLE IF EXISTS `contactinfoemployees`;
/*!50001 DROP VIEW IF EXISTS `contactinfoemployees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contactinfoemployees` AS SELECT 
 1 AS `PersonalName`,
 1 AS `Phone`,
 1 AS `Email`,
 1 AS `DepartmentName`,
 1 AS `Position`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `ID` varchar(3) NOT NULL,
  `CountryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('DE','Germany'),('DK','Denmark'),('F','France'),('SE','Sweden');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customeradresses`
--

DROP TABLE IF EXISTS `customeradresses`;
/*!50001 DROP VIEW IF EXISTS `customeradresses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customeradresses` AS SELECT 
 1 AS `ID`,
 1 AS `CustomerName`,
 1 AS `StreetName`,
 1 AS `HouseNr`,
 1 AS `PostCode`,
 1 AS `CityName`,
 1 AS `CountryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(255) DEFAULT NULL,
  `AdressID` varchar(255) DEFAULT NULL,
  `CustomerPhone` varchar(255) DEFAULT NULL,
  `CustomerEmail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerID` (`CustomerID`),
  KEY `AdressID` (`AdressID`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`AdressID`) REFERENCES `adresses` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Georg Schuppe','1','0123456','Georg@Gerne.se'),(2,'Lisa Dünte','2','0123456','Lisa@Lachen.de'),(3,'Toto','3','0123456','-'),(5,'Baby','4','01568888','KatzenBaby@lol.de'),(6,'Popel','4','01568888','KatzenBaby@lol.de'),(7,'Gnompfell','11','01568888','KatzenBaby@lol.de');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `departmentadresses`
--

DROP TABLE IF EXISTS `departmentadresses`;
/*!50001 DROP VIEW IF EXISTS `departmentadresses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `departmentadresses` AS SELECT 
 1 AS `Name`,
 1 AS `StreetName`,
 1 AS `HouseNr`,
 1 AS `PostCode`,
 1 AS `CityName`,
 1 AS `CountryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DepartmentID` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(255) DEFAULT NULL,
  `DepartmentHead` varchar(255) DEFAULT NULL,
  `AdressID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `DepartmentID` (`DepartmentID`),
  KEY `AdressID` (`AdressID`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`AdressID`) REFERENCES `adresses` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'IT','Lisa Dünte','1'),(2,'Production','Alena Arndt','1'),(3,'Sales','Bernd Brems','1'),(4,'Comfort','Test','1');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `PriceEach` float DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,1,25.99,2),(1,8,5.99,4),(2,4,12.99,2),(5,2,25.99,5),(6,5,12.99,40),(7,2,25.99,2),(11,1,25.99,1),(13,1,25.99,1),(19,1,25.99,1),(20,1,25.99,1),(21,1,25.99,1),(22,1,25.99,1),(23,1,25.99,1),(24,1,25.99,1),(24,2,25.99,1),(24,3,25.99,1),(26,5,12.99,2),(26,7,15.99,3),(39,5,12.99,20),(39,7,15.99,4),(40,4,12.99,20),(40,10,5.99,4),(41,4,12.99,20),(41,10,5.99,4),(42,4,12.99,20),(42,10,5.99,4),(43,4,12.99,20),(43,10,5.99,4),(44,4,12.99,20),(44,10,5.99,4),(45,4,12.99,20),(45,10,5.99,4),(46,4,12.99,20),(46,10,5.99,4);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orderhistory`
--

DROP TABLE IF EXISTS `orderhistory`;
/*!50001 DROP VIEW IF EXISTS `orderhistory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orderhistory` AS SELECT 
 1 AS `CustomerID`,
 1 AS `CustomerName`,
 1 AS `OrderID`,
 1 AS `ProductID`,
 1 AS `ProductName`,
 1 AS `Quantity`,
 1 AS `OrderDate`,
 1 AS `StatusName`*/;
SET character_set_client = @saved_cs_client;

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

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `StatusID` int NOT NULL,
  `StatusName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,'on hold'),(2,'shipped'),(3,'in preperation'),(4,'delivered'),(5,'packed'),(6,'canceled');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paystatus`
--

DROP TABLE IF EXISTS `paystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paystatus` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `StatusName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paystatus`
--

LOCK TABLES `paystatus` WRITE;
/*!40000 ALTER TABLE `paystatus` DISABLE KEYS */;
INSERT INTO `paystatus` VALUES (1,'not paid'),(2,'paid');
/*!40000 ALTER TABLE `paystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `PersonalID` int NOT NULL AUTO_INCREMENT,
  `PersonalName` varchar(255) DEFAULT NULL,
  `AdressID` varchar(255) DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `Position` varchar(255) DEFAULT NULL,
  `SalaryID` int DEFAULT NULL,
  PRIMARY KEY (`PersonalID`),
  UNIQUE KEY `PersonalID` (`PersonalID`),
  KEY `SalaryID` (`SalaryID`),
  KEY `DepartmentID` (`DepartmentID`),
  KEY `AdressID` (`AdressID`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`SalaryID`) REFERENCES `salary` (`ID`),
  CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `personal_ibfk_3` FOREIGN KEY (`AdressID`) REFERENCES `adresses` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Georg Schuppe','1',1,'017786374','Georg@ITDep.de','Human Ressource',1),(2,'Lisa Dünte','1',1,'017786374','Lisa@ITDep.de','Head of Department',1),(3,'Gabi Meyer','11',3,'0123456','Gabi@ganzgern.de','Azubi',3);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcodes`
--

DROP TABLE IF EXISTS `postcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postcodes` (
  `PostCode` int NOT NULL,
  `CityID` int NOT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `CityID` (`CityID`),
  CONSTRAINT `postcodes_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `cities` (`CityID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcodes`
--

LOCK TABLES `postcodes` WRITE;
/*!40000 ALTER TABLE `postcodes` DISABLE KEYS */;
INSERT INTO `postcodes` VALUES (1050,3,1),(1054,3,2),(9850,7,3),(10115,5,4),(10117,5,5),(11121,2,6),(11123,2,7),(21111,6,8),(21113,6,9),(30159,1,10),(30173,1,11),(69001,8,12),(69002,8,13),(75000,4,14),(75001,4,15),(30159,7,16),(1010,7,17),(30159,9,18),(30167,1,19),(40192,10,20);
/*!40000 ALTER TABLE `postcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) DEFAULT NULL,
  `PorductType` varchar(3) DEFAULT NULL,
  `Length` float DEFAULT NULL,
  `Width` float DEFAULT NULL,
  `Height` float DEFAULT NULL,
  `Weigth` float DEFAULT NULL,
  `Colour` varchar(60) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `ProductID` (`ProductID`),
  KEY `FK_products` (`PorductType`),
  CONSTRAINT `FK_products` FOREIGN KEY (`PorductType`) REFERENCES `producttypes` (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Twix Table','T',100,50,130,30,'Black',25.99),(2,'Bounty Table','T',100,50,130,30,'White',25.99),(3,'Snickers Bank','B',150,50,120,40,'Brown',25.99),(4,'Gummibear Stol','S',100,50,100,15,'Red',12.99),(5,'Gummibear Stol','S',100,50,100,15,'Green',12.99),(6,'Kex Bed','BE',200,180,80,50,'Mocca',55.99),(7,'Liquorice Lamp','L',80,20,120,6,'Black',15.99),(8,'Karamel Kudde','P',20,20,10,4,'Brown',5.99),(9,'Popcorn Kudde','P',20,20,10,4,'White',5.99),(10,'Godis Kudde','P',20,20,10,4,'Yellow',5.99),(11,'Choklad Kudde','P',20,20,10,4,'Brown',5.99);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttypes`
--

DROP TABLE IF EXISTS `producttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producttypes` (
  `TypeID` varchar(3) NOT NULL,
  `ProductType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttypes`
--

LOCK TABLES `producttypes` WRITE;
/*!40000 ALTER TABLE `producttypes` DISABLE KEYS */;
INSERT INTO `producttypes` VALUES ('B','Bank'),('BE','Bed'),('C','Carpet'),('KI','Kitchen'),('L','Lamp'),('M','Mirror'),('P','Pillow'),('S','Stol'),('T','Table'),('W','Wardrobe');
/*!40000 ALTER TABLE `producttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `quantityinwarehouse`
--

DROP TABLE IF EXISTS `quantityinwarehouse`;
/*!50001 DROP VIEW IF EXISTS `quantityinwarehouse`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `quantityinwarehouse` AS SELECT 
 1 AS `ProductName`,
 1 AS `TotalQuantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reportedhours`
--

DROP TABLE IF EXISTS `reportedhours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportedhours` (
  `PersonalID` int NOT NULL,
  `WorkedHours` float DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PersonalID`,`Date`),
  CONSTRAINT `reportedhours_ibfk_1` FOREIGN KEY (`PersonalID`) REFERENCES `personal` (`PersonalID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportedhours`
--

LOCK TABLES `reportedhours` WRITE;
/*!40000 ALTER TABLE `reportedhours` DISABLE KEYS */;
INSERT INTO `reportedhours` VALUES (1,38,'2022-02-08 14:54:46'),(2,40,'2022-02-08 14:54:46');
/*!40000 ALTER TABLE `reportedhours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ContractBegin` datetime DEFAULT CURRENT_TIMESTAMP,
  `ContractForm` varchar(255) DEFAULT NULL,
  `€/hr` float DEFAULT NULL,
  `AvgHours` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'2022-02-04 00:00:00','Full-Time',32,40),(2,'2022-02-04 15:28:27','Part-Time',32,25),(3,'2022-02-04 15:28:48','Internship',0,40),(4,'2022-02-04 15:28:51','Temporary Employment',25,40),(5,'2022-02-04 15:28:53','Fixed-Term',40,40);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippers` (
  `ShipperID` int NOT NULL AUTO_INCREMENT,
  `ShipperName` varchar(255) DEFAULT NULL,
  `AdressID` varchar(255) DEFAULT NULL,
  `ShipperPhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`),
  UNIQUE KEY `ShipperID` (`ShipperID`),
  KEY `AdressID` (`AdressID`),
  CONSTRAINT `shippers_ibfk_1` FOREIGN KEY (`AdressID`) REFERENCES `adresses` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
INSERT INTO `shippers` VALUES (1,'BambooFactory','1','0177 45678'),(2,'BambooFactory','4','0177 45678'),(3,'TomBoy','5','0177 45678'),(4,'TomBoy','6','0177 45678'),(5,'TomBoy','7','0177 45678'),(6,'BigBernd','8','0177 45678'),(7,'FactoryFracters','14','01805 827394');
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `showmonthlysalary`
--

DROP TABLE IF EXISTS `showmonthlysalary`;
/*!50001 DROP VIEW IF EXISTS `showmonthlysalary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `showmonthlysalary` AS SELECT 
 1 AS `PersonalName`,
 1 AS `WorkedHours`,
 1 AS `Salary`,
 1 AS `Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `showorderstatus`
--

DROP TABLE IF EXISTS `showorderstatus`;
/*!50001 DROP VIEW IF EXISTS `showorderstatus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `showorderstatus` AS SELECT 
 1 AS `CustomerName`,
 1 AS `orderid`,
 1 AS `ProductName`,
 1 AS `Quantity`,
 1 AS `StatusName`,
 1 AS `ShippingDate`,
 1 AS `Payment`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streets`
--

LOCK TABLES `streets` WRITE;
/*!40000 ALTER TABLE `streets` DISABLE KEYS */;
INSERT INTO `streets` VALUES (1,1,'Bambelbergstrasse',1),(2,1,'Bambelbergstrasse',2),(3,1,'Bambelbergstrasse',3),(4,2,'Bambelbergstrasse',1),(5,2,'Bambelbergstrasse',2),(6,2,'bamBelbergstrasse',3),(7,10,'Nordhafen',5),(8,10,'Nordhafen',6),(9,10,'Nordhafen',7),(10,16,'Nordhafen',7),(11,17,'Nordhafen',7),(12,18,'Nordhafen',7),(13,19,'Kniestrasse',15),(14,20,'Kopernikusstrasse',27);
/*!40000 ALTER TABLE `streets` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionhistory`
--

LOCK TABLES `transactionhistory` WRITE;
/*!40000 ALTER TABLE `transactionhistory` DISABLE KEYS */;
INSERT INTO `transactionhistory` VALUES (1,1,'2022-02-10 14:49:58','7'),(2,2,'2022-02-10 15:14:51','4'),(3,2,'2022-02-10 15:15:06','5'),(6,1,'2022-02-11 13:48:13','8'),(7,1,'2022-02-11 13:48:54','9'),(8,1,'2022-02-11 13:48:54','10'),(9,1,'2022-02-11 13:50:39','11'),(10,1,'2022-02-11 13:50:39','12'),(11,1,'2022-02-11 13:52:19','13'),(12,1,'2022-02-11 13:52:19','14'),(15,1,'2022-02-11 13:54:37','17'),(16,1,'2022-02-11 13:59:20','18'),(17,1,'2022-02-11 14:03:08','19'),(18,1,'2022-02-11 14:06:41','20'),(19,1,'2022-02-11 14:07:53','21'),(20,1,'2022-02-11 14:08:32','22'),(21,1,'2022-02-11 14:09:35','23'),(22,1,'2022-02-11 14:10:57','24'),(23,4,'2022-02-11 14:41:45','2'),(24,2,'2022-02-11 14:47:07','5'),(25,2,'2022-02-11 14:47:08','5'),(26,1,'2022-02-11 15:01:26','25'),(27,1,'2022-02-11 15:02:37','26'),(28,2,'2022-02-11 15:02:37','5'),(29,2,'2022-02-11 15:02:37','7'),(30,1,'2022-02-11 15:04:10','27'),(35,1,'2022-02-13 09:09:30','32'),(36,1,'2022-02-13 09:10:49','33'),(37,1,'2022-02-13 09:22:24','34'),(9380,1,'2022-02-13 09:27:36','36'),(9381,2,'2022-02-13 09:27:36','5'),(9382,2,'2022-02-13 09:27:36','7'),(9383,2,'2022-02-13 09:27:36','7'),(9384,2,'2022-02-13 09:35:51','7'),(9385,1,'2022-02-13 09:36:07','37'),(9386,2,'2022-02-13 09:36:07','5'),(9387,1,'2022-02-13 09:38:11','38'),(9388,2,'2022-02-13 09:38:11','5'),(9389,2,'2022-02-13 09:39:51','5'),(9390,2,'2022-02-13 09:40:41','5'),(9391,1,'2022-02-13 09:42:15','39'),(9392,2,'2022-02-13 09:42:15','5'),(9393,2,'2022-02-13 09:42:15','5'),(9394,2,'2022-02-13 09:42:15','7'),(9395,1,'2022-02-13 09:43:34','40'),(9396,2,'2022-02-13 09:43:34','4'),(9397,2,'2022-02-13 09:43:34','4'),(9398,2,'2022-02-13 09:43:34','10'),(9399,2,'2022-02-13 09:43:34','10'),(9400,2,'2022-02-13 09:47:23','4'),(9401,2,'2022-02-13 09:47:23','5'),(9402,2,'2022-02-13 09:47:23','10'),(9403,2,'2022-02-13 09:47:42','4'),(9404,2,'2022-02-13 09:47:42','5'),(9405,2,'2022-02-13 09:47:42','7'),(9406,2,'2022-02-13 09:47:42','10'),(9407,2,'2022-02-13 09:48:36','4'),(9408,1,'2022-02-13 09:49:12','41'),(9409,2,'2022-02-13 09:49:12','4'),(9410,2,'2022-02-13 09:49:12','4'),(9411,2,'2022-02-13 09:49:12','10'),(9412,2,'2022-02-13 09:49:12','10'),(9413,1,'2022-02-13 09:50:44','42'),(9414,2,'2022-02-13 09:50:44','4'),(9415,2,'2022-02-13 09:50:44','10'),(9416,1,'2022-02-13 09:53:07','43'),(9417,2,'2022-02-13 09:53:07','4'),(9418,2,'2022-02-13 09:53:07','10'),(9419,1,'2022-02-13 09:55:48','44'),(9420,2,'2022-02-13 09:55:48','4'),(9421,2,'2022-02-13 09:55:48','10'),(9422,1,'2022-02-13 09:57:59','45'),(9423,2,'2022-02-13 09:57:59','4'),(9424,2,'2022-02-13 09:57:59','10'),(9425,1,'2022-02-13 10:01:41','46'),(9426,2,'2022-02-13 10:01:41','4'),(9427,2,'2022-02-13 10:01:41','10'),(9429,2,'2022-02-13 10:02:56','4');
/*!40000 ALTER TABLE `transactionhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiontype`
--

DROP TABLE IF EXISTS `transactiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactiontype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontype`
--

LOCK TABLES `transactiontype` WRITE;
/*!40000 ALTER TABLE `transactiontype` DISABLE KEYS */;
INSERT INTO `transactiontype` VALUES (1,'Order'),(2,'Stock upp'),(3,'Adress Change'),(4,'Bank Information Change');
/*!40000 ALTER TABLE `transactiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `WarehouseID` int NOT NULL AUTO_INCREMENT,
  `AdressID` varchar(255) DEFAULT NULL,
  `WarehouseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`WarehouseID`),
  UNIQUE KEY `WarehouseID` (`WarehouseID`),
  KEY `AdressID` (`AdressID`),
  CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`AdressID`) REFERENCES `adresses` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'11','Lager Norrmalm'),(2,'12','Lager Södermalm'),(3,'13','Lager Hannover');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehousestatus`
--

DROP TABLE IF EXISTS `warehousestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehousestatus` (
  `WarehouseID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`WarehouseID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `warehousestatus_ibfk_1` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouse` (`WarehouseID`),
  CONSTRAINT `warehousestatus_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehousestatus`
--

LOCK TABLES `warehousestatus` WRITE;
/*!40000 ALTER TABLE `warehousestatus` DISABLE KEYS */;
INSERT INTO `warehousestatus` VALUES (1,1,11),(1,2,42),(1,3,59),(1,4,0),(1,5,5),(1,6,110),(1,7,34),(1,8,89),(1,9,111),(1,10,0),(1,11,23),(2,1,150),(2,2,34),(2,3,45),(2,4,0),(2,5,55),(2,6,77),(2,7,0),(2,8,150),(2,9,20),(2,10,0),(2,11,20);
/*!40000 ALTER TABLE `warehousestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `adressview`
--

/*!50001 DROP VIEW IF EXISTS `adressview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adressview` AS select `a`.`ID` AS `ID`,`s`.`StreetName` AS `StreetName`,`s`.`HouseNr` AS `HouseNr`,`p`.`PostCode` AS `PostCode`,`c`.`CityName` AS `CityName`,`co`.`CountryName` AS `CountryName` from ((((`adresses` `a` left join `streets` `s` on((`a`.`StreetID` = `s`.`StreetID`))) left join `postcodes` `p` on((`s`.`PostCodeID` = `p`.`ID`))) left join `cities` `c` on((`p`.`CityID` = `c`.`CityID`))) left join `countries` `co` on((`co`.`ID` = `c`.`CountryID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contactinfoemployees`
--

/*!50001 DROP VIEW IF EXISTS `contactinfoemployees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contactinfoemployees` AS select `p`.`PersonalName` AS `PersonalName`,`p`.`Phone` AS `Phone`,`p`.`Email` AS `Email`,`d`.`DepartmentName` AS `DepartmentName`,`p`.`Position` AS `Position` from (`personal` `p` left join `departments` `d` on((`p`.`DepartmentID` = `d`.`DepartmentID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customeradresses`
--

/*!50001 DROP VIEW IF EXISTS `customeradresses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customeradresses` AS select `c`.`CustomerID` AS `ID`,`c`.`CustomerName` AS `CustomerName`,`s`.`StreetName` AS `StreetName`,`s`.`HouseNr` AS `HouseNr`,`p`.`PostCode` AS `PostCode`,`ci`.`CityName` AS `CityName`,`co`.`CountryName` AS `CountryName` from (((((`customers` `c` left join `adresses` `a` on((`c`.`AdressID` = `a`.`ID`))) left join `streets` `s` on((`a`.`StreetID` = `s`.`StreetID`))) left join `postcodes` `p` on((`s`.`PostCodeID` = `p`.`ID`))) left join `cities` `ci` on((`p`.`CityID` = `ci`.`CityID`))) left join `countries` `co` on((`ci`.`CountryID` = `co`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `departmentadresses`
--

/*!50001 DROP VIEW IF EXISTS `departmentadresses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `departmentadresses` AS select `d`.`DepartmentName` AS `Name`,`s`.`StreetName` AS `StreetName`,`s`.`HouseNr` AS `HouseNr`,`p`.`PostCode` AS `PostCode`,`ci`.`CityName` AS `CityName`,`co`.`CountryName` AS `CountryName` from (((((`departments` `d` left join `adresses` `a` on((`d`.`AdressID` = `a`.`ID`))) left join `streets` `s` on((`a`.`StreetID` = `s`.`StreetID`))) left join `postcodes` `p` on((`s`.`PostCodeID` = `p`.`ID`))) left join `cities` `ci` on((`p`.`CityID` = `ci`.`CityID`))) left join `countries` `co` on((`ci`.`CountryID` = `co`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderhistory`
--

/*!50001 DROP VIEW IF EXISTS `orderhistory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderhistory` AS select `c`.`CustomerID` AS `CustomerID`,`c`.`CustomerName` AS `CustomerName`,`o`.`OrderID` AS `OrderID`,`p`.`ProductID` AS `ProductID`,`p`.`ProductName` AS `ProductName`,`od`.`Quantity` AS `Quantity`,`o`.`OrderDate` AS `OrderDate`,`os`.`StatusName` AS `StatusName` from ((((`customers` `c` left join `orders` `o` on((`c`.`CustomerID` = `o`.`CustomerID`))) left join `orderdetails` `od` on((`o`.`OrderID` = `od`.`OrderID`))) left join `orderstatus` `os` on((`o`.`OrderStatusID` = `os`.`StatusID`))) left join `products` `p` on((`od`.`ProductID` = `p`.`ProductID`))) order by `o`.`OrderDate` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quantityinwarehouse`
--

/*!50001 DROP VIEW IF EXISTS `quantityinwarehouse`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quantityinwarehouse` AS select `p`.`ProductName` AS `ProductName`,sum(`ws`.`Quantity`) AS `TotalQuantity` from (`products` `p` left join `warehousestatus` `ws` on((`p`.`ProductID` = `ws`.`ProductID`))) group by `p`.`ProductID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `showmonthlysalary`
--

/*!50001 DROP VIEW IF EXISTS `showmonthlysalary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showmonthlysalary` AS select `p`.`PersonalName` AS `PersonalName`,`r`.`WorkedHours` AS `WorkedHours`,(`s`.`€/hr` * `r`.`WorkedHours`) AS `Salary`,`r`.`Date` AS `Date` from ((`personal` `p` join `reportedhours` `r` on((`p`.`PersonalID` = `r`.`PersonalID`))) join `salary` `s` on((`p`.`SalaryID` = `s`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `showorderstatus`
--

/*!50001 DROP VIEW IF EXISTS `showorderstatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showorderstatus` AS select `c`.`CustomerName` AS `CustomerName`,`o`.`OrderID` AS `orderid`,`p`.`ProductName` AS `ProductName`,`od`.`Quantity` AS `Quantity`,`os`.`StatusName` AS `StatusName`,`o`.`ShippingDate` AS `ShippingDate`,`ps`.`StatusName` AS `Payment` from (((((`customers` `c` left join `orders` `o` on((`c`.`CustomerID` = `o`.`CustomerID`))) left join `orderdetails` `od` on((`o`.`OrderID` = `od`.`OrderID`))) left join `orderstatus` `os` on((`o`.`OrderStatusID` = `os`.`StatusID`))) left join `products` `p` on((`od`.`ProductID` = `p`.`ProductID`))) left join `paystatus` `ps` on((`o`.`PayStatus` = `ps`.`ID`))) where ((`o`.`OrderID` is not null) and (`os`.`StatusName` <> 'delivered')) */;
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

-- Dump completed on 2022-02-14 17:09:25
