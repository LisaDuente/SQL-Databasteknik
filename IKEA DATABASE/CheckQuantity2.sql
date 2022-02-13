CREATE DEFINER=`root`@`localhost` PROCEDURE `checkQuantity2`(PID INT, Quantity INT, INOUT checker INT)
BEGIN
SELECT @inStock := SUM(WarehouseStatus.Quantity) FROM WarehouseStatus WHERE ProductID = PID;
IF Quantity > @inStock THEN
	Rollback;
    SET checker = 0;
END IF;
END