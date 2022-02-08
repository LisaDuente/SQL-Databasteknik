CREATE PROCEDURE `InsertCustomers` (CName VARCHAR(255), CStreet VARCHAR(255), CHouseNr INT, CPostCode INT, CCity VARCHAR(255), CCountry VARCHAR(255), CPhone VARCHAR(255), CMail VARCHAR(255))
BEGIN
-- use case?
-- if everything exists
IF EXISTS(SELECT StreetName, HouseNr, Postcode, CityName, CountryName FROM customeradresses WHERE StreetName = CStreet AND HouseNR = CHouseNR AND PostCode = CPostCode AND CountryName = CCountry) THEN
INSERT INTO Customers VALUES(NULL, CNAME, (SELECT AdressID FROM Customers AS C LEFT JOIN Customeradresses AS CA ON C.CustomerID = CA.ID WHERE CA.StreetName = CStreet AND CA.HouseNR = CHouseNR AND CA.PostCode = CPostCode AND CA.CountryName = CCountry), CPhone, CMail);
ELSE
-- use exists?
-- if street doesn't exist
-- if Housenr doesnt exist
-- if postcode doesn't exist
-- if city doesnt exist
-- if country doesnt exists

INSERT INTO Countries VALUES (Null, CCountry);
INSERT INTO Cities
END IF;
END
