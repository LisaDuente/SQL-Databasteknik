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
-- Dumping routines for database 'ikea'
--
/*!50003 DROP FUNCTION IF EXISTS `createAdressID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `createAdressID`() RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

RETURN (SELECT CONCAT('A', (COUNT(ID)+1))
FROM Adresses);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertNewCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertNewCustomer`(Name VARCHAR (255), Phone VARCHAR (255), Email VARCHAR (255), CStreet VARCHAR (255), CHouseNr INT, CPostCode INT, CCity VARCHAR (255), CCountry VARCHAR (255))
BEGIN
DECLARE adressID VARCHAR(255);
SET adressID = createAdressID();
IF EXISTS(SELECT Street, HouseNr, PostCode, City, Country FROM adresses WHERE Street = CStreet AND HouseNr = CHouseNr AND PostCode = CPostcode AND City = CCity AND Country = CCountry) THEN
	INSERT INTO Customers VALUES (NULL, Name, (SELECT ID FROM adresses WHERE Street = CStreet AND HouseNr = CHouseNr AND PostCode = CPostcode AND City = CCity AND Country = CCountry), Phone, Email);
ELSE
	INSERT INTO adresses VALUES(adressID, CStreet, CHouseNr, CPostCode, CCity, CCountry);
	INSERT INTO Customers VALUES (NULL, Name, adressID, Phone, Email);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertNewDepartment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertNewDepartment`( DName VARCHAR (255), DHead VARCHAR(255), DStreet VARCHAR (255), DHouseNr INT, DPostCode INT, DCity VARCHAR (255), DCountry VARCHAR (255))
BEGIN
DECLARE adressID VARCHAR(255);
SET adressID = createAdressID();
IF EXISTS(SELECT Street, HouseNr, PostCode, City, Country FROM adresses WHERE Street = DStreet AND HouseNr = DHouseNr AND PostCode = DPostcode AND City = DCity AND Country = DCountry) THEN
	INSERT INTO Departments VALUES (NULL, DName, DHead, (SELECT ID FROM adresses WHERE Street = DStreet AND HouseNr = DHouseNr AND PostCode = DPostcode AND City = DCity AND Country = DCountry));
ELSE
	INSERT INTO adresses VALUES(adressID, DStreet, DHouseNr, DPostCode, DCity, DCountry);
	INSERT INTO Departments VALUES (NULL, DName, DHEAD, adressID);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertNewPersonal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertNewPersonal`(PName VARCHAR(255), PDepartment INT, Phone VARCHAR(255), Email VARCHAR(255), Position VARCHAR (255), SalaryID INT, PStreet VARCHAR (255), PHouseNr INT, PPostcode INT, PCity VARCHAR (255), PCountry VARCHAR (255))
BEGIN
DECLARE adressID VARCHAR(255);
SET adressID = createAdressID();
IF EXISTS(SELECT Street, HouseNr, PostCode, City, Country FROM adresses WHERE Street = PStreet AND HouseNr = PHouseNr AND PostCode = PPostcode AND City = PCity AND Country = PCountry) THEN
	INSERT INTO Personal VALUES (NULL, PName, (SELECT ID FROM adresses WHERE Street = PStreet AND HouseNr = PHouseNr AND PostCode = PPostcode AND City = PCity AND Country = PCountry), PDepartment, Phone, Email, Position, SalaryID);
ELSE
	INSERT INTO adresses VALUES(adressID, PStreet, PHouseNr, PPostCode, PCity, PCountry);
	INSERT INTO Personal VALUES (NULL, PName, adressID, PDepartment, Phone, Email, Position, SalaryID);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertNewProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertNewProduct`(PName VARCHAR (255), PType VARCHAR (255), PLength FLOAT, PWidth FLOAT, PHeight FLOAT, PWeight FLOAT, PColor VARCHAR (255),PPrice FLOAT, PWareHouseID INT, PQuantity INT)
BEGIN
DECLARE WProductID INT;
IF EXISTS(SELECT TypeID FROM ProductTypes WHERE TypeID = PType) THEN
INSERT INTO Products VALUES (NULL, PName, PType, PLength, PWidth, PHeight, PWeight, PColor ,PPrice);
SET WProductID = (SELECT MAX(ProductID) FROM Products);
INSERT INTO WarehouseStatus VALUES (PWareHouseID, WProductID, PQuantity);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertNewShipper` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertNewShipper`(shipperName VARCHAR(255), Phone VARCHAR(255), ShipperStreet VARCHAR (255), ShipperHouseNr INT, ShipperPostCode INT, ShipperCity VARCHAR (255), ShipperCountry VARCHAR (255))
BEGIN
DECLARE adressID VARCHAR(255);
SET adressID = createAdressID();
IF EXISTS(SELECT Street, HouseNr, PostCode, City, Country FROM adresses WHERE Street = ShipperStreet AND HouseNr = ShipperHouseNr AND PostCode = ShipperPostcode AND City = ShipperCity AND Country = ShipperCountry) THEN
	INSERT INTO shippers VALUES (NULL, shipperName, (SELECT ID FROM adresses WHERE Street = ShipperStreet AND HouseNr = ShipperHouseNr AND PostCode = ShipperPostcode AND City = ShipperCity AND Country = ShipperCountry), Phone);
ELSE
	INSERT INTO adresses VALUES(adressID, ShipperStreet, ShipperHouseNr, ShipperPostCode, ShipperCity, ShipperCountry);
	INSERT INTO shippers VALUES (NULL, shipperName, adressID, Phone);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertNewWarehouse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertNewWarehouse`(WName VARCHAR(255), WStreet VARCHAR (255), WHouseNr INT, WPostcode INT, WCity VARCHAR (255), WCountry VARCHAR (255))
BEGIN
DECLARE adressID VARCHAR(255);
SET adressID = createAdressID();
IF EXISTS(SELECT Street, HouseNr, PostCode, City, Country FROM adresses WHERE Street = WStreet AND HouseNr = WHouseNr AND PostCode = WPostcode AND City = WCity AND Country = WCountry) THEN
	INSERT INTO Warehouse VALUES (NULL, (SELECT ID FROM adresses WHERE Street = WStreet AND HouseNr = WHouseNr AND PostCode = WPostcode AND City = WCity AND Country = WCountry), WName);
ELSE
	INSERT INTO adresses VALUES(adressID, WStreet, WHouseNr, WPostCode, WCity, WCountry);
	INSERT INTO Warehouse VALUES (NULL, adressID, WName);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCustomerAdress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCustomerAdress`(CID INT, CStreet VARCHAR (255), CHouseNr INT, CPostCode INT, CCity VARCHAR (255), CCountry VARCHAR (255))
BEGIN
DECLARE adressIDC VARCHAR(255);
SET adressIDC = createAdressID();
IF EXISTS(SELECT Street, HouseNr, PostCode, City, Country FROM adresses WHERE Street = CStreet AND HouseNr = CHouseNr AND PostCode = CPostcode AND City = CCity AND Country = CCountry) THEN
    UPDATE customers SET AdressID = (SELECT ID FROM adresses WHERE Street = CStreet AND HouseNr = CHouseNr AND PostCode = CPostCode AND City = CCity AND Country = CCountry) WHERE CustomerID = CID;
ELSE
	INSERT INTO adresses VALUES(adressIDC, CStreet, CHouseNr, CPostCode, CCity, CCountry);
    UPDATE customers SET AdressID = adressIDC WHERE CustomerID = CID;
END IF;
END ;;
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

-- Dump completed on 2022-02-08 10:21:30
