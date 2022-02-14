USE Ikea;
SET autocommit = 0;
-- problems to solve:

-- QUESTIONS FOR HANDLEDNING:

-- THINGS TO DO
-- trigger update shippingstatus?
-- reflection
-- ER diagramm
-- Transaction History (Triggers for changin adresses)
-- procedures to update/change adresses
-- view for invoice kundname + productname + price + total ammount (when the date is the same) or just add it in orders?
-- make a repport from those views

-- alter tables
ALTER TABLE products CONVERT TO CHARACTER SET latin1; 
ALTER TABLE Orders ADD COLUMN Total FLOAT UNSIGNED;
ALTER TABLE BankInformation MODIFY COLUMN KreditCode VARCHAR(255); 

CALL insertNewProduct('Choclad Kudde','A',20,20,10,4,'Brown',5.99,2,20);

-- update various things
CALL updateCustomerAdress(2,'Bambelbinengarten',4,123456,'Stockholm','Sverige');
UPDATE Products SET PorductType = 'Lamp' WHERE ProductID = 7;

-- insert into bankinfo
INSERT INTO BankInformation VALUES (2,"lala","bärbel","234567890","123456");

-- Place to alter, delete and drop things
START TRANSACTION;

CALL insertShipper('FactoryFracters', 'Kopernikusstrasse', 27, 40192,'Holmstedt', 'Germany','01805 827394');
CALL insertWarehouse('Lager Hannover', 'Kniestrasse',15,'30167','Hannover','Germany');
CALL insertPersonal('Gabi Meyer', "Nordhafen",7,30159,"Hannover", "Germany",3,"0123456","Gabi@ganzgern.de","Azubi",3);
CALL insertDepartment('Comfort',"Nordhafen",7,30159,"Hannover", "Denmark",'Test4');
CALL InsertCustomer("Gnompfell","Nordhafen",7,30159,"Hannover", "Germany", "01568888","KatzenBaby@lol.de");
CALL PlaceMultipleOrders(2,"4,10","20,4",4);
CALL StockUpp(2,5,20);


DROP TABLE PERSONAL;
ALTER TABLE Products DROP COLUMN WarehouseStatus;
ALTER TABLE Warehouse ADD WarehouseName VARCHAR(255);
ALTER TABLE Personal DROP CONSTRAINT salaryID;

COMMIT;
ROLLBACK;

-- Select from various tables
SELECT SUM(Quantity) FROM WarehouseStatus WHERE ProductID = 4;
SELECT * FROM information_schema.TABLE_CONSTRAINTS;
SELECT * FROM Shippers;
SELECT * FROM Customers;
SELECT * FROM Departments;
SELECT * FROM Adresses;
SELECT * FROM Salary;
SELECT * FROM Personal;
SELECT * FROM Warehouse;
SELECT * FROM WarehouseStatus;
SELECT * FROM Products;
SELECT * FROM ProductTypes;
SELECT * FROM orderstatus;
SELECT * FROM Orders;
SELECT * FROM Orderdetails;

-- Do a join to get out the information you wish
SELECT PersonalName, Street, HouseNR, City, Country FROM Personal AS P
INNER JOIN Adresses AS A
ON P.AdressID = A.ID;

SELECT PersonalName, ContractBegin,Salary FROM Personal AS P
INNER JOIN Salary AS s
ON P.SalaryID = S.ID;

SELECT PersonalName, Position, DepartmentName FROM Personal AS P
INNER JOIN Departments AS D
WHERE P.PersonalName = D.DepartmentHead;

-- to reach warehouse, product and status you need to do a nested join!

-- things for the reflection:
-- it's hard to make inserts and updates for tables that are higly normalised
-- made a table for Transations but noticed that I don't need one for orders to get a transaction history


