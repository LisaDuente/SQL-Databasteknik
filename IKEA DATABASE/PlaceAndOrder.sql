CREATE DEFINER=`root`@`localhost` PROCEDURE `placeAnOrder`(CID INT, PID INT, OQuantity INT, PreferredShipper INT )
BEGIN
DECLARE tempQuantity INT;
IF (SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID = PID) >= OQuantity THEN
	UPDATE WarehouseStatus SET Quantity = (Quantity - OQuantity) WHERE ProductID = PID AND WarehouseID = 1;
	INSERT INTO Orders VALUES(NULL, CID, NOW(),NULL, PreferredShipper, 3);
	INSERT INTO OrderDetails VALUES ((SELECT MAX(OrderID) FROM Orders),PID,(SELECT Price FROM Products WHERE ProductID = PID), OQuantity);
ELSEIF (SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 2 AND ProductID = PID) >= OQuantity THEN
	UPDATE WarehouseStatus SET Quantity = (Quantity - OQuantity) WHERE ProductID = PID AND WarehouseID = 2;
	INSERT INTO Orders VALUES(NULL, CID, NOW(),NULL, PreferredShipper, 3);
	INSERT INTO OrderDetails VALUES ((SELECT MAX(OrderID) FROM Orders),PID,(SELECT Price FROM Products WHERE ProductID = PID), OQuantity);
ELSEIF ((SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 2 AND ProductID = PID)+(SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID = PID))>=OQuantity THEN
-- take all product from warehouse1
    SET tempQuantity = ((SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID = PID)-OQuantity);
	UPDATE WarehouseStatus SET Quantity = 0 WHERE ProductID = PID AND WarehouseID = 1;
    -- take the rest of the products from warehouse 2
	UPDATE WarehouseStatus SET Quantity = (Quantity - ABS(tempQuantity)) WHERE WarehouseID =2 AND ProductID = PID;
    INSERT INTO Orders VALUES(NULL, CID, NOW(),NULL, PreferredShipper, 3);
	INSERT INTO OrderDetails VALUES ((SELECT MAX(OrderID) FROM Orders),PID,(SELECT Price FROM Products WHERE ProductID = PID), OQuantity);
END IF;
END