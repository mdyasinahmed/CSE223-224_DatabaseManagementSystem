-- QUESTION
-- mobile(id, name, company, color, quantity, price)
-- 1. Select all the mobiles where the color starting "B";
-- 2. Write the query to select all the mobiles whose average is greater than 40000
-- 3. Write  the query to select all the mobiles whose sum is less than 35000
-- 4. Write the query to retrieve the mobile information whose price is lowest


USE company_database;


-- Create mobile table
CREATE TABLE IF NOT EXISTS mobile (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    company VARCHAR(100) NOT NULL,
    color VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Insert Data
INSERT INTO mobile 
(name, company, color, quantity, price) 
VALUES
('M_1', 'Company_1', 'Blue', 5, 45000.00),
('M_2', 'Company_2', 'Black', 8, 38000.00),
('M_3', 'Company_3', 'Red', 10, 42000.00),
('M_4', 'Company_4', 'Blue', 7, 36000.00),
('M_5', 'Company_5', 'Green', 12, 50000.00);


-- 1. Select all the mobiles where the color starts with "B"
SELECT * FROM mobile WHERE color LIKE 'B%';

-- 2. Write the query to select all the mobiles whose average price is greater than 40000
SELECT * FROM mobile WHERE (SELECT AVG(price) FROM mobile) > 40000;

-- 3. Write the query to select all the mobiles whose sum of prices is less than 35000
SELECT * FROM mobile WHERE (SELECT SUM(price) FROM mobile) < 35000;

-- 4. Write the query to retrieve the mobile information whose price is the lowest
SELECT * FROM mobile ORDER BY price ASC LIMIT 1;


