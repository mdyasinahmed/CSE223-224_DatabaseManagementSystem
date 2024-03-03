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

SELECT eName from employee, works where employee.eID=works.eID AND CompanyName = "First Bank Corporation";

SELECT eName, City from employee, works where employee.eID=works.eID AND  companyName = "First Bank Corporation";

SELECT eName, Street, City from employee, works where employee.eID=works.eID AND  companyName = "Last Bank Corporation"AND salary > 10000;

SELECT eName from employee, works where employee.eID=works.eID AND  companyName != "First Bank Corporation";

SELECT eName from employee, works, company where employee.eID=works.eID AND works.CompanyName=company.CompanyName AND  employee.City = company.City;



SELECT UPPER(mName) from manager where mName like '%A%' OR mName like '%R';

SELECT eName, salary from employee, works where employee.eID=works.eID ORDER By salary ASC;



SELECT eName from employee, company, manager where employee.eName=manager.eName AND  employee.City = company.City;

select * from employee, works where employee.eID=works.eID and salary = (select max(salary) from works) and salary > (select avg(salary) from works);


-- select * from employee, works where employee.e_id=works.e_id group by  salary having sum(salary) < 50000;

select * from employee, works where employee.e_id=works.e_id and salary = (select max(salary) from works);

