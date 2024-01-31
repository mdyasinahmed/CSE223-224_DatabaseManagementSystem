CREATE database Information;
USE Information;

CREATE table owner(
	o_id int PRIMARY KEY,
    o_name varchar(50),
    o_phone varchar(20),
    o_mail varchar(50),
    o_adrs varchar(25)
);

CREATE table employee(
	o_id int,
	e_id int PRIMARY KEY,
    e_name varchar(50),
    e_phone varchar(20),
    e_mail varchar(50),
    e_adrs varchar(25),
    j_date DATE
);

INSERT INTO owner
(o_id, o_name, o_phone, o_mail, o_adrs)
VALUES
(1, "Mashrafee Mortaza", "01234556789", "mash@gmakl.com", "Dhaka"),
(2, "Mahmudullah Riad", "01234556789", "mahmudullah@gmail.com", "Barisal"),
(3, "Mushfiqur Rahim", "01234556789", "mushfiq@gmail.com", "Dhaka"),
(4, "Tamim Iqbal", "01234556789", "tamim@gmail.com", "Chittagong"),
(5, "Sakib Al Hasan", "01234556789", "sakib@gmail.com", "Khulna");

INSERT INTO employee
(o_id, e_id, e_name, e_phone, e_mail, e_adrs, j_date)
VALUES
(5, 1, "Tanzim Sakib", "01234556789", "tanzim@gmakl.com", "Sylhet", "2023-01-10"),
(4, 2, "Mehedi Miraz", "01234556789", "miraz@gmakl.com", "Barisal", "2020-03-10"),
(3, 3, "Tarek Ahmed", "017454563336", "tarek@gmail.com", "Dhaka", "2021-04-10"),
(2, 4, "Takbir Ali", "0174523657247", "takbir@gmail.com", "Comilla", "2022-04-12"),
(1,5, "Amran Malik", "0184353626457", "amran@gmail.com", "Khulna", "2019-05-09");

SELECT * from owner;

SELECT * from employee;

SELECT * from owner, employee; 

SELECT e_name from employee where e_id=1 AND e_adrs="Sylhet";

SELECT e_name, e_phone from employee where j_date BETWEEN "2021-01-01" AND "2024-01-01";

