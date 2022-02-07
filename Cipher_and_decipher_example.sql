SELECT * FROM Customers;

INSERT INTO Customers (CustomerName, CustomerAdress, Salt)
			VALUES('testname2', AES_ENCRYPT(concat('Bogenstrasse 3','salt2'),'1234'),'salt2');
            
-- to break down adress and salt          
SELECT CustomerName, CustomerAdress, REPLACE(CAST(AES_DECRYPT(CustomerAdress,'1234') AS CHAR(100)),salt,'') AS 'dekrypted' FROM Customers;
            
SELECT * FROM Customers;
            
SELECT CustomerName, CAST(AES_DECRYPT(CustomerAdress,'1234') AS CHAR(100))AS CustomersDekryptedAdress FROM Customers;