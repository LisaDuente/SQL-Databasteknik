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
-- Dumping events for database 'ikea'
--

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

RETURN (SELECT (COUNT(ID)+1)
FROM Adresses);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkQuantity2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkQuantity2`(PID INT, Quantity INT, INOUT checker INT)
BEGIN
SELECT @inStock := SUM(WarehouseStatus.Quantity) FROM WarehouseStatus WHERE ProductID = PID;
IF Quantity > @inStock THEN
	Rollback;
    SET checker = 0;
END IF;
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
/*!50003 DROP PROCEDURE IF EXISTS `insertCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCustomer`(CName VARCHAR(255), CStreet VARCHAR(255), CHouseNr INT, CPostCode INT, CCity VARCHAR(255), CCountry VARCHAR(255), CPhone VARCHAR(255), CMail VARCHAR(255))
ADProcess: BEGIN

 -- DECLARE BoolCity INT;
-- DECLARE BoolPostcode TINYINT;
-- DECLARE BoolStreet TINYINT;

-- use case?
-- if everything exists
IF EXISTS(SELECT StreetName, HouseNr, Postcode, CityName, CountryName FROM adressView WHERE StreetName = CStreet AND HouseNR = CHouseNR AND PostCode = CPostCode AND CityName = CCity AND CountryName = CCountry) THEN
	INSERT INTO Customers 
		VALUES(NULL, CNAME, (SELECT ID FROM adressView AS DA WHERE DA.StreetName = CStreet AND DA.HouseNR = CHouseNR AND DA.PostCode = CPostCode AND CityName = CCity AND DA.CountryName = CCountry GROUP BY ID), CPhone, CMail);
        LEAVE ADProcess;
ELSE
	-- create new adress id?
    -- check the countryID, if its not in the databank, leave the process
	IF EXISTS(SELECT CountryName FROM Countries WHERE CountryName = CCountry) THEN
		SELECT @thisCountryID := ID FROM Countries WHERE CountryName = CCountry;
	ELSE
		LEAVE ADProcess;
	END IF;
    
    -- Check if the City is in the country, if not, add it and insert customer
    IF EXISTS(SELECT CityName FROM Cities WHERE CityName = CCity AND CountryID = @thisCountryID) THEN
		SELECT @thisCityID := CityID FROM Cities WHERE CityName = CCity AND CountryID = @thisCountryID;
	ELSE
		SELECT @tempCityID := MAX(CityId) + 1 FROM Cities;
		INSERT INTO Cities VALUES (@tempCityID, CCity, @thisCountryID);
        SELECT @tempPostCodeID := MAX(ID)+1 FROM PostCodes;
        INSERT INTO PostCodes VALUES (CPostCode, @tempCityID, @tempPostCodeID);
        SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @tempPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Customers VALUES (NULL, CName, @tempAdressID, CPhone, CMail);
        LEAVE ADProcess;
	END IF;
    
    IF EXISTS(SELECT PostCode FROM PostCodes WHERE PostCode = CPostCode AND CityID = @thisCityID) THEN
		SELECT @thisPostCodeID := ID FROM PostCodes WHERE PostCode = CPostCode AND CityID = @thisCityID;
	ELSE
		SELECT @tempPostCodeID := MAX(ID)+1 FROM PostCodes;
        INSERT INTO PostCodes VALUES (CPostCode, @thisCityID, @tempPostCodeID);
        SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @tempPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Customers VALUES (NULL, CName, @tempAdressID, CPhone, CMail);
        LEAVE ADProcess;
	END IF;
    
    IF EXISTS (SELECT StreetName FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR) THEN
		SELECT @thisStreetID := StreetID FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR;
	ELSE
		SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @thisPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Customers VALUES (NULL, CName, @tempAdressID, CPhone, CMail);
        LEAVE ADProcess;
	END IF;
		
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertDepartment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDepartment`(DName VARCHAR(255), CStreet VARCHAR(255), CHouseNr INT, CPostCode INT, CCity VARCHAR(255), CCountry VARCHAR(255), DHead VARCHAR(255))
ADProcess: BEGIN

-- if everything exists
IF EXISTS(SELECT StreetName, HouseNr, Postcode, CityName, CountryName FROM adressView WHERE StreetName = CStreet AND HouseNR = CHouseNR AND PostCode = CPostCode AND CityName = CCity AND CountryName = CCountry) THEN
    INSERT INTO Departments 
		VALUES(NULL, DName, DHead, (SELECT ID FROM adressView AS DA WHERE DA.StreetName = CStreet AND DA.HouseNR = CHouseNR AND DA.PostCode = CPostCode AND CityName = CCity AND DA.CountryName = CCountry GROUP BY ID));
        LEAVE ADProcess;
ELSE
    -- check the countryID, if its not in the databank, leave the process
	IF EXISTS(SELECT CountryName FROM Countries WHERE CountryName = CCountry) THEN
		SELECT @thisCountryID := ID FROM Countries WHERE CountryName = CCountry;
	ELSE
		LEAVE ADProcess;
	END IF;
    
    -- Check if the City is in the country, if not, add it and insert customer
    IF EXISTS(SELECT CityName FROM Cities WHERE CityName = CCity AND CountryID = @thisCountryID) THEN
		SELECT @thisCityID := CityID FROM Cities WHERE CityName = CCity AND CountryID = @thisCountryID;
	ELSE
		SELECT @tempCityID := MAX(CityId) + 1 FROM Cities;
		INSERT INTO Cities VALUES (@tempCityID, CCity, @thisCountryID);
        SELECT @tempPostCodeID := MAX(ID)+1 FROM PostCodes;
        INSERT INTO PostCodes VALUES (CPostCode, @tempCityID, @tempPostCodeID);
        SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @tempPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Departments VALUES (NULL, DName, DHead, @tempAdressID);
        LEAVE ADProcess;
	END IF;
    
    IF EXISTS(SELECT PostCode FROM PostCodes WHERE PostCode = CPostCode AND CityID = @thisCityID) THEN
		SELECT @thisPostCodeID := ID FROM PostCodes WHERE PostCode = CPostCode AND CityID = @thisCityID;
	ELSE
		SELECT @tempPostCodeID := MAX(ID)+1 FROM PostCodes;
        INSERT INTO PostCodes VALUES (CPostCode, @thisCityID, @tempPostCodeID);
        SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @tempPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Departments VALUES (NULL, DName, DHead, @tempAdressID);
        LEAVE ADProcess;
	END IF;
    
    IF EXISTS (SELECT StreetName FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR) THEN
		SELECT @thisStreetID := StreetID FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR;
	ELSE
		SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @thisPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Departments VALUES (NULL, DName, DHead, @tempAdressID);
        LEAVE ADProcess;
	END IF;
		
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
/*!50003 DROP PROCEDURE IF EXISTS `insertPersonal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPersonal`(PName VARCHAR(255), CStreet VARCHAR(255), CHouseNr INT, CPostCode INT, CCity VARCHAR(255), CCountry VARCHAR(255), PDepartment INT, PPhone VARCHAR (255), PEmail VARCHAR (255), PPosition VARCHAR(255), PSalary INT)
ADProcess: BEGIN

-- if everything exists
IF EXISTS(SELECT StreetName, HouseNr, Postcode, CityName, CountryName FROM adressView WHERE StreetName = CStreet AND HouseNR = CHouseNR AND PostCode = CPostCode AND CityName = CCity AND CountryName = CCountry) THEN
    INSERT INTO Personal
		VALUES(NULL, PName, (SELECT ID FROM adressView AS DA WHERE DA.StreetName = CStreet AND DA.HouseNR = CHouseNR AND DA.PostCode = CPostCode AND CityName = CCity AND DA.CountryName = CCountry GROUP BY ID), PDepartment, PPhone, PEmail, PPosition, PSalary);
        LEAVE ADProcess;
ELSE
    -- check the countryID, if its not in the databank, leave the process
	IF EXISTS(SELECT CountryName FROM Countries WHERE CountryName = CCountry) THEN
		SELECT @thisCountryID := ID FROM Countries WHERE CountryName = CCountry;
	ELSE
		LEAVE ADProcess;
	END IF;
    
    -- Check if the City is in the country, if not, add it and insert customer
    IF EXISTS(SELECT CityName FROM Cities WHERE CityName = CCity AND CountryID = @thisCountryID) THEN
		SELECT @thisCityID := CityID FROM Cities WHERE CityName = CCity AND CountryID = @thisCountryID;
	ELSE
		SELECT @tempCityID := MAX(CityId) + 1 FROM Cities;
		INSERT INTO Cities VALUES (@tempCityID, CCity, @thisCountryID);
        SELECT @tempPostCodeID := MAX(ID)+1 FROM PostCodes;
        INSERT INTO PostCodes VALUES (CPostCode, @tempCityID, @tempPostCodeID);
        SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @tempPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Personal VALUES (NULL, PName, @tempAdressID, PDepartment, PPhone, PEmail, PPosition, PSalary);
        LEAVE ADProcess;
	END IF;
    
    IF EXISTS(SELECT PostCode FROM PostCodes WHERE PostCode = CPostCode AND CityID = @thisCityID) THEN
		SELECT @thisPostCodeID := ID FROM PostCodes WHERE PostCode = CPostCode AND CityID = @thisCityID;
	ELSE
		SELECT @tempPostCodeID := MAX(ID)+1 FROM PostCodes;
        INSERT INTO PostCodes VALUES (CPostCode, @thisCityID, @tempPostCodeID);
        SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @tempPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Personal VALUES (NULL, PName, @tempAdressID, PDepartment, PPhone, PEmail, PPosition, PSalary);
        LEAVE ADProcess;
	END IF;
    
    IF EXISTS (SELECT StreetName FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR) THEN
		SELECT @thisStreetID := StreetID FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR;
	ELSE
		SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @thisPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Personal VALUES (NULL, PName, @tempAdressID, PDepartment, PPhone, PEmail, PPosition, PSalary);
        LEAVE ADProcess;
	END IF;
		
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertShipper` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertShipper`(SName VARCHAR(255), CStreet VARCHAR(255), CHouseNr INT, CPostCode INT, CCity VARCHAR(255), CCountry VARCHAR(255),SPhone VARCHAR(255))
ADProcess: BEGIN

-- if everything exists
IF EXISTS(SELECT StreetName, HouseNr, Postcode, CityName, CountryName FROM adressView WHERE StreetName = CStreet AND HouseNR = CHouseNR AND PostCode = CPostCode AND CityName = CCity AND CountryName = CCountry) THEN
    INSERT INTO Shippers
		VALUES(NULL, SName, (SELECT ID FROM adressView AS DA WHERE DA.StreetName = CStreet AND DA.HouseNR = CHouseNR AND DA.PostCode = CPostCode AND CityName = CCity AND DA.CountryName = CCountry GROUP BY ID), SPhone);
        LEAVE ADProcess;
ELSE
    -- check the countryID, if its not in the databank, leave the process
	IF EXISTS(SELECT CountryName FROM Countries WHERE CountryName = CCountry) THEN
		SELECT @thisCountryID := ID FROM Countries WHERE CountryName = CCountry;
	ELSE
		LEAVE ADProcess;
	END IF;
    
    -- Check if the City is in the country, if not, add it and insert customer
    IF EXISTS(SELECT CityName FROM Cities WHERE CityName = CCity AND CountryID = @thisCountryID) THEN
		SELECT @thisCityID := CityID FROM Cities WHERE CityName = CCity AND CountryID = @thisCountryID;
	ELSE
		SELECT @tempCityID := MAX(CityId) + 1 FROM Cities;
		INSERT INTO Cities VALUES (@tempCityID, CCity, @thisCountryID);
        SELECT @tempPostCodeID := MAX(ID)+1 FROM PostCodes;
        INSERT INTO PostCodes VALUES (CPostCode, @tempCityID, @tempPostCodeID);
        SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @tempPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Shippers VALUES (NULL, SName, @tempAdressID, SPhone);
        LEAVE ADProcess;
	END IF;
    
    IF EXISTS(SELECT PostCode FROM PostCodes WHERE PostCode = CPostCode AND CityID = @thisCityID) THEN
		SELECT @thisPostCodeID := ID FROM PostCodes WHERE PostCode = CPostCode AND CityID = @thisCityID;
	ELSE
		SELECT @tempPostCodeID := MAX(ID)+1 FROM PostCodes;
        INSERT INTO PostCodes VALUES (CPostCode, @thisCityID, @tempPostCodeID);
        SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @tempPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Shippers VALUES (NULL, SName, @tempAdressID, SPhone);
        LEAVE ADProcess;
	END IF;
    
    IF EXISTS (SELECT StreetName FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR) THEN
		SELECT @thisStreetID := StreetID FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR;
	ELSE
		SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @thisPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Shippers VALUES (NULL, SName, @tempAdressID, SPhone);
        LEAVE ADProcess;
	END IF;
		
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertWarehouse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertWarehouse`(WName VARCHAR(255),CStreet VARCHAR(255), CHouseNr INT, CPostCode INT, CCity VARCHAR(255), CCountry VARCHAR(255))
ADProcess: BEGIN

-- if everything exists
IF EXISTS(SELECT StreetName, HouseNr, Postcode, CityName, CountryName FROM adressView WHERE StreetName = CStreet AND HouseNR = CHouseNR AND PostCode = CPostCode AND CityName = CCity AND CountryName = CCountry) THEN
    INSERT INTO Warehouse
		VALUES(NULL, (SELECT ID FROM adressView AS DA WHERE DA.StreetName = CStreet AND DA.HouseNR = CHouseNR AND DA.PostCode = CPostCode AND CityName = CCity AND DA.CountryName = CCountry GROUP BY ID), WName);
        LEAVE ADProcess;
ELSE
    -- check the countryID, if its not in the databank, leave the process
	IF EXISTS(SELECT CountryName FROM Countries WHERE CountryName = CCountry) THEN
		SELECT @thisCountryID := ID FROM Countries WHERE CountryName = CCountry;
	ELSE
		LEAVE ADProcess;
	END IF;
    
    -- Check if the City is in the country, if not, add it and insert customer
    IF EXISTS(SELECT CityName FROM Cities WHERE CityName = CCity AND CountryID = @thisCountryID) THEN
		SELECT @thisCityID := CityID FROM Cities WHERE CityName = CCity AND CountryID = @thisCountryID;
	ELSE
		SELECT @tempCityID := MAX(CityId) + 1 FROM Cities;
		INSERT INTO Cities VALUES (@tempCityID, CCity, @thisCountryID);
        SELECT @tempPostCodeID := MAX(ID)+1 FROM PostCodes;
        INSERT INTO PostCodes VALUES (CPostCode, @tempCityID, @tempPostCodeID);
        SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @tempPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Warehouse VALUES (NULL, @tempAdressID, WName);
        LEAVE ADProcess;
	END IF;
    
    IF EXISTS(SELECT PostCode FROM PostCodes WHERE PostCode = CPostCode AND CityID = @thisCityID) THEN
		SELECT @thisPostCodeID := ID FROM PostCodes WHERE PostCode = CPostCode AND CityID = @thisCityID;
	ELSE
		SELECT @tempPostCodeID := MAX(ID)+1 FROM PostCodes;
        INSERT INTO PostCodes VALUES (CPostCode, @thisCityID, @tempPostCodeID);
        SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @tempPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Warehouse VALUES (NULL, @tempAdressID, WName);
        LEAVE ADProcess;
	END IF;
    
    IF EXISTS (SELECT StreetName FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR) THEN
		SELECT @thisStreetID := StreetID FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR;
	ELSE
		SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @thisPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
        INSERT INTO Warehouse VALUES (NULL, @tempAdressID, WName);
        LEAVE ADProcess;
	END IF;
		
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PlaceMultipleOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PlaceMultipleOrders`(IN CID INT, IN ProductIDs VARCHAR(255), IN Quantities VARCHAR(255), PreferredShipper VARCHAR(255))
Place: BEGIN
	SELECT @totalNumberOfProducts := LENGTH(ProductIDs) - LENGTH(REPLACE(ProductIDs, ',', '')) + 1;
	SET @currentCount := 1;
	SELECT @newOrderID := MAX(OrderID)+1 FROM Orders;

	START TRANSACTION;
	INSERT INTO Orders VALUES(@newOrderID, CID, NOW(),NULL, PreferredShipper, 3,1);
    
    WHILE @currentCount <= @totalNumberOfProducts DO
    
		SET @thisProductString := SUBSTRING_INDEX(SUBSTRING_INDEX(productIDs,",", @currentCount),",", -1);
		SET @thisProduct := CAST(@thisProductString AS UNSIGNED);
		SET @quantityString := SUBSTRING_INDEX(SUBSTRING_INDEX(Quantities,",", @currentCount),",", -1);
		SET @quantity := CAST(@quantityString AS UNSIGNED);
        SET @checker := 1;
    
		-- check if both warehouses have enough products if not, the order ends here
		CALL checkQuantity2(@thisProduct, @quantity, @checker);
        IF @checker = 0 THEN
			LEAVE Place;
		END IF;
		SELECT @W1Quantity := Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID = @thisProduct;
		-- update both warehouses
		CALL UpdateWarehouse(@W1Quantity,@thisProduct, @quantity);
        SELECT @thisPrice := Price FROM Products WHERE ProductId = @thisProduct;
        INSERT INTO orderdetails VALUES (@newOrderID, @thisProduct, @thisPrice, @quantity);
        SET @currentCount = @currentCount + 1;
    
    END WHILE;
    COMMIT;
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
/*!50003 DROP PROCEDURE IF EXISTS `UpdateWarehouse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateWarehouse`(W1Quantity INT, thisProduct INT, Quantity INT)
BEGIN
	IF W1Quantity > 0 THEN
		-- take everything in warehouse 1
        SET @tempQuantity := ABS(W1Quantity-Quantity);
		UPDATE WarehouseStatus SET Quantity = 0 WHERE ProductID = thisProduct AND WarehouseID = 1;
		-- take the rest of the products from warehouse 2
		UPDATE WarehouseStatus SET Quantity = (Quantity - @tempQuantity) WHERE WarehouseID =2 AND ProductID = thisProduct;
	ELSE 
		UPDATE WarehouseStatus SET Quantity = (Quantity - quantity) WHERE ProductID = thisProduct AND WarehouseID = 2;
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

-- Dump completed on 2022-02-14 15:50:00
