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
END