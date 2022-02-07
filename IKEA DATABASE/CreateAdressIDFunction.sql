CREATE DEFINER=`root`@`localhost` FUNCTION `createAdressID`() RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

RETURN (SELECT CONCAT('A', (COUNT(ID)+1))
FROM Adresses);
END