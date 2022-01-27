DROP DATABASE IF EXISTS IKEA;
CREATE DATABASE Ikea;

USE IKEA;

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
CREATE TABLE Adresses(
ID INT UNIQUE,
Street VARCHAR (255),
HouseNr INT,
PostCode INT,
City VARCHAR (255),
Country VARCHAR (255),
PRIMARY KEY (ID)
) DEFAULT CHARSET = Latin1;

-- CREATE TABLE Warehouse ?

-- maybe not needed? Interesting for shippers?
CREATE TABLE Departments(
DepartmentID INT UNIQUE AUTO_INCREMENT,
DepartmentName VARCHAR (255),
DepartmentHead VARCHAR (255),
AdressID INT UNIQUE,
FOREIGN KEY (AdressID) REFERENCES Adresses(ID),
PRIMARY KEY (DepartmentID)
);

CREATE TABLE Salary(
ID INT UNIQUE AUTO_INCREMENT,
ContractBegin DATETIME DEFAULT NOW(),
SalaryCategory VARCHAR (255),
ContractForm VARCHAR (255),
Salary FLOAT,
PRIMARY KEY (ID)
);

CREATE TABLE Personal(
PersonalID INT UNIQUE NOT NULL AUTO_INCREMENT,
PersonalName VARCHAR (255),
AdressID INT UNIQUE,
DepartmentID INT,
Phone VARCHAR(20),
Email VARCHAR (60),
Position VARCHAR(255),
SalaryID INT UNIQUE,
FOREIGN KEY (SalaryID) REFERENCES Salary(ID),
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
FOREIGN KEY (AdressID) REFERENCES Adresses(ID),
PRIMARY KEY (PersonalID)
);

CREATE TABLE Shippers(
ShipperID INT UNIQUE NOT NULL AUTO_INCREMENT,
ShipperName VARCHAR (255),
AdressID INT UNIQUE,
ShipperPhone VARCHAR(255),
FOREIGN KEY (AdressID) REFERENCES Adresses(ID),
PRIMARY KEY (ShipperID)
);

CREATE TABLE Customers(
CustomerID INT UNIQUE NOT NULL AUTO_INCREMENT,
CustomerName VARCHAR (255),
AdressID INT UNIQUE,
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
);

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

