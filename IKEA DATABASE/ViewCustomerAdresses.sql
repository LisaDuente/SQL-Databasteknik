CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `customeradresses` AS
    SELECT 
        `c`.`CustomerName` AS `CustomerName`,
        `s`.`StreetName` AS `StreetName`,
        `s`.`HouseNr` AS `HouseNr`,
        `p`.`PostCode` AS `PostCode`,
        `ci`.`CityName` AS `CityName`,
        `co`.`CountryName` AS `CountryName`
    FROM
        (((((`customers` `c`
        LEFT JOIN `adresses` `a` ON ((`c`.`AdressID` = `a`.`ID`)))
        LEFT JOIN `streets` `s` ON ((`a`.`StreetID` = `s`.`StreetID`)))
        LEFT JOIN `postcodes` `p` ON ((`s`.`PostCodeID` = `p`.`ID`)))
        LEFT JOIN `cities` `ci` ON ((`p`.`CityID` = `ci`.`CityID`)))
        LEFT JOIN `countries` `co` ON ((`ci`.`CountryID` = `co`.`ID`)))