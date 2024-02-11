CREATE DATABASE employeeInformation;

USE employeeInformation;


CREATE table employee(
	eID INT PRIMARY KEY,
	eName VARCHAR(50),
	Street VARCHAR(50),
	City VARCHAR(50)
);

CREATE table works(
	wID INT PRIMARY KEY,
	eID INT NOT NULL,
	CompanyName VARCHAR(50),
	Salary INT NOT NULL
);

CREATE table company(
	CompanyName VARCHAR(50),
    City VARCHAR(50)
);

CREATE table manager(
	mID INT PRIMARY KEY,
	eName VARCHAR(50),
	mName VARCHAR(50)
);

INSERT INTO employee
(eID, eName, Street, City)
VALUES
(11, "Rahim", "61A", "Amborkhana"),
(12, "Karim", "90C", "Uposhahar"),
(13, "Kobir", "78D", "Modina Market"),
(14, "Ashfaque", "30B", "Amborkhana");

INSERT INTO works
(wID, eID, CompanyName, Salary)
VALUES
(21, 11, "First Bank Corporation", 500000),
(22, 13, "Last Bank Corporation", 100000),
(23, 12, "First Bank Corporation", 100000);

INSERT INTO company
(CompanyName, City)
VALUES
("First Bank Corporation", "Sylhet"),
("Last Bank Corporation", "Sylhet");

INSERT INTO manager
(mID, eName, mName)
VALUES
(1,"Rahim", "Chowdhury"),
(2, "Karim", "Hasan"),
(3, "Kobir","Ahmed"),
(4, "Kobir","Mahmud");






