-- problems to solve:
-- what if two persons live at the same adress, now they get a new ID each time they get inserted
-- can one write an if sentence that checks if an adress is already inserted?
-- changed personal table, may need to drop it and set it up again

-- insert various new people, shippers and departments
CALL insertShipper('BambooFactory','0177 45678');
CALL insertNewCustomer('Lisa Dünte','0123456','Lisa@Lachen.de','Bambelbinengarten',4,123456,'Stockholm','Sverige');
CALL insertDepartment('IT','Lisa Dünte','Buxtehudestrasse',3,123456,'Stockholm','Sverige');
CALL insertPersonal('Lisa Dünte','D1','1234567','Lisa@lachmalwieder.com','Head of Department','Lebenslaufweg',34,23456,'Stockholm','Sverige',NULL,'Bonus Programm','Vid behov',1234.89);

-- Select from various tables
SELECT * FROM Shippers;
SELECT * FROM Customers;
SELECT * FROM Departments;
SELECT * FROM Adresses;
SELECT * FROM Salary;

-- Do a joint to get out the information you wish
SELECT PersonalName, Street, HouseNR, City, Country FROM Personal AS P
INNER JOIN Adresses AS A
ON P.AdressID = A.ID;

SELECT PersonalName, ContractBegin,Salary FROM Personal AS P
INNER JOIN Salary AS s
ON P.SalaryID = S.ID;

SELECT PersonalName, Position, DepartmentName FROM Personal AS P
INNER JOIN Departments AS D
WHERE P.PersonalName = D.DepartmentHead;


