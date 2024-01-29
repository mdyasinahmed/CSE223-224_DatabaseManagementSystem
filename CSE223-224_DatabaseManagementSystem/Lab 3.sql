CREATE database Metro;

USE Metro;

CREATE table CSE_57(
	ID int NOT NULL,
    Name varchar(30),
    Section char(1),
    Phone varchar(20),
    Mail varchar(30),
    PRIMARY KEY(ID)
);

ALTER table CSE_57 ADD
	Address varchar(50);

INSERT INTO CSE_57
(ID, Name, Section, Phone, Mail, Address)
VALUES
(081, "Borna", 'C', "0123456789", "bornabhowmik5@gmail.com", "Sylhet"),
(090, "Mustafiz", 'C', "0123456789", "mustafizur.syl@gmail.com", "Sylhet"),
(095, "Yasin", 'C', "0123456789", "tomdyasin@gmail.com", "Sylhet"),
(100, "Sabbir", 'C', "0123456789", "tsabbir007@gmail.com", "Sylhet"),
(110, "Takbir", 'C', "0123456789", "takbirali@gmail.com", "Sylhet");

UPDATE CSE_57 SET phone = "01743583748" where id = 110;

SELECT * from CSE_57;

SHOW tables;

drop table CSE_57;