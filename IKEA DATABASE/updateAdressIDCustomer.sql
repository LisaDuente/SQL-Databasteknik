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
END