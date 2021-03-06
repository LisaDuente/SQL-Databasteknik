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
/*!50001 VIEW `showmonthlysalary` AS select `p`.`PersonalName` AS `PersonalName`,`r`.`WorkedHours` AS `WorkedHours`,(`s`.`???/hr` * `r`.`WorkedHours`) AS `Salary`,`r`.`Date` AS `Date` from ((`personal` `p` join `reportedhours` `r` on((`p`.`PersonalID` = `r`.`PersonalID`))) join `salary` `s` on((`p`.`SalaryID` = `s`.`ID`))) */;
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
/*!50003 DROP PROCEDURE IF EXISTS `insertBankinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertBankinfo`(CID INT, CIBAN VARCHAR(255), CBIC VARCHAR(255), CKreditNr INT, CKreditcode INT)
BEGIN
INSERT INTO BankInformation 
VALUES(CID, AES_ENCRYPT(CONCAT(CIBAN,CID), "123Test"),AES_ENCRYPT(CONCAT(CBIC,CID), "123Test"),AES_ENCRYPT(CONCAT(CIBAN,CID), "123Test"),
		AES_ENCRYPT(CONCAT(CKreditNr,CID), "123Test"),AES_ENCRYPT(CONCAT(CKreditcode,CID), "123Test"));
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
/*!50003 DROP PROCEDURE IF EXISTS `placeAnOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `placeAnOrder`(CID INT, PIDs VARCHAR(255), OQuantities VARCHAR(255), PreferredShipper INT )
BEGIN
DECLARE tempQuantity INT;
SELECT @newOrderID := MAX(OrderID)+1 FROM Orders;
SELECT @totalProductCount := LENGTH(PIDs)-LENGTH(REPLACE(PIDs,',',''))+1;

SET AUTOCOMMIT = 0;
INSERT INTO Orders VALUES(NULL, CID, NOW(),NULL, PreferredShipper, 3,1);

START TRANSACTION;
SET @currentCount := 1;
WHILE @currentCount <= @totalProductCount DO
	-- split to geht all the seperate PIDs from the string

	IF (SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID = CAST(@thisPID AS UNSIGNED)) >= @IntQuantity THEN
    
		SET @thisPID := SUBSTRING_INDEX(SUBSTRING_INDEX(PIDs,',',@currentCount),',',-1);
		SET @thisQuantity := SUBSTRING_INDEX(SUBSTRING_INDEX(OQuantities,',',@currentCount),',',-1);
		SET @IntQuantity := CAST(@thisQuantity AS UNSIGNED);
        
		UPDATE WarehouseStatus SET Quantity = (Quantity - @IntQuantity) WHERE ProductID = CAST(@thisPID AS UNSIGNED) AND WarehouseID = 1;
		INSERT INTO OrderDetails VALUES (@newOrderID,CAST(@thisPID AS UNSIGNED),(SELECT Price FROM Products WHERE ProductID = @thisPID), @IntQuantity);
		SELECT @currentCount := @currentCount + 1;
    
	ELSEIF (SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 2 AND ProductID = CAST(@thisPID AS UNSIGNED)) >= @IntQuantity THEN
    
		SET @thisPID := SUBSTRING_INDEX(SUBSTRING_INDEX(PIDs,',',@currentCount),',',-1);
		SET @thisQuantity := SUBSTRING_INDEX(SUBSTRING_INDEX(OQuantities,',',@currentCount),',',-1);
		SET @IntQuantity := CAST(@thisQuantity AS UNSIGNED);
        
		UPDATE WarehouseStatus SET Quantity = (Quantity - @IntQuantity) WHERE ProductID = CAST(@thisPID AS UNSIGNED) AND WarehouseID = 2;
		INSERT INTO OrderDetails VALUES (@newOrderID,CAST(@thisPID AS UNSIGNED),(SELECT Price FROM Products WHERE ProductID = CAST(@thisPID AS UNSIGNED)), @IntQuantity);
		SELECT @currentCount := @currentCount + 1;
    
	ELSEIF ((SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 2 AND ProductID = CAST(@thisPID AS UNSIGNED))+
		(SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID = CAST(@thisPID AS UNSIGNED)))>=@IntQuantity THEN
        
		SET @thisPID := SUBSTRING_INDEX(SUBSTRING_INDEX(PIDs,',',@currentCount),',',-1);
		SET @thisQuantity := SUBSTRING_INDEX(SUBSTRING_INDEX(OQuantities,',',@currentCount),',',-1);
		SET @IntQuantity := CAST(@thisQuantity AS UNSIGNED);
        
		-- take all product from warehouse1
		SET tempQuantity = ((SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID =CAST(@thisPID AS UNSIGNED))-@IntQuantity);
		UPDATE WarehouseStatus SET Quantity = 0 WHERE ProductID = CAST(@thisPID AS UNSIGNED) AND WarehouseID = 1;
		-- take the rest of the products from warehouse 2
		UPDATE WarehouseStatus SET Quantity = (Quantity - ABS(tempQuantity)) WHERE WarehouseID =2 AND ProductID = CAST(@thisPID AS UNSIGNED);
		INSERT INTO OrderDetails VALUES (@newOrderID,CAST(@thisPID AS UNSIGNED),(SELECT Price FROM Products WHERE ProductID = CAST(@thisPID AS UNSIGNED)), @IntQuantity);
         SET @currentCount := @currentCount + 1;
	ELSE	
		ROLLBACK;
	END IF;
END WHILE;
COMMIT;
SET autocommit = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StockUpp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StockUpp`(InWarehouseID INT, InProductID INT, NewQuantity INT)
BEGIN
UPDATE WarehouseStatus SET Quantity = (Quantity + NewQuantity) WHERE WarehouseID = InWarehouseID AND ProductID = InProductID;
INSERT INTO TransactionHistory VALUES(NULL, 2, NOW(), InProductID);
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

-- Dump completed on 2022-02-11 15:48:50
