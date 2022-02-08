USE Ikea;
-- problems to solve:
-- change streets to just the names of possible streets? What to do with the houseNr?
-- change insert customer (started a procedure), warehouse, shippers, department, personal to add everything in the new tables
-- stored procedure to count all the items in different warehouses / View? 
-- how to update warehous status on products?
-- do a nested join to reach warehouse, product and productstatus
-- trigger on order to orderdetails
-- place order function?

-- things to do
-- stored procedure: update stock
-- view for kund+bankinfo
-- view: product + warehousestatus
-- view: personal + department
-- view: personal + salary + contracttype
-- make a repport from those views

-- alter tables
ALTER TABLE products CONVERT TO CHARACTER SET latin1; 
ALTER TABLE Orders MODIFY COLUMN OrderStatus INT;
ALTER TABLE Orders RENAME COLUMN OrderStausID TO OrderStatusID;
ALTER TABLE Orders CHANGE OrderStatusID OrderStatusID INT NOT NULL; 

-- insert various new people, shippers, Warehouses and departments
-- CALL insertNewShipper('BigBernd','0177 45678','Hahnenweg',21,567890,'Huddinge','Sverige');
-- CALL insertNewCustomer('Toto','0123456','-','Bambelbinengarten',4,123456,'Stockholm','Sverige');
-- CALL insertNewDepartment('Production','Patrik Selberg','Buxtehudestrasse',3,123456,'Stockholm','Sverige');
-- CALL insertNewPersonal('Lisa Dünte', 1, '017786374','Lisa@LachLaut.de','Head of Department',1,'Crabway',89, 1234567,'Oceantown','Sweden');
-- CALL insertNewWarehouse('Lager Norrmalm', 'Duennestrasse',4,145678,'Stockholm','Sweden');
-- CALL insertNewWarehouse('Lager Södermalm', 'Babelberggarten',4,145678,'Stockholm','Sweden');
-- CALL insertNewProduct('Choclad Kudde','P',20,20,10,4,'Brown',5.99,2,20);
-- shouldn't work
CALL insertNewProduct('Choclad Kudde','A',20,20,10,4,'Brown',5.99,2,20);

-- update various things
CALL updateCustomerAdress(2,'Bambelbinengarten',4,123456,'Stockholm','Sverige');
UPDATE Products SET PorductType = 'Lamp' WHERE ProductID = 7;

-- insert salary table
INSERT INTO salary VALUES (NULL, NOW(), 'Full-Time',2800.80);
INSERT INTO salary VALUES (NULL, NOW(), 'Part-Time',1400.40);
INSERT INTO salary VALUES (NULL, NOW(), 'Internship',0.00);
INSERT INTO salary VALUES (NULL, NOW(), 'Temporary Employment',2800.80);
INSERT INTO salary VALUES (NULL, NOW(), 'Fixed-Term',2800.80);

-- insert products
INSERT INTO Products VALUES(Null, 'Twix Table', 'Table', 100,50,130,30,'Black',25.99);
INSERT INTO Products VALUES(Null, 'Bounty Table', 'Table', 100,50,130,30,'White',25.99);
INSERT INTO Products VALUES(Null, 'Snickers Bank', 'Bank', 100,50,130,30,'Brown',25.99);
INSERT INTO Products VALUES(Null, 'Gummibear Stol', 'Stol', 100,50,130,30,'Red',12.99);
INSERT INTO Products VALUES(Null, 'Gummibear Stol', 'Stol', 100,50,130,30,'Green',12.99);
INSERT INTO Products VALUES(Null, 'Kex Bed', 'Bed', 100,50,130,30,'Mocca',55.99);
INSERT INTO Products VALUES(Null, 'Liquorice Lamp', 'Lamp', 80,20,120,6,'Black',15.99);

-- Place to alter, delete and drop things
START TRANSACTION;

DROP TABLE PERSONAL;
ALTER TABLE Products DROP COLUMN WarehouseStatus;
ALTER TABLE Warehouse ADD WarehouseName VARCHAR(255);
ALTER TABLE Personal DROP CONSTRAINT salaryID;

COMMIT;
ROLLBACK;

-- Select from various tables
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


