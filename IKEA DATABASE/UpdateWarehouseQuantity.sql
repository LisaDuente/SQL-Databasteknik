CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateWarehouse`(W1Quantity INT, thisProduct INT, Quantity INT)
BEGIN
	IF W1Quantity > 0 THEN
		-- take everything in warehouse 1
        SET @tempQuantity := (W1Quantity-Quantity);
		UPDATE WarehouseStatus SET Quantity = 0 WHERE ProductID = thisProduct AND WarehouseID = 1;
		-- take the rest of the products from warehouse 2
		UPDATE WarehouseStatus SET WarehouseStatus.Quantity = (WarehouseStatus.Quantity - @tempQuantity) WHERE WarehouseID =2 AND ProductID = thisProduct;
	ELSE 
		UPDATE WarehouseStatus SET WarehouseStatus.Quantity = (WarehouseStatus.Quantity - quantity) WHERE ProductID = thisProduct AND WarehouseID = 2;
	END IF;
END