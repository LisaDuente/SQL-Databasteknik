DROP DATABASE IF EXISTS Plüschies;
CREATE DATABASE Plüschies;

USE Plüschies;

CREATE TABLE Animals (
AnimalID INT UNIQUE AUTO_INCREMENT,
AnimalName VARCHAR(50) NOT NULL,
YarnColour VARCHAR (15),
InStock BOOL,
StockCount INT,
BuyPrice INT,
SellPrice INT,
PRIMARY KEY (AnimalID)
);

CREATE TABLE Customers (
CustomerID INT UNIQUE AUTO_INCREMENT,
CustomerName VARCHAR(150),
CustomerAdress VARCHAR(255),
-- used for ciphering equal values but its no good to use it in a real database
Salt VARCHAR(30),
PRIMARY KEY (CustomerID)
) DEFAULT CHARSET = latin1;

CREATE TABLE Orders (
OrderID INT UNIQUE AUTO_INCREMENT,
CustomerID INT,
CustomerName VARCHAR(150),
AnimalID INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (AnimalID) REFERENCES Animals(AnimalID),
TotalPrice INT NOT NULL,
OrderDate DATETIME DEFAULT NOW(),
PRIMARY KEY (OrderID)
);

CREATE TABLE Yarn (
YarnID INT UNIQUE AUTO_INCREMENT,
YarnColour VARCHAR(15),
YarnThickness VARCHAR(10),
GramInStock INT
);




