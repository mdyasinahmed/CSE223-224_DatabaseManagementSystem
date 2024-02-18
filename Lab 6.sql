CREATE DATABASE AccidentInformation;

USE AccidentInformation;


CREATE TABLE person (
    driver_id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255)
);

INSERT INTO person VALUES
(1, 'John Doe', '123 Main St'),
(2, 'John Smith', '456 Oak St'),
(3, 'Bob Johnson', '789 Elm St'),
(4, 'Alice Brown', '987 Pine St'),
(5, 'Charlie Davis', '654 Birch St'),
(6, 'Eva White', '321 Maple St');

CREATE TABLE car (
    license VARCHAR(10) PRIMARY KEY,
    model VARCHAR(50),
    m_year INT
);

INSERT INTO car VALUES
('ABC123', 'Toyota Camry', 2020),
('XYZ789', 'Honda Accord', 2019),
('DEF456', 'Ford Focus', 2021),
('GHI789', 'Chevrolet Malibu', 2018),
('JKL321', 'Nissan Altima', 2022),
('MNO654', 'Hyundai Sonata', 2020);

CREATE TABLE accident (
    report_number INT PRIMARY KEY,
    a_date DATE,
    location VARCHAR(255)
);


INSERT INTO accident VALUES
(101, '2023-01-15', 'Intersection of Main St and Elm St'),
(102, '2023-02-20', 'Parking lot near Oak St'),
(103, '2023-03-25', 'Highway 101, Mile Marker 30'),
(104, '2023-04-10', 'Residential area on Pine St'),
(105, '2023-05-05', 'Busy intersection at Maple St'),
(106, '2023-06-15', 'Shopping mall on Birch St');


CREATE TABLE owns (
    driver_id INT,
    license VARCHAR(10),
    PRIMARY KEY (driver_id, license),
    FOREIGN KEY (driver_id) REFERENCES person(driver_id),
    FOREIGN KEY (license) REFERENCES car(license)
);


INSERT INTO owns VALUES
(1, 'ABC123'),
(2, 'XYZ789'),
(3, 'DEF456'),
(4, 'GHI789'),
(5, 'JKL321'),
(6, 'MNO654');


CREATE TABLE participated (
    driver_id INT,
    license VARCHAR(10),
    report_number INT,
    damage_amount DECIMAL(10, 2),
    PRIMARY KEY (driver_id, license, report_number),
    FOREIGN KEY (driver_id) REFERENCES person(driver_id),
    FOREIGN KEY (license) REFERENCES car(license),
    FOREIGN KEY (report_number) REFERENCES accident(report_number)
);


INSERT INTO participated VALUES
(1, 'ABC123', 101, 500.00),
(2, 'XYZ789', 102, 1000.00),
(3, 'DEF456', 103, 750.00),
(4, 'GHI789', 104, 1200.00),
(5, 'JKL321', 105, 800.00),
(6, 'MNO654', 106, 600.00);

-- Find the total number of people who owned cars that were involved in accident in 1989
-- Find the number of accident in which the cars belonging to "Jhon Smith" were involved
-- Delete Mazda belonging  to "Jhon Smith"


DELETE FROM car
WHERE model='Ford Focus' AND license IN(SELECT license FROM owns WHERE driver_licenseid=(SELECT driver_id FROM person WHERE name = 'John Smith'));

