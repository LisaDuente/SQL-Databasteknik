CREATE DEFINER=`root`@`localhost` PROCEDURE `checkQuantity1`(WID INT, PID INT, Quantity INT)
BEGIN
SELECT @inStock := Quantity FROM WarehouseStatus WHERE ProductID = PID AND WarehouseID = WID;
IF Quantity > @inStock THEN
	Rollback;
END IF;
END