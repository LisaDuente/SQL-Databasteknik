CREATE DEFINER=`root`@`localhost` PROCEDURE `checkQuantity2`(PID INT, Quantity INT)
BEGIN
SELECT @inStock := SUM(Quantity) FROM WarehouseStatus WHERE ProductID = PID;
IF Quantity > @inStock THEN
	Rollback;
END IF;
END