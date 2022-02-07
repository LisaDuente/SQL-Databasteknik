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
END