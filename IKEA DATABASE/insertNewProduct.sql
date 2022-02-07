CREATE DEFINER=`root`@`localhost` PROCEDURE `insertNewProduct`(PName VARCHAR (255), PTYpe VARCHAR (255), PLength FLOAT, PWidth FLOAT, PHeight FLOAT, PWeight FLOAT, PColor VARCHAR (255),PPrice FLOAT, PWareHouseID INT, PQuantity INT)
BEGIN
DECLARE WProductID INT;
INSERT INTO Products VALUES (NULL, PName, PType, PLength, PWidth, PHeight, PWeight, PColor ,PPrice);
SET WProductID = (SELECT MAX(ProductID) FROM Products);
INSERT INTO WarehouseStatus VALUES (PWareHouseID, WProductID, PQuantity);
END