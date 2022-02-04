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
END