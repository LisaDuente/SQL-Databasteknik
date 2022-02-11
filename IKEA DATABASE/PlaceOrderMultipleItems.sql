CREATE DEFINER=`root`@`localhost` PROCEDURE `placeAnOrder`(CID INT, PIDs VARCHAR(255), OQuantities VARCHAR(255), PreferredShipper INT )
BEGIN
DECLARE tempQuantity INT;
SELECT @newOrderID := MAX(OrderID)+1 FROM Orders;
SELECT @totalProductCount := LENGTH(PIDs)-LENGTH(REPLACE(PIDs,',',''))+1;

SET AUTOCOMMIT = 0;
INSERT INTO Orders VALUES(NULL, CID, NOW(),NULL, PreferredShipper, 3,1);

START TRANSACTION;
SET @currentCount := 1;
WHILE @currentCount <= @totalProductCount DO

	IF (SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID = CAST(@thisPID AS UNSIGNED)) >= @IntQuantity THEN
		-- split to geht all the seperate PIDs from the string
		SET @thisPID := SUBSTRING_INDEX(SUBSTRING_INDEX(PIDs,',',@currentCount),',',-1);
		SET @thisQuantity := SUBSTRING_INDEX(SUBSTRING_INDEX(OQuantities,',',@currentCount),',',-1);
		SET @IntQuantity := CAST(@thisQuantity AS UNSIGNED);
        
		UPDATE WarehouseStatus SET Quantity = (Quantity - @IntQuantity) WHERE ProductID = CAST(@thisPID AS UNSIGNED) AND WarehouseID = 1;
		INSERT INTO OrderDetails VALUES (@newOrderID,CAST(@thisPID AS UNSIGNED),(SELECT Price FROM Products WHERE ProductID = @thisPID), @IntQuantity);
		SELECT @currentCount := @currentCount + 1;
    
	ELSEIF (SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 2 AND ProductID = CAST(@thisPID AS UNSIGNED)) >= @IntQuantity THEN
		-- split to geht all the seperate PIDs from the string
		SET @thisPID := SUBSTRING_INDEX(SUBSTRING_INDEX(PIDs,',',@currentCount),',',-1);
		SET @thisQuantity := SUBSTRING_INDEX(SUBSTRING_INDEX(OQuantities,',',@currentCount),',',-1);
		SET @IntQuantity := CAST(@thisQuantity AS UNSIGNED);
        
		UPDATE WarehouseStatus SET Quantity = (Quantity - @IntQuantity) WHERE ProductID = CAST(@thisPID AS UNSIGNED) AND WarehouseID = 2;
		INSERT INTO OrderDetails VALUES (@newOrderID,CAST(@thisPID AS UNSIGNED),(SELECT Price FROM Products WHERE ProductID = CAST(@thisPID AS UNSIGNED)), @IntQuantity);
		SELECT @currentCount := @currentCount + 1;
    
	ELSEIF ((SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 2 AND ProductID = CAST(@thisPID AS UNSIGNED))+
		(SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID = CAST(@thisPID AS UNSIGNED)))>=@IntQuantity THEN
        -- split to geht all the seperate PIDs from the string
		SET @thisPID := SUBSTRING_INDEX(SUBSTRING_INDEX(PIDs,',',@currentCount),',',-1);
		SET @thisQuantity := SUBSTRING_INDEX(SUBSTRING_INDEX(OQuantities,',',@currentCount),',',-1);
		SET @IntQuantity := CAST(@thisQuantity AS UNSIGNED);
        
		-- take all product from warehouse1
		SET tempQuantity = ((SELECT Quantity FROM WarehouseStatus WHERE WarehouseID = 1 AND ProductID =CAST(@thisPID AS UNSIGNED))-@IntQuantity);
		UPDATE WarehouseStatus SET Quantity = 0 WHERE ProductID = CAST(@thisPID AS UNSIGNED) AND WarehouseID = 1;
		-- take the rest of the products from warehouse 2
		UPDATE WarehouseStatus SET Quantity = (Quantity - ABS(tempQuantity)) WHERE WarehouseID =2 AND ProductID = CAST(@thisPID AS UNSIGNED);
		INSERT INTO OrderDetails VALUES (@newOrderID,CAST(@thisPID AS UNSIGNED),(SELECT Price FROM Products WHERE ProductID = CAST(@thisPID AS UNSIGNED)), @IntQuantity);
         SET @currentCount := @currentCount + 1;
	ELSE	
		ROLLBACK;
	END IF;
END WHILE;
COMMIT;
SET autocommit = 1;
END