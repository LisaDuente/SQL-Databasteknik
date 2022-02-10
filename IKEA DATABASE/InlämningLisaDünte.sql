-- DROP DATABASE IF EXISTS IKEA;
CREATE DATABASE Ikea;

USE IKEA;

CREATE TABLE ProductTypes(
TypeID VARCHAR(3) NOT NULL,
ProductType VARCHAR(255),
PRIMARY KEY (TypeID)
) DEFAULT CHARSET = Latin1;

CREATE TABLE Products(
ProductID INT UNIQUE NOT NULL AUTO_INCREMENT,
ProductName VARCHAR(255),
TypeID VARCHAR(255),
WarehouseStatus VARCHAR (255),
Length FLOAT,
Width FLOAT,
Height FLOAT,
Weigth FLOAT,
Colour VARCHAR(60),
Price FLOAT,
FOREIGN KEY (TypeID) REFERENCES ProductTypes(TypeID),
PRIMARY KEY(ProductID)
) DEFAULT CHARSET = latin1;

CREATE TABLE Countries(
ID VARCHAR(3),
CountryName VARCHAR(255),
PRIMARY KEY (ID)
) DEFAULT CHARSET = latin1;

CREATE TABLE Cities(
CityID INT NOT NULL,
CityName VARCHAR(255),
CountryID VARCHAR(3),
FOREIGN KEY (CountryID) REFERENCES Countries(ID),
PRIMARY KEY(CityID)
) DEFAULT CHARSET = latin1;

CREATE TABLE Postcodes(
ID INT NOT NULL AUTO_INCREMENT,
PostCode INT NOT NULL,
CityID INT,
FOREIGN KEY (CityID) REFERENCES Cities(CityID),
PRIMARY KEY (ID)
) DEFAULT CHARSET = latin1;

CREATE TABLE Streets(
StreetID INT NOT NULL AUTO_INCREMENT,
StreetName VARCHAR(255),
Housenr INT,
PostCodeID INT,
FOREIGN KEY (PostCodeID) REFERENCES Postcodes(ID),
PRIMARY KEY (StreetID)
) DEFAULT CHARSET = latin1;

CREATE TABLE Adresses(
ID VARCHAR(255) UNIQUE,
StreetID INT,
FOREIGN KEY (StreetID) REFERENCES Streets(StreetID),
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
Quantity INT UNSIGNED,
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
`€/hr` FLOAT,
AvgHours FLOAT,
PRIMARY KEY (ID)
);

CREATE TABLE ReportedHours(
PersonalID INT,
WorkedHours FLOAT,
`Date` TIMESTAMP DEFAULT NOW(),
FOREIGN KEY (PersonalID) REFERENCES Personal(PersonalID),
PRIMARY KEY (PersonalID, `date`)
) DEFAULT CHARSET = latin1;

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

-- no new table for BIC because of safty in encryption
CREATE TABLE BankInformation(
CustomerID INT NOT NULL,
IBAN VARCHAR(255),
BIC Varchar(30),
KreditNr INT,
KreditCode INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
PRIMARY KEY (CustomerID)
);

CREATE TABLE OrderStatus(
StatusID INT NOT NULL,
StatusName VARCHAR(255),
PRIMARY KEY (StatusID)
) DEFAULT CHARSET = latin1;

-- Transaktionshistorik
CREATE TABLE Orders(
OrderID INT UNIQUE NOT NULL AUTO_INCREMENT,
CustomerID INT,
OrderDate DATETIME DEFAULT NOW(),
ShippingDate DATETIME,
ShipperID INT,
OrderStatusID INT NOT NULL,
FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(StatusID),
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

