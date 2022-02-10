CREATE PROCEDURE `InsertCustomers` (CName VARCHAR(255), CStreet VARCHAR(255), CHouseNr INT, CPostCode INT, CCity VARCHAR(255), CCountry VARCHAR(255), CPhone VARCHAR(255), CMail VARCHAR(255))
BEGIN

-- DECLARE BoolCity TINYINT;
-- DECLARE BoolPostcode TINYINT;
-- DECLARE BoolStreet TINYINT;

-- use case?
-- if everything exists
IF EXISTS(SELECT StreetName, HouseNr, Postcode, CityName, CountryName FROM customeradresses WHERE StreetName = CStreet AND HouseNR = CHouseNR AND PostCode = CPostCode AND CountryName = CCountry) THEN
	INSERT INTO Customers 
		VALUES(NULL, CNAME, (SELECT AdressID FROM Customers AS C LEFT JOIN Customeradresses AS CA ON C.CustomerID = CA.ID WHERE CA.StreetName = CStreet AND CA.HouseNR = CHouseNR AND CA.PostCode = CPostCode AND CA.CountryName = CCountry GROUP BY AdressID), CPhone, CMail);
ELSE
	IF EXISTS(SELECT CountryName FROM Countries WHERE CountryName = CCountry) THEN
		-- save the country id?
        -- no new country inserts (we just deliver to some countries)
	END IF;
    
    -- check if the ccityname is coppled with the country id
    -- if yes: save cityID, go to next check.
    -- if not: insert into city name + countryID, then save cityID, then insert postcode with cityID in Postcodes, then insert Streetname + Housenr + postcodeID in streets, then insert Streetid in adressid, END STATEMENT
    
    -- check if check if postcode is coppled with cityID
    -- if yes: save postcodeID, go check next
    -- if not: insert postcode and copple it with cityID, save postcodeID, insert into streets streetname, housenr + postcodeid, save streetid, then insert streetid in adresses END
    
    -- check if postcodeID is coppled with streetname+housenr
    -- if yes: save stretid
	-- if not: insert streetname + housenr + postcode in streets, save streetid, insert streetID in Adresses, save adressID
    
    
    

END IF;
END
