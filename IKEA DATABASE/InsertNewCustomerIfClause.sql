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
END