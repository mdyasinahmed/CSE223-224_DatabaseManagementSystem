-- Create the database
CREATE DATABASE company_database;

USE company_database;

-- Create employees table
CREATE TABLE IF NOT EXISTS employees (
    e_id INT AUTO_INCREMENT PRIMARY KEY,
    e_name VARCHAR(255) NOT NULL,
    e_age INT NOT NULL,
    e_address VARCHAR(255) NOT NULL,
    e_salary DECIMAL(10, 2) NOT NULL
);

-- Insertig Data
INSERT INTO 
employees (e_name, e_age, e_address, e_salary) 
VALUES
('John Carry', 30, 'Jaipur', 40000.00),
('Jhon Smith', 28, 'Delhi', 45000.00),
('Jhonson Charles', 35, 'Mumbai', 38000.00),
('Alice Williams', 32, 'Jaipur', 42000.00),
('David Brown', 28, 'Delhi', 36000.00);

-- 1. write the query to select all records from employees table
SELECT * FROM employees;

-- 2. write the e_address query to select all distinct values from
SELECT distinct e_address FROM employees;

-- 3. write the query to select the address of employees who lives in Jaipure
SELECT e_name, e_address FROM employees WHERE e_address = 'Jaipur';

-- 4. write the query to sort the name of employees in descending order
SELECT * FROM employees ORDER BY e_name DESC;

-- 5. Count the number of rows in the table
SELECT COUNT(*) FROM employees;

-- 6. write the quetry to retrieve all employees whose Salary in between 35000 to 45000
SELECT e_name FROM employees WHERE e_salary BETWEEN 35000.00 AND 45000.00;

