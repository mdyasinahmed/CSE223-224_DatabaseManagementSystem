CREATE DATABASE DonorList;

USE DonorList;

CREATE TABLE register(
	f_name varchar(20),
    l_name varchar(20),
    b_grp varchar(10),
    c_area varchar(30),
    last_donates date,
    phone varchar(20),
    email varchar(20),
    socail_link varchar(20)
);


CREATE TABLE d_search(
	b_grp varchar(10),
	s_area varchar(30),
    exp_time date,
    s_contact varchar(20)
);
