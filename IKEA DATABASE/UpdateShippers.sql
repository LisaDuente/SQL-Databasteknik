CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateShippers`(SID INT, CStreet VARCHAR(255), CHouseNr INT, CPostCode INT, CCity VARCHAR(255), CCountry VARCHAR(255))
ADProcess: BEGIN
-- if everything exists
IF EXISTS(SELECT StreetName, HouseNr, Postcode, CityName, CountryName FROM adressView WHERE StreetName = CStreet AND HouseNR = CHouseNR AND PostCode = CPostCode AND CityName = CCity AND CountryName = CCountry) THEN
	UPDATE Shippers 
		SET AdressID = (SELECT ID FROM adressView AS DA WHERE DA.StreetName = CStreet AND DA.HouseNR = CHouseNR AND DA.PostCode = CPostCode AND CityName = CCity AND DA.CountryName = CCountry GROUP BY ID) WHERE ShipperID = SID;
	INSERT INTO TransactionHistory VALUES(NULL, 3, NOW(),SID);
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
        UPDATE Shippers SET AdressID = @tempAdressID WHERE DepartmentID = SID;
        INSERT INTO TransactionHistory VALUES(NULL, 3, NOW(),SID);
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
		UPDATE Shippers SET AdressID = @tempAdressID WHERE DepartmentID = SID;
        INSERT INTO TransactionHistory VALUES(NULL, 3, NOW(),SID);
        LEAVE ADProcess;
	END IF;
    
    IF EXISTS (SELECT StreetName FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR) THEN
		SELECT @thisStreetID := StreetID FROM Streets WHERE PostCodeID = @thisPostCodeID AND Streetname = CStreet AND HouseNR = CHouseNR;
	ELSE
		SELECT @tempStreetID := MAX(StreetID)+1 FROM Streets;
        INSERT INTO Streets VALUES (@tempStreetID, @thisPostCodeId, CStreet, CHouseNR);
        SELECT @tempAdressID := createAdressID();
        INSERT INTO Adresses VALUES (@tempAdressID, @tempStreetID);
		UPDATE Shippers SET AdressID = @tempAdressID WHERE DepartmentID = SID;
        INSERT INTO TransactionHistory VALUES(NULL, 3, NOW(),SID);
        LEAVE ADProcess;
	END IF;
		
END IF;
END