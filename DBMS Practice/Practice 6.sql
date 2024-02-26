-- Create a new database
CREATE DATABASE IF NOT EXISTS SampleDatabase;

-- Use the created database
USE SampleDatabase;

-- Create a table
CREATE TABLE IF NOT EXISTS SampleTable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female'),
    UNIQUE KEY unique_name (name)
);

-- Insert values into the table
INSERT INTO SampleTable (name, age, gender) VALUES
('John', 25, 'Male'),
('Jane', 30, 'Female'),
('Bob', 28, 'Male');

-- Select all records from the table
SELECT * FROM SampleTable;

-- Update a record in the table
UPDATE SampleTable SET age = 26 WHERE name = 'John';


-- Delete a record from the table
DELETE FROM SampleTable WHERE name = 'Bob';


-- Drop the table
DROP TABLE IF EXISTS SampleTable;


-- Create a new table with foreign key relation
CREATE TABLE IF NOT EXISTS AnotherTable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sample_id INT,
    FOREIGN KEY (sample_id) REFERENCES SampleTable(id)
);


-- Select records with AND, OR, Between, Distinct, Not
SELECT * FROM SampleTable WHERE age > 25 AND gender = 'Male';
SELECT * FROM SampleTable WHERE age BETWEEN 25 AND 30;
SELECT DISTINCT gender FROM SampleTable;
SELECT * FROM SampleTable WHERE age IS NOT NULL;


-- Aggregate functions: AVG, COUNT, SUM, MIN, MAX
SELECT AVG(age) as average_age, COUNT(*) as total_records, SUM(age) as total_age, MIN(age) as min_age, MAX(age) as max_age FROM SampleTable;


-- Constraints: Unique, Not Null, Default
CREATE TABLE IF NOT EXISTS ConstraintsTable (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT DEFAULT 0
);

-- Primary Key and Auto Increment
CREATE TABLE IF NOT EXISTS PrimaryKeyTable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255)
);

-- IN, NOT IN, ANY, ALL
SELECT * FROM SampleTable WHERE age IN (25, 30);
SELECT * FROM SampleTable WHERE age NOT IN (25, 30);
SELECT * FROM SampleTable WHERE age = ANY (SELECT age FROM AnotherTable);
SELECT * FROM SampleTable WHERE age > ALL (SELECT age FROM AnotherTable);

-- Create a View
CREATE VIEW SampleView AS SELECT name, age FROM SampleTable WHERE gender = 'Male';
