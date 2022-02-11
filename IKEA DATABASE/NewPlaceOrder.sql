CREATE PROCEDURE `PlaceAMultipleOrder` (IN CID INT, IN ProductIDs VARCHAR(255), IN Quantities VARCHAR(255))
BEGIN
	SELECT @totalNumberOfProducts := LENGTH(products) - LENGTH(REPLACE(products, ',', '')) + 1;
	SET @currentCount := 1;
	SELECT @newOrderID := MAX(OrderID)+1 FROM Orders;

	START TRANSACTION;
	INSERT INTO Orders VALUES(NULL, CID, NOW(),NULL, PreferredShipper, 3,1);
    
    WHILE @currentCount <= @totalNumberOfProducts DO
    
    SET @thisProductString := SUBSTRING_INDEX(SUBSTRING_INDEX(productIDs,",", @currentCount),",", -1);
    SET @thisProduct := CAST(@thisProductString AS UNSIGNED);
	SET @quantityString := SUBSTRING_INDEX(SUBSTRING_INDEX(Quantities,",", @currentCount),",", -1);
    SET @quantity := CAST(@quantityString AS UNSIGNED);
    
    SELECT @quantityInBoth := SUM(Quantity) FROM WarehouseStatus WHERE ProductID = @thisProduct;
    -- check if both warehouses have enough products if not, the order ends here
    CALL checkQuantity2(@thisProduct, @quantityInBoth);
    
    
    SELECT @tempQuantity := ((SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID = @thisProduct)-@quantity);
    SELECT @W1Quantity := Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID = @thisProduct;
    SELECT @W2Quantity := Quantity FROM WarehouseStatus WHERE WarehouseID = 2 AND ProductID = @thisProduct;
    
    -- This is something I have to think about
    IF @tempQuantity < 0 AND @W1Quantity > 0 THEN
		-- take everything in warehouse 1
		UPDATE WarehouseStatus SET Quantity = 0 WHERE ProductID = CAST(@thisPID AS UNSIGNED) AND WarehouseID = 1;
		-- take the rest of the products from warehouse 2
		UPDATE WarehouseStatus SET Quantity = (Quantity - ABS(@tempQuantity)) WHERE WarehouseID =2 AND ProductID = @thisProduct;
        
	ELSEIF @tempQuantity < 0 AND @W2Quantity > 0 THEN
		-- take everything in warehouse 1
		UPDATE WarehouseStatus SET Quantity = 0 WHERE ProductID = CAST(@thisPID AS UNSIGNED) AND WarehouseID = 2;
		-- take the rest of the products from warehouse 2
		UPDATE WarehouseStatus SET Quantity = (Quantity - ABS(@tempQuantity)) WHERE WarehouseID =2 AND ProductID = @thisProduct;
	ELSE
		-- just take Items from warehouse 1
		UPDATE WarehouseStatus SET Quantity = (Quantity - @quantity) WHERE ProductID = @thisProduct AND WarehouseID = 1;
		
		
    
END
