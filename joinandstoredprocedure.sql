/* First Table : Employee */

CREATE TABLE Employee
(
	emp_id int primary key,
	emp_name varchar(20)
);

INSERT INTO Employee VALUES
(01, 'Jaydeep'),
(02, 'Viraj'),
(03, 'Mohan'),
(04, 'Ram'),
(05, 'Rahul'),
(06, 'Amrut');

SELECT * FROM Employee;

/* Second Table : Organization */

CREATE TABLE Organization (
	company_id int primary key, 
	emp_id int, 
    points int, 
	status varchar(20));

INSERT INTO Organization VALUES
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

SELECT * FROM Organization;

/* Third Table : Profile */

CREATE TABLE Profile (
	city varchar(20), 
	email varchar(20), 
    company_id int, 
	post varchar(50));

INSERT INTO Profile VALUES 
('Delhi', 'mohan@gmail.com', 102, 'Trainee Software Developer'),
('Mumbai', 'jaydeep@gmail.com', 101, 'Business Analyst'),
('Kolkata', 'rahul@gmail.com', 103, 'Laravel Developer'),
('Chennai', 'viraj@gmail.com', 104, 'Salesforce Developer');

/* The INNER JOIN keyword selects all rows from both the tables as long as the condition satisfies.  */
SELECT emp_name, points, status, city, email,
post from Employee e INNER JOIN Organization r on
e.emp_id = r.emp_id INNER JOIN Profile a on 
a.company_id = r.company_id;

/* FULL JOIN creates the result-set by combining result of both LEFT JOIN and RIGHT JOIN. */
SELECT emp_name, points, status, city, email,
post from Employee e FULL OUTER JOIN Organization r on
e.emp_id = r.emp_id FULL OUTER JOIN Profile a on 
a.company_id = r.company_id;

/* This join returns all the rows of the table on the left side of the join and matching rows for the table on the right side of join. */
SELECT emp_name, points, status, city, email,
post from Employee e LEFT JOIN Organization r on
e.emp_id = r.emp_id LEFT JOIN Profile a on 
a.company_id = r.company_id;

/* This join returns all the rows of the table on the right side of the join and matching rows for the table on the left side of join. */
SELECT emp_name, points, status, city, email,
post from Employee e RIGHT JOIN Organization r on
e.emp_id = r.emp_id RIGHT JOIN Profile a on 
a.company_id = r.company_id;

/* A stored procedure is a prepared SQL code that  can be reused over and over again. */

CREATE PROCEDURE CommonProcedure
AS
SELECT * FROM Profile
GO;

EXEC CommonProcedure;

/* Stored procedure with single parameter */

CREATE PROCEDURE EmpSinglePara @city nvarchar(30)
AS
SELECT * FROM Profile WHERE city = @city;

EXEC EmpSinglePara @city = 'Delhi';

/* Stored procedure with multiple parameter */

CREATE PROCEDURE EmpMultipleParameter @city nvarchar(30), @post varchar(20)
AS
SELECT * FROM Profile WHERE city = @city AND post = @post;

EXEC EmpMultipleParameter @city = 'Chennai', @post = 'Salesforce Developer';