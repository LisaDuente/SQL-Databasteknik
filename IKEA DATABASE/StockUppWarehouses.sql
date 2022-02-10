CREATE DEFINER=`root`@`localhost` PROCEDURE `StockUpp`(InWarehouseID INT, InProductID INT, NewQuantity INT)
BEGIN
UPDATE WarehouseStatus SET Quantity = (Quantity + NewQuantity) WHERE WarehouseID = InWarehouseID AND ProductID = InProductID;
INSERT INTO TransactionHistory VALUES(NULL, 2, NOW(), InProductID);
END