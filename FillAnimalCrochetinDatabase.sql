USE Plüschies;

INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Giraffe', 'White+dots',0,0,15,20);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Dinosaur', 'Cottoncandy',0,0,15,20);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Reindeer', 'Mint',0,0,15,20);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Reindeer', 'Brown/Beige',0,0,25,35);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Dragon', 'Green+dots',0,0,25,35);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Fox', 'Orange+dots',0,0,25,35);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('CatBaby', 'Grey',0,0,10,15);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Cat', 'Purple+dots',0,0,15,20);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Elephant', 'Strawberry',0,0,15,20);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Rhino', 'Mint',0,0,15,20);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('BigGoat', 'Beige',0,0,40,50);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('BigMouse', 'Grey',0,0,40,50);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Frog', 'MudGreenYellow',0,0,20,30);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Seal', 'Green',0,0,20,30);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('SingingBird', 'Blue/White',0,0,10,20);
INSERT INTO Animals(AnimalName, YarnColour, InStock, StockCount, BuyPrice, SellPrice) VALUES('Dove', 'Yellow/Green',0,0,15,20);

INSERT INTO Customers(CustomerName, CustomerAdress) VALUES ('Martin','Hannover-Nordstadt');
INSERT INTO Customers(CustomerName, CustomerAdress) VALUES ('Jana','Tumba');
INSERT INTO Customers(CustomerName, CustomerAdress) VALUES ('Jenny','Bromma');
INSERT INTO Customers(CustomerName, CustomerAdress) VALUES ('TherapyLady', 'Hannover');
INSERT INTO Customers(CustomerName, CustomerAdress) VALUES ('Kita', 'Hannover-Vinnhorst');
INSERT INTO Customers(CustomerName, CustomerAdress) VALUES ('Cem', 'Aachen');

INSERT INTO Orders(CustomerID, CustomerName, AnimalID, TotalPrice) VALUES (
(SELECT CustomerID FROM Customers WHERE CustomerName= 'Jana'),
'Jana',
(SELECT AnimalID FROM Animals WHERE AnimalName = 'Reindeer' AND YarnColour = 'Mint'),
(SELECT SellPrice FROM Animals WHERE AnimalName = 'Reindeer' AND YarnColour = 'Mint')
);
INSERT INTO Orders(CustomerID, CustomerName, AnimalID, TotalPrice) VALUES (
(SELECT CustomerID FROM Customers WHERE CustomerName= 'Jenny'),
'Jenny',
(SELECT AnimalID FROM Animals WHERE AnimalName = 'Cat'),
(SELECT SellPrice FROM Animals WHERE AnimalName = 'Cat')
);
INSERT INTO Orders(CustomerID, CustomerName, AnimalID, TotalPrice) VALUES (
(SELECT CustomerID FROM Customers WHERE CustomerName= 'Jenny'),
'Jenny',
(SELECT AnimalID FROM Animals WHERE AnimalName = 'CatBaby'),
(SELECT SellPrice FROM Animals WHERE AnimalName = 'CatBaby')
);
INSERT INTO Orders(CustomerID, CustomerName, AnimalID, TotalPrice) VALUES (
(SELECT CustomerID FROM Customers WHERE CustomerName= 'Cem'),
'Cem',
(SELECT AnimalID FROM Animals WHERE AnimalName = 'SingingBird'),
(SELECT SellPrice FROM Animals WHERE AnimalName = 'SingingBird')
);
INSERT INTO Orders(CustomerID, CustomerName, AnimalID, TotalPrice) VALUES (
(SELECT CustomerID FROM Customers WHERE CustomerName= 'Cem'),
'Cem',
(SELECT AnimalID FROM Animals WHERE AnimalName = 'Dove'),
(SELECT SellPrice FROM Animals WHERE AnimalName = 'Dove')
);

INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Deepblue', '50g/80m', 50);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Lavendel', '50g/80m', 50);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Rose', '50g/80m', 34);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Forrestgreen', '50g/80m', 34);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Green+dots', '50g/80m', 11);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Grey', '50g/80m', 39);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Cinnober', '50g/80m', 34);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('White', '50g/80m', 17);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Black', '50g/80m', 24);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Palegreen', '25g/57,5m', 20);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Grassgreen', '25g/57,5m', 50);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Mint', '25g/57,5m', 34);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Paleyellow', '25g/57,5m', 12);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Darkblue', '25g/57,5m', 48);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Deeplavender', '25g/57,5m', 11);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Grassgreen', '25g/57,5m', 50);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Mintgreen', '25g/57,5m', 20);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Gey059', '25g/57,5m', 47);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Grey079', '25g/57,5m', 25);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Grey004', '25g/57,5m', 25);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Blue038', '25g/57,5m', 25);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Blue032', '25g/57,5m', 25);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Yellow006', '25g/57,5m', 50);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('White', '25g/57,5m', 7);
INSERT INTO Yarn (YarnColour, YarnThickness, GramInStock) VALUES ('Azureblue', '25g/57,5m', 4);
-- add all the yarn from the dinnertable


