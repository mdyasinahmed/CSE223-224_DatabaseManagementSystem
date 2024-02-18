CREATE DATABASE AccidentInformation;

USE AccidentInformation;

CREATE TABLE person(
	driver_id int PRIMARY KEY,
    name varchar(50),
    address varchar(50)
);

CREATE TABLE car(
	license varchar(21) PRIMARY KEY,
    model varchar(50),
    model_year year
);

CREATE TABLE accident(
	report_number int PRIMARY KEY,
    accident_date date,
    location varchar(50)
);

CREATE TABLE owns(
	driver_id int,
    license varchar(21)
);

CREATE TABLE participated (
	driver_id int,
    license varchar(21),
    report_number int,
    damage_amount int
);


INSERT INTO person
(driver_id, name, address)
VALUES
(10, "Alex Jay", "California"),
(12, "Jhosh Brown", "California"),
(13, "Robert Carry", "New York"),
(14, "Alex Hales", "San Diego"),
(15, "Shon Williams", "Los Angeles"),
(16, "Jhon Smith", "New York"),
(17, "Glen Maxwel", "California");

INSERT INTO car
(license, model, model_year)
VALUES
("HM88-8439-3438", "Mazda", 1980),
("TF48-4232-0904", "Ford", 1971),
("KL32-7843-4233", "Hyundai", 2000),
("WE43-4233-9923", "Audi", 2000),
("TF48-4932-0934", "Mazda", 1980);

INSERT INTO accident
(report_number, accident_date, location)
VALUES
(51, "1980-08-27", "Los Angele"),
(52, "1989-06-23", "California"),
(53, "1989-09-12", "New York"),
(54, "1989-10-01", "San Diego"),
(55, "1990-11-10", "California");





