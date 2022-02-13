CREATE DEFINER=`root`@`localhost` PROCEDURE `PlaceMultipleOrders`(IN CID INT, IN ProductIDs VARCHAR(255), IN Quantities VARCHAR(255), PreferredShipper VARCHAR(255))
Place: BEGIN
	SELECT @totalNumberOfProducts := LENGTH(ProductIDs) - LENGTH(REPLACE(ProductIDs, ',', '')) + 1;
	SET @currentCount := 1;
	SELECT @newOrderID := MAX(OrderID)+1 FROM Orders;

	START TRANSACTION;
	INSERT INTO Orders VALUES(@newOrderID, CID, NOW(),NULL, PreferredShipper, 3,1);
    
    WHILE @currentCount <= @totalNumberOfProducts DO
    
		SET @thisProductString := SUBSTRING_INDEX(SUBSTRING_INDEX(productIDs,",", @currentCount),",", -1);
		SET @thisProduct := CAST(@thisProductString AS UNSIGNED);
		SET @quantityString := SUBSTRING_INDEX(SUBSTRING_INDEX(Quantities,",", @currentCount),",", -1);
		SET @quantity := CAST(@quantityString AS UNSIGNED);
        SET @checker := 1;
    
		-- check if both warehouses have enough products if not, the order ends here
		CALL checkQuantity2(@thisProduct, @quantity, @checker);
        IF @checker = 0 THEN
			LEAVE Place;
		END IF;
		SELECT @W1Quantity := Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID = @thisProduct;
		-- update both warehouses
		CALL UpdateWarehouse(@W1Quantity,@thisProduct, @quantity);
        SELECT @thisPrice := Price FROM Products WHERE ProductId = @thisProduct;
        INSERT INTO orderdetails VALUES (@newOrderID, @thisProduct, @thisPrice, @quantity);
        SET @currentCount = @currentCount + 1;
    
    END WHILE;
    COMMIT;
END