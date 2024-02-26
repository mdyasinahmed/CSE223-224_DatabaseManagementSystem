-- QUESTION 
-- person (driver-id, name, address)
-- car (license, model, year)
-- accident (report number, date, location)
-- owns (driver id, license)
-- participated (report number, license, driver id, damage amount)

-- Find the total number of people who owned cars that were involved in accident in 1989
-- Find the number of accident in which the cars belonging to "Jhon Smith" were involved
-- Delete Mazda belonging  to "Jhon Smith"

-- Create the database
CREATE DATABASE IF NOT EXISTS AccidentDatabase;

-- Use the created database
USE AccidentDatabase;

-- Create person table
CREATE TABLE IF NOT EXISTS person (
    driver_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

-- Create car table
CREATE TABLE IF NOT EXISTS car (
    license VARCHAR(20) PRIMARY KEY,
    model VARCHAR(255) NOT NULL,
    year INT NOT NULL
);

-- Create accident table
CREATE TABLE IF NOT EXISTS accident (
    report_number INT PRIMARY KEY,
    date DATE NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Create owns table with foreign keys
CREATE TABLE IF NOT EXISTS owns (
    driver_id INT,
    license VARCHAR(20),
    PRIMARY KEY (driver_id, license),
    FOREIGN KEY (driver_id) REFERENCES person(driver_id),
    FOREIGN KEY (license) REFERENCES car(license)
);

-- Create participated table with foreign keys
CREATE TABLE IF NOT EXISTS participated (
    report_number INT,
    license VARCHAR(20),
    driver_id INT,
    damage_amount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (report_number, license, driver_id),
    FOREIGN KEY (report_number) REFERENCES accident(report_number),
    FOREIGN KEY (license) REFERENCES car(license),
    FOREIGN KEY (driver_id) REFERENCES person(driver_id)
);

-- Insert values into person table
INSERT INTO person (driver_id, name, address) VALUES
(1, 'John Smith', '123 Main St'),
(2, 'Jane Doe', '456 Oak St');

-- Insert values into car table
INSERT INTO car (license, model, year) VALUES
('ABC123', 'Toyota', 1988),
('XYZ456', 'Mazda', 1990);

-- Insert values into accident table
INSERT INTO accident (report_number, date, location) VALUES
(101, '1989-01-01', 'Intersection A'),
(102, '1989-02-15', 'Intersection B');

-- Insert values into owns table
INSERT INTO owns (driver_id, license) VALUES
(1, 'ABC123'),
(1, 'XYZ456'),
(2, 'ABC123');

-- Insert values into participated table
INSERT INTO participated (report_number, license, driver_id, damage_amount) VALUES
(101, 'ABC123', 1, 5000.00),
(101, 'XYZ456', 1, 8000.00),
(102, 'ABC123', 2, 3000.00);

-- 1. Find the total number of people who owned cars that were involved in an accident in 1989
SELECT COUNT(DISTINCT p.driver_id) AS total_people
FROM person p
JOIN owns o ON p.driver_id = o.driver_id
JOIN participated pa ON o.license = pa.license
JOIN accident a ON pa.report_number = a.report_number
WHERE YEAR(a.date) = 1989;

-- 2. Find the number of accidents in which the cars belonging to "John Smith" were involved
SELECT COUNT(DISTINCT a.report_number) AS total_accidents
FROM person p
JOIN owns o ON p.driver_id = o.driver_id
JOIN participated pa ON o.license = pa.license
JOIN accident a ON pa.report_number = a.report_number
WHERE p.name = 'John Smith';

-- 3. Delete Mazda belonging to "John Smith"
DELETE FROM car
WHERE license IN (
    SELECT o.license
    FROM person p
    JOIN owns o ON p.driver_id = o.driver_id
    WHERE p.name = 'John Smith'
    AND o.license IN (SELECT license FROM car WHERE model = 'Mazda')
);
