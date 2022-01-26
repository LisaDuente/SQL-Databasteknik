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

-- CREATE TABLE Warehouse ?

-- maybe not needed? Interesting for shippers?
CREATE TABLE Departments(
DepartmentID INT UNIQUE AUTO_INCREMENT,
DepartmentName VARCHAR (255),
DepartmentHead VARCHAR (255),
DepartmentAdress VARCHAR(255),
DepartmentPostCode INT,
DepartmentCity VARCHAR (255),
DepartmentCountry VARCHAR (255),
PRIMARY KEY (DepartmentID)
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
);

CREATE TABLE Personal(
PersonalID INT UNIQUE NOT NULL AUTO_INCREMENT,
PersonalName VARCHAR (255),
PersonalAdress VARCHAR(255),
PersonalPostCode INT,
PersonalCity VARCHAR (255),
PersonalCountry VARCHAR (255),
Position VARCHAR(255),
DepartmentID INT,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
PRIMARY KEY (PersonalID)
);

CREATE TABLE Shippers(
ShipperID INT UNIQUE NOT NULL AUTO_INCREMENT,
ShipperName VARCHAR (255),
ShipperAdress VARCHAR (255),
ShipperPostCode INT,
ShipperCity VARCHAR (255),
ShipperCountry VARCHAR (255),
ShipperPhone VARCHAR(255),
PRIMARY KEY (ShipperID)
);

CREATE TABLE Customers(
CustomerID INT UNIQUE NOT NULL AUTO_INCREMENT,
CustomerName VARCHAR (255),
CustomerStreet VARCHAR (255),
CustomerPostCode Int,
CustomerCity VARCHAR (255),
CustomerCountry VARCHAR (255),
CustomerPhone VARCHAR (255),
PRIMARY KEY (CustomerID)
);

-- Transaktionshistorik
CREATE TABLE Orders(
OrderID INT UNIQUE NOT NULL AUTO_INCREMENT,
Customer INT,
OrderDate DATETIME DEFAULT NOW(),
ShippingDate DATETIME,
Shipper INT,
OrderStatus VARCHAR (255),
FOREIGN KEY (Shipper) REFERENCES Shippers(ShipperID),
FOREIGN KEY (Customer) REFERENCES Customers(CustomerID),
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
-- FOREIGN KEY (PriceEach) REFERENCES Products(Price), doesn't work because its not part of the key, is it needed? how to make a view?
PRIMARY KEY (OrderID, ProductID)
);

