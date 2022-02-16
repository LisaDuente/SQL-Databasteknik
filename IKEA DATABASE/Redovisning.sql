-- INSERT AND UPDATE CUSTOMERS
	SELECT * FROM adressview WHERE StreetName = 'BlauBerg';
	CALL insertCustomer('Marie','Curie','BlauBerg',11,30179,'Hannover','Germany','01775647','SmartyParty@web.de');
    SELECT * FROM ikea.customers WHERE CustomerName = 'Marie' AND CustomerSurname = 'Curie';
    SELECT * FROM adressview WHERE ID = 1;
    CALL updateCustomer(11,'Nordhafen',7,1010,'Hirtshals','Denmark');
    SELECT * FROM customers  WHERE CustomerName = 'Marie' AND CustomerSurname = 'Curie';
    SELECT * FROM TransactionHistory WHERE `Type`= 3 AND `Reference` = 'C11';
    CALL insertBankinfo(11,'DE00 0000 0000 0000','HAHAHAHA','-','-');
    SELECT * FROM Bankinformation WHERE CustomerID = 11;

-- PLACE AN ORDER
	SELECT ProductID, Productname, Price FROM Products;
    SELECT * FROM Shippers WHERE ShipperName = 'BigBernd';
    SELECT * FROM quantityInWarehouse WHERE ID = 1 OR ID = 6 OR ID = 9;
	CALL PlaceMultipleOrders(11,'1,9,6','1,1,1',6); 
    SELECT * FROM Orders WHERE CustomerID = 10;
    SELECT * FROM Orderdetails WHERE OrderID = 47;
	SELECT * FROM quantityInWarehouse WHERE ID = 1 OR ID = 6 OR ID = 9;
    SELECT * FROM TransactionHistory WHERE `Type`= 1 AND `Reference` = 11;
    SELECT * FROM showOrderStatus WHERE OrderID = 47;
    UPDATE orders SET PayStatus = 2 WHERE OrderID = 47;
    UPDATE orders SET ShippingDate = NOW() WHERE OrderID = 47;
    UPDATE orders SET OrderStatusID = 2 WHERE OrderID = 47;
    SELECT * FROM showOrderStatus WHERE OrderID = 47;
    
-- DEMONSTRATE SOME VIEWS
	SELECT * FROM contactinfoemployees;
	SELECT * FROM showmonthlysalary;
    SELECT * FROM customeradresses;

-- LOOK UP THE CURRENT SALARY
	SELECT * from reportedhours;
	SELECT * FROM showmonthlysalary;
	SELECT Salary FROM ikea.showmonthlysalary WHERE `Date` IN (SELECT MAX(`Date`) FROM ikea.showmonthlysalary WHERE PersonalName = 'Georg');

-- HANDLE THE TRANSACTION HISTORY
	-- show when a product was delivered
	SELECT * FROM transactionhistory WHERE `Type` = 2 AND `Reference`= 1;