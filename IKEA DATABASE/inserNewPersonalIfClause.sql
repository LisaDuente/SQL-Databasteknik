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
END