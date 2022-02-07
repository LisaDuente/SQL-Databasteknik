-- DROP DATABASE IF EXISTS IKEA;
CREATE DATABASE Ikea;

USE IKEA;

-- add a table for ll producttypes?
CREATE TABLE Products(
ProductID INT UNIQUE NOT NULL AUTO_INCREMENT,
ProductName VARCHAR(255),
PorductType VARCHAR(255),
WarehouseStatus VARCHAR (255),
-- WareHouseName VARCHAR (255),
Length FLOAT,
Width FLOAT,
Height FLOAT,
Weigth FLOAT,
Colour VARCHAR(60),
Price FLOAT,
PRIMARY KEY(ProductID)
);

-- in exchange for all the info in shippers, customers and personal? maybe no good because a shipper can have the same ID as a customer because they are on different tables?
-- Table for city+postcode and country?
CREATE TABLE Adresses(
ID VARCHAR(255) UNIQUE,
Street VARCHAR (255),
HouseNr INT,
PostCode INT,
City VARCHAR (255),
Country VARCHAR (255),
PRIMARY KEY (ID)
) DEFAULT CHARSET = Latin1;

CREATE TABLE Warehouse(
WarehouseID INT UNIQUE AUTO_INCREMENT NOT NULL,
WarehouseName VARCHAR(255),
AdressID VARCHAR(255),
FOREIGN KEY (AdressID) REFERENCES Adresses(ID),
PRIMARY KEY (WarehouseID)
) DEFAULT CHARSET = latin1;

CREATE TABLE WarehouseStatus(
WarehouseID INT,
ProductID INT,
Quantity INT,
FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
PRIMARY KEY (WarehouseID, ProductID)
) DEFAULT CHARSET = Latin1;


-- maybe not needed? Interesting for shippers?
CREATE TABLE Departments(
DepartmentID INT UNIQUE AUTO_INCREMENT NOT NULL,
DepartmentName VARCHAR (255),
DepartmentHead VARCHAR (255),
AdressID VARCHAR(255),
FOREIGN KEY (AdressID) REFERENCES Adresses(ID),
PRIMARY KEY (DepartmentID)
)DEFAULT CHARSET = Latin1;

CREATE TABLE Salary(
ID INT UNIQUE AUTO_INCREMENT,
ContractBegin DATETIME DEFAULT NOW(),
ContractForm VARCHAR (255),
Salary FLOAT,
PRIMARY KEY (ID)
);

CREATE TABLE Personal(
PersonalID INT UNIQUE AUTO_INCREMENT NOT NULL,
PersonalName VARCHAR (255),
AdressID VARCHAR(255), -- shouldn't be unique, what if two persons live at the same place?
DepartmentID INT,
Phone VARCHAR(20),
Email VARCHAR (60),
Position VARCHAR(255),
SalaryID INT,
FOREIGN KEY (SalaryID) REFERENCES Salary(ID),
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
FOREIGN KEY (AdressID) REFERENCES Adresses(ID),
PRIMARY KEY (PersonalID)
)DEFAULT CHARSET = Latin1;

CREATE TABLE Shippers(
ShipperID INT UNIQUE AUTO_INCREMENT NOT NULL,
ShipperName VARCHAR (255),
AdressID VARCHAR(255),
ShipperPhone VARCHAR(255),
FOREIGN KEY (AdressID) REFERENCES Adresses(ID),
PRIMARY KEY (ShipperID)
)DEFAULT CHARSET = Latin1;

CREATE TABLE Customers(
CustomerID INT UNIQUE AUTO_INCREMENT NOT NULL,
CustomerName VARCHAR (255),
AdressID VARCHAR(255),
CustomerPhone VARCHAR (255),
CustomerEmail VARCHAR (255),
FOREIGN KEY (AdressID) REFERENCES Adresses(ID),
PRIMARY KEY (CustomerID)
) DEFAULT CHARSET = Latin1;

-- Transaktionshistorik
CREATE TABLE Orders(
OrderID INT UNIQUE NOT NULL AUTO_INCREMENT,
CustomerID INT,
OrderDate DATETIME DEFAULT NOW(),
ShippingDate DATETIME,
ShipperID INT,
OrderStatus VARCHAR (255),
FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
PRIMARY KEY (OrderID)
)DEFAULT CHARSET = Latin1;

-- beställningar (one orderID can have many products)
CREATE TABLE OrderDetails(
OrderID INT,
ProductID INT,
PriceEach FLOAT,
Quantity INT,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
PRIMARY KEY (OrderID, ProductID)
);

