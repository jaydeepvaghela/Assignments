
/*JOIN QUERY FOR THREE TABLES*/

CREATE TABLE EmpInformation (
	emp_id int primary key,
	emp_name varchar(20));

INSERT INTO EmpInformation VALUES
(01, 'Jaydeep'),
(02, 'Viraj'),
(03, 'Mohan'),
(04, 'Ram'),
(05, 'Rahul'),
(06, 'Amrut');

SELECT * FROM EmpInformation;

CREATE TABLE RESULT (
	company_id int primary key, 
	emp_id int, 
    points int, 
	status varchar(20));

INSERT INTO RESULT VALUES
(101, 1, 73, 'PASS'),
(102, 3, 72, 'PASS'),
(103, 5, 74, 'PASS'),
(104, 2, 77, 'PASS'),
(105, 8, 53, 'PASS'),
(106, 7, 68, 'PASS'),
(107, 10, 68, 'PASS'),
(108, 9, 68, 'PASS'),
(109, 6, 68, 'PASS'),
(110, 4, 98, 'PASS');

SELECT * FROM RESULT;

CREATE TABLE AllInformation (
	city varchar(20), 
	email varchar(20), 
    company_id int, 
	post varchar(50));

INSERT INTO AllInformation VALUES 
('Delhi', 'mohan@gmail.com', 102, 'Trainee Software Developer'),
('Mumbai', 'jaydeep@gmail.com', 101, 'Business Analyst'),
('Kolkata', 'rahul@gmail.com', 103, 'Laravel Developer'),
('Chennai', 'viraj@gmail.com', 104, 'Salesforce Developer');

/* INNER JOIN */
SELECT emp_name, points, status, city, email,
post from EmpInformation e INNER JOIN Result r on
e.emp_id = r.emp_id INNER JOIN AllInformation a on 
a.company_id = r.company_id;

/* FULL OUTER JOIN */
SELECT emp_name, points, status, city, email,
post from EmpInformation e FULL OUTER JOIN Result r on
e.emp_id = r.emp_id FULL OUTER JOIN AllInformation a on 
a.company_id = r.company_id;

/* LEFT JOIN */
SELECT emp_name, points, status, city, email,
post from EmpInformation e LEFT JOIN Result r on
e.emp_id = r.emp_id LEFT JOIN AllInformation a on 
a.company_id = r.company_id;

/* RIGHT JOIN */
SELECT emp_name, points, status, city, email,
post from EmpInformation e RIGHT JOIN Result r on
e.emp_id = r.emp_id RIGHT JOIN AllInformation a on 
a.company_id = r.company_id;

/* STORED PROCEDURE */

CREATE PROCEDURE EmpData
AS
SELECT * FROM AllInformation
GO;

EXEC EmpData;

/* STORED PROCEDURE WITH SINGLE PARAMETER */

CREATE PROCEDURE EmpSinglePara @city nvarchar(30)
AS
SELECT * FROM AllInformation WHERE city = @city;


EXEC EmpSinglePara @city = 'Delhi';

/* STORED PROCEDURE WITH MULTIPLE PARAMETER */
CREATE PROCEDURE EmpMultipleParameter @city nvarchar(30), @post varchar(20)
AS
SELECT * FROM AllInformation WHERE city = @city AND post = @post;

EXEC EmpMultipleParameter @city = 'Chennai', @post = 'Salesforce Developer';

