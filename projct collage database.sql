CREATE DATABASE collage_management_system;

USE collage_management_system;


CREATE TABLE students
(
	std_roll_no INT PRIMARY KEY,                                                 
	std_fname VARCHAR(20),                     
	std_lname VARCHAR(20),
	age INT,
	branch_code INT NOT NULL,
	FOREIGN KEY(branch_code)REFERENCES branch(branch_code),
	std_registration_no INT NOT NULL,
	FOREIGN KEY(std_registration_no)REFERENCES examination_center(std_registration_no)
);

SELECT * FROM students;

INSERT INTO students(std_roll_no,std_fname,std_lname,age,branch_code,std_registration_no) 
VALUES (2021001,"shuvam","sharma",25,001,1302021);

INSERT INTO students(std_roll_no,std_fname,std_lname,age,branch_code,std_registration_no) 
VALUES (2021002,"nitesh","yogi",28,002,1312021);

INSERT INTO students(std_roll_no,std_fname,std_lname,age,branch_code,std_registration_no) 
VALUES (2021003,"priyanka","nandi",25,003,1322021);

INSERT INTO students(std_roll_no,std_fname,std_lname,age,branch_code,std_registration_no) 
VALUES (2021004,"ayesha","kumari",25,004,1332021);
	
	
	
	
CREATE TABLE location
(
	location_code INT PRIMARY KEY,
	std_address VARCHAR(30),
	postal_code INT NOT NULL,
	std_roll_no INT NOT NULL,
	FOREIGN KEY(std_roll_no)REFERENCES students(std_roll_no)
);

SELECT * FROM location;

INSERT INTO location(location_code,std_address,postal_code,std_roll_no) VALUES (001,"banglore",784635,2021001);

INSERT INTO location(location_code,std_address,postal_code,std_roll_no) VALUES (002,"kolkata",700042,2021002);

INSERT INTO location(location_code,std_address,postal_code,std_roll_no) VALUES (003,"bhubneswar",752101,2021003);

INSERT INTO location(location_code,std_address,postal_code,std_roll_no) VALUES (004,"ahmedabad",795648,2021004);



CREATE TABLE country
(
	country_code INT PRIMARY KEY,
	country_name VARCHAR(30),
	country_region VARCHAR(20),
	location_code INT NOT NULL,
        FOREIGN KEY(location_code)REFERENCES location(location_code)
 );
 
 SELECT * FROM country;
 
INSERT INTO country(country_code,country_name,country_region,location_code) VALUES (001,"INDIA","north",001);

INSERT INTO country(country_code,country_name,country_region,location_code) VALUES (002,"INDIA","south",002);

INSERT INTO country(country_code,country_name,country_region,location_code) VALUES (003,"INDIA","east",003);

INSERT INTO country(country_code,country_name,country_region,location_code) VALUES (004,"INDIA","west",004);

 
CREATE TABLE branch
(
	branch_code INT PRIMARY KEY,
	branch_name VARCHAR(20)
);

SELECT * FROM branch;

INSERT INTO branch VALUES (001,"EEE"),(002,"ECE"),(003,"CSE"),(004,"ME");

CREATE TABLE lecturer
(
	fname VARCHAR(20),
	lname VARCHAR(20),
	branch_code INT NOT NULL,
	FOREIGN KEY(branch_code)REFERENCES branch(branch_code)
);

SELECT * FROM lecturer;

INSERT INTO lecturer(fname,lname,branch_code) VALUES ("birendra","singh",001);
INSERT INTO lecturer(fname,lname,branch_code) VALUES ("tejpal","sisodia",002);
INSERT INTO lecturer(fname,lname,branch_code) VALUES ("chandan","kumar",003);
INSERT INTO lecturer(fname,lname,branch_code) VALUES ("varun","dutta",004);




CREATE TABLE examination_center
(
	std_registration_no INT PRIMARY KEY,
	std_cgpa FLOAT NOT NULL,
	branch_code INT NOT NULL,
	FOREIGN KEY(branch_code)REFERENCES branch(branch_code)
);

SELECT * FROM examination_center;

INSERT INTO examination_center (std_registration_no,std_cgpa,branch_code) VALUES (1302021,9.20,001);
INSERT INTO examination_center (std_registration_no,std_cgpa,branch_code) VALUES (1312021,7.36,002);
INSERT INTO examination_center (std_registration_no,std_cgpa,branch_code) VALUES (1322021,8.58,003);
INSERT INTO examination_center (std_registration_no,std_cgpa,branch_code) VALUES (1332021,6.70,004);


CREATE TABLE std_edu_history
(
	std_id INT PRIMARY KEY,
	std_matric_percent INT ,
	std_HSC_percent INT,
	std_semister_percent INT,
	std_roll_no INT NOT NULL,
	FOREIGN KEY(std_roll_no)REFERENCES students(std_roll_no)
);

SELECT * FROM std_edu_history;

INSERT INTO std_edu_history (std_id,std_matric_percent,std_HSC_percent,std_semister_percent,std_roll_no) 
VALUES (001,78,82,72,2021001);

INSERT INTO std_edu_history (std_id,std_matric_percent,std_HSC_percent,std_semister_percent,std_roll_no) 
VALUES (002,58,70,82,2021002);

INSERT INTO std_edu_history (std_id,std_matric_percent,std_HSC_percent,std_semister_percent,std_roll_no) 
VALUES (003,65,72,75,2021003);

INSERT INTO std_edu_history (std_id,std_matric_percent,std_HSC_percent,std_semister_percent,std_roll_no) 
VALUES (004,85,90,85,2021004);


CREATE TABLE collage_placements_cell
(
	std_passout_batch INT ,
	placement_status ENUM('PLACED','NOT PLACED'),
	std_id INT NOT NULL,
	FOREIGN KEY(std_id)REFERENCES std_edu_history(std_id),
	std_registration_no INT NOT NULL,
	FOREIGN KEY(std_registration_no)REFERENCES examination_center(std_registration_no),
	branch_code INT NOT NULL,
	FOREIGN KEY(branch_code)REFERENCES branch(branch_code),
	std_roll_no INT NOT NULL,
	FOREIGN KEY(std_roll_no)REFERENCES students(std_roll_no)
);
	
 SELECT * FROM collage_placements_cell;
 
 SELECT students.std_fname,students.std_lname,collage_placements_cell.std_passout_batch,collage_placements_cell.placement_status,collage_placements_cell.std_roll_no,
 collage_placements_cell.std_registration_no FROM collage_placements_cell,students WHERE students.std_roll_no=collage_placements_cell.std_roll_no;
 
 
	
INSERT INTO collage_placements_cell(std_passout_batch,placement_status,std_id,std_registration_no,branch_code,std_roll_no) VALUES (2017,'PLACED',001,1302021,001,2021001);

INSERT INTO collage_placements_cell(std_passout_batch,placement_status,std_id,std_registration_no,branch_code,std_roll_no) VALUES (2020,'NOT PLACED',002,1312021,002,2021002);

INSERT INTO collage_placements_cell(std_passout_batch,placement_status,std_id,std_registration_no,branch_code,std_roll_no) VALUES (2018,'PLACED',003,1322021,003,2021003);

INSERT INTO collage_placements_cell(std_passout_batch,placement_status,std_id,std_registration_no,branch_code,std_roll_no) VALUES (2021,'NOT PLACED',004,1332021,004,2021004);



SELECT collage_placements_cell.branch_code,collage_placements_cell.std_roll_no,std_edu_history.std_HSC_percent,std_edu_history.std_semister_percent
FROM collage_placements_cell INNER JOIN std_edu_history ON collage_placements_cell.branch_code=std_edu_history.std_id;

SELECT collage_placements_cell.branch_code,collage_placements_cell.std_roll_no,std_edu_history.std_HSC_percent,std_edu_history.std_semister_percent
FROM collage_placements_cell, std_edu_history where collage_placements_cell.branch_code=std_edu_history.std_id;



