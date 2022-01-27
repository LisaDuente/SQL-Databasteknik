DROP DATABASE IF EXISTS Sjukhus;
CREATE DATABASE Sjukhus;

USE Sjukhus;

CREATE TABLE Läkare(
namn VARCHAR (255) UNIQUE NOT NULL,
omrade VARCHAR (255),
PRIMARY KEY (namn)
);

CREATE TABLE Patient(
namn VARCHAR(255),
email VARCHAR(255) UNIQUE NOT NULL,
PRIMARY KEY (email)
);

-- 'skriva in' sambandet
CREATE TABLE Ansvarig(
LäkareNamn VARCHAR(255),
PatientNamn VARCHAR (255) NOT NULL UNIQUE,
FOREIGN KEY (LäkareNamn) REFERENCES Läkare(namn),
PRIMARY KEY (PatientNamn)
);

CREATE TABLE Medicin(
MedicinID INT UNIQUE AUTO_INCREMENT,
NamnLäkemedel VARCHAR (255),
PRIMARY KEY (MedicinID)
);

CREATE TABLE Behandling(
LäkareNamn VARCHAR (255) NOT NULL,
Patientnamn VARCHAR (255) NOT NULL,
MedicinID INT,
Operation VARCHAR(255),
FOREIGN KEY (MedicinID) REFERENCES Medicin(MedicinID),
FOREIGN KEY(LäkareNamn) REFERENCES Läkare(namn),
-- would like to take the name instead but the ER diagramm needs the email als primary key
FOREIGN KEY (Patientnamn) REFERENCES Patient(email),
PRIMARY KEY (LäkareNamn, Patientnamn)
);

INSERT INTO Läkare VALUES ('Achim', 'Allgemeinmediziner'),('Thorsten','Kardiologe'),('Emma','NEurologe'),('Tabea','Gynekologist');
INSERT INTO Patient VALUES ('Mia','Mia@MeineMinna.de'),('Tim','Tim@TollerTag.se'),('Gustav','Gustav@GabelGlänzt.com');
INSERT INTO Ansvarig VALUES('Achim','Mia'),('Achim','Tim'),('Thorsten','Gustav');
INSERT INTO Medicin VALUES(Null, 'GoingHardAgainstThatShit'),(Null, 'FuckCancer'),(Null,'MakeYourHeartGoBoom');
INSERT INTO Behandling VALUES ('Achim','Tim@TollerTag.se',1, null), ('Achim','Mia@MeineMinna.de',null,'NoseTransplantation'),('Emma','Mia@MeineMinna.de',3, null);

-- SELECT * FROM Ansvarig;
-- SELECT * FROM Behandling;
-- SELECT * FROM Medicin;

START TRANSACTION;
-- funkar inte, just som den ska
INSERT INTO Ansvarig VALUES ('Achim','Tim');
INSERT INTO Behandling VALUES (Null, 'Tim', 1, 'CloseThatHole');
INSERT INTO Behandling VALUES ('Achim', null, 2, null);
INSERT INTO Behandling VALUES ('Achim','Martina@MutterMaria.net', null, null);
INSERT INTO Behandling VALUES ('Alberta','Mia@MeineMinna.de', null, null);
-- the exercise was about that u need to have an operation OR a medication, not both, maybe do assert?
INSERT INTO Behandling VALUES ('Thorsten','Gustav@GabelGlänzt.com',3,'HeartOperation');
INSERT INTO Behandling VALUES ('Achim','Mia@MeineMinna.de', null, null);
ROLLBACK;
